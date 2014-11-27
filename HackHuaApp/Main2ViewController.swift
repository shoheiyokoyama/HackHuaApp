//
//  Main2ViewController.swift
//  HackHuaApp
//
//  Created by 横山祥平 on 2014/11/21.
//  Copyright (c) 2014年 Hua. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class Main2ViewController: UIViewController {
    
    
    
    
    var myMotionManager: CMMotionManager!
    
    var audio1 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("konnitiha02", ofType: "wav")!)
    var playerkon2 = AVAudioPlayer()
    var audio2 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("itam01", ofType: "wav")!)
    var playeritam01 = AVAudioPlayer()
    var audio3 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("itam02", ofType: "wav")!)
    var playeritam02 = AVAudioPlayer()
    var audio4 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("uaM04", ofType: "mp3")!)
    var playeruaM04 = AVAudioPlayer()
    var audio5 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("uwaM02", ofType: "mp3")!)
    var playeruaM02 = AVAudioPlayer()
    var audio6 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("rakka", ofType: "mp3")!)
    var playerrakka = AVAudioPlayer()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()

        // Do any additional setup after loading the view.
        playerkon2 = AVAudioPlayer(contentsOfURL: audio1, error: nil)
        playerkon2.prepareToPlay()
        playeritam01 = AVAudioPlayer(contentsOfURL: audio2, error: nil)
        playeritam01.prepareToPlay()
        playeritam02 = AVAudioPlayer(contentsOfURL: audio3, error: nil)
        playeritam02.prepareToPlay()
        playeruaM04 = AVAudioPlayer(contentsOfURL: audio4, error: nil)
        playeruaM04.prepareToPlay()
        playeruaM02 = AVAudioPlayer(contentsOfURL: audio5, error: nil)
        playeruaM02.prepareToPlay()
        playerrakka = AVAudioPlayer(contentsOfURL: audio6, error: nil)
        playerrakka.prepareToPlay()
        
        playerkon2.currentTime = 0
        playerkon2.play()
        
        let imgM01:UIImage! = UIImage(named:"Man01.png")
        let imgM02:UIImage! = UIImage(named:"Man02.png")
        

        
        
        // MotionManagerを生成.
        myMotionManager = CMMotionManager()
        
        // 更新周期を設定.
        myMotionManager.accelerometerUpdateInterval = 0.1
        
        
        // 加速度の取得を開始.
        myMotionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {(accelerometerData:CMAccelerometerData!, error:NSError!) -> Void in
            let w  = accelerometerData.acceleration.x + accelerometerData.acceleration.y + accelerometerData.acceleration.z//xyz軸の加速度の合計
            


            
            if  accelerometerData.acceleration.x < -0.1
            {
                self.playeruaM04.currentTime = 0
                self.playeruaM04.play()

                let iv:UIImageView = UIImageView(image:imgM02)
                iv.frame = CGRectMake(35,100, 250, 350)
             
            }
       
            else if accelerometerData.acceleration.y < -0.1
            {
                self.playeruaM02.currentTime = 0
                self.playeruaM02.play()
                let iv:UIImageView = UIImageView(image:imgM02)
                iv.frame = CGRectMake(35,100, 250, 350)
                self.view.addSubview(iv)
                
                
            }
            else if accelerometerData.acceleration.y > 0.1
            {
                self.playeruaM02.currentTime = 0
                self.playeruaM02.play()
                let iv:UIImageView = UIImageView(image:imgM02)
                iv.frame = CGRectMake(35,100, 250, 350)
                self.view.addSubview(iv)
                
                
            }
            else if accelerometerData.acceleration.x > 0.1
            {
                self.playeruaM04.currentTime = 0
                self.playeruaM04.play()
                let iv:UIImageView = UIImageView(image:imgM02)
                iv.frame = CGRectMake(35,100, 250, 350)
                self.view.addSubview(iv)
                
                
            }
          

            else
            {
                
                let iv:UIImageView = UIImageView(image:imgM01)
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
