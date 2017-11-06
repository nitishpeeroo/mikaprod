<?php

$router = new \Phalcon\Mvc\Router(false);

$router->removeExtraSlashes(true);

$frontend = 'Application\Frontend\Controllers\\';
$backend = 'Application\Backend\Controllers\\';

/**
 *  Page erreur
 */
$router->add('/page-404', [
    'module' => 'frontend',
    'namespace' => $frontend,
    'controller' => 'error',
    'action' => 'error404'
]);

/**
 * Accueil
 */
$router->add('/', [
    'module' => 'frontend',
    'namespace' => $frontend,
    'controller' => 'index',
    'action' => 'index'
]);

/**
 * test
 */
$router->add('/test', [
    'module' => 'frontend',
    'namespace' => $frontend,
    'controller' => 'index',
    'action' => 'test'
]);
/**
 * A propos
 */
$router->add('/a-propos', [
    'module' => 'frontend',
    'namespace' => $frontend,
    'controller' => 'index',
    'action' => 'about'
]);

/**
 * Contactez-nous
 */
$router->add('/contact', [
    'module' => 'frontend',
    'namespace' => $frontend,
    'controller' => 'index',
    'action' => 'contact'
]);

/**
 * Page de déconnexion
 */
$router->add("/deconnexion", [
    'module' => 'frontend',
    'namespace' => $frontend,
    'controller' => 'sign',
    'action' => 'signout',
]);
/*
 * Pages de connexions
 */
$router->add("/connexion", [
    'module' => 'frontend',
    'namespace' => $frontend,
    'controller' => 'sign',
    'action' => 'signin',
]);

$router->add("/connexion/verification", [
    'module' => 'frontend',
    'namespace' => $frontend,
    'controller' => 'sign',
    'action' => 'doSignin',
]);
/*
 * Page de création de compte
 */
$router->add("/creer-compte", [
    'module' => 'frontend',
    'namespace' => $frontend,
    'controller' => 'sign',
    'action' => 'signup',
]);
/**
 * Gestion de la création de compte
 */
$router->add("/signup/doSignup", [
    'module' => 'frontend',
    'namespace' => $frontend,
    'controller' => 'sign',
    'action' => 'doSignup',
]);
/**
 * Gestion de la connexion
 */
$router->add("/signin/doSignin", [
    'module' => 'frontend',
    'namespace' => $frontend,
    'controller' => 'sign',
    'action' => 'doSignin',
]);

/**
 * 
 * Backend
 * 
 */
$router->add('/mon-compte', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'dashboard',
    'action' => 'index'
]);

$router->add('/admin', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'admin',
    'action' => 'index'
]);
/**
 * CategorieController
 */
$router->add('/admin/categorie/gestion', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'categorie',
    'action' => 'gestion'
]);
$router->add('/admin/categorie/suppression/{id}', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'categorie',
    'action' => 'suppression',
    'id' => 1
]);
$router->add('/admin/categorie/modification/{id}', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'categorie',
    'action' => 'modification',
    'id' => 1
]);
/**
 * MusiqueController
 */
$router->add('/admin/musique/ajout', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'musique',
    'action' => 'ajout'
]);
$router->add('/admin/musique/modification/{id}', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'musique',
    'action' => 'modification',
    'id' => 1
]);
$router->add('/admin/musique/suppression/{id}', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'musique',
    'action' => 'suppression',
    id => 1
]);
$router->add('/admin/musique/gestion', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'musique',
    'action' => 'gestion'
]);
$router->add('/admin/musique/upload', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'musique',
    'action' => 'upload'
]);
/**
 * UtilisateurController
 */
$router->add('/admin/utilisateur/ajout', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'utilisateur',
    'action' => 'ajout'
]);
$router->add('/admin/utilisateur/modification/{id}', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'utilisateur',
    'action' => 'modification',
    'id' => 1
]);

$router->add('/admin/utilisateur/suppression/{id}', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'utilisateur',
    'action' => 'suppression',
    id => 1
]);
$router->add('/admin/utilisateur/mot-de-passe-oublier/{id}', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'utilisateur',
    'action' => 'generateNewPassword',
    id => 1
]);
$router->add('/admin/utilisateur/gestion', [
    'module' => 'backend',
    'namespace' => $backend,
    'controller' => 'utilisateur',
    'action' => 'gestion'
]);
return $router;
