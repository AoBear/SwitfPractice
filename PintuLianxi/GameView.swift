//
//  GameView.swift
//  PintuLianxi
//
//  Created by DemonChou on 15/12/19.
//  Copyright © 2015年 DemonChou. All rights reserved.
//

import UIKit

public enum GameMode : Int {
    case normal
    case swapping
}

public enum GridBorderType : Int {
    case up
    case left
    case down
    case right
    case other
}

struct Position {
    var position : Int
    var sort : Int
}

let randomSwapCount:Int = 15
//随机的时候需要记录最后移动位置的个数，默认记录最后4个位置
let lastRandomSwapCount : Int = 2

class GameView: UIView {
    
    private var swapNum = randomSwapCount //随机移动次数
    private var lastPositions : [Int] = [] //最后两次移动过的点
    
    //
    private var views = NSMutableArray()
    private var positions : [Position] = [] //移动的路径
    
    private var numberOfGrids : Int{
        get{
            return self.numberOfRows * self.numberOfRows
        }
    }
    
    
    
    var numberOfRows : Int = 3 {
        didSet{
            //设置格子数之后需要更新控件信息
            self.resetViews()
        }
    }
    
    var image : UIImage? {
        didSet {
            //处理图片并显示
            self.reloadData()
        }
    }
    
    var gameMode : GameMode = .normal{
        didSet{
            self.resetViews()
        }
    }
    
    /**
    *  检测游戏是否结束
    */
    func checkGamerOver()->Bool {
        var success = true
        for temp in self.views {
            let item = temp as! GridInfo
            
            if item.sort != item.location {
                success = false
                break
            }
            print("location: \(item.location) sort: \(item.sort)")
        }
        return success
    }
    
    
    func reloadData() {
        let imageW = (image?.size.width)!/CGFloat(self.numberOfRows)*(image?.scale)!
        let imageH = (image?.size.height)!/CGFloat(self.numberOfRows)*(image?.scale)!
        
        for temp in self.views {
            let item = temp as! GridInfo
            let x = (item.imageView?.tag)! % self.numberOfRows
            let y = (item.imageView?.tag)! / self.numberOfRows
            let rect = CGRectMake(CGFloat(x)*imageW, CGFloat(y)*imageH, CGFloat(imageW), CGFloat(imageH))
            let tempImage = UIImage.clipImage(self.image!, withRect: rect)
            item.imageView.image = tempImage
            item.sort = self.views.indexOfObject(temp)
        }
    }
    
    
    /**
     格子的边界类型情况
     */
    func borderType(item:GridInfo) -> [GridBorderType]{
        var types:[GridBorderType] = []
        //是否为左边界的点
        if ((item.location)%self.numberOfRows == 0) {
            types.append(.left)
        }
        //是否为边界
        if (item.location+1)%self.numberOfRows == 0 {
            types.append(.right)
        }
        //是否为上边界
        if (item.location < self.numberOfRows){
            types.append(.up)
        }
        //是否为下边界
        if (item.location >= self.numberOfGrids - self.numberOfRows ){
            types.append(.down)
        }
        //不是边界点就是中间
        if types.count == 0{
            types.append(.other)
        }
        return types
    }
     
     
     
     
     
    /**
    *  随机获取一个占位符附近的格子
    */
    func randomGridNearbyPlaceholder(placeholder : GridInfo) -> GridInfo{
        var nearPotions:[Int] = []
        let types = self.border
    }
    
    
    func resetViews() {
        self.lastPositions.removeAll()
        self.positions.removeAll()
        for temp in self.views {
            let item = temp as! GridInfo
            item.imageView!.removeFromSuperview()
        }
        self.views.removeAllObjects()
        self.setupSubviews()
        
        if(self.image != nil){
            self.reloadData()
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
