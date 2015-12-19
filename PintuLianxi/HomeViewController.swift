//
//  ViewController.swift
//  PintuLianxi
//
//  Created by DemonChou on 15/12/19.
//  Copyright © 2015年 DemonChou. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBAction func StartGame(sender: UIButton) {
        let GVC = GameViewController()
        self.navigationController!.pushViewController(GVC, animated: true)
    }
    
    @IBAction func Other(sender: UIButton) {
        let OVC = OtherViewController()
        self.navigationController!.pushViewController(OVC, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.lightGrayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

