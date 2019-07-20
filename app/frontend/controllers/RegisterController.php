<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 7/18/2019
 * Time: 11:21 AM
 */

namespace Multiple\Frontend\Controllers;

use Multiple\Frontend\Models\Users;

class RegisterController extends BaseController {

    public function indexAction(){
        if($this->request->isPost()){
            $billingRegister    = new Users();
            if($billingRegister->create($this->request->getPost())){
                $this->flash->success("Account Creation Successful");
                $this->response->redirect("login?task=success&p=".uniqid("xlR"));
            }
            else{
                $this->flash->error(implode(", ",$billingRegister->getMessages()));
                return $this->response->redirect("login?task=failed&r=".uniqid());
            }
        }
        return $this->view->disable();
    }
}