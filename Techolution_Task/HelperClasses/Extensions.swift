//
//  Extensions.swift
//  Techolution_Task
//
//  Created by Kastech on 06/05/19.
//  Copyright © 2019 Techolution. All rights reserved.
//

import Foundation
import UIKit

/**********  Alert & Activity Indicator View  ************/

extension UIViewController
{
    /// This function represents the Alert controller Messages
    /// Parameters : message, title ; me
    ///             message : this string represnts the alert message
    ///             title   : title represnts the alercontroller title

    func showAlertController(_ message: String, _title : String)
    {
        DispatchQueue.main.async
            {
                let alertController = UIAlertController(title: self.title, message: message, preferredStyle: .alert)
                let defaultAction   = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
        }
    }
}

extension String
{
    //length is for calculating the length of string
    var length: Int { return self.count }
    
    /// This function represents the regex of Alpha Numeric Characters by using predicate.
    ///
    /// Return : true or false
    
    func isValidAlphaNumeric() -> Bool
    {
        if self.count != 0
        {
            let alphaNumric = NSPredicate(format: "SELF MATCHES %@", " /^([a-zA-Z0-9]+)$/")
            return alphaNumric.evaluate(with: self)
        }else
        {
            return false
        }
    }

}
