//
//	RootClass.swift
//
//	Create by Aboelnaga on 8/9/2019
//	Copyright © 2019. All rights reserved.

import Foundation 
import ObjectMapper


class InOutTables : NSObject, NSCoding, Mappable{

	var data : [InOutTablesData]?
	var status : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return InOutTables()
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
         data = aDecoder.decodeObject(forKey: "data") as? [InOutTablesData]
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
