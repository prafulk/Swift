//
//  SecondViewController.swift
//  To do List
//
//  Created by Praful Konduru on 4/11/15.
//  Copyright (c) 2015 Slickrick. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func addItem(sender: AnyObject) {
        
        toDoList.append(item.text)
        item.text = ""
       NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
        
    }
    @IBOutlet var item: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField:UITextField!)->Bool{
        
        item.resignFirstResponder()
        return true
        
    }
    // The abve two functions "touches began" and "textfieldshow" are used to control the keyboard
    
    

    

}

