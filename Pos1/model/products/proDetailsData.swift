//
//	Data.swift
//
//	Create by Aboelnaga on 19/8/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class proDetailsData : NSObject, NSCoding, Mappable{

	var iD : Int?
	var details : String?
	var images : [AnyObject]?
	var inFavourite : Bool?
	var mainImg : String?
	var name : String?
	var price : Int?
	var priceOffer : Int?
	var proSize : [AnyObject]?
	var sellerId : Int?
	var sellerName : String?


	class func newInstance(map: Map) -> Mappable?{
		return proDetailsData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		iD <- map["ID"]
		details <- map["details"]
		images <- map["images"]
		inFavourite <- map["in_favourite"]
		mainImg <- map["main_img"]
		name <- map["name"]
		price <- map["price"]
		priceOffer <- map["price_offer"]
		proSize <- map["pro_size"]
		sellerId <- map["seller_id"]
		sellerName <- map["seller_name"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         iD = aDecoder.decodeObject(forKey: "ID") as? Int
         details = aDecoder.decodeObject(forKey: "details") as? String
         images = aDecoder.decodeObject(forKey: "images") as? [AnyObject]
         inFavourite = aDecoder.decodeObject(forKey: "in_favourite") as? Bool
         mainImg = aDecoder.decodeObject(forKey: "main_img") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         price = aDecoder.decodeObject(forKey: "price") as? Int
         priceOffer = aDecoder.decodeObject(forKey: "price_offer") as? Int
         proSize = aDecoder.decodeObject(forKey: "pro_size") as? [AnyObject]
         sellerId = aDecoder.decodeObject(forKey: "seller_id") as? Int
         sellerName = aDecoder.decodeObject(forKey: "seller_name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if iD != nil{
			aCoder.encode(iD, forKey: "ID")
		}
		if details != nil{
			aCoder.encode(details, forKey: "details")
		}
		if images != nil{
			aCoder.encode(images, forKey: "images")
		}
		if inFavourite != nil{
			aCoder.encode(inFavourite, forKey: "in_favourite")
		}
		if mainImg != nil{
			aCoder.encode(mainImg, forKey: "main_img")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if price != nil{
			aCoder.encode(price, forKey: "price")
		}
		if priceOffer != nil{
			aCoder.encode(priceOffer, forKey: "price_offer")
		}
		if proSize != nil{
			aCoder.encode(proSize, forKey: "pro_size")
		}
		if sellerId != nil{
			aCoder.encode(sellerId, forKey: "seller_id")
		}
		if sellerName != nil{
			aCoder.encode(sellerName, forKey: "seller_name")
		}

	}

}
