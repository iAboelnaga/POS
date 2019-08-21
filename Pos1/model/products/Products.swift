//
//	RootClass.swift
//
//	Create by Aboelnaga on 17/8/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Products : NSObject, NSCoding, Mappable{

	var catName : String?
	var data : [ProductsData]?
	var itemFound : Int?
	var status : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return Products()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		catName <- map["cat_name"]
		data <- map["data"]
		itemFound <- map["item_found"]
		status <- map["status"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         catName = aDecoder.decodeObject(forKey: "cat_name") as? String
         data = aDecoder.decodeObject(forKey: "data") as? [ProductsData]
         itemFound = aDecoder.decodeObject(forKey: "item_found") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if catName != nil{
			aCoder.encode(catName, forKey: "cat_name")
		}
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if itemFound != nil{
			aCoder.encode(itemFound, forKey: "item_found")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
