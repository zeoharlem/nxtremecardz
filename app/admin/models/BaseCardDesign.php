<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 7/12/2019
 * Time: 10:23 AM
 */

namespace Multiple\Admin\Models;


class BaseCardDesign extends BaseModel {

    public function initialize() {
        $this->setSource("base_card_design");
        $this->belongsTo(
            "base_card_design_id",
            "Multiple\\Admin\\Models\\FinishType",
            "base_card_design_id",
            array(
                'reusable'  => true,
                'alias'     => "FinishTypesBaseCardDesign"
            )
        );
    }

    public function getFinishType(){
        return $this->getRelated('FinishTypesBaseCardDesign');
    }


}