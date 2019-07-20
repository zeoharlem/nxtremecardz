<?php
/**
 * Created by PhpStorm.
 * User: Theophilus
 * Date: 2/18/2019
 * Time: 11:49 AM
 */
namespace Multiple\Backend\Controllers;

use Multiple\Backend\Models\Register;
use Phalcon\Mvc\View;

class IndexController extends BaseController {

    public function initialize(){
        parent::initialize();
    }

    public function indexAction(){
//        echo $this->security->hash("admin"); exit;
        return $this->view->setRenderLevel(View::LEVEL_MAIN_LAYOUT);
    }

    public function registerAction(){
        if($this->request->isPost()){
            $register   = new Register();

            Register::$_viewPath    = "http://xtremecardz.com";
            Register::$_message     = "Thank you for Registering. Kindly Activate your account. 
            An Account was successfully created for you. Username is your email and Password is Admin";

            if($register->create($this->request->getPost())){
                $this->flash->success('Registration Successful! Check your email for Activation');

                return $this->dispatcher->forward([
                    'action'    => 'confirm',
                    'params'    => $this->request->getPost()
                ]);

                //$this->response->redirect("backend/register/confirm?task=".uniqid('xLmR'));
            }
            else{
                $this->flash->error(implode(",", $register->getMessages()));
                $this->response->redirect("backend/index/register?task=".uniqid('xLmR'));
            }
        }
        return $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }

    public function confirmAction(){
        if($this->dispatcher->wasForwarded()) {
            $params = $this->dispatcher->getParams();
            $this->view->setVars([
                "email" => $params['email']
            ]);
            return $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
        }
        return $this->response->redirect("backend/index/register?task=");
    }

    public function passwordAction() {
        $hash   = $this->request->hasQuery('hash') ? $this->request->getQuery('hash') : '';
        $email  = $this->request->hasQuery('email') ? $this->request->getQuery('email') : '';
        if(!empty($hash) && !empty($email)) {
            if ($this->request->isPost()) {
                $password   = $this->request->getPost('password');
                $rpassword  = $this->request->getPost('rpassword');
                if($password == $rpassword){
                    $register   = Register::findFirst('email="'.$email.'" AND hash="'.$hash.'"');
                    if($register){

                        $updateRow  = $register->update(
                            [
                                "role"      => 'user',
                                "password"  => $password,
                            ]
                        );
                        if($updateRow){
                            $this->flash->success("Password Created | Updated Successfully");
                            return $this->response->redirect('backend/');
                        }
                        else{
                            $this->flash->error("Unable to Update Password");
                            return $this->response->redirect('backend/index/register/password?hash='.$hash.'&email='.$email);
                        }
                    }
                    else{
                        $this->flash->error("Seems your email is not found");
                        return $this->response->redirect('backend/index/register/password?hash='.$hash.'&email='.$email);
                    }
                }
                else{
                    $this->flash->error("Passwords are not the same");
                    return $this->response->redirect('backend/index/register/password?hash='.$hash.'&email='.$email);
                }
            }
            return $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
        }
        else{
            $this->response->redirect("backend/index?task=MISSING_HASH&emailTag");
        }
    }

}