<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 7/15/2019
 * Time: 1:43 AM
 */

namespace Multiple\Frontend\Models;


class BaseCardDesign extends BaseModel {

    public function initialize(){
        $this->setSource("base_card_design");
        $this->belongsTo(
            "base_card_design",
            "Multiple\\Frontend\\Models\\PricingTable",
            "base_card_design",
            array(
                "reusable"  => true,
                "alias"     => "PricingTableDesign"
            )
        );
    }

    public function getPricingTableDesign() {
        return $this->getRelated("PricingTableDesign");
    }
}