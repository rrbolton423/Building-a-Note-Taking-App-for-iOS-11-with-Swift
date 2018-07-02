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
        table.dataSource = self
        self.title = "Notes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // Create add button in Navigation Bar
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        
        // Set the rightBarButton of the NavigationBar equal to the addButton that we created
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addNote() {
        
        // Create the name of the note
        let name:String = "Item \(data.count + 1)"
        
        // Put item in data array, in the beginning
        data.insert(name, at: 0)
        
        // Create an index path
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        
        // Insert a new row into the TableView
        table.insertRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

