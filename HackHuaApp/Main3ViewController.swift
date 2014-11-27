//
//  Main3ViewController.swift
//  HackHuaApp
//
//  Created by 横山祥平 on 2014/11/22.
//  Copyright (c) 2014年 Hua. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class Main3ViewController: UIViewController {
    
    var myMotionManager: CMMotionManager!
    
    var audioM01 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("mec01", ofType: "mp3")!)
    var playerM01 = AVAudioPlayer()
    var audioM02 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("mec02", ofType: "mp3")!)
    var playerM02 = AVAudioPlayer()
    var audioM03 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("mec03", ofType: "mp3")!)
    var playerM03 = AVAudioPlayer()
    var audioM04 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("mec04", ofType: "mp3")!)
    var playerM04 = AVAudioPlayer()
    var audioM05 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("mec05", ofType: "wav")!)
    var playerM05 = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let imgR01:UIImage! = UIImage(named:"Robo01.png")
        let imgR02:UIImage! = UIImage(named:"Robo02.png")
        let imgR03:UIImage! = UIImage(named:"Robo03.png")
        
        
        playerM01 = AVAudioPlayer(contentsOfURL: audioM01, error: nil)
        playerM01.prepareToPlay()
        playerM02 = AVAudioPlayer(contentsOfURL: audioM02, error: nil)
        playerM02.prepareToPlay()
        playerM03 = AVAudioPlayer(contentsOfURL: audioM03, error: nil)
        playerM03.prepareToPlay()
        playerM04 = AVAudioPlayer(contentsOfURL: audioM04, error: nil)
        playerM04.prepareToPlay()
        playerM05 = AVAudioPlayer(contentsOfURL: audioM05, error: nil)
        playerM05.prepareToPlay()
        
        
        playerM04.currentTime = 0
        playerM04.play()
        
        
        
        // MotionManagerを生成.
        myMotionManager = CMMotionManager()
        
        // 更新周期を設定.
        myMotionManager.accelerometerUpdateInterval = 0.1
        
        
        // 加速度の取得を開始.
        myMotionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {(accelerometerData:CMAccelerometerData!, error:NSError!) -> Void in
            
            
            let w  = accelerometerData.acceleration.x + accelerometerData.acceleration.y + accelerometerData.acceleration.z//xyz軸の加速度の合計
            
            
            if  accelerometerData.acceleration.x > 0.1
            {
                self.playerM01.currentTime = 0
                self.playerM01.play()
                
                let iv:UIImageView = UIImageView(image:imgR02)
                iv.frame = CGRectMake(35,100, 250, 350)
                self.view.addSubview(iv)
                
            }
            else if accelerometerData.acceleration.y > 0.1
            {
                self.playerM02.currentTime = 0
                self.playerM02.play()
                
                let iv:UIImageView = UIImageView(image:imgR03)
                iv.frame = CGRectMake(35,100, 250, 350)
                self.view.addSubview(iv)
                
            }
                
            else if accelerometerData.acceleration.y < -0.1
            {
                self.playerM03.currentTime = 0
                self.playerM03.play()
                let iv:UIImageView = UIImageView(image:imgR03)
                iv.frame = CGRectMake(35,100, 250, 350)
                self.view.addSubview(iv)
                
                
                
                
            }
            else if accelerometerData.acceleration.x < -0.1
            {
                self.playerM05.currentTime = 0
                self.playerM05.play()
                let iv:UIImageView = UIImageView(image:imgR02)
                iv.frame = CGRectMake(35,100, 250, 350)
                self.view.addSubview(iv)
                
                
                
                
            }
            else
            {
                
                let iv:UIImageView = UIImageView(image:imgR01)
                iv.frame = CGRectMake(35,100, 250, 350)
                self.view.addSubview(iv)
                
                
                
                
            }
            
        })
        
        
        
        
        
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
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
