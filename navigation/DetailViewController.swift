//
//  DetailViewController.swift
//  navigation
//
//  Created by Jose Ramon 👾 on 7/23/14.
//  Copyright (c) 2014 CoDN. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var detailDescriptionLabel: UILabel


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.name
            }
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

