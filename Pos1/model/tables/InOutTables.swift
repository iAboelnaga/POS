//
//	RootClass.swift
//
//	Create by Aboelnaga on 26/8/2019


import Foundation 
import ObjectMapper


class InOutTables : NSObject, NSCoding, Mappable{

	var cartTotalCost : Int?
	var data : [InOutTablesData]?
	var status : Bool?
	var tableId : Int?


	class func newInstance(map: Map) -> Mappable?{
		return InOutTables()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		cartTotalCost <- map["cart_total_cost"]
		data <- map["data"]
		status <- map["status"]
		tableId <- map["table_id"]
		
	}

    @objc required init(coder aDecoder: NSCoder)
	{
         cartTotalCost = aDecoder.decodeObject(forKey: "cart_total_cost") as? Int
         data = aDecoder.decodeObject(forKey: "data") as? [InOutTablesData]
         status = aDecoder.decodeObject(forKey: "status") as? Bool
         tableId = aDecoder.decodeObject(forKey: "table_id") as? Int

	}

    @objc func encode(with aCoder: NSCoder)
	{
		if cartTotalCost != nil{
			aCoder.encode(cartTotalCost, forKey: "cart_total_cost")
		}
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if tableId != nil{
			aCoder.encode(tableId, forKey: "table_id")
		}

	}

}
