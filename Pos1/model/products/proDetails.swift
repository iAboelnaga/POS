//
//	RootClass.swift
//
//	Create by Aboelnaga on 19/8/2019
//	Copyright © 2019. All rights reserved.

import Foundation 
import ObjectMapper


class proDetails : NSObject, NSCoding, Mappable{

	var branchName : String?
	var catName : String?
	var data : proDetailsData?
	var status : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return proDetails()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		branchName <- map["branch_name"]
		catName <- map["cat_name"]
		data <- map["data"]
		status <- map["status"]
		
	}

    @objc required init(coder aDecoder: NSCoder)
	{
         branchName = aDecoder.decodeObject(forKey: "branch_name") as? String
         catName = aDecoder.decodeObject(forKey: "cat_name") as? String
         data = aDecoder.decodeObject(forKey: "data") as? proDetailsData
         status = aDecoder.decodeObject(forKey: "status") as? Bool

	}

    @objc func encode(with aCoder: NSCoder)
	{
		if branchName != nil{
			aCoder.encode(branchName, forKey: "branch_name")
		}
		if catName != nil{
			aCoder.encode(catName, forKey: "cat_name")
		}
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
