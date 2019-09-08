//
//	Data.swift
//
//	Create by Aboelnaga on 8/9/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class DriversData : NSObject, NSCoding, Mappable{

	var email : String?
	var img : String?
	var restaurantsBranchId : String?
	var restaurantsBranchName : String?
	var restaurantsMainId : Int?
	var restaurantsMainName : String?
	var typeRegisteration : String?
	var userMobile : String?
	var username : String?


	class func newInstance(map: Map) -> Mappable?{
		return DriversData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		email <- map["email"]
		img <- map["img"]
		restaurantsBranchId <- map["restaurants_branch_id"]
		restaurantsBranchName <- map["restaurants_branch_name"]
		restaurantsMainId <- map["restaurants_main_id"]
		restaurantsMainName <- map["restaurants_main_name"]
		typeRegisteration <- map["type_registeration"]
		userMobile <- map["user_mobile"]
		username <- map["username"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         email = aDecoder.decodeObject(forKey: "email") as? String
         img = aDecoder.decodeObject(forKey: "img") as? String
         restaurantsBranchId = aDecoder.decodeObject(forKey: "restaurants_branch_id") as? String
         restaurantsBranchName = aDecoder.decodeObject(forKey: "restaurants_branch_name") as? String
         restaurantsMainId = aDecoder.decodeObject(forKey: "restaurants_main_id") as? Int
         restaurantsMainName = aDecoder.decodeObject(forKey: "restaurants_main_name") as? String
         typeRegisteration = aDecoder.decodeObject(forKey: "type_registeration") as? String
         userMobile = aDecoder.decodeObject(forKey: "user_mobile") as? String
         username = aDecoder.decodeObject(forKey: "username") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if email != nil{
			aCoder.encode(email, forKey: "email")
		}
		if img != nil{
			aCoder.encode(img, forKey: "img")
		}
		if restaurantsBranchId != nil{
			aCoder.encode(restaurantsBranchId, forKey: "restaurants_branch_id")
		}
		if restaurantsBranchName != nil{
			aCoder.encode(restaurantsBranchName, forKey: "restaurants_branch_name")
		}
		if restaurantsMainId != nil{
			aCoder.encode(restaurantsMainId, forKey: "restaurants_main_id")
		}
		if restaurantsMainName != nil{
			aCoder.encode(restaurantsMainName, forKey: "restaurants_main_name")
		}
		if typeRegisteration != nil{
			aCoder.encode(typeRegisteration, forKey: "type_registeration")
		}
		if userMobile != nil{
			aCoder.encode(userMobile, forKey: "user_mobile")
		}
		if username != nil{
			aCoder.encode(username, forKey: "username")
		}

	}

}
