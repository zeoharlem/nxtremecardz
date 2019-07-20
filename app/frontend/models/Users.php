<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 7/18/2019
 * Time: 12:22 PM
 */

namespace Multiple\Frontend\Models;


use Phalcon\Db\RawValue;
use Phalcon\Security;
use Phalcon\Validation;

class Users extends BaseModel {

    public $email, $password, $phonenumber, $role;
    public $date_registered, $user_id, $fullname;

    public function initialize(){
        $this->belongsTo(
            "email",
            "Multiple\\Frontend\\Models\\BillingRegister",
            "email",
            array(
                "reusable"  => true,
                "alias"     => "BillingRegister"
            )
        );
    }

    public function getBillingRegister() {
        return $this->getRelated("BillingRegister");
    }

    public function beforeValidationOnCreate(){
        $this->role = "users";
        $this->date_registered  = new RawValue("NOW()");
    }

    public function validation(){
        $security   = new Security();
        $validate   = new Validation();
        $validate->add("email", new Validation\Validator\Uniqueness([
            "model"     => $this,
            "message"   => "Email Already Existed"
        ]));

        $validate->add("phonenumber", new Validation\Validator\Uniqueness([
            "model"     => $this,
            "message"   => "Phone Number ALready Existed"
        ]));
        $this->password = $security->hash($this->password);
        return $this->validate($validate);
    }
}