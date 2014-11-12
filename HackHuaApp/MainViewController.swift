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
    var audio00 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("ou", ofType: "wav")!)
    var playerou = AVAudioPlayer()
    
    var audio01 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("ugu", ofType: "wav")!)
    var playerugu = AVAudioPlayer()
    var audio02 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("guho", ofType: "mp3")!)
    var playerguho = AVAudioPlayer()
    var audio03 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("ugya", ofType: "wav")!)
    var playerugya = AVAudioPlayer()
    var audio04 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("いたい", ofType: "wav")!)
    var playeritai01 = AVAudioPlayer()
    var audio05 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("いてっ", ofType: "wav")!)
    var playeritai02 = AVAudioPlayer()
    var audio06 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("いたいってば", ofType: "wav")!)
    var playeritai03 = AVAudioPlayer()
    var audio07 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("ooi", ofType: "wav")!)
    var playerooi = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let img7:UIImage! = UIImage(named:"gori1.jpg")
        let img8:UIImage! = UIImage(named:"gori2.jpg")
        let img9:UIImage! = UIImage(named:"gori03.jpg")
        let img10:UIImage! = UIImage(named:"warai.jpg")
        let img11:UIImage! = UIImage(named:"naki.jpg")
        let img12:UIImage! = UIImage(named:"odoroki.jpg")


        playerou = AVAudioPlayer(contentsOfURL: audio00, error: nil)
        playerou.prepareToPlay()
        playerugu = AVAudioPlayer(contentsOfURL: audio01, error: nil)
        playerugu.prepareToPlay()
        playerguho = AVAudioPlayer(contentsOfURL: audio02, error: nil)
        playerguho.prepareToPlay()
        playerugya = AVAudioPlayer(contentsOfURL: audio03, error: nil)
        playerugya.prepareToPlay()
        playeritai01 = AVAudioPlayer(contentsOfURL: audio04, error: nil)
        playeritai01.prepareToPlay()
        playeritai02 = AVAudioPlayer(contentsOfURL: audio05, error: nil)
        playeritai02.prepareToPlay()
        playeritai03 = AVAudioPlayer(contentsOfURL: audio06, error: nil)
        playeritai03.prepareToPlay()
        playerooi = AVAudioPlayer(contentsOfURL: audio07, error: nil)
        playerooi.prepareToPlay()
        
        
        playerooi.currentTime = 0
        playerooi.play()

        
//        let myWLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
//        myWLabel.backgroundColor = UIColor.blueColor()
//        myWLabel.layer.masksToBounds = true
//        myWLabel.layer.cornerRadius = 10.0
//        myWLabel.textColor = UIColor.whiteColor()
//        myWLabel.shadowColor = UIColor.grayColor()
//        myWLabel.textAlignment = NSTextAlignment.Center
//        myWLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 420)
//        
//        self.view.addSubview(myWLabel)
//        let iv:UIImageView = UIImageView(image:img8)
//        iv.frame = CGRectMake(30,30, 300, 300)
//        self.view.addSubview(iv)
        
        
        // MotionManagerを生成.
        myMotionManager = CMMotionManager()
        
        // 更新周期を設定.
        myMotionManager.accelerometerUpdateInterval = 0.1
        
        
        // 加速度の取得を開始.
        myMotionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {(accelerometerData:CMAccelerometerData!, error:NSError!) -> Void in
            
            
            let w  = accelerometerData.acceleration.x + accelerometerData.acceleration.y + accelerometerData.acceleration.z//xyz軸の加速度の合計
            let a = "→"
            let b = "←"
            let c = "↑"
            let d = "↓"
            
            
            
            if  accelerometerData.acceleration.x > 0.3
            {
                self.playeritai01.currentTime = 0
                self.playeritai01.play()

                let iv:UIImageView = UIImageView(image:img11)
                iv.frame = CGRectMake(0,0, 300, 500)
                self.view.addSubview(iv)
//                myWLabel.text = "w=\(a)"
            }
            else if accelerometerData.acceleration.y > 0.3
            {
                self.playeritai02.currentTime = 0
                self.playeritai02.play()
                
                let iv:UIImageView = UIImageView(image:img11)
                iv.frame = CGRectMake(0,0, 300, 500)
                self.view.addSubview(iv)
                
            }
                
            else if accelerometerData.acceleration.y < -0.4
            {
                self.playeritai03.currentTime = 0
                self.playeritai03.play()
                let iv:UIImageView = UIImageView(image:img12)
                iv.frame = CGRectMake(0,0, 300, 500)
                self.view.addSubview(iv)
                
               
                
                
            }
            else
            {
                
                let iv:UIImageView = UIImageView(image:img10)
                iv.frame = CGRectMake(0,0, 300, 500)
                self.view.addSubview(iv)
                
                
                
                
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
