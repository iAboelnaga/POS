//
//	Data.swift
//
//	Create by Aboelnaga on 1/9/2019


import Foundation 
import ObjectMapper


class KitchenData : NSObject, NSCoding, Mappable{

	var iD : Int?
	var datePayment : String?
	var paytype : String?
	var price : Int?
	var priceDelivery : Int?
	var pricePro : Int?
	var productName : String?
	var quantity : Int?


	class func newInstance(map: Map) -> Mappable?{
		return KitchenData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		iD <- map["ID"]
		datePayment <- map["date_payment"]
		paytype <- map["paytype"]
		price <- map["price"]
		priceDelivery <- map["price_delivery"]
		pricePro <- map["price_pro"]
		productName <- map["product_name"]
		quantity <- map["quantity"]
		
	}

    @objc required init(coder aDecoder: NSCoder)
	{
         iD = aDecoder.decodeObject(forKey: "ID") as? Int
         datePayment = aDecoder.decodeObject(forKey: "date_payment") as? String
         paytype = aDecoder.decodeObject(forKey: "paytype") as? String
         price = aDecoder.decodeObject(forKey: "price") as? Int
         priceDelivery = aDecoder.decodeObject(forKey: "price_delivery") as? Int
         pricePro = aDecoder.decodeObject(forKey: "price_pro") as? Int
         productName = aDecoder.decodeObject(forKey: "product_name") as? String
         quantity = aDecoder.decodeObject(forKey: "quantity") as? Int

	}

    @objc func encode(with aCoder: NSCoder)
	{
		if iD != nil{
			aCoder.encode(iD, forKey: "ID")
		}
		if datePayment != nil{
			aCoder.encode(datePayment, forKey: "date_payment")
		}
		if paytype != nil{
			aCoder.encode(paytype, forKey: "paytype")
		}
		if price != nil{
			aCoder.encode(price, forKey: "price")
		}
		if priceDelivery != nil{
			aCoder.encode(priceDelivery, forKey: "price_delivery")
		}
		if pricePro != nil{
			aCoder.encode(pricePro, forKey: "price_pro")
		}
		if productName != nil{
			aCoder.encode(productName, forKey: "product_name")
		}
		if quantity != nil{
			aCoder.encode(quantity, forKey: "quantity")
		}

	}

}