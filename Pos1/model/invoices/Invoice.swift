//
//	RootClass.swift
//
//	Create by Aboelnaga on 1/9/2019

import Foundation 
import ObjectMapper


class Invoice : NSObject, NSCoding, Mappable{

	var data : [InvoiceData]?
	var status : Bool?
	var typeInvoice : String?


	class func newInstance(map: Map) -> Mappable?{
		return Invoice()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		data <- map["data"]
		status <- map["status"]
		typeInvoice <- map["type_invoice"]
		
	}

    @objc required init(coder aDecoder: NSCoder)
	{
         data = aDecoder.decodeObject(forKey: "data") as? [InvoiceData]
         status = aDecoder.decodeObject(forKey: "status") as? Bool
         typeInvoice = aDecoder.decodeObject(forKey: "type_invoice") as? String

	}

    @objc func encode(with aCoder: NSCoder)
	{
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if typeInvoice != nil{
			aCoder.encode(typeInvoice, forKey: "type_invoice")
		}

	}

}
