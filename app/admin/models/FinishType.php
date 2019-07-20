<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 7/12/2019
 * Time: 10:24 AM
 */

namespace Multiple\Admin\Models;


class FinishType extends BaseModel {

    public function initialize() {
        $this->setSource("finish_type");
    }
}