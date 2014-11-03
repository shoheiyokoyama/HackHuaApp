//
//  ViewController.swift
//  HackHuaApp
//
//  Created by 横山祥平 on 2014/11/03.
//  Copyright (c) 2014年 Hua. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var myMotionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Labelを作成.
        let myXLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        myXLabel.backgroundColor = UIColor.blueColor()
        myXLabel.layer.masksToBounds = true
        myXLabel.layer.cornerRadius = 10.0
        myXLabel.textColor = UIColor.whiteColor()
        myXLabel.shadowColor = UIColor.grayColor()
        myXLabel.textAlignment = NSTextAlignment.Center
        myXLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        
        let myYLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        myYLabel.backgroundColor = UIColor.orangeColor()
        myYLabel.layer.masksToBounds = true
        myYLabel.layer.cornerRadius = 10.0
        myYLabel.textColor = UIColor.whiteColor()
        myYLabel.shadowColor = UIColor.grayColor()
        myYLabel.textAlignment = NSTextAlignment.Center
        myYLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 280)
        
        let myZLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        myZLabel.backgroundColor = UIColor.redColor()
        myZLabel.layer.masksToBounds = true
        myZLabel.layer.cornerRadius = 10.0
        myZLabel.textColor = UIColor.whiteColor()
        myZLabel.shadowColor = UIColor.grayColor()
        myZLabel.textAlignment = NSTextAlignment.Center
        myZLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 360)
        
        // Viewの背景色を青にする.
        self.view.backgroundColor = UIColor.cyanColor()
        
        // ViewにLabelを追加.
        self.view.addSubview(myXLabel)
        self.view.addSubview(myYLabel)
        self.view.addSubview(myZLabel)
        
        // MotionManagerを生成.
        myMotionManager = CMMotionManager()
        
        // 更新周期を設定.
        myMotionManager.accelerometerUpdateInterval = 0.1
        
        // 加速度の取得を開始.
        myMotionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {(accelerometerData:CMAccelerometerData!, error:NSError!) -> Void in
            myXLabel.text = "x=\(accelerometerData.acceleration.x)"
            myYLabel.text = "y=\(accelerometerData.acceleration.y)"
            myZLabel.text = "z=\(accelerometerData.acceleration.z)"
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

