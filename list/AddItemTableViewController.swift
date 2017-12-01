//
//  AddItemTableViewController.swift
//  list
//
//  Created by Krystyna Swider on 11/7/17.
//  Copyright © 2017 Krystyna Swider. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    @IBOutlet weak var itemTextField: UITextField!
    var itemText:String?
    var ind:Int?
    
    weak var delegate: AddItemTableViewControllerDelegate?
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
       // we let know delegate that button was pressed
        // which calls func cancelButtonPressed
        delegate?.cancelButtonPressed(by: self)
         print ("cancel")
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let text = itemTextField.text!
        delegate?.itemSaved(by: self, with: text, ind: ind)
        print("saved button pressed in AddItemVC")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextField.text = itemText

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
