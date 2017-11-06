<?php

namespace Application\Models;

class User extends BaseModel {

    public $id;
    public $nom;
    public $prenom;
    public $email;
    public $password;
    public $role;
    public $created_at;
    public $updated_at;

    /**
     * Pour spécifier la table si elle est différence du nom de la classe
     */
    public function initialize() {
        $this->setSource('user');
    }

    /**
     * @param type $nom
     * @param type $prenom
     * @param type $email
     * @param type $password
     * @return \Application\Models\User
     */
    public function creationCompte($nom, $prenom, $email, $password) {
        if (!$this->issetEmail($email)) {
            $user = new User();
            $user->nom = $nom;
            $user->prenom = $prenom;
            $user->email = $email;
            $user->password = $password;
            $user->role = 'user';
            $user->created_at = date('Y-m-d H:m:s');
            $user->updated_at = date('Y-m-d H:m:s');
            $user->save();
            return $user;
        }
        return false;
    }

    public function modificationUtilisateur($id, $nom, $prenom, $email) {
        $user = $this->getFirstUtilisateur($id);
        if ($user) {
            $user->nom = $nom;
            $user->prenom = $prenom;
            $user->email = $email;
            $user->updated_at = date('Y-m-d H:m:s');
            $user->save();
            return $user;
        }
    }

    public function issetEmail($email) {
        $user = User::findFirst('email = "' . $email . '"');
        if ($user != false) {
            return true;
        }
        return false;
    }

    public function getFirstUtilisateur($id) {
        return User::findFirst('id =' . $id);
    }

    public static function deleteUser($id) {
        $user = new User();
        $user = $user->getFirstUtilisateur($id);
        if ($user) {
            $user->delete();
        }
    }

}
