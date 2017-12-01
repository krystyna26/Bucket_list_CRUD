//
//  ViewController.swift
//  list
//
//  Created by Krystyna Swider on 11/6/17.
//  Copyright © 2017 Krystyna Swider. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate{
    
//    @IBOutlet var tableView: UITableView!
    var items = ["one", "two", "three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        print("prepare for segue function")
        if segue.identifier == "addOrEditSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            // Set Self as Destination Delegate
            addItemTableViewController.delegate = self
            if let ip = sender as? NSIndexPath {
                addItemTableViewController.itemText = items[ip.row]
                addItemTableViewController.ind = ip.row
            }
        }
    }
    // when you click particular "info"
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "addOrEditSegue", sender: indexPath)
    }
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        print("I'm the hidden controller, but I am responding to the cancel button pressed")
        dismiss(animated: true, completion: nil)
    }
    func itemSaved(by controller:AddItemTableViewController, with text: String, ind:Int?) {
        print("received by itemSaved in VC")
        if let i = ind {
            items[i] = text
        } else {
            items.append(text)
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

