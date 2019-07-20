<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 7/20/2019
 * Time: 6:38 AM
 */

namespace Multiple\Frontend\Controllers;


class LogoutController extends BaseController {

    //put your code here
    public function indexAction(){
        //var_dump($this->session->get('auth')); exit;
        if($this->session->has('auth')){
            $this->__LogOutNow();
            $this->response->redirect('index?task=logout');
        }
    }

    private function __LogOutNow($param=''){
        empty($param) ? $this->session->destroy()
            : $this->session->remove($param);
    }
}