//
//  ResultsModel.swift
//  Techolution_Task
//
//  Created by Sravan on 06/05/19.
//  Copyright © 2019 Techolution. All rights reserved.
//

import Foundation
import UIKit

struct ResultsModel
{
    //MARK:- Variable Properties
    var maths = 0
    var english = 0
    var science = 0
    var totalMarks = 0
    var name = ""
    var status = ""
    var rollNumber = ""
    var color = UIColor.black
    var passMarks = 20
    var distnictMarks = 120
    
    /// This function returns the Array of ResultModel from given array of dictionaries.
    ///
    /// Returns : [ResultsModel] by converting Array of dictionary to Array of ResultsModel object.
    
    func getResults(list: [[String: Any]]) -> [ResultsModel]
    {
        var results = [ResultsModel]()
        for data in list
        {
            results.append(ResultsModel().getResult(list: data))
        }
        return results
    }
    
    /// This function returns the  ResultModel from given single dictionary.
    ///
    /// Returns : ResultsModel by converting dictionary to ResultsModel object.

    func getResult(list: [String: Any]) -> ResultsModel
    {
        var result = ResultsModel()
        let marksData = list["marks"] as? [String:Any]

        result.name = list["name"] as? String ?? ""
        result.rollNumber = list["rollNumber"] as? String ?? ""
        result.english = Int(marksData?["English"] as? String ?? "") ?? 0
        result.science = Int(marksData?["Science"] as? String ?? "") ?? 0
        result.maths = Int(marksData?["Maths"] as? String ?? "") ?? 0
        result.totalMarks = result.english + result.science + result.maths

        if result.english < passMarks ||  result.science < passMarks || result.maths < passMarks
        {
            result.color = UIColor.red
            result.status = "Fail"
        }
        else if result.english > passMarks &&  result.science > passMarks && result.maths > passMarks && result.totalMarks > distnictMarks
        {
            result.status = "Topper"
            result.color = UIColor.green
        }else if result.totalMarks < distnictMarks
        {
            result.status = "Pass"
        }
        
        return result
    }
    
}

