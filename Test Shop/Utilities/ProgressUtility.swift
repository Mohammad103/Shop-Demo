//
//  ProgressUtility.swift
//  Test Shop
//
//  Created by Mohammad Shaker on 1/25/18.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit
import Foundation
import SVProgressHUD
import NitroUIColorCategories


class ProgressUtility {
    
    class func setProgressViewStyles() {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setBackgroundColor(UIColor(fromARGBHexString: "34425A"))
        SVProgressHUD.setForegroundColor(UIColor(fromARGBHexString: "EFEFF4"))
    }
    
    class func showProgressView() {
        DimUtility.addDimView()
        
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    
    class func showProgressViewWithProgress() {
        DimUtility.addDimView()
        
        DispatchQueue.main.async {
            SVProgressHUD.showProgress(0.0)
        }
    }
    
    
    class func showProgressViewWithProgress(progress: Float) {
        DispatchQueue.main.async {
            SVProgressHUD.showProgress(progress)
        }
    }
    
    
    class func dismissProgressView() {
        DimUtility.removeDimView()
        
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
}
