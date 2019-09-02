//
//	Data.swift
//
//	Create by Aboelnaga on 26/8/2019


import Foundation 
import ObjectMapper


class InOutTablesData : NSObject, NSCoding, Mappable{

	var iD : Int?
	var mainImg : String?
	var name : String?
	var price : Int?
	var priceOffer : Int?
	var quantity : Int?
	var sellerId : Int?
	var sellerName : String?
	var sizeId : Int?
	var sizeName : String?
	var tableId : Int?
	var total : Int?


	class func newInstance(map: Map) -> Mappable?{
		return InOutTablesData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		iD <- map["ID"]
		mainImg <- map["main_img"]
		name <- map["name"]
		price <- map["price"]
		priceOffer <- map["price_offer"]
		quantity <- map["quantity"]
		sellerId <- map["seller_id"]
		sellerName <- map["seller_name"]
		sizeId <- map["size_id"]
		sizeName <- map["size_name"]
		tableId <- map["table_id"]
		total <- map["total"]
		
	}

    @objc required init(coder aDecoder: NSCoder)
	{
         iD = aDecoder.decodeObject(forKey: "ID") as? Int
         mainImg = aDecoder.decodeObject(forKey: "main_img") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         price = aDecoder.decodeObject(forKey: "price") as? Int
         priceOffer = aDecoder.decodeObject(forKey: "price_offer") as? Int
         quantity = aDecoder.decodeObject(forKey: "quantity") as? Int
         sellerId = aDecoder.decodeObject(forKey: "seller_id") as? Int
         sellerName = aDecoder.decodeObject(forKey: "seller_name") as? String
         sizeId = aDecoder.decodeObject(forKey: "size_id") as? Int
         sizeName = aDecoder.decodeObject(forKey: "size_name") as? String
         tableId = aDecoder.decodeObject(forKey: "table_id") as? Int
         total = aDecoder.decodeObject(forKey: "total") as? Int

	}

    @objc func encode(with aCoder: NSCoder)
	{
		if iD != nil{
			aCoder.encode(iD, forKey: "ID")
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
		if quantity != nil{
			aCoder.encode(quantity, forKey: "quantity")
		}
		if sellerId != nil{
			aCoder.encode(sellerId, forKey: "seller_id")
		}
		if sellerName != nil{
			aCoder.encode(sellerName, forKey: "seller_name")
		}
		if sizeId != nil{
			aCoder.encode(sizeId, forKey: "size_id")
		}
		if sizeName != nil{
			aCoder.encode(sizeName, forKey: "size_name")
		}
		if tableId != nil{
			aCoder.encode(tableId, forKey: "table_id")
		}
		if total != nil{
			aCoder.encode(total, forKey: "total")
		}

	}

}
