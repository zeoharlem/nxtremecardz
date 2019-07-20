<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 7/17/2019
 * Time: 4:39 PM
 */

namespace Multiple\Frontend\Models;


use Phalcon\Db\RawValue;
use Phalcon\Security;
use Phalcon\Validation;

class EliteHeadson extends BaseModel {
    public $file_list, $graphic_description, $tag_description;
    public $date_created, $hash_tag, $package_type;

    public function initialize(){
        $this->setSource("elite_headson");

        $this->allowEmptyStringValues([
            "file_list", "graphic_description", "tag_description"
        ]);
    }

    public function beforeValidationOnCreate(){
        $timeRow            = time();
        $security           = new Security();
        $this->date_created = new RawValue("NOW()");
        $this->hash_tag     = $timeRow."_".$security->hash($timeRow);
    }

    public function validation(){
        $validate   = new Validation();
        $validate->add("hash_tag", new Validation\Validator\Uniqueness(
            [
                "model"     => $this,
                "message"   => "Tag Already Existed"
            ]
        ));
        return $this->validate($validate);
    }
}