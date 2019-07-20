<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 7/15/2019
 * Time: 12:57 AM
 */

namespace Multiple\Frontend\Controllers;


use Multiple\Frontend\Models\BaseCardDesign;
use Multiple\Frontend\Models\EliteHeadson;
use Multiple\Frontend\Models\FinishType;
use Multiple\Frontend\Models\PricingTable;
use Phalcon\Mvc\View;

class PackagesController extends BaseController {

    public function initialize() {
        parent::initialize();
    }

    public function indexAction(){
        //var_dump($this->url->get()); exit;
        $this->tag->appendTitle("Heads-On Package");
        return $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }

    public function swiftsAction(){
        $this->tag->appendTitle("Swift Package");
        $this->view->setVar("baseCardDesign", BaseCardDesign::find());
        return $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }

    public function elitesAction(){
        $this->tag->appendTitle("Elites Package");
        return $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }

    public function setrequestAction(){
        $timeRow    = time();
        $packageTypeImage   = "";
        $hash_tag   = $timeRow."_".$this->security->hash($timeRow);

        if($this->request->isAjax() && $this->request->isPost()){
            $stackRow   = [
                "file_list"             => $this->request->getPost("fileList"),
                "graphic_description"   => $this->request->getPost("graphicDes"),
                "package_type"          => $this->request->getPost("packageType"),
                "quantity_price"        => $this->request->getPost("quantityDerive"),
                "total_quantity"        => $this->request->getPost("totalQuantity"),
                "tag_description"       => $this->request->getPost("tagDescript"),
                //"hash_tagRow"         => $this->request->getPost("hash_tagRow"),
            ];

            $splitted       = explode(",", $stackRow["file_list"]);
            if($stackRow['package_type'] == "headson"){
                $packageTypeImage   = $this->url->get("assets/images/heads_on_pack_white.png");
            }
            elseif($stackRow['package_type'] == "elites"){
                $packageTypeImage   = $this->url->get("assets/images/elite_pack_white.png");
            }
            else{
                $packageTypeImage   = "";
            }
            $getStackRow[$hash_tag]    = [
                "image"     => $packageTypeImage,
                "price"     => $stackRow['quantity_price'],
                "quantity"  => $stackRow['package_type'] == "headson" || $stackRow['package_type'] == "elites"? 1: $stackRow['total_quantity'],
                "total"     => $stackRow['quantity_price'],
                "notes"     => $stackRow['tag_description'],
                "name"      => $stackRow['package_type'],
                "items"     => $this->request->getPost(),
                "hash_tag"  => $hash_tag,
            ];
            $this->session->set("cart_item", $getStackRow);
            $this->response->setJsonContent(
                [
                    "status"    => "OK",
                    "data"      => $getStackRow,
                    "hashtag"   => $hash_tag
                ]
            )->send();
        }

        return $this->view->disable();
    }

    public function uploadimgAction() {
        $runTask        = false;
        $messageTask    = array();
        $getFilesRow    = array();
        if($this->request->isAjax() && $this->request->hasFiles()){
            $uploadPathRow  = "";
            $timeRow        = time();
            $typePackage    = $this->request->getPost("type_package");
            if($typePackage == "headson" || $typePackage == "elites"){
                $uploadPathRow  = "../public/assets/elites_heads/";
            }
            else {
                $uploadPathRow  = "../public/assets/order_mix/";
            }
            foreach($this->request->getUploadedFiles() as $keysRow=>$valuesRow){
                $newFileName    = $timeRow . "_" . preg_replace('/\s+/', '_', $valuesRow->getName());
                $movedFileRow   = $valuesRow->moveTo($uploadPathRow.'/'.$newFileName);
                if($movedFileRow != false){
                    $runTask        = true;
                    $getFilesRow[]  = $newFileName;
                    $messageTask[]  = $valuesRow->getName()." Uploaded";
                }
                else{
                    $messageTask[]  = "Error:".$valuesRow->getError();
                }
            }
            if($runTask != false){
                $this->response->setJsonContent(
                    [
                        "status"    => "OK",
                        "data"      => $getFilesRow,
                        "extras"    => $this->request->getPost(),
                        "hashtag"   => $timeRow."_".$this->security->hash($timeRow),
                        "message"   => $messageTask
                    ]
                );
                $this->response->send();
            }
            else{
                $this->response->setJsonContent(
                    [
                        "status"    => "ERROR",
                        "data"      => array(),
                        "extras"    => array(),
                        "message"   => $messageTask
                    ]
                );
                $this->response->send();
            }
        }
        return $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }

    public function packtypeAction(){
        if($this->request->isAjax() && $this->request->isPost()){
            $stackRow       = [];
            $getPackType    = $this->request->getPost("pack_id","int");
            $getPackAso     = FinishType::find("base_card_design_id = '".$getPackType."'");
            $getPrincing    = PricingTable::find("base_card_design_id ='".$getPackType."'");
            foreach($getPackAso as $keyRow => $valueRow) {
                $stackCardDesignRow[]   = $valueRow;
            }
            $this->response->setJsonContent(
                [
                    "status"    => "OK",
                    "cardDesign"=> $getPackAso->toArray(),
                    "pricing"   => $getPrincing->toArray(),
                ]
            )->send();
        }
        return $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
}