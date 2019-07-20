<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of BaseController
 *
 * @author web
 */
namespace Multiple\Frontend\Controllers;

use Multiple\Frontend\Models\AlbumImages;
use Multiple\Frontend\Models\Albums;
use Multiple\Frontend\Models\Categories;
use Multiple\Frontend\Models\PortfolioItems;
use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Model\Resultset;
use Phalcon\Tag;

class BaseController extends Controller {
    public function initialize(){
        $stacksRow  = [];
        Tag::prependTitle('Xtremecardz');
        Tag::setTitleSeparator(' | ');

        $category   = Categories::find();

        foreach($category as $keyCat => $valueCat){
            $portfolio  = $valueCat->getCatPortfolio();
            foreach($portfolio->toArray() as $keyPortf => $valuePortf){
                $getPortfolio   = PortfolioItems::findFirstByItem_id($valuePortf['item_id']);
                $getAlbumImgs   = $getPortfolio->getAlbums()->getAlbumsImages();
                $getImageId     = $getAlbumImgs->toArray()[0]['image_id'];

                $stacksRow[$valueCat->name][]   = [
                    "category_id"   => $valueCat->category_id,
                    "items"         => $valuePortf['title'],
                    "portfolio_id"  => $valuePortf['item_id'],
                    "albums_image"  => AlbumImages::findFirstByImage_id($getImageId)->getImages()->toArray()['filename'],
                    "layout"        => $getPortfolio->getAlbums()->toArray()['description']
                ];
            }

        }
        //var_dump($stacksRow); exit;
        $this->view->setVars(
            [
                "products"  => $stacksRow,
                "pItems"    => PortfolioItems::find()->toArray()
            ]
        );
        //var_dump(); exit;
        $this->assets->collection("headers")
            ->addCss("assets/css/components/bs-filestyle.css");

        $this->assets->collection("footers")
            ->addJs("assets/js/components/bs-filestyle.js")
            ->addJs("assets/js/packages.js");
    }
    
    protected function __dataTableFlow($builder){
        if($this->request->isAjax()){
            $dataTables = new \DataTables\DataTable();
            return $dataTables->fromBuilder($builder)->sendResponse();
        }
    }
    
    protected function __dataTableArray($builder){
        if($this->request->isAjax()){
            $dataTables = new \DataTables\DataTable();
            return $dataTables->fromArray($builder)->sendResponse();
        }
    }
    
    //Get Array Conditions to replace post or get Query
    //Note that the index 0 returned is array and 1 is strings
    //Use like this $getWhatever = $this->__getArrayCon($array);
    protected function __getArrayCon(array $array){
        $strings = '';
        $results = array();
        foreach($array as $key => $value){
            $results[$key] = $value;
            $strings .= $key.' = :'.$key.': AND ';
        }
        return array(
            $results, substr($strings,0,-4)
        );
    }
    
    //Remove empty getPost() | getQuery() request
    protected function __getPostRemoveEmpty(){
        if($this->request->isPost()){
            foreach($this->request->getPost() as $key => $value){
                if(empty($value) || is_null($value)){
                    unset($_POST[$key]);
                }
            }
        }
        else{
            foreach($this->request->getQuery() as $key => $value){
                if(empty($value) || is_null($value)){
                    unset($_GET[$key]);
                }
            }
        }
    }
    
    //This method create a binding value based
    //Empty post remooved from the getPost() returned
    protected function __bindAfterRemoveEmpty($type='post'){
        $results = array();
        switch ($type) {
            case 'post':
                foreach($this->request->getPost() as $key => $value){
                    $results[$key] = $value;
                }
                return $results;
                break;
                
            case 'get':
                foreach($this->request->getQuery() as $key => $value){
                    if($key !== '_url'){
                        $results[$key] = $value;
                    }
                }
                return $results;
                break;
        }
    }
    
    //This method creates queries of values for binding
    protected function __conditionsRemoveEmpty($type='post'){
        $strings = '';
        switch ($type) {
            case 'post':
                foreach($this->request->getPost() as $key => $value){
                    $strings .= $key.' = :'.$key.': AND ';
                }
                return substr($strings,0,-4);
                break;
                
            case 'get':
                foreach($this->request->getQuery() as $key => $value){
                    if($key !== '_url'){
                        $strings .= $key.' = :'.$key.': AND ';
                    }
                }
                return substr($strings,0,-4);
                break;
        }
    }
    
}
