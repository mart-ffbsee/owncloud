<?php

/**
 * ownCloud - roundcube mail plugin
 *
 * @author Martin Reinhardt and David Jaedke
 * @copyright 2012 Martin Reinhardt contact@martinreinhardt-online.de
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU AFFERO GENERAL PUBLIC LICENSE
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU AFFERO GENERAL PUBLIC LICENSE for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

/**
 * This class manages the roundcube app.
 * It enables the db integration and
 * connects to the roundcube installation via the roundcube API
 */
class OC_RoundCube_App
{

    const SESSION_ATTR_RCPRIVKEY = 'OC\\ROUNDCUBE\\privateKey';

    const SESSION_ATTR_RCUSER = 'OC\\ROUNDCUBE\\rcUser';

    const SESSION_ATTR_RCSESSID = 'OC\\ROUNDCUBE\\rcSessID';

    const SESSION_ATTR_RCSESSAUTH = 'OC\\ROUNDCUBE\\rcSessAuth';

    private $path = '';

    /**
     * Write to the PHP session
     *
     * @param
     *            Session Key $key
     * @param
     *            Value for the variable $value
     */
    public static function setSessionVariable($key, $value)
    {
        if (isset(\OC::$session)) {
            $session = \OC::$session;
            $session->set($key, $value);
        } else 
            if (isset(\OC::$server)) {
                $session = \OC::$server->getSession();
                $session->set($key, $value);
            } else {
                $_SESSION[$key] = $value;
            }
    }

    /**
     * Read from the PHP session
     *
     * @param
     *            Session Key $key
     *            
     * @return Value of the session variable
     */
    public static function getSessionVariable($key)
    {
        if (isset(\OC::$session)) {
            $session = \OC::$session;
            return $session->get($key);
        } else 
            if (isset(\OC::$server)) {
                $session = \OC::$server->getSession();
                return $session->get($key);
            } else {
                return isset($_SESSION[$key]) ? $_SESSION[$key] : false;
            }
    }

    /**
     * @brief write basic information for the user in the app configu
     *
     * @param
     *            oc username $ocUser
     * @return s true/false
     *        
     *         This function creates a simple personal entry for each user to distinguish them later
     *        
     *         It also chekcs the login data
     */
    public static function writeBasicData($ocUser)
    {
        OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->writeBasicData(): Writing basic data for ' . $ocUser, OCP\Util::DEBUG);
        $stmt = OCP\DB::prepare("INSERT INTO *PREFIX*roundcube (oc_user) VALUES (?)");
        $result = $stmt->execute(array(
            $ocUser
        ));
        return self::checkLoginData($ocUser, 1);
    }

    /**
     * @brief chek the login parameters
     *
     * @param
     *            user object $ocUser
     * @param
     *            write the basic user data to db
     * @return s the login data
     *        
     *         This function tries to load the configured login data for roundcube and return it.
     */
    public static function checkLoginData($ocUser, $written = 0)
    {
        OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->checkLoginData(): Checking login data for oc user ' . $ocUser, OCP\Util::DEBUG);
        $stmt = OCP\DB::prepare('SELECT * FROM *PREFIX*roundcube WHERE oc_user=?');
        $result = $stmt->execute(array(
            $ocUser
        ));
        $mailEntries = $result->fetchAll();
        if (count($mailEntries) > 0) {
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->checkLoginData(): Found login data for oc user ' . $ocUser, OCP\Util::DEBUG);
            return $mailEntries;
        } elseif ($written == 0) {
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->checkLoginData(): Did not found login data for oc user ' . $ocUser, OCP\Util::DEBUG);
            return self::writeBasicData($ocUser);
        }
    }

