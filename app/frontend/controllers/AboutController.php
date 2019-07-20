<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 6/25/2019
 * Time: 6:27 PM
 */

namespace Multiple\Frontend\Controllers;


use Phalcon\Mvc\View;
use Phalcon\Tag;

class AboutController extends BaseController {

    public function initialize() {
        parent::initialize(); //
        Tag::appendTitle("About Us");
    }

    public function indexAction() {
        $this->view->setRenderLevel(View::LEVEL_AFTER_TEMPLATE);
    }
}