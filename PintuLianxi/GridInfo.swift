//
//  GridInfo.swift
//  PintuLianxi
//
//  Created by DemonChou on 15/12/19.
//  Copyright © 2015年 DemonChou. All rights reserved.
//

import UIKit

class GridInfo: NSObject {

    //所在格子的序号
    var location : Int = 0
    var imageView : UIImageView!
    
    var sort : Int = 0
    
    convenience init(location :Int, imageView : UIImageView) {
        self.init()
        self.imageView = imageView
        self.location = location
    }
    
}
