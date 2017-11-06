<?php

namespace Application\Components\Elements;

use Application\Models\Categorie;

/**
 * Elements
 *
 * Helps to build UI elements for the application
 */
class Elements extends \Phalcon\Mvc\User\Component {

    public function test() {
        echo "La classe element marche";
    }

    public function getCategorie($id) {
        if ($id == null) {
            echo "Auncune catégorie rattaché";
        } else {
            $categorie = Categorie::findFirst('id = ' . $id);
            if ($categorie != false) {
                echo $categorie->categorie;
            }
        }
    }

}
