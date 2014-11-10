//
//  MainViewController.swift
//  HackHuaApp
//
//  Created by 横山祥平 on 2014/11/08.
//  Copyright (c) 2014年 Hua. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class MainViewController: UIViewController {

    var myMotionManager: CMMotionManager!
    var audio00 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("uaboy", ofType: "wav")!)
    var playeruaboy = AVAudioPlayer()
    
    var audio01 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("kyaa1", ofType: "wav")!)
    var playerkyaa1 = AVAudioPlayer()
    var audio02 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("ohayo01", ofType: "mp3")!)
    var playerohayo = AVAudioPlayer()
    var audio03 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("uu", ofType: "wav")!)
    var playeruu = AVAudioPlayer()
    var audio04 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("kyaa02", ofType: "mp3")!)
    var playerkyaa02 = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img1:UIImage! = UIImage(named:"j1.jpeg")
        let img2:UIImage! = UIImage(named:"j2.jpeg")
        let img3:UIImage! = UIImage(named:"migi1.jpg")
        let img4:UIImage! = UIImage(named:"hidari.jpg")
        let img5:UIImage! = UIImage(named:"ue.jpg")
        let img6:UIImage! = UIImage(named:"sita.jpg")
        let img7:UIImage! = UIImage(named:"gori1.jpg")
        let img8:UIImage! = UIImage(named:"gori2.jpg")

        playeruaboy = AVAudioPlayer(contentsOfURL: audio00, error: nil)
        playeruaboy.prepareToPlay()
        playerkyaa1 = AVAudioPlayer(contentsOfURL: audio01, error: nil)
        playerkyaa1.prepareToPlay()
        playerohayo = AVAudioPlayer(contentsOfURL: audio02, error: nil)
        playerohayo.prepareToPlay()
        playeruu = AVAudioPlayer(contentsOfURL: audio03, error: nil)
        playeruu.prepareToPlay()
        playerkyaa02 = AVAudioPlayer(contentsOfURL: audio04, error: nil)
        playerkyaa02.prepareToPlay()
        
        playerohayo.currentTime = 0
        playerohayo.play()

        
        let myWLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        myWLabel.backgroundColor = UIColor.blueColor()
        myWLabel.layer.masksToBounds = true
        myWLabel.layer.cornerRadius = 10.0
        myWLabel.textColor = UIColor.whiteColor()
        myWLabel.shadowColor = UIColor.grayColor()
        myWLabel.textAlignment = NSTextAlignment.Center
        myWLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 420)
        
        self.view.addSubview(myWLabel)
        let iv:UIImageView = UIImageView(image:img8)
        iv.frame = CGRectMake(30,30, 300, 300)
        self.view.addSubview(iv)
        
        
        // MotionManagerを生成.
        myMotionManager = CMMotionManager()
        
        // 更新周期を設定.
        myMotionManager.accelerometerUpdateInterval = 0.2
        
        
        // 加速度の取得を開始.
        myMotionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {(accelerometerData:CMAccelerometerData!, error:NSError!) -> Void in
            
            
            let w  = accelerometerData.acceleration.x + accelerometerData.acceleration.y + accelerometerData.acceleration.z//xyz軸の加速度の合計
            let a = "→"
            let b = "←"
            let c = "↑"
            let d = "↓"
            
            
            
            if (accelerometerData.acceleration.x > 1)
            {
                self.playeruu.currentTime = 0
                self.playeruu.play()

                let iv:UIImageView = UIImageView(image:img7)
                iv.frame = CGRectMake(30,30, 300, 300)
                self.view.addSubview(iv)
                myWLabel.text = "w=\(a)"
            }
                
            else if (w < 1)
            {
                
                let iv:UIImageView = UIImageView(image:img8)
                iv.frame = CGRectMake(30,30, 300, 300)
                self.view.addSubview(iv)
                myWLabel.text = "w=\(b)"
               
                
                
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
