<?php
use Application\Components\Elements\Elements,
    Phalcon\DI\FactoryDefault,
    Phalcon\Exception,
    Phalcon\Mvc\Application,
    Phalcon\Mvc\Dispatcher,
    Phalcon\Mvc\Url,
    Phalcon\Session\Adapter\Files;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt;

/**
 * Sets which PHP errors are reported
 */
error_reporting(E_ALL & ~E_NOTICE);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
const SESSION_NAME = 'phalcon-session';
date_default_timezone_set('Europe/Paris');
try {
    require __DIR__ . '/../vendor/autoload.php';

    //Dependancy Injection
    $di = new FactoryDefault();
    /**
     * Registering a router
     */
    $di->set('router', require __DIR__ . '/../common/config/routes.php');

    //Configure and start Session
    $di->setShared('session', function() {

        $session = new Files();
        $session->start();
        return $session;
    });
    
    /**
     * Register a user component
     */
    $di->set('elements', function() {
        return new Elements();
    });

    //Custom Dispatcher (Override the default)
    $di->set('dispatcher', function() use ($di) {
        $eventManager = $di->getShared('eventsManager');

        //Custom ACL Class
        require __DIR__ . '/../common/acl/Permission.php';
        $permission = new Permission();
        //Listen for events from the permission class
        $eventManager->attach('dispatch', $permission);

        $eventManager->attach('dispatch:beforeException', function($event, $dispatcher, $exception) {

            switch ($exception->getCode()) {

                case Phalcon\Dispatcher::EXCEPTION_HANDLER_NOT_FOUND:
                case Phalcon\Dispatcher::EXCEPTION_ACTION_NOT_FOUND:

                    $response = new Phalcon\Http\Response();
                    $response->redirect("/page-404");
                    return false;
            }
        }
        );

        $dispatcher = new Dispatcher();
        $dispatcher->setEventsManager($eventManager);

        return $dispatcher;
    });

    //Setup a base URI so that all generated URIs
    $di->set('url', function() {
        $url = new Url();
        $url->setBaseUri('/');
        return $url;
    });

    //Deploy the App
    $app = new Application($di);


    /**
     * Register application modules
     */
    $app->registerModules(require __DIR__ . '/../common/config/modules.php');



    echo $app->handle()->getContent();
  
} catch (Exception $e) {

    //Catch and display messages error
    echo $e->getMessage();
}