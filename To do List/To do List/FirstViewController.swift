//
//  FirstViewController.swift
//  To do List
//
//  Created by Praful Konduru on 4/11/15.
//  Copyright (c) 2015 Slickrick. All rights reserved.
//

import UIKit

var toDoList = [String]()



class FirstViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet var toDoListTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
           
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as [String]
        
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return toDoList.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        // The cell takes the value according to the array index ie the toDoList
        }
    
    
   func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        // For the editing style, in this case it is the delete
    if editingStyle == UITableViewCellEditingStyle.Delete{
        
        toDoList.removeAtIndex(indexPath.row)
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
        //updating the table ie setting the value after deletion of that particular element in that table
        
        
        toDoListTable.reloadData()
    }
        
    }

    
    
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
        
        // Similar to the viewDidLoad function....So, everytime the user adds an item the table updates it only when the app loads from scratch, but now with the viewDidAppear fn it loads everytime we update it
    }
    
    
    
    
}