    /**
     * Generate a private/public key pair.
     *
     * @param
     *            User ID$user.
     * @param
     *            Passphrase to $passphrase
     *            
     * @return array('privateKey', 'publicKey')
     */
    public static function generateKeyPair($user, $passphrase)
    {
        /* Retrieve openssl.cnf default location */
        $cert_locations = openssl_get_cert_locations();
        $opensslcnf = $cert_locations["default_default_cert_area"]."/openssl.cnf";

        /* Check if the openssl.cnf file exists */
        if (! file_exists ( $opensslcnf )) {
          OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->generateKeyPair(): File '.$opensslcnf.' doesn\'t exist. Setting private_key_bits=2048', OCP\Util::ERROR);
          /* Set a default private key length (>384) */
          $config = array( "private_key_bits" => 2048 );
        }
	else
	{
	   // TODO get private key bits lengh from OC config! if a openssl.cnf file does not property installed ( unix /opt)
	}
        /* Create the private and public key */
        $res = openssl_pkey_new($config);
        if (! $res) {
          OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->generateKeyPair(): Creating the private and public key failed', OCP\Util::ERROR);
        }
        /* Extract the private key from $res to $privKey */
        if (! openssl_pkey_export($res, $privKey, $passphrase, $config)) {
            return false;
        }
        /* Extract the public key from $res to $pubKey */
        $pubKey = openssl_pkey_get_details($res);
        if ($pubKey === false) {
            return false;
        }
        $pubKey = $pubKey['key'];
        // We now store the public key unencrypted in the user preferences.
        // The private key already is encrypted with the user's password,
        // so there is no need to encrypt it again.
        \OCP\Config::setUserValue($user, 'roundcube', 'publicSSLKey', $pubKey);
        \OCP\Config::setUserValue($user, 'roundcube', 'privateSSLKey', $privKey);
        $uncryptedPrivKey = openssl_get_privatekey($privKey, $passphrase);
        return array(
            'privateKey' => $uncryptedPrivKey, // this is actually a resource
            'publicKey' => $pubKey
        );
    }

    /**
     * Get users public key
     *
     * @param user $user            
     * @return public key
     */
    public static function getPublicKey($user)
    {
        $pubKey = \OCP\Config::getUserValue($user, 'roundcube', 'publicSSLKey', false);
        OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->getPublicKey(): ' . $pubKey, OCP\Util::DEBUG);
        return $pubKey;
    }

    /**
     * Get private key for user
     *
     * @param user $user            
     * @param password $passphrase            
     * @return private key|boolean
     */
    public static function getPrivateKey($user, $passphrase)
    {
        $privKey = \OCP\Config::getUserValue($user, 'roundcube', 'privateSSLKey', false);
        // need to create key pair
        if ($privKey === false) {
            $result = self::generateKeyPair($user, $passphrase);
            $uncryptedPrivKey = $result['privateKey'];
        } else {
            $uncryptedPrivKey = openssl_get_privatekey($privKey, $passphrase);
        }
        
        // save private key for later usage, need to export in order
        // to convert from a resource to real data.
        openssl_pkey_export($uncryptedPrivKey, $exportedPrivKey);
        self::setSessionVariable(OC_RoundCube_App::SESSION_ATTR_RCPRIVKEY, $exportedPrivKey);
        
        return $uncryptedPrivKey;
    }

    /**
     * encrypt data ssl
     *
     * @param
     *            object to encrypt $entry
     * @param
     *            public key $pubKey
     * @return boolean|unknown
     */
    public static function cryptMyEntry($entry, $pubKey)
    {
        OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->cryptMyEntry(): Starting encryption.', OCP\Util::DEBUG);
        if (openssl_public_encrypt($entry, $encryptedData, $pubKey) === false) {
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_AuthHelper.class.php->cryptMyEntry(): Error during crypting entry', OCP\Util::ERROR);
            return false;
        }
        OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->cryptMyEntry(): Encryption done with data ', OCP\Util::DEBUG);
        $encrypted = base64_encode($encryptedData);
        return $encrypted;
    }

    /**
     * decrypt ssl-encrypted data
     *
     * @param
     *            data to encrypt $entry
     * @param
     *            private key $privKey
     * @return void|unknown
     */
    public static function decryptMyEntry($entry, $privKey)
    {
        OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->decryptMyEntry(): Starting decryption.', OCP\Util::DEBUG);
        $data = base64_decode($entry);
        if (openssl_private_decrypt($data, $decrypted, $privKey) === false) {
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->decryptMyEntry(): Decryption finished with errors.', OCP\Util::ERROR);
            return;
        }
        OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->decryptMyEntry(): Decryption finished successfull.', OCP\Util::DEBUG);
        return $decrypted;
    }

    /**
     * Use the pulic key of the respective user to encrypt the given
     * email identity and store it in the data-base.
     *
     * @param owncloud $ocUser            
     * @param roundcube $emailUser            
     * @param roundcube $emailPassword            
     * @param
     *            set to false if don't want to persist/read data to db $persist
     * @return The IMAP credentials.|unknown
     */
    public static function cryptEmailIdentity($ocUser, $emailUser, $emailPassword, $persist = true)
    {
        OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->cryptEmailIdentity(): Updating roundcube profile for ' . $ocUser . ' (mail user: ' . $emailUser . ')', OCP\Util::DEBUG);
        
        $pubKey = self::getPublicKey($ocUser);
        
        if ($pubKey === false) {
            OCP\Util::writeLog('roundcube', 'Found no valid public key for user ' . $ocUser . ' (mail user: ' . $emailUser . ')', OCP\Util::ERROR);
            return false;
        }
        OCP\Util::writeLog('roundcube', 'Found  valid public key for user ' . $ocUser . ': ' . $pubKey . ')', OCP\Util::DEBUG);
        if ($persist) {
            $mail_userdata_entries = self::checkLoginData($ocUser);
            $mail_userdata = $mail_userdata_entries[0];
            if ($mail_userdata_entries === false) {
                OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->cryptEmailIdentity():  Found no valid mail login data ', OCP\Util::ERROR);
                return false;
            } else {
                OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->cryptEmailIdentity():  Found valid mail login data for user ' . $ocUser . ' (mail user: ' . $emailUser . ')', OCP\Util::INFO);
            }
        }
        $mail_username = self::cryptMyEntry($emailUser, $pubKey);
        $mail_password = self::cryptMyEntry($emailPassword, $pubKey);
        
        if ($mail_username === false || $mail_password === false) {
            OCP\Util::writeLog('roundcube', 'Encryption error for user ' . $ocUser, OCP\Util::ERROR);
            return false;
        }
        if ($persist) {
            OCP\Util::writeLog('roundcube', 'Updating roundcube user data (' . $emailUser . ')for oc user ' . $ocUser, OCP\Util::INFO);
            $stmt = OCP\DB::prepare("UPDATE *PREFIX*roundcube SET mail_user = ?, mail_password = ? WHERE oc_user = ?");
            $result = $stmt->execute(array(
                $mail_username,
                $mail_password,
                $ocUser
            ));
            OCP\Util::writeLog('roundcube', 'Done updating roundcube login data for user ' . $ocUser . ' (mail user: ' . $emailUser . ')' . $ocUser, OCP\Util::INFO);
        } else {
            $result = array(
                'mail_user' => $mail_username,
                'mail_password' => $mail_password
            );
        }
        return $result;
    }
    
    public static function makeLoginHandler($rcHost, $rcPort, $maildir, $enableVerbose)
    {
    	$enableDebug = OCP\Config::getAppValue('roundcube', 'enableDebug', 'false');
        $disableSSLverify = OCP\Config::getAppValue('roundcube', 'noSSLverify', 'false');
        
    	$url = OCP\Config::getAppValue('roundcube', 'rcInternalAddress', '');
    	// Generate RoundCube server address on-the-fly based on public address
    	if(!$url) {
			if ((isset($_SERVER['HTTPS']) && $_SERVER["HTTPS"] || isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) {
		        $url = "https://";
		    } else {
		        $url = "http://";
		    }
		    $url .= $rcHost;
		    if (strlen($rcPort) > 0) {
		        $url .= ":" . $rcPort;
		    }
		
			$sep = $maildir[0] != '/' ? '/' : '';
        	$url = $url . $sep . $maildir;
		}
		
		return new OC_RoundCube_Login($url, $disableSSLverify, $enableDebug, $enableVerbose);
    }
	
    /**
     * Logs the current user out from roundcube
     *
     * @param
     *            roundcube server address $rcHost
     * @param
     *            roundcube server port $rcPort
     * @param
     *            path to roundcube installation, Note: The first parameter is the URL-path of the RC inst
     *            NOT the file-system path http://host.com/path/to/roundcube/ --> "/path/to/roundcube" $maildir
     * @param
     *            roundcube usernam $user
     */
    public static function logout($rcHost, $rcPort, $maildir, $user)
    {
        $rcl = self::makeLoginHandler($rcHost, $rcPort, $maildir, false);
        if ($rcl->logout()) {
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->logout(): ' . $user . ' successfully logged off from roundcube ', OCP\Util::INFO);
        } else {
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->logout(): Failed to log-off ' . $user . ' from roundcube. If you are using roundcube 1.0.4. Please update to roundcube 1.0.5', OCP\Util::ERROR);
        }
        self::setSessionVariable(self::SESSION_ATTR_RCSESSID, '1');
        self::setSessionVariable(self::SESSION_ATTR_RCSESSAUTH, '1');
    }

    /**
     * Login to roundcube host
     *
     * @param
     *            roundcube host to use $rcHost
     * @param
     *            port of the roundcube server $rcPort
     * @param
     *            context path of roundcube $maildir
     * @param
     *            login to be used $pLogin
     * @param
     *            password to be used $pPassword
     */
    public static function login($rcHost, $rcPort, $maildir, $pLogin, $pPassword)
    {
        // Create RC login object.
        $rcl = self::makeLoginHandler($rcHost, $rcPort, $maildir, false);
        // Try to login
        $rcl->login($pLogin, $pPassword);
        OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->login(): Trying to log into roundcube webinterface under ' . $maildir . ' as user ' . $pLogin, OCP\Util::DEBUG);
        if ($rcl->isLoggedIn()) {
            // save roundcube session ID to Session
            self::setSessionVariable(self::SESSION_ATTR_RCSESSID, $rcl->getSessionID());
            self::setSessionVariable(self::SESSION_ATTR_RCSESSAUTH, $rcl->getSessionAuth());
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->login(): ' . $pLogin . ' already logged into roundcube with session ID ' . $rcl->getSessionID(), OCP\Util::DEBUG);
            return true;
        } else {
            $rcl->login($pLogin, $pPassword);
            if ($rcl->isLoggedIn()) {
                // save roundcube session ID to Session
                self::setSessionVariable(self::SESSION_ATTR_RCSESSID, $rcl->getSessionID());
                self::setSessionVariable(self::SESSION_ATTR_RCSESSAUTH, $rcl->getSessionAuth());
                OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->login(): ' . $pLogin . ' successfully logged into roundcube with session ID ' . $rcl->getSessionID(), OCP\Util::DEBUG);
                return true;
            } else {
                // If the login fails, display an error message in the loggs
                OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->login(): ' . $pLogin . ': RoundCube can\'t login to roundcube due to a login error to roundcube', OCP\Util::ERROR);
                return false;
            }
        }
    }

    /**
     * Try to refresh roundcube session
     *
     * @param
     *            roundcube host to use $rcHost
     * @param
     *            port of the roundcube server $rcPort
     * @param
     *            context path of roundcube $maildir
     * @return true if session refresh was successfull, otherwise false
     */
    public static function refresh($rcHost, $rcPort, $maildir)
    {
        $ocUser = OCP\User::getUser();
        // Create RC login object.
        $rcl = self::makeLoginHandler($rcHost, $rcPort, $maildir, false);
        // reuse session ID
        $sessId = self::getSessionVariable(self::SESSION_ATTR_RCSESSID);
        if ($sessId !== false) {
            $rcl->setSessionID($sessId);
        }
        $sessAuth = self::getSessionVariable(self::SESSION_ATTR_RCSESSAUTH);
        if ($sessAuth !== false) {
            $rcl->setSessionAuth($sessAuth);
        }
        // Try to refresh
        OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->refresh(): Trying to refresh RoundCube session under ' . $maildir, OCP\Util::DEBUG);
        if ($rcl->isLoggedIn()) {
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->refresh(): Successfully refreshed the RC session.', OCP\Util::INFO);
            self::setSessionVariable(self::SESSION_ATTR_RCSESSAUTH, $rcl->getSessionAuth());
            return true;
        } else {
            // login errors, let's try once again
            if ($rcl->isLoggedIn()) {
                OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->refresh(): Trying again to refresh RoundCube session under ' . $maildir, OCP\Util::DEBUG);
                self::setSessionVariable(self::SESSION_ATTR_RCSESSAUTH, $rcl->getSessionAuth());
                return true;
            } else {
                // TODO add new exception here for relogin
                OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->refresh(): Failed to refresh the RC session.', OCP\Util::INFO);
                return false;
            }
        }
    }

    /**
     *
     * @brief showing up roundcube iFrame
     *
     * @param
     *            roundcube host $rcHost
     * @param
     *            roundcube port $rcPort
     * @param
     *            path to roundcube installation, Note: The first parameter is the URL-path of the RC inst
     *            NOT the file-system path http://host.com/path/to/roundcube/ --> "/path/to/roundcube" $maildir
     *            
     */
    public static function showMailFrame($rcHost, $rcPort, $maildir)
    {
        $ocUser = OCP\User::getUser();
        $rcLogin = self::getSessionVariable(self::SESSION_ATTR_RCUSER);
        $returnObject = new OC_Mail_Object();
        $enableDebug = OCP\Config::getAppValue('roundcube', 'enableDebug', true);
        $enableAutologin = OCP\Config::getAppValue('roundcube', 'autoLogin', false);
        try {
            if (! self::refresh($rcHost, $rcPort, $maildir)) {
                // If the login fails, display an error message in the logs
                OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->showMailFrame(): There were login errors', OCP\Util::ERROR);
                throw new OC_Mail_LoginException("Unable to login to roundcube");
            }
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->showMailFrame(): Preparing iFrame for roundcube.', OCP\Util::DEBUG);
            // loader image
            $loader_image = OCP\Util::imagePath('roundcube', 'loader.gif');
            $disable_header_nav = OCP\Config::getAppValue('roundcube', 'removeHeaderNav', 'false');
            $disable_control_nav = OCP\Config::getAppValue('roundcube', 'removeControlNav', 'false');
            
            $returnObject->setDisplayName($rcLogin);
            // create iFrame begin
            $returnObject->appendHtmlOutput('<div id="roundcubeLoaderContainer"><img src="' . $loader_image . '" id="roundcubeLoader"></div>');
            $returnObject->appendHtmlOutput('<iframe src="' . self::getRedirectPath($rcHost, $rcPort, $maildir) . '" id="roundcubeFrame"  name="roundcube" width="100%" style="display:none;">  </iframe>');
            $returnObject->appendHtmlOutput('<input type="hidden" id="disable_header_nav" value="' . $disable_header_nav . '"/>');
            $returnObject->appendHtmlOutput('<input type="hidden" id="disable_control_nav" value="' . $disable_control_nav . '"/>');
            // create iFrame end
        } catch (OC_Mail_NetworkingException $ex_net) {
            $returnObject->setErrorOccurred(true);
            $returnObject->setErrorCode(OC_Mail_Object::ERROR_CODE_NETWORK);
            $returnObject->setHtmlOutput('');
            $returnObject->setErrorDetails("ERROR: Technical problem during trying to connect to roundcube server, " . $ex_net->getMessage());
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->showMailFrame(): RoundCube can not login to roundcube due to a network connection exception to roundcube', OCP\Util::ERROR);
        } catch (OC_Mail_LoginException $ex_login) {
            $returnObject->setErrorOccurred(true);
            if ($enableAutologin) {
                OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->showMailFrame(): Autologin is enabled. Seems that the owncloud and roundcube login details do not match', OCP\Util::ERROR);
                $returnObject->setErrorCode(OC_Mail_Object::ERROR_CODE_AUTOLOGIN);
            } else {
                $returnObject->setErrorCode(OC_Mail_Object::ERROR_CODE_LOGIN);
            }
            $returnObject->setHtmlOutput('');
            $returnObject->setErrorDetails("ERROR: Technical problem, " . $ex_login->getMessage());
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->showMailFrame(): RoundCube can not login to roundcube due to a login exception to roundcube', OCP\Util::ERROR);
        } catch (OC_Mail_RC_InstallNotFoundException $ex_login) {
            $returnObject->setErrorOccurred(true);
            $returnObject->setErrorCode(OC_Mail_Object::ERROR_CODE_RC_NOT_FOUND);
            $returnObject->setHtmlOutput('');
            $returnObject->setErrorDetails("ERROR: Technical problem, " . $ex_login->getMessage());
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->showMailFrame(): RoundCube can nott be found on the given path.', OCP\Util::ERROR);
        } catch (Exception $ex_login) {
            $returnObject->setErrorOccurred(true);
            $returnObject->setErrorCode(OC_Mail_Object::ERROR_CODE_GENERAL);
            $returnObject->setHtmlOutput('');
            $returnObject->setErrorDetails("ERROR: Technical problem, " . $ex_login->getMessage());
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->showMailFrame(): RoundCube can not login to roundcube due to a unkown exception to roundcube', OCP\Util::ERROR);
        }
        return $returnObject;
    }

    public static function getRedirectPath($pRcHost, $pRcPort, $pRcPath)
    {
        // Use a relative protocol in case we/roundcube are behind an SSL proxy (see
        // http://tools.ietf.org/html/rfc3986#section-4.2).
        $protocol = '//';
        if (strlen($pRcPort) > 1) {
            $path = $protocol . rtrim($pRcHost, "/") . ":" . $pRcPort . "/" . ltrim($pRcPath, "/");
        } else {
            $path = $protocol . rtrim($pRcHost, "/") . "/" . ltrim($pRcPath, "/");
        }
        return $path;
    }

    public static function saveUserSettings($appName, $ocUser, $rcUser, $rcPassword)
    {
        $l = OC::$server->getL10N('roundcube');
        
        if (isset($appName) && $appName == "roundcube") {
            $result = self::cryptEmailIdentity($ocUser, $rcUser, $rcPassword, true);
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->saveUserSettings(): Starting saving new users data for ' . $ocUser . ' as roundcube user ' . $rcUser, OCP\Util::DEBUG);
            
            if ($result) {
                // update login credentials
                $rcMaildir = OCP\Config::getAppValue('roundcube', 'maildir', '');
                $rcHost = OCP\Config::getAppValue('roundcube', 'rcHost', '');
                $rcPort = OCP\Config::getAppValue('roundcube', 'rcPort', '');
                if ($rcHost == '') {
                    $rcHost = OCP\Util::getServerHost();
                }
                // login again
                if (self::login($rcHost, $rcPort, $rcMaildir, $rcUser, $rcPassword)) {
                    OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->saveUserSettings(): Saved user settings successfull.', OCP\Util::DEBUG);
                    OCP\JSON::success(array(
                        'data' => array(
                            'message' => $l->t('Email-user credentials successfully stored. Please login again to OwnCloud for applying the new settings.')
                        )
                    ));
                    return true;
                } else {
                    OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->saveUserSettings(): Login errors', OCP\Util::DEBUG);
                    OC_JSON::error(array(
                        "data" => array(
                            "message" => $l->t("Unable to login into roundcube. There are login errors.")
                        )
                    ));
                    return false;
                }
            } else {
                OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->saveUserSettings(): Unable to save email credentials.', OCP\Util::DEBUG);
                OC_JSON::error(array(
                    "data" => array(
                        "message" => $l->t("Unable to store email credentials in the data-base.")
                    )
                ));
                return false;
            }
        } else {
            OCP\Util::writeLog('roundcube', 'OC_RoundCube_App.class.php->saveUserSettings(): Not for roundcube app.', OCP\Util::DEBUG);
            OC_JSON::error(array(
                "data" => array(
                    "message" => $l->t("Not submitted for us.")
                )
            ));
            return false;
        }
    }
}
