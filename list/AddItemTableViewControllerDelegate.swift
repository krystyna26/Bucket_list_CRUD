//
//  AddItemTableViewControllerDelegate.swift
//  list
//
//  Created by Krystyna Swider on 11/7/17.
//  Copyright © 2017 Krystyna Swider. All rights reserved.
//

import Foundation
protocol AddItemTableViewControllerDelegate: class {
    func itemSaved(by controller: AddItemTableViewController, with text: String, ind:Int?)
    func cancelButtonPressed(by controller: AddItemTableViewController)
    
}
