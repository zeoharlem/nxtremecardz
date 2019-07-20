<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 7/19/2019
 * Time: 5:27 PM
 */

namespace Multiple\Frontend\Controllers;


use Multiple\Frontend\Models\Order;
use Phalcon\Mvc\View;

class DashboardController extends BaseController {

    public function initialize() {
        parent::initialize();
        $this->tag->appendTitle("Dashboard");
    }

    public function indexAction(){
        $this->view->setVar("activity", Order::find());
        return $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }

    public function getAction(){
        $tableRowPath   = "<div class=\"col_12 product-desc\">";

        if($this->request->isPost() && $this->request->isAjax()){
            $reference      = $this->request->getPost("reference");
            $getOrderRow    = Order::findFirstByReference(trim($reference));
            $getItemDetails = json_decode($getOrderRow->items);
            foreach($getItemDetails as $keyRowItem => $valueRowItem){
                $priceTagRow    = number_format($valueRowItem->price, 2);
                $imageRowPath   = substr($valueRowItem->image, strpos($valueRowItem->image,'assets'));
                $tableRowPath   .= "<!-- Product Single - Short Description
								============================================= -->
								<p><img src='$imageRowPath' style='height: 90%' /></p><div class=\"product-price\"><ins>&#8358;$priceTagRow</ins></div>";
            }
            $tableRowPath   .= "<!-- Product Single - Meta
								============================================= -->
								<div class=\"card product-meta\">
									<div class=\"card-body\">
										<span itemprop=\"productID\" class=\"sku_wrapper\"><b>Status:</b> <span class=\"sku\"><a href='#'><b>".ucwords($getOrderRow->status)."</b></a></span></span>
										| <span class=\"posted_in\"><b>Reference Key:</b> <a href=\"#\" rel=\"tag\"><b>$getOrderRow->reference</b></a>.</span>
										| <span class=\"tagged_as\"><b>Date:</b> <a href=\"#\" rel=\"tag\"><b>$getOrderRow->order_date</b></a></span>
									</div>
								</div><!-- Product Single - Meta End -->
							</div>";
            echo $tableRowPath;
        }
        return $this->view->disable();
    }
}