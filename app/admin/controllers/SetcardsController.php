<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 7/12/2019
 * Time: 9:04 AM
 */

namespace Multiple\Admin\Controllers;


use Multiple\Admin\Models\BaseCardDesign;
use Multiple\Admin\Models\FinishType;
use Multiple\Admin\Models\PricingTable;
use Phalcon\Mvc\View;

class SetcardsController extends BaseController {

    public function initialize() {
        parent::initialize(); //
        $this->tag->appendTitle("Set-Cards Up");
    }

    public function indexAction() {
        $timeRow        = time();
        if($this->request->isPost()){
            $pricingTable   = new PricingTable();
            if($pricingTable->create($this->request->getPost())){
                $this->flash->success("Pricing Table Created");
                return $this->response->redirect("admin/setcards?task=SUCCESS");
            }
            else{
                $this->flash->error(implode(",", $pricingTable->getMessages()));
                return $this->response->redirect("admin/setcards?task=FAILED");
            }
        }
        $this->view->setVar("finish_type", BaseCardDesign::find());
        return $this->view->setRenderLevel(View::LEVEL_AFTER_TEMPLATE);
    }

    public function finishtypesAction(){
        $timeRow        = time();
        if($this->request->hasFiles() && $this->request->isPost()){
            $getUploadFile  = $this->request->getUploadedFiles()[0];
            $uploadPathRow  = "../public/assets/base_design/";
            $newFileName    = $timeRow."_".preg_replace('/\s+/', '_', $getUploadFile->getName());
            $movedFileRow   = $getUploadFile->moveTo($uploadPathRow.$newFileName);
            if($movedFileRow){
                $tableBaseDesign    = new BaseCardDesign();
                $inputStackRow      = [
                    "base_card_image"   => $newFileName,
                    "base_card_title"   => $this->request->getPost("base_card_title"),
                ];
                if($tableBaseDesign->create($inputStackRow)){
                    $this->flash->success($this->request->getPost("base_card_title")." Base Design Created");
                    $this->response->redirect("admin/setcards/?task=redirect&type=SUCCESS");
                }
                else{
                    $this->flash->error("Error: ".implode(",", $tableBaseDesign->getMessages()));
                    return $this->response->redirect("admin/setcards?task= failed");
                }
            }
        }
        $baseCardDesign = BaseCardDesign::find();
        if($baseCardDesign){
            $this->view->setVars([
                "baseCardDesign"    => $baseCardDesign
            ]);
        }
        return $this->view->setRenderLevel(View::LEVEL_AFTER_TEMPLATE);
    }

    public function basecardsAction($id, $string){
        $finishTypes    = new FinishType();
        $uploadPathRow  = "../public/assets/base_design/sub/";
        if($this->request->hasFiles() && $this->request->isPost()) {
            $timeRow        = time();
            $getUploadFile  = $this->request->getUploadedFiles()[0];
            $newFileName    = $timeRow."_".preg_replace('/\s+/', '_', $getUploadFile->getName());
            $movedFileRow   = $getUploadFile->moveTo($uploadPathRow.$newFileName);
            if($movedFileRow) {
                $setTypeFinish = [
                    "base_card_design_id" => $id,
                    "finish_type_name"  => $this->request->getPost("finish_type_name"),
                    "finish_type_image" => $newFileName
                ];
                if ($finishTypes->create($setTypeFinish) != false) {
                    $this->flash->success($setTypeFinish["finish_type_name"]." Created");
                    return $this->response->redirect("admin/setcards/basecards/".$id."/".$string."?task=SUCCESS");
                }
                else{
                    $this->flash->error(implode(",", $finishTypes->getMessages()));
                    return $this->response->redirect("admin/setcards/basecards/".$id."/".$string."?task=failed");
                }
            }
        }
        $this->view->setVars([
            "titleString"   => trim($string),
            "base_card_id"  => (int) $id
        ]);
        return $this->view->setRenderLevel(View::LEVEL_AFTER_TEMPLATE);
    }
}