<?php

namespace Application\Backend\Controllers;

use Phalcon\Tag;

class AdminController extends BaseController {

    public function indexAction() {
        Tag::setTitle('Admin');
    }
    

}
