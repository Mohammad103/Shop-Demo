//
//  ItemsTableViewController.swift
//  Test Shop
//
//  Created by Mohammad Shaker on 1/25/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import UIKit
import SDWebImage

class ItemsTableViewController: UITableViewController {

    var viewModel: ItemsViewModel! = ItemsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        
        viewModel.loadAllItems {
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsToDisplay(in: section)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        cell.titleLbl.text = viewModel.titleToDisplay(for: indexPath)
        cell.descriptionLbl.text = viewModel.descriptionToDisplay(for: indexPath)
        cell.priceLbl.text = viewModel.priceToDisplay(for: indexPath)
        cell.mediaImageView.sd_setImage(with: URL(string: viewModel.imageURLToDisplay(for: indexPath)), placeholderImage: UIImage(named: "placeholder"))
        
        return cell
    }

}
