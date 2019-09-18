//
//  APIsRequests.swift
//  Pos1
//
//  Created by Aboelnaga on 7/31/19.
//  Copyright © 2019 Ahmed_Aboelnaga. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper

class APIsRequests: NSObject {
    class func login(username:String, user_pass:String, completion:@escaping(_ _error:Error?, _ obj:Login?)->Void){
        let url = "http://mrcashier.net/json_user/login.php?"
        let parameters = [
            "username" : username,
            "user_pass" : user_pass,
            "fmctoken" : "",
            "device_type" : "ios",
            "lang" : "en"
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300).responseObject(completionHandler: { (response: DataResponse<Login>) in
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    print(value.message ?? "Nothing Happened")
                     let user_id = value.iD
                     let user_img = value.img
                     let user_name = value.username
                     let user_type = value.typeRegisteration
                        let def = UserDefaults.standard
                        def.setValue(user_id, forKey: "userID")
                        def.setValue(user_img, forKey: "userImg")
                        def.setValue(user_name, forKey: "userName")
                        def.setValue(user_type, forKey: "userType")
                        def.synchronize()
                    completion(nil, response.result.value)
                    
                }
            })
    }
    class func categories(user_id:String, completion:@escaping(_ _error:Error?, _ obj:MainCategories?)->Void){
        let url = "http://mrcashier.net/json_user/get_categores.php?"
        let parameters = [
            "user_id" : user_id,
            "lang" : "en"
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300).responseObject(completionHandler: { (response: DataResponse<MainCategories>) in
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    print(value.status ?? "Nothing Happened")
                    completion(nil, response.result.value)
                    
                }
            })
    }
    class func products(dep_id:Int, user_id:String, completion:@escaping(_ _error:Error?, _ obj:Products?)->Void){
        let url = "http://mrcashier.net/json_user/get_products.php?"
        let parameters = [
            "dep_id" : dep_id,
            "user_id" : user_id,
            "lang" : "en"
            ] as [String : Any]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300).responseObject(completionHandler: { (response: DataResponse<Products>) in
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    print(value.status ?? "Nothing Happened")
                    print(value.catName ?? "Nothing Happened")
                    completion(nil, response.result.value)
                    
                }
            })
    }
    class func addBasket(casher_id:String, pro_id:Int, quantity:String, size_id:Int, table_id:String, completion:@escaping(_ _error:Error?, _ success:Bool)->Void){
        let url = "http://mrcashier.net/json_user/add_basket.php?"
        let parameters = [
            "casher_id" : casher_id,
            "pro_id" : pro_id,
            "quantity" : quantity,
            "size_id" : size_id,
            "table_id" : table_id
            ] as [String : Any]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            //.validate(statusCode:200..<300)
            .responseJSON{ response in
                switch response.result
                {
                case.failure(let error):
                    completion(error, false)
                    print(error)
                case.success(let value):
                    let json = JSON(value)
                    if let code = json["message"].string{
                        print(code)
                    }
                    completion(nil,true)
                }
        }
    }
    class func proDetails(pro_id:Int, completion:@escaping(_ _error:Error?, _ obj:proDetails?)->Void){
        let url = "http://mrcashier.net/json_user/proDetails.php?"
        let parameters = [
            "pro_id" : pro_id,
            "lang" : "en"
            ] as [String : Any]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300).responseObject(completionHandler: { (response: DataResponse<proDetails>) in
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    print(value.status ?? "Nothing Happened")
                    completion(nil, response.result.value)
                    
                }
            })
    }
    class func orders(casher_id:String, completion:@escaping(_ _error:Error?, _ obj:Orders?)->Void){
        let url = "http://mrcashier.net/json_user/my_orders.php?"
        let parameters = [
            "casher_id" : casher_id,
            "lang" : "en"
            ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300).responseObject(completionHandler: { (response: DataResponse<Orders>) in
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    print(value.status ?? "Nothing Happened")
                    completion(nil, response.result.value)
                    
                }
            })
    }
    class func orderDetails(order_id:String, completion:@escaping(_ _error:Error?, _ obj:OrderDetails?)->Void){
        let url = "http://mrcashier.net/json_user/my_orders_details.php?"
        let parameters = [
            "order_id" : order_id,
            "lang" : "en"
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300).responseObject(completionHandler: { (response: DataResponse<OrderDetails>) in
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    print(value.status ?? "Nothing Happened")
                    completion(nil, response.result.value)
                    
                }
            })
    }
    class func inTables(casher_id:String, type:String, completion:@escaping(_ _error:Error?, _ obj:InOutTables?)->Void){
        let url = "http://mrcashier.net/json_user/tables.php?"
        let parameters = [
            "casher_id" : casher_id,
            "lang" : "en",
            "type" : type
            ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300).responseObject(completionHandler: { (response: DataResponse<InOutTables>) in
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    print(value.status ?? "Nothing Happened")
                    completion(nil, response.result.value)
                    
                }
            })
    }
    class func kitchen(kitchen_id:String, completion:@escaping(_ _error:Error?, _ obj:Kitchen?)->Void){
        let url = "http://mrcashier.net/json_user/kitchen.php?"
        let parameters = [
            "kitchen_id" : kitchen_id,
            "lang" : "en"
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300).responseObject(completionHandler: { (response: DataResponse<Kitchen>) in
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    print(value.status ?? "Nothing Happened")
                    completion(nil, response.result.value)
                    
                }
            })
    }
    class func invoices(type_invoice:String, completion:@escaping(_ _error:Error?, _ obj:Invoice?)->Void){
        let url = "http://mrcashier.net/json_user/invoice.php?"
        let parameters = [
            "lang" : "en",
            "type_invoice" : type_invoice
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300).responseObject(completionHandler: { (response: DataResponse<Invoice>) in
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    print(value.status ?? "Nothing Happened")
                    completion(nil, response.result.value)
                    
                }
            })
    }
    class func drivers(completion:@escaping(_ _error:Error?, _ obj:Drivers?)->Void){
        let url = "http://mrcashier.net/json_user/drivers.php?"
        let parameters = [
            "lang" : "en"
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300).responseObject(completionHandler: { (response: DataResponse<Drivers>) in
                switch response.result
                {
                case.failure(let error):
                    completion(error, nil)
                    print(error)
                case.success(let value):
                    print(value.status ?? "Nothing Happened")
                    completion(nil, response.result.value)
                    
                }
            })
    }
    
    class func payment(user_id:String, payment_type:Int, full_name:String, area:String, block:String, street:String, avenue:String, shipping_method:String, delivery:Bool, building:String, table_id:String, type_invoice:Int, driver_id:String, flat:String, notes:String, completion:@escaping(_ _error:Error?, _ success:Bool)->Void){
        let url = "http://mrcashier.net/json_user/payment.php?"
        let parameters = [
            "lang" : "en",
            "user_id" : user_id,
            "payment_type" : payment_type,
            "full_name" : full_name,
            "shipping_method" : shipping_method,
            "delivery" : delivery,
            "table_id" : table_id,
            "type_invoice" : type_invoice,
            "driver_id" : driver_id,
            "area" : area,
            "block" : block,
            "street" : street,
            "avenue" : avenue,
            "building" : building,
            "flat" : flat,
            "notes" : notes
            ] as [String : Any]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            //.validate(statusCode:200..<300)
            .responseJSON{ response in
                switch response.result
                {
                case.failure(let error):
                    completion(error, false)
                    print(error)
                case.success(let value):
                    let json = JSON(value)
                    if let code = json["message"].string{
                        print(code)
                    }
                    if let u = json["url_payment"].string{
                        print(u)
                    }
                    completion(nil,true)
                }
        }
    }
    class func attendance(user_id:String, attendance_flage:Int, is_attendance:Bool, completion:@escaping(_ _error:Error?, _ success:Bool)->Void){
        let url = "http://mrcashier.net/json_user/attendance.php?"
        let parameters = [
            "user_id" : user_id,
            "lang" : "en",
            "attendance_flage" : attendance_flage,
            "is_attendance" : is_attendance
            ] as [String : Any]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON{ response in
                switch response.result
                {
                case.failure(let error):
                    completion(error, false)
                    print(error)
                case.success(let value):
                    let json = JSON(value)
                    if let code = json["message"].string{
                        print(code)
                    }
                    completion(nil,true)
                }
        }
    }
    class func logout(user_id:Int, completion:@escaping(_ _error:Error?, _ success:Bool)->Void){
        let url = "http://mrcashier.net/json_user/logout.php?"
        let parameters = ["user_id" : user_id]
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            //.validate(statusCode:200..<300)
            .responseJSON{ response in
                switch response.result
                {
                case.failure(let error):
                    completion(error, false)
                    print(error)
                case.success(let value):
                    let json = JSON(value)
                    if let code = json["message"].string{
                        print(code)
                    }
                    let def = UserDefaults.standard
                    def.setValue(nil, forKey: "userID")
                    def.synchronize()
                    
                    completion(nil,true)
                }
        }
    }
}
