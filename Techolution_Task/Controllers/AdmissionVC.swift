//
//  AdmissionVC.swift
//  Techolution_Task
//
//  Created by Kastech on 06/05/19.
//  Copyright © 2019 Techolution. All rights reserved.
//

import UIKit

class AdmissionVC: UIViewController,UITextFieldDelegate
{
    //MARK:- Outlets
    @IBOutlet weak var textFieldFirstName: UITextField!
    @IBOutlet weak var textFieldLastName: UITextField!
    @IBOutlet weak var textFieldClassName: UITextField!
    @IBOutlet weak var textFieldPassOutYear: UITextField!
    @IBOutlet weak var textFieldPercentage: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    //MARK:- View Life Cycle Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        btnSubmit.isHidden = true
        
        //Adding the Numeric Keyboard Return *Done* Button
        self.addDoneBtnOnKeyboard(self.textFieldPassOutYear)
        self.addDoneBtnOnKeyboard(self.textFieldPercentage)
    }
   
    // MARK: TextField Delegate Methods

    // It Returns the specified text should be changed in the textfields
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if textField == textFieldFirstName ||  textField == textFieldLastName
        {
            //Regex string for allowing only characters
            do {
                let regex = try NSRegularExpression(pattern: ".*[^A-Za-z].*", options: [])
                if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil
                {
                    self.showAlertController("Please enter alphabets.", _title: "")
                    return false
                }
                if textFieldFirstName.text?.length ?? 0 > 19 &&  textFieldLastName.text?.length ?? 0 > 19
                {
                    self.showAlertController("Characters should not greater than 20", _title: "")
                    return false
                }
            }
            catch
            {
                print("ERROR")
            }
            return true
        }
        else if textField == textFieldClassName
        {
            if string.count >= 1
            {
                if !(self.textFieldClassName.text?.isValidAlphaNumeric())!
                {
                    return true
                }else
                {
                    self.showAlertController("Please Enter Alpha Numeric", _title: "")
                    return false
                }
            }
            return true
        }
        return true
    }
   
    //This method tells the delegate that editing stopped for the specified text field.
    func textFieldDidEndEditing(_ textField: UITextField) {
        showSubmitButton()
    }

    /// This function says the delegate if the text field should process the pressing of the return button.
    ///
    /// Returns : true or false
    /// true returns the keyboard hide ; false returns the keyboard doesnt hide
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }

    //MARK:- Private Methods
    
    /// This function Adding the Numeric Keyboard Return *Done* button
    ///
    /// Usage:
    /// self.addDoneBtnOnKeyboard(self.textFieldPassOutYear)
    ///
    /// - Parameter textField: The fileName is json path name.
    ///

    func addDoneBtnOnKeyboard(_ textField: UITextField)
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect (x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(AdmissionVC.doneButtonAction))
        
        let items = NSMutableArray()
        items.add(flexSpace)
        items.add(done)
        doneToolbar.items = items as? [UIBarButtonItem]
        doneToolbar.sizeToFit()
        textField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        let strPassYear = self.textFieldPassOutYear.text ?? ""
        let intYear = Int(strPassYear) ?? 0
        
        if intYear > 2017
        {
            self.showAlertController("Please Enter valid year (Years must be less than or equal 2017)", _title: "")
        }else
        {
            self.textFieldPassOutYear.resignFirstResponder()
        }
        self.textFieldPercentage.resignFirstResponder()
    }
    
    // This function is useful for checking the conditions of textfields and Submit button show/hide.
    
    private func showSubmitButton()
    {
        if textFieldFirstName.text == nil ||  textFieldFirstName.text == "" && textFieldLastName.text == nil ||  textFieldLastName.text == "" && textFieldClassName.text == nil ||  textFieldClassName.text == "" && textFieldPassOutYear.text == nil ||  textFieldPassOutYear.text == "" && textFieldPercentage.text == nil ||  textFieldPercentage.text == ""
        {
            btnSubmit.isHidden = true
        }else
        {
            btnSubmit.isHidden = false
        }
    }

    //MARK:- Button Action Methods
    @IBAction func btnSubmitActionMethod(_ sender: Any) {
        
    }

}
