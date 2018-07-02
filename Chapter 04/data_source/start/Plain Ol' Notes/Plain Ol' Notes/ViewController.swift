//
//  ViewController.swift
//  Plain Ol' Notes
//
//  Created by Todd Perkins on 1/9/18.
//  Copyright © 2018 Todd Perkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    var data:[String] = ["Item 1", "Item 2", "Item 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set the table's datasource to an object that implements the UITableViewDataSource protocol
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count // Return the number of rows based on the length of the data array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a cell
        let cell:UITableViewCell = UITableViewCell()
        
        // Set the text of the cell of a given index
        cell.textLabel?.text = data[indexPath.row]
        
        // Return the cell
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

