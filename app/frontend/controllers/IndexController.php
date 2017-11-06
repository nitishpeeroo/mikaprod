<?php

namespace Application\Frontend\Controllers;

use Phalcon\Tag,
Application\Models\User;
        

class IndexController extends BaseController {

    public function indexAction() {
        Tag::setTitle('Accueil');
        $this->assets->addCss('css/player.css');
     
    }

    public function aboutAction() {
        Tag::setTitle('A propos');
        $this->assets->addJs('js/wavesurfer/script.js');
    }

    public function contactAction() {
        Tag::setTitle('Contact');
    }
    public function testAction(){
        
    }

}
