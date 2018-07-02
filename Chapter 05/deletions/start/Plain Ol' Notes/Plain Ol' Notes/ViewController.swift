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
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem = addButton
        
        // Set the bar button for the left to be an edit button
        self.navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @objc func addNote() {
        
        // Do not add notes if in editing mode
        if table.isEditing {
            return
        }
        
        let name:String = "Item \(data.count + 1)"
        data.insert(name, at: 0)
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
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
    
    // Handle method when going into editing mode
    override func setEditing(_ editing: Bool, animated: Bool) {
        
        // Make call to super method
        super.setEditing(editing, animated: animated)
        
        // Put the table into editing mode
        table.setEditing(editing, animated: animated)
    }
    
    // Edit content in TableView
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // Remove object from our data array
        data.remove(at: indexPath.row)
        
        // Update the table
        table.deleteRows(at: [indexPath], with: .fade)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

