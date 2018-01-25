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
    
    
    func fillWithJSON(json: JSON)
    {
        self.id = json["id"].string ?? ""
        self.title = json["title"].string ?? ""
        self.desc = json["description"].string ?? ""
        self.locality = json["locality"].string ?? ""
        self.price = json["price"].double ?? 0.0
        self.currency = json["currency"].string ?? ""
        self.media = json["media"].string ?? ""
    }
    
    
    class func loadAllItems(successBlock: @escaping (_ items: [Item]) -> Void, failureBlock: @escaping (_ error: String) -> Void)
    {
        let url = "http://www.soinfo.org/tmp/test.json"
        
        let networkAPI = NetworkAPI()
        networkAPI.getJsonArray(url: url, parameters: nil, headers: nil, successBlock: { (responseArray) in
            var items: [Item] = []
            for dict in responseArray {
                let swiftyJson = JSON(dict)
                let itemObj = Item()
                itemObj.fillWithJSON(json: swiftyJson)
                items.append(itemObj)
            }
            successBlock(items)
        }) { (error) in
            failureBlock(error)
        }
    }
    
}
