<?php

namespace Application\Backend;

use Phalcon\DiInterface;
use Phalcon\Assets\Manager;
use Phalcon\Http\Response\Cookies;
use Phalcon\Loader;
use Phalcon\Mvc\ModuleDefinitionInterface;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt;
use Phalcon\Db\Adapter\Pdo\Mysql as Connection;
use Phalcon\Flash\Direct as FlashDirect;
use Phalcon\Flash\Session as FlashSession;
use Phalcon\Session\Adapter\Files as SessionAdapter;
use Application\Components\Auth\Auth;
use Application\Components\Elements\Elements;

class Module implements ModuleDefinitionInterface {

    /**
     * Registers an autoloader related to the module
     *
     * @param DiInterface $di Dependency Injection Container [Optional]
     */
    public function registerAutoloaders(DiInterface $di = null) {
        $loader = new Loader();

        $loader->registerNamespaces([
            'Application\Backend\Controllers' => __DIR__ . '/controllers/',
            'Application\Models' => __DIR__ . '/../../common/models/',
            'Application\Components' => __DIR__ . '/../../common/',
        ]);

        $loader->register();
    }

    /**
     * Registers services related to the module
     *
     * @param DiInterface $di Dependency Injection Container
     */
    public function registerServices(DiInterface $di = null) {
        /**
         * Read configuration
         */
        $config = require __DIR__ . "/config/config.php";

        //Injection configuration
        $di->setShared('config', function () use ($config) {
            return $config;
        });


        /**
         * Setting up the view component
         */
        $di->setShared('view', function() {
            $view = new View();
            $view->setViewsDir(__DIR__ . '/views/');
            $view->setLayoutsDir(__DIR__ . '/views/templates/');
            $view->registerEngines([
                ".volt" => function($view, $di) {
                    $volt = new Volt($view, $di);
                    $volt->setOptions(array(
                        "compiledPath" => __DIR__ . "/../../var/volt",
                        'compiledExtension' => '.volt',
                        'compiledSeparator' => '-'
                    ));
                    return $volt;
                }
            ]);

            return $view;
        });

        $di->set('cookies', function() {
            $cookies = new Cookies();
            $cookies->useEncryption(true);
            return $cookies;
        });

        /**
         * Register a user component
         */
        $di->set('elements', function() {
            return new Elements();
        });


        $di->set('session', function () {
            $session = new SessionAdapter();
            $session->start();
            return $session;
        });

        /**
         * Custom authentication component
         */
        $di->set('auth', function () {
            return new Auth();
        });

        $di->set('assets', function () {
            return new Manager();
        }, true);


        $di->set('flash', function () {
            return new FlashDirect([
                "error" => "alert alert-danger",
                "success" => "alert alert-success",
                "notice" => "alert alert-info",
                "warning" => "alert alert-warning",
            ]);
        });

        $di->set('flashSession', function() {
            return new FlashSession(array(
                'error' => 'alert alert-danger',
                'success' => 'alert alert-success',
                'notice' => 'alert alert-info',
                'warning' => 'alert alert-warning'
            ));
        });

        /**
         * Database connection is created based in the parameters defined in the configuration file
         */
        $di->setShared('db', function() use ($di) {
            $dbConfig = (array) $di->get('config')->get('db');
            return new Connection($dbConfig);
        });
    }

}
