<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 7/18/2019
 * Time: 10:51 AM
 */

namespace Multiple\Frontend\Controllers;


use Multiple\Frontend\Models\Users;
use Phalcon\Mvc\View;

class LoginController extends BaseController {

    public function initialize() {
        parent::initialize();
        $this->tag->appendTitle("Login");
    }

    public function indexAction() {
        if($this->request->isPost()){
            $username   = $this->request->getPost("username");
            $password   = $this->request->getPost("fpassword");
            $getUsername= Users::findFirstByEmail(trim($username));
            if($getUsername != false){
                if($this->security->checkHash($password, $getUsername->password)){
                    $this->_setActiveRoles($getUsername);
                    $this->flash->success("Hi! ".$getUsername->fullname.", Welcome.");
                    return $this->response->redirect("cart/checkout?token=".uniqid("xLRv"));
                }
                else{
                    $this->flash->error("Incorrect Password Submitted");
                    return $this->response->redirect("login/?task=failed");
                }
            }
            else{
                $this->flash->error($username." is not found here");
                return $this->response->redirect("login/?task=failed");
            }
        }
        return $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }

    private function _setActiveRoles(Users $users){
        $getBillRegs    = $users->getBillingRegister()->toArray();
        $firstname      = $getBillRegs['firstname'];
        $lastname       = $getBillRegs['lastname'];
        $this->session->set("auth", array(
            "firstname"     => $firstname,
            "lastname"      => $lastname,
            "email"         => $users->email,
            "fullname"      => $firstname." ".$lastname,
            "address"       => $getBillRegs["address"],
            "country"       => $getBillRegs["country"],
            "company"       => $getBillRegs["company"],
            "city"          => $getBillRegs["city"],
            "phonenumber"   => $users->phonenumber,
            "role"          => $users->role,
        ));
    }
}