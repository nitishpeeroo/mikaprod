<?php

use Phalcon\Acl,
    Phalcon\Acl\Resource,
    Phalcon\Acl\Role,
    Phalcon\Acl\Adapter\Memory,
    Phalcon\Mvc\User\Plugin,
    Phalcon\Mvc\Dispatcher,
    Phalcon\Events\Event;

/*
 * Permission
 * 
 * Prevents User Types from accessing areas they are not allowed in.
 */

class Permission extends Plugin {
    /*
     * Constants to prevent a typo
     */

    const GUEST = 'guest';
    const USER = 'user';
    const ADMIN = 'admin';

    /**
     * Accesible to everyone
     * @var array
     */
    protected $_publicResources = [
        'index' => ['index', 'about', 'contact', 'test'],
        'sign' => ['signout', 'signin', 'doSignin', 'signup', 'doSignup'],
        'error' => ['error404'],
    ];

    /**
     * Accesible to Users (and Admins)
     * @var array
     */
    protected $_userResources = [
        'dashboard' => ['index']
    ];

    /**
     * Accesible to Admins
     * @var array
     */
    protected $_adminResources = [
        'admin' => ['index'],
        'categorie' => ['gestion', 'suppression', 'modification'],
        'musique' => ['ajout', 'gestion', 'modification', 'suppression', 'upload'],
        'utilisateur' => ['ajout', 'gestion', 'modification', 'suppression','generateNewPassword']
    ];

    // -------------------------------------------------------------------------

    /**
     * 
     * @param Event $event
     * @param Dispatcher $dispatcher
     * 
     * @return boolean|void
     */
    public function beforeExecuteRoute(Event $event, Dispatcher $dispatcher) {
        $session = $this->session->get(SESSION_NAME);
        if (!$session) {
            $role = self::GUEST;
        } else {
            $role = $session['role'];
        }

        //Get the current controller/action from the dispatcher
        $controller = $dispatcher->getControllerName();
        $action = $dispatcher->getActionName();
        //Get the ACL Rule List
        $acl = $this->getAcl();

        //See if they have permission

        $allowed = $acl->isAllowed($role, $controller, $action);

        if ($allowed != Acl::ALLOW) {
            $this->flash->error("Oups je pense que vous êtes arriver dans le monde des licornes");
            $this->response->redirect("/page-404")->sendHeaders();
            //Stops the dispatcher at the current operation
            return false;
        }
    }

    // -------------------------------------------------------------------------

    /**
     * Build the session ACL list one time if it's not set
     * 
     * @return object
     */
    protected function getAcl() {

        //if (isset($this->persistent->acl)) {

        $acl = new Memory();
        $acl->setDefaultAction(Acl::DENY);

        $roles = [
            self::GUEST => new Role(self::GUEST),
            self::USER => new Role(self::USER),
            self::ADMIN => new Role(self::ADMIN)
        ];

        foreach ($roles as $role) {
            $acl->addRole($role);
        }

        //Public Resources
        foreach ($this->_publicResources as $ressource => $action) {
            $acl->addResource(new Resource($ressource), $action);
        }

        //User Resources
        foreach ($this->_userResources as $ressource => $action) {
            $acl->addResource(new Resource($ressource), $action);
        }

        //Admin Resources
        foreach ($this->_adminResources as $ressource => $action) {
            $acl->addResource(new Resource($ressource), $action);
        }

        //Allow All Roles to access the Public Resources
        foreach ($roles as $role) {
            foreach ($this->_publicResources as $ressource => $action) {
                $acl->allow($role->getName(), $ressource, $action);
            }
        }

        //Allow User and Admin to access the User Resources
        foreach ($this->_userResources as $ressource => $actions) {
            foreach ($actions as $action) {
                $acl->allow(self::USER, $ressource, $action);
                $acl->allow(self::ADMIN, $ressource, $action);
            }
        }

        //Allow  Admin to access the Admin Resources
        foreach ($this->_adminResources as $ressource => $actions) {
            foreach ($actions as $action) {
                $acl->allow(self::ADMIN, $ressource, $action);
            }
        }

        $this->persistent->acl = $acl;
        //}

        return $this->persistent->acl;
    }

}
