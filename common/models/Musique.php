<?php

namespace Application\Models;

class Musique extends BaseModel {

    public $id;
    public $libelle;
    public $slug;
    public $id_categorie;
    public $created_at;
    public $updated_at;

    /**
     * Pour spécifier la table si elle est différence du nom de la classe
     */
    public function initialize() {
        $this->setSource('musique');
    }

    /**
     * 
     * @param type $name
     * @param type $path
     * @param type $categorie
     */
    public function creationMusique($name, $path, $categorie = null) {
        $musique = new Musique();
        $musique->id_categorie = $categorie;
        $musique->slug = $path;
        $musique->libelle = substr($name, 0, -4);
        $musique->created_at = $this->horodateur();
        $musique->updated_at = $this->horodateur();
        $musique->save();
    }

    /**
     * 
     * @param type $id
     * @param type $name
     * @param type $categorie
     */
    public function modificationMusique($id, $name, $categorie) {
        $musique = $this->findFirstMusique($id);
        if ($musique != false) {
            $musique->libelle = $name;
            $musique->id_categorie = $categorie;
            $musique->save();
            return true;
        }
        return false;
    }

    /**
     * 
     * @param type $id
     * @return boolean
     */
    public function suppressionMusique($id) {
        $musique = $this->findFirstMusique($id);
        $path = getcwd() . "/media/" . $musique->slug;
        if ($musique != false) {
            $musique->delete();
            if (is_file($path)) {
                unlink($path);
            }
            return true;
        }
        return false;
    }
    
   

    /**
     * 
     * @param type $id
     * @return type
     */
    public static function findFirstMusique($id) {
        return Musique::findFirst("id = " . $id);
    }

}
