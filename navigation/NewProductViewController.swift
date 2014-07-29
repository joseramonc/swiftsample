//
//  NewProductViewController.swift
//  navigation
//
//  Created by Jose Ramon 👾 on 7/25/14.
//  Copyright (c) 2014 CoDN. All rights reserved.
//

import UIKit

class NewProductViewController: UIViewController {

    @IBOutlet var newProductDescriptionLabel: UINavigationItem
    
    @IBOutlet var productNameField: UITextField
    
    var masterVC: MasterViewController?

    @IBOutlet var confirmButton: UIButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createProduct(sender: UIButton) {
        println("confirmed")
        var name = productNameField.text
        if  name == "" {
            masterVC?.objects.insertObject(masterVC?.generateRandomProduct(), atIndex: 0)
        } else {
            masterVC?.objects.insertObject(Product(newName: name), atIndex: 0)
        }
        
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        masterVC?.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        self.navigationController.popViewControllerAnimated(true)
    }

}
