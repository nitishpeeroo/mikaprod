<?php

use Phalcon\Tag;
class IndexController extends BaseController
{
     public function initialize()
    {
        Tag::setTitle(' - nitishpeeroo.fr');
         $this->view->setTemplateAfter("index");
        parent::initialize();
    }
    
    public function indexAction(){
        
        Tag::prependTitle('Index');
        $this->view->setVar('hello',"Hello World");
       
    }
}