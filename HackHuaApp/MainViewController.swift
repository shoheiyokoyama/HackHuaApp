//
//  MainViewController.swift
//  HackHuaApp
//
//  Created by 横山祥平 on 2014/11/08.
//  Copyright (c) 2014年 Hua. All rights reserved.
//

import UIKit
import CoreMotion




class MainViewController: UIViewController {

    var myMotionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       self.view.backgroundColor = UIColor.whiteColor()
        
        let myWLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        myWLabel.backgroundColor = UIColor.blueColor()
        myWLabel.layer.masksToBounds = true
        myWLabel.layer.cornerRadius = 10.0
        myWLabel.textColor = UIColor.whiteColor()
        myWLabel.shadowColor = UIColor.grayColor()
        myWLabel.textAlignment = NSTextAlignment.Center
        myWLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 420)
        
        self.view.addSubview(myWLabel)
        
        // MotionManagerを生成.
        myMotionManager = CMMotionManager()
        
        // 更新周期を設定.
        myMotionManager.accelerometerUpdateInterval = 0.01
        
        
        // 加速度の取得を開始.
        myMotionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {(accelerometerData:CMAccelerometerData!, error:NSError!) -> Void in
            
            let w  = accelerometerData.acceleration.x + accelerometerData.acceleration.y + accelerometerData.acceleration.z//xyz軸の加速度の合計
            let a = "→"
            let b = "←"
            let c = "↑"
            let d = "↓"
            
            let img1:UIImage! = UIImage(named:"j1.jpeg")
            let img2:UIImage! = UIImage(named:"j2.jpeg")
            let img3:UIImage! = UIImage(named:"migi.jpeg")
            let img4:UIImage! = UIImage(named:"hidari.jpeg")
            let img5:UIImage! = UIImage(named:"ue.jpeg")
            let img6:UIImage! = UIImage(named:"sita.jpeg")
     

            
            
            
            if (accelerometerData.acceleration.x > 0.1 )
            {
                let iv:UIImageView = UIImageView(image:img3)
                iv.frame = CGRectMake(100,100, 200, 300)
                self.view.addSubview(iv)
                myWLabel.text = "w=\(a)"
            }
                
            else if (accelerometerData.acceleration.x < -0.1 )
            {
                let iv:UIImageView = UIImageView(image:img4)
                iv.frame = CGRectMake(100,100, 200, 300)
                self.view.addSubview(iv)
                myWLabel.text = "w=\(b)"
               
                
                
            }
            else if (accelerometerData.acceleration.y > 0.1 )
            {
                let iv:UIImageView = UIImageView(image:img5)
                iv.frame = CGRectMake(100,100, 200, 300)
                self.view.addSubview(iv)
                myWLabel.text = "w=\(c)"
                
                
                
            }
            else if (accelerometerData.acceleration.y < -0.1 )
            {
                let iv:UIImageView = UIImageView(image:img6)
                iv.frame = CGRectMake(100,100, 200, 300)
                self.view.addSubview(iv)
                myWLabel.text = "w=\(d)"
                
                
                
            }
        })
        
        
        
        
        
        //停止について
        if (myMotionManager.accelerometerActive) {
            myMotionManager.stopAccelerometerUpdates()
        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
