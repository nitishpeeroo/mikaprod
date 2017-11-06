<?php

namespace Application\Frontend\Controllers;

use Phalcon\Tag;
use Application\Models\User;

class SignController extends BaseController {

    public function signoutAction() {
        $this->session->remove(SESSION_NAME);
        $this->session->destroy();
        $this->flash->success('Vous avez bien été déconnecter');
        $this->response->redirect('/');
    }

    /**
     * Connexion en mode utilisateur
     */
    public function signinAction() {
        Tag::setTitle('Connexion');
        $this->assets->collection('additional')
                ->addCss('css/signin.css');
    }

    /**
     * Création de compte
     */
    public function signupAction() {
        Tag::setTitle('Inscription');
        $this->assets->collection('additional')
                ->addCss('css/signin.css');
    }

    /*
     * Vérification avant connexion d'un utilisateur
     */

    public function doSigninAction() {
        //Vérification du token CSRF
        $this->checkCsrf('/connexion');
        //Désactivation d'un affichage
        $this->view->disable();
        //Requete SQL recherchant l'email
        $user = User::findFirst([
                    'email = :email:',
                    'bind' => [
                        'email' => $this->getPost('email', 'email'),
                    ]
        ]);
        //Vérification des donnée de l'utilisateur
        if (!$user) {
            $this->flashSession->error("Email ou mot de passe incorrect");
            $this->dispatcher->forward([
                "controller" => "sign",
                "action" => "signin",
            ]);
        }
        if (!$this->security->checkHash($this->getPost('password', 'string'), $user->password)) {
            $this->flashSession->error("Email ou mot de passe incorrect");
            $this->dispatcher->forward([
                "controller" => "sign",
                "action" => "signin",
            ]);
        }
        //Dispatche les utilisateurs par rôle
        switch ($user->role) {
            case 'admin':
                $this->setSession($user);
                $this->response->redirect('/admin');
                break;
            case 'user':
                $this->setSession($user);
                $this->response->redirect('/mon-compte');
                break;
        }
    }

    /**
     * Vérification avant création de compte etredirect vers son compte
     */
    public function doSignupAction() {

        $this->checkCsrf('/creer-compte');
        $this->view->disable();
        $email = $this->getPost('email', 'email');
        $nom = $this->getPost('nom', 'string');
        $prenom = $this->getPost('prenom', 'string');
        $password = $this->getPost('password', 'string');
        $passwordConfirm = $this->getPost('password-confirm', 'string');
        if ($password !== $passwordConfirm || $password == '') {
            $this->flashSession->error("Mot de passe Incorrect");
            $this->dispatcher->forward([
                "controller" => "sign",
                "action" => "signup",
            ]);
        } else {
            if (User::findFirst(['email = :email:', 'bind' => ['email' => $email]])) {
                $this->flashSession->error("Vous possédez déjà un compte");
                $this->dispatcher->forward([
                    "controller" => "sign",
                    "action" => "signup",
                ]);
            } else {
                $user = new User();
                $user = $user->creationCompte($nom, $prenom, $email, $this->security->hash($password));
                $this->setSession($user);
                $this->flashSession->success('Votre compte à bien été créer');
                $this->response->redirect('/mon-compte');
            }
        }
    }

    public function setSession(User $user) {
        $this->session->set(SESSION_NAME, array(
            'id' => $user->id,
            'nom' => $user->nom,
            'prenom' => $user->prenom,
            'email' => $user->email,
            'role' => $user->role,
            'nom' => $user->nom,
            'prenom' => $user->prenom
        ));
    }

}
