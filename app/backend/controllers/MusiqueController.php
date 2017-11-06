<?php

namespace Application\Backend\Controllers;

use Application\Models\Musique;
use Application\Models\Categorie;
use Phalcon\Tag;

class MusiqueController extends BaseController {

    public function initialize() {
        parent::initialize();
        Tag::setTitle('Musique');
    }

    public function ajoutAction() {
        
    }

    public function gestionAction() {
        if ($_SERVER['REQUEST_METHOD'] == "POST") {
            $musique = new Musique();
            $musique->modificationMusique($_POST['id'], $_POST['name'], $_POST['parent']);
        }
        $musiques = Musique::find();
        $this->view->setVar('musiques', $musiques);
    }

    public function modificationAction($id) {
        $musique = Musique::findFirstMusique($id);
        $this->view->setVar('musique', $musique);

        $categories = Categorie::getCategories();
        $this->view->setVar('categories', $categories);
    }

    public function suppressionAction($id) {
        $musique = new Musique();
        $musique->suppressionMusique($id);
        $this->response->redirect('/admin/musique/gestion');
    }

    public function uploadAction() {
        $file = $_FILES['file'];
        $fileName = $file['name'];
        $size = $this->FileSizeConvert($size);
        if ($file['type'] == "audio/mp3") {
            $randomString = $this->generateRandomString(246) . ".mp3";
            $path = getcwd() . "/media/" . $randomString;
            if (move_uploaded_file($_FILES["file"]["tmp_name"], $path)) {
                $musique = new Musique();
                $musique->creationMusique($fileName, $randomString);
                $msg = true;
            } else {
                $msg = false;
            }
        } else {
            $msg = false;
        }
        echo $msg;
    }

}
