<?php

namespace Application\Models;

class Categorie extends BaseModel {

    public $id;
    public $categorie;
    public $id_categorie;
    public $slug;

    /**
     * Pour spécifier la table si elle est différence du nom de la classe
     */
    public function initialize() {
        $this->setSource('categorie');
    }

    /**
     * Créer une catégorie
     * @param type $name
     * @param type $idCategorie
     * @return \Application\Models\Categorie
     */
    public function creationCategorie($name, $idCategorie = null) {
        if ($this->issetCategorie($name)) {
            return false;
        }
        $categorie = new Categorie();
        $categorie->categorie = $name;
        $categorie->id_categorie = $idCategorie;
        $categorie->slug = $this->slug($name);
        $categorie->save();
        return $categorie;
    }

    public function issetCategorie($name) {
        $categorie = new Categorie();
        return $categorie->findFirst("categorie ='{$name}'");
    }

    public static function getCategories() {
        return Categorie::find();
    }

    public static function deleteCategorie($id) {
        $categorie = Categorie::findFirst('id =' . $id);
        if ($categorie != false) {
            $musiques = Musique::find('id_categorie =' . $id);
            foreach ($musiques as $musique) {
                $musique->id_categorie = null;
                $musique->save();
            }
            $categorie->delete();
        }
    }

}
