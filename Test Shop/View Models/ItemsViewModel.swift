//
//  ItemsViewModel.swift
//  Test Shop
//
//  Created by Mohammad Shaker on 1/25/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import UIKit

class ItemsViewModel: NSObject {
    
    var items: [Item]?
    
    
    func loadAllItems(completion: @escaping () -> Void)
    {
        Item.loadAllItems(successBlock: { (items) in
            self.items = items
            completion()
        }) { (error) in
            // TODO: Show error alert
        }
    }
    
    
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return items?.count ?? 0
    }
    
    
    func titleToDisplay(for indexPath: IndexPath) -> String {
        return items?[indexPath.row].title ?? ""
    }
    
    
    func descriptionToDisplay(for indexPath: IndexPath) -> String {
        return items?[indexPath.row].desc ?? ""
    }
    
    
    func priceToDisplay(for indexPath: IndexPath) -> String {
        return "\(items?[indexPath.row].price ?? 0.0) \(items?[indexPath.row].currency ?? "")"
    }
    
    
    func imageURLToDisplay(for indexPath: IndexPath) -> String {
        return "\(items?[indexPath.row].media ?? "")"
    }
    
}
