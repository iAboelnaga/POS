//
//	Data.swift
//
//	Create by Aboelnaga on 19/8/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class OrdersData : NSObject, NSCoding, Mappable{

	var datePayment : String?
	var delivery : Bool?
	var orderId : Int?
	var paytype : String?
	var price : Int?
	var priceDelivery : Int?
	var pricePro : Int?
	var quantity : Int?
	var tableId : Int?


	class func newInstance(map: Map) -> Mappable?{
		return OrdersData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		datePayment <- map["date_payment"]
		delivery <- map["delivery"]
		orderId <- map["order_id"]
		paytype <- map["paytype"]
		price <- map["price"]
		priceDelivery <- map["price_delivery"]
		pricePro <- map["price_pro"]
		quantity <- map["quantity"]
		tableId <- map["table_id"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         datePayment = aDecoder.decodeObject(forKey: "date_payment") as? String
         delivery = aDecoder.decodeObject(forKey: "delivery") as? Bool
         orderId = aDecoder.decodeObject(forKey: "order_id") as? Int
         paytype = aDecoder.decodeObject(forKey: "paytype") as? String
         price = aDecoder.decodeObject(forKey: "price") as? Int
         priceDelivery = aDecoder.decodeObject(forKey: "price_delivery") as? Int
         pricePro = aDecoder.decodeObject(forKey: "price_pro") as? Int
         quantity = aDecoder.decodeObject(forKey: "quantity") as? Int
         tableId = aDecoder.decodeObject(forKey: "table_id") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if datePayment != nil{
			aCoder.encode(datePayment, forKey: "date_payment")
		}
		if delivery != nil{
			aCoder.encode(delivery, forKey: "delivery")
		}
		if orderId != nil{
			aCoder.encode(orderId, forKey: "order_id")
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
		if quantity != nil{
			aCoder.encode(quantity, forKey: "quantity")
		}
		if tableId != nil{
			aCoder.encode(tableId, forKey: "table_id")
		}

	}

}
