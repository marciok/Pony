//
//  BreedsTableViewController.swift
//  Pony
//
//  Created by Marcio Klepacz on 15/03/15.
//  Copyright (c) 2015 Marcio Klepacz. All rights reserved.
//

import UIKit

public class BreedsTableViewController: UITableViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "ponyCellReuseIdentifier")
    }
    
    

    // MARK: - Table view data source

    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 3
    }
    
    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ponyCellReuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
        
        if let textLabel = cell.textLabel {
            switch indexPath.row {
            case 0:
                textLabel.text = "Shetland"
            case 1:
                textLabel.text = "Welsh"
            case 2:
                textLabel.text = "Exmoor"
            default:
                break
            }
        }
        
        if let imageView = cell.imageView {
            switch indexPath.row {
            case 0:
                let imageName = "shetland"
                imageView.image = UIImage(named: imageName)
                imageView.accessibilityIdentifier = imageName
            case 1:
                let imageName = "welsh"
                imageView.image = UIImage(named: "welsh")
                imageView.accessibilityIdentifier = "welsh"
            case 2:
                let imageName = "exmoor"
                imageView.image = UIImage(named: "exmoor")
                imageView.accessibilityIdentifier = "exmoor"
            default:
                break
            }
        }

        return cell
    }


}
