<?php

namespace Application\Backend\Controllers;

use Application\Models\Categorie;
use Phalcon\Tag;

class CategorieController extends BaseController {

    public function initialize() {
        parent::initialize();
         Tag::setTitle('Catégorie');
    }

    public function gestionAction() {
        if ($_SERVER['REQUEST_METHOD'] == "POST") {
            $categorie = new Categorie();
            $categorie->creationCategorie($_POST['name'], $_POST['parent']);
        }
        $categorie = Categorie::getCategories();
        $this->view->setVar('categories', $categorie);
    }

    public function suppressionAction($id) {
        Categorie::deleteCategorie($id);
        $this->response->redirect('/admin/categorie/gestion');
    }

    public function modificationAction($id) {
        $categorie = Categorie::findFirst('id =' . $id);
        $this->view->setVar('categorie', $categorie);

        $categories = Categorie::getCategories();
        $this->view->setVar('categories', $categories);
    }

}
