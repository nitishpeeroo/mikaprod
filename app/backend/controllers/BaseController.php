<?php

namespace Application\Backend\Controllers;

use Phalcon\Mvc\Controller;
use Phalcon\Tag;
use Phalcon\Mvc\View;

class BaseController extends Controller {

    /**
     * 
     */
    public function initialize() {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
        Tag::prependTitle('MikaProd | ');
//        $this->assets->addCss('css/bootstrap/bootstrap.css', false, false)
//                ->addCss('css/admin/sb-admin.css')
//                ->addCss('css/admin/morris.css')
//                ->addCss('css/admin/font-awesome.min.css');
//
//        $this->assets->addJs('js/jquery-3.2.0.min.js', false, false)
//                ->addJs('js/bootstrap/bootstrap.min.js', false, false)
//                ->addJs('js/admin/morris.min.js', false, false)
//                ->addJs('js/admin/morris-data.js', false, false)
//                ->addJs('js/admin/raphael.min.js', false, false);
//                
        //$this->assets->collection('style')
        $this->assets->addCss('/css/bootstrap/bootstrap.css', false, false)
                ->addCss('/css/admin/sb-admin.css')
                // ->addCss('/css/admin/morris.css')
                ->addCss('/css/admin/font-awesome.css');
        //  ->setTargetPath('css/production.css')
        //->setTargetUri('css/production.css')
        //->join(true)
        //>addFilter(new \Phalcon\Assets\Filters\Cssmin());
        //$this->assets->collection('js')
        //addJs('js/jquery-3.2.0.min.js', false, false)
        ///->addJs('js/bootstrap/bootstrap.min.js', false, false)
        // $this->assets->addJs('/js/dropzone.js', false, false)
        //->addJs('/js/admin/morris.min.js', false, false)
        //  ->addJs('/js/admin/morris-data.js', false, false)
        $this->assets->addJs('/js/admin/raphael.min.js', false, false);
        //->setTargetPath('js/production.js')
        //->setTargetUri('js/production.js')
        //->join(true)
        //->addFilter(new \Phalcon\Assets\Filters\Jsmin());
//        $this->assets->collection('jsFooter')
//                ->setTargetPath('js/JsFooter.js')
//                ->setTargetUri('js/JsFooter.js')
//                ->join(true)
//                ->addFilter(new \Phalcon\Assets\Filters\Jsmin());
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

    public function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    public function FileSizeConvert($bytes) {
        $bytes = floatval($bytes);
        $arBytes = array(
            0 => array(
                "UNIT" => "TB",
                "VALUE" => pow(1024, 4)
            ),
            1 => array(
                "UNIT" => "GB",
                "VALUE" => pow(1024, 3)
            ),
            2 => array(
                "UNIT" => "MB",
                "VALUE" => pow(1024, 2)
            ),
            3 => array(
                "UNIT" => "KB",
                "VALUE" => 1024
            ),
            4 => array(
                "UNIT" => "B",
                "VALUE" => 1
            ),
        );

        foreach ($arBytes as $arItem) {
            if ($bytes >= $arItem["VALUE"]) {
                $result = $bytes / $arItem["VALUE"];
                $result = str_replace(".", ",", strval(round($result, 2))) . " " . $arItem["UNIT"];
                break;
            }
        }
        return $result;
    }

}
