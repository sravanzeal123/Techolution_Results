//
//  ResultsCell.swift
//  Techolution_Task
//
//  Created by Sravan on 06/05/19.
//  Copyright © 2019 Techolution. All rights reserved.
//

import UIKit

class ResultsCell: UITableViewCell
{
    //MARK:- Outlets
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRollNumber: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblTotalMarks: UILabel!
    
    // Configure the cell’s contents with resultsModel Object

    func configureResultCell(with result: ResultsModel!)
    {
        //updating label text values
        self.lblName.text = result?.name.capitalized
        self.lblStatus.text = result?.status.capitalized
        self.lblRollNumber.text = result?.rollNumber
        let totalMarks = result.totalMarks
        self.lblTotalMarks.text = String(totalMarks)
        
        //updating label text colours
        self.lblName.textColor = result.color
        self.lblStatus.textColor = result.color
        self.lblTotalMarks.textColor = result.color
        self.lblRollNumber.textColor = result.color
    }

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}

