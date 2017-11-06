<?php

namespace Application\Frontend\Controllers;

use Phalcon\Mvc\Controller;
use Phalcon\Tag;

class BaseController extends Controller {

    /**
     * 
     */
    public function initialize() {
        Tag::prependTitle('MkMusicProd | ');
        $this->assets->collection('style')
                ->addCss('css/bootstrap/bootstrap.css', false, false);
//                ->setTargetPath('css/production.css')
//                ->setTargetUri('css/production.css')
//                ->join(true)
//                ->addFilter(new \Phalcon\Assets\Filters\Cssmin());
        $this->assets->collection('js')
                ->addJs('js/jquery-3.2.0.min.js', false, false)
                ->addJs('js/bootstrap/bootstrap.min.js', false, false)
                ->setTargetPath('js/production.js')
                ->setTargetUri('js/production.js')
                ->join(true)
                ->addFilter(new \Phalcon\Assets\Filters\Jsmin());
    }

    /**
     * 
     */
    public function indexAction() {
        
    }

    /**
     * 
     */
    public function setJsonResponse() {
        $this->view->disable();
        $this->_isJsonResponse = true;
        $this->response->setContentType('application/json', 'UTF-8');
    }

    /**
     * 
     */
    public function notFoundAction() {
        $this->response->setStatusCode(404, 'Not Found');
        $this->view->setTemplateAfter("notFound");
        $this->assets->addCss('css/notFound.css');
    }

    /**
     * 
     */
    public function getStatusCode() {
        $this->vd($this->response->getStatusCode());
        die();
    }

    /**
     * 
     * @param type $var
     */
    public function vd($var) {
        echo '<pre>';
        var_dump($var);
        echo '</pre>';
        die();
    }

    /**
     * 
     * @param type $redirect
     * @return boolean
     */
    public function checkCsrf($redirect) {
        if ($this->security->checkToken() == false) {
            $this->flashSession->error('Invalide CSRF');
            $this->response->redirect($redirect);
        } else {
            return true;
        }
    }

    /**
     * 
     * @param type $name
     * @param type $type
     * @return type
     */
    public function getPost($name, $type) {
        return $this->request->getPost($name, $type);
    }

    public function getAllVariable() {
        $this->vd($GLOBALS);
    }

}
