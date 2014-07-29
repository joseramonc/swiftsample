//
//  MasterViewController.swift
//  navigation
//
//  Created by Jose Ramon 👾 on 7/23/14.
//  Copyright (c) 2014 CoDN. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var objects = NSMutableArray()
//    var flag = true
    let names:[String] = ["💩", "🐰", "🙊", "🙉", "🙈","🙊", "👮","😢","😮","🐑","😱","🐵","👾","🐣","🐒","🐭"]


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
//        make a request
//        let url = NSURL(string: "http://localhost:3000/products.json")
        
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/products.json"))
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        var params = ["product":["name": "i3f", "price":"777"] as Dictionary] as Dictionary
        var err: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            println("Response: \(response)")
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("Body: \(strData)")
            })
        
//        task.resume()
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        self.performSegueWithIdentifier("newProduct", sender: self)
//        self.performSegueWithIdentifier("New", sender: self)
//        objects.insertObject(generateRandomProduct(), atIndex: 0)
//        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
//        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // #pragma mark - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println(segue.identifier)

        if segue.identifier == "showDetail" {
            let indexPath = self.tableView.indexPathForSelectedRow()
            let object = objects[indexPath.row] as Product
            (segue.destinationViewController as DetailViewController).detailItem = object
        } else if segue.identifier == "newProduct" {
            (segue.destinationViewController as NewProductViewController).masterVC = self
        }

    }

    // #pragma mark - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let object = objects[indexPath.row] as Product
        cell.textLabel.text = object.name
        return cell
    }

    func generateRandomProduct() -> Product {
        var nameNumber:Int = Int(arc4random_uniform(16))
        var p:Product = Product(newName: names[nameNumber])
        return p
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        println(indexPath.row)
        if indexPath.row > 3 {
            return false
        } else {
            return true
        }

    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            println("edit style insert")
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}
