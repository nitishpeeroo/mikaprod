<?php

namespace Application\Frontend\Controllers;
use Phalcon\Tag;

class ErrorController extends BaseController {
    
    public function initialize() {
        parent::initialize();
    }

    public function error404Action() {
         Tag::setTitle('Page 404');

    }

}
