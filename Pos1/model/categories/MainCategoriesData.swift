//
//	Data.swift
//
//	Create by Aboelnaga on 17/8/2019
//	Copyright © 2019. All rights reserved.

import Foundation 
import ObjectMapper


class MainCategoriesData : NSObject, NSCoding, Mappable{

	var id : Int?
	var img : String?
	var name : String?


	class func newInstance(map: Map) -> Mappable?{
		return MainCategoriesData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		id <- map["id"]
		img <- map["img"]
		name <- map["name"]
		
	}
    
    @objc required init(coder aDecoder: NSCoder)
	{
         id = aDecoder.decodeObject(forKey: "id") as? Int
         img = aDecoder.decodeObject(forKey: "img") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String

	}

    @objc func encode(with aCoder: NSCoder)
	{
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if img != nil{
			aCoder.encode(img, forKey: "img")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}

	}

}
