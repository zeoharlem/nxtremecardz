<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 7/15/2019
 * Time: 1:46 AM
 */

namespace Multiple\Frontend\Models;


class PricingTable extends BaseModel {

    public function initialize(){
        $this->setSource("pricing_table");
    }
}