//
//  Item.swift
//  Test Shop
//
//  Created by Mohammad Shaker on 1/25/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import UIKit
import SwiftyJSON

class Item: NSObject {
    
    var id: String! = ""
    var title: String! = ""
    var desc: String! = ""
    var locality: String! = ""
    var price: Double! = 0.0
    var currency: String! = ""
    var media: String! = ""
    
    
    class func parse(json: JSON) -> Item
    {
        let item: Item = Item()
        item.id = json["id"].string ?? ""
        item.title = json["title"].string ?? ""
        item.desc = json["description"].string ?? ""
        item.locality = json["locality"].string ?? ""
        item.price = json["price"].double ?? 0.0
        item.currency = json["currency"].string ?? ""
        item.media = json["media"].string ?? ""
        
        return item
    }
    
    
    class func loadAllItems(successBlock: @escaping (_ items: [Item]) -> Void, failureBlock: @escaping (_ error: String) -> Void)
    {
        let url = "http://www.soinfo.org/tmp/test.json"
        
        let networkAPI = NetworkAPI()
        networkAPI.getJsonArray(url: url, parameters: nil, headers: nil, successBlock: { (responseArray) in
            var items: [Item] = []
            for dict in responseArray {
                let swiftyJson = JSON(dict)
                items.append(Item.parse(json: swiftyJson))
            }
            successBlock(items)
        }) { (error) in
            failureBlock(error)
        }
    }
    
}
