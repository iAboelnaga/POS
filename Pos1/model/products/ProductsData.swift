//
//	Data.swift
//
//	Create by Aboelnaga on 17/8/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class ProductsData : NSObject, NSCoding, Mappable{

	var iD : Int?
	var branchName : String?
	var inFavourite : Bool?
	var mainImg : String?
	var name : String?
	var price : Int?
	var priceOffer : Int?


	class func newInstance(map: Map) -> Mappable?{
		return ProductsData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		iD <- map["ID"]
		branchName <- map["branch_name"]
		inFavourite <- map["in_favourite"]
		mainImg <- map["main_img"]
		name <- map["name"]
		price <- map["price"]
		priceOffer <- map["price_offer"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         iD = aDecoder.decodeObject(forKey: "ID") as? Int
         branchName = aDecoder.decodeObject(forKey: "branch_name") as? String
         inFavourite = aDecoder.decodeObject(forKey: "in_favourite") as? Bool
         mainImg = aDecoder.decodeObject(forKey: "main_img") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         price = aDecoder.decodeObject(forKey: "price") as? Int
         priceOffer = aDecoder.decodeObject(forKey: "price_offer") as? Int

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
		if branchName != nil{
			aCoder.encode(branchName, forKey: "branch_name")
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

	}

}
