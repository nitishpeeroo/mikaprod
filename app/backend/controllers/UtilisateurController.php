<?php

namespace Application\Backend\Controllers;

use Application\Models\User;
use Phalcon\Tag;

class UtilisateurController extends BaseController {

    public function initialize() {
        parent::initialize();
        Tag::setTitle('Utilisateur');
    }

    public function gestionAction() {
        if ($_SERVER['REQUEST_METHOD'] == "POST") {
            $user = new User();
            $password = $this->generateRandomString(6);
            $user->creationCompte($_POST['nom'], $_POST['prenom'], $_POST['email'], $this->security->hash($password));
            /**
             * Envoi de mail
             */
        }
        $utilisateurs = User::find("role != 'admin'");
        $this->view->setVar('utilisateurs', $utilisateurs);
    }

    public function suppressionAction($id) {
        User::deleteUser($id);
        $this->response->redirect('/admin/utilisateur/gestion');
    }

    public function modificationAction($id) {
        if ($_SERVER['REQUEST_METHOD'] == "POST") {
            $user = new User();
            $user->modificationUtilisateur($_POST['id'], $_POST['nom'], $_POST['prenom'], $_POST['email']);
            $this->response->redirect('/admin/utilisateur/gestion');
        }
        $utilisateur = User::findFirst('id =' . $id);
        $this->view->setVar('utilisateur', $utilisateur);
    }

    public function generateNewPasswordAction($id) {
        $user = new User();
        $user = $user->getFirstUtilisateur($id);
        if ($user != false) {
            $password = $this->generateRandomString();
            $user->password = $this->security->hash($password);
            $user->updated_at = date('Y-m-d H:m:s');
            $user->save();
            /**
             * Envoi de mail
             */
            $this->response->redirect('/admin/utilisateur/gestion');
        }
    }

}
