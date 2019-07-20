<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 6/25/2019
 * Time: 7:55 PM
 */

namespace Multiple\Frontend\Controllers;


use Phalcon\Mvc\View;
use Phalcon\Tag;

class ContactController extends BaseController {

    public function initialize() {
        parent::initialize();
        Tag::appendTitle("Contact Us");
    }

    public function indexAction(){
        if($this->request->isPost()){
            $mBodyMsg   = "Service Type: ".$this->request->getPost("services")
                ."<hr/>".$this->request->getPost("contact_message");
            $messageSent    = $this->mailer->createMessage()
                ->to("info@xtremecardz.com")
                ->subject($this->request->getPost("subject"))
                ->content(trim($mBodyMsg));
            if($messageSent){
                $this->response->setJsonContent([
                    "status"    => "OK",
                    "data"      => $this->request->getPost()
                ]);
                $this->response->send();
            }
            else{
                $this->response->setJsonContent([
                    "status"    => "ERROR",
                    "data"      => $this->request->getPost()
                ]);
                $this->response->send();
            }
            $this->view->disable();
        }
        $this->view->setRenderLevel(View::LEVEL_AFTER_TEMPLATE);
    }
}