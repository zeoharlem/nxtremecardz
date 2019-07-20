<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 7/15/2019
 * Time: 1:44 AM
 */

namespace Multiple\Frontend\Models;


class FinishType extends BaseModel {

    public function initialize(){
        $this->setSource("finish_type");
    }
}