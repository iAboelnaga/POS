//
//	RootClass.swift
//
//	Create by Aboelnaga on 19/8/2019
//	Copyright © 2019. All rights reserved.

import Foundation 
import ObjectMapper


class OrderDetails : NSObject, NSCoding, Mappable{

	var data : [OrderDetailsData]?
	var status : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return OrderDetails()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		data <- map["data"]
		status <- map["status"]
		
	}

    @objc required init(coder aDecoder: NSCoder)
	{
         data = aDecoder.decodeObject(forKey: "data") as? [OrderDetailsData]
         status = aDecoder.decodeObject(forKey: "status") as? Bool

	}

    @objc func encode(with aCoder: NSCoder)
	{
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
