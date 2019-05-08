//
//  ResultsVC
//  Techolution_Task
//
//  Created by Sravan on 06/05/19.
//  Copyright © 2019 Techolution. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    //MARK:- Outlet Properties
    @IBOutlet weak var tableViewResults: UITableView!
    
    //MARK:- Variable Properties
    var results = [ResultsModel]()
    
    //MARK:- View Life Cycle methods
    
    override func viewDidLoad()
    {
        //table view configuration
        self.tableViewResults.delegate = self
        self.tableViewResults.dataSource = self
        
        super.viewDidLoad()
       
        if let json = self.readJSONFromFile(fileName: "Results")
        {
            self.results = ResultsModel().getResults(list:json as! [[String : Any]])
            self.results.sort(by: { $0.name < $1.name })
            
            DispatchQueue.main.async
                {
                    //Reload the tableview Data
                self.tableViewResults.reloadData()
            }
        }
    }
    
    /// This function returns a *JSON* Any for a given `fileName i.e Results.json`.
    ///
    /// - Warning: The returned JSON is not localized.
    ///
    /// Usage:
    ///
    ///   print(readJSONFromFile("Results")) // {"marks":{"maths":40,...}}
    ///
    /// - Parameter fileName: The fileName is json path name.
    ///
    /// - Returns: A JSON Array to the `fileName`.

    func readJSONFromFile(fileName: String) -> Any?
    {
        var json: Any?
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do
            {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                json = try? JSONSerialization.jsonObject(with: data)
            } catch {
                // Handle error here
            }
        }
        return json
    }
    
    //MARK:- UITableView Data Source methods
    
    // Return the number of rows for the table.

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.results.count
    }
    
    // Provide a cell object for each row.

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell") as! ResultsCell
        let result = self.results[indexPath.row]
        
        // Configure the cell’s contents.
        cell.configureResultCell(with: result)
        
        return cell
    }
    
    // Return the height of rows for the cell.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 90
    }
}

