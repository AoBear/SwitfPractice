//
//  OtherViewController.swift
//  PintuLianxi
//
//  Created by DemonChou on 15/12/19.
//  Copyright © 2015年 DemonChou. All rights reserved.
//

import UIKit

class OtherViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        self.navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITableViewDataSource & Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.view.frame.size.width
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.None
        
        var imageView = cell.contentView.viewWithTag(1111) as? UIImageView
        if imageView == nil{
            imageView = UIImageView(frame: cell.bounds)
            imageView!.tag = 1111
            cell.contentView.addSubview(imageView!)
        }
        let name = "00" + String(indexPath.row)
        imageView?.image = UIImage(named: name)

        return cell
    }

}
