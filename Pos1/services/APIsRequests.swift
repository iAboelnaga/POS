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
                    print("access_token: \(String(describing: value.iD))")
                        let def = UserDefaults.standard
                        def.setValue(user_id, forKey: "userID")
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
