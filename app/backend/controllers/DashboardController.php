<?php

namespace Application\Backend\Controllers;

class DashboardController extends BaseController {

    public function initialize() {
        $this->view->setTemplateAfter('user');
        parent::initialize();
    }

    public function indexAction() {
        
    }

}
