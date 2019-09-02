//
//	RootClass.swift
//
//	Create by Aboelnaga on 1/9/2019

import Foundation 
import ObjectMapper


class Kitchen : NSObject, NSCoding, Mappable{

	var data : [KitchenData]?
	var status : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return Kitchen()
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
         data = aDecoder.decodeObject(forKey: "data") as? [KitchenData]
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
