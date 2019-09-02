//
//	Login.swift
//
//	Create by Aboelnaga on 31/7/2019

import Foundation 
import ObjectMapper


class Login : NSObject, NSCoding, Mappable{

	var iD : Int?
	var delivery : Int?
	var email : String?
	var img : String?
	var invoices : Int?
	var message : String?
	var restaurantsBranchId : String?
	var restaurantsBranchName : String?
	var restaurantsMainId : Int?
	var restaurantsMainName : String?
	var status : Bool?
	var tables : Int?
	var typeRegisteration : String?
	var userMobile : String?
	var username : String?


	class func newInstance(map: Map) -> Mappable?{
		return Login()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		iD <- map["ID"]
		delivery <- map["delivery"]
		email <- map["email"]
		img <- map["img"]
		invoices <- map["invoices"]
		message <- map["message"]
		restaurantsBranchId <- map["restaurants_branch_id"]
		restaurantsBranchName <- map["restaurants_branch_name"]
		restaurantsMainId <- map["restaurants_main_id"]
		restaurantsMainName <- map["restaurants_main_name"]
		status <- map["status"]
		tables <- map["tables"]
		typeRegisteration <- map["type_registeration"]
		userMobile <- map["user_mobile"]
		username <- map["username"]
		
	}

    @objc required init(coder aDecoder: NSCoder)
	{
         iD = aDecoder.decodeObject(forKey: "ID") as? Int
         delivery = aDecoder.decodeObject(forKey: "delivery") as? Int
         email = aDecoder.decodeObject(forKey: "email") as? String
         img = aDecoder.decodeObject(forKey: "img") as? String
         invoices = aDecoder.decodeObject(forKey: "invoices") as? Int
         message = aDecoder.decodeObject(forKey: "message") as? String
         restaurantsBranchId = aDecoder.decodeObject(forKey: "restaurants_branch_id") as? String
         restaurantsBranchName = aDecoder.decodeObject(forKey: "restaurants_branch_name") as? String
         restaurantsMainId = aDecoder.decodeObject(forKey: "restaurants_main_id") as? Int
         restaurantsMainName = aDecoder.decodeObject(forKey: "restaurants_main_name") as? String
         status = aDecoder.decodeObject(forKey: "status") as? Bool
         tables = aDecoder.decodeObject(forKey: "tables") as? Int
         typeRegisteration = aDecoder.decodeObject(forKey: "type_registeration") as? String
         userMobile = aDecoder.decodeObject(forKey: "user_mobile") as? String
         username = aDecoder.decodeObject(forKey: "username") as? String

	}

    @objc func encode(with aCoder: NSCoder)
	{
		if iD != nil{
			aCoder.encode(iD, forKey: "ID")
		}
		if delivery != nil{
			aCoder.encode(delivery, forKey: "delivery")
		}
		if email != nil{
			aCoder.encode(email, forKey: "email")
		}
		if img != nil{
			aCoder.encode(img, forKey: "img")
		}
		if invoices != nil{
			aCoder.encode(invoices, forKey: "invoices")
		}
		if message != nil{
			aCoder.encode(message, forKey: "message")
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
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if tables != nil{
			aCoder.encode(tables, forKey: "tables")
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
