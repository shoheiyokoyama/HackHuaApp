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
    

    var audio04 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("いたい", ofType: "wav")!)
    var playeritai01 = AVAudioPlayer()
    var audio05 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("いてっ", ofType: "wav")!)
    var playeritai02 = AVAudioPlayer()
    var audio06 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("いたいってば", ofType: "wav")!)
    var playeritai03 = AVAudioPlayer()
    var audio07 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("ooi", ofType: "wav")!)
    var playerooi = AVAudioPlayer()
    var audio08 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("konnitiha01", ofType: "wav")!)
    var playerkon = AVAudioPlayer()
    var audio09 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("uhaW01", ofType: "mp3")!)
    var playeruha01 = AVAudioPlayer()
    var audio10 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("itaW03", ofType: "mp3")!)
    var playeruha03 = AVAudioPlayer()
    var audio11 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("itaW02", ofType: "mp3")!)
    var player11 = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let imgW01:UIImage! = UIImage(named:"Woman01.png")
        let imgW02:UIImage! = UIImage(named:"Woman02.png")
        


        playeritai01 = AVAudioPlayer(contentsOfURL: audio04, error: nil)
        playeritai01.prepareToPlay()
        playeritai02 = AVAudioPlayer(contentsOfURL: audio05, error: nil)
        playeritai02.prepareToPlay()
        playeritai03 = AVAudioPlayer(contentsOfURL: audio06, error: nil)
        playeritai03.prepareToPlay()
        playerooi = AVAudioPlayer(contentsOfURL: audio07, error: nil)
        playerooi.prepareToPlay()
        playerkon = AVAudioPlayer(contentsOfURL: audio08, error: nil)
        playerkon.prepareToPlay()
        playeruha01 = AVAudioPlayer(contentsOfURL: audio09, error: nil)
        playeruha01.prepareToPlay()
        playeruha03 = AVAudioPlayer(contentsOfURL: audio10, error: nil)
        playeruha03.prepareToPlay()
        player11 = AVAudioPlayer(contentsOfURL: audio11, error: nil)
        player11.prepareToPlay()
        
        playerkon.currentTime = 0
        playerkon.play()

     
        
        
        // MotionManagerを生成.
        myMotionManager = CMMotionManager()
        
        // 更新周期を設定.
        myMotionManager.accelerometerUpdateInterval = 0.1
        
        
        // 加速度の取得を開始.
        myMotionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {(accelerometerData:CMAccelerometerData!, error:NSError!) -> Void in
            
            
            let w  = accelerometerData.acceleration.x + accelerometerData.acceleration.y + accelerometerData.acceleration.z//xyz軸の加速度の合計

          
            
            
            if  accelerometerData.acceleration.x > 0.1
            {
                self.playeruha01.currentTime = 0
                self.playeruha01.play()

                let iv:UIImageView = UIImageView(image:imgW02)
                iv.frame = CGRectMake(35,100, 250, 350)
                self.view.addSubview(iv)

            }
            else if accelerometerData.acceleration.y > 0.1
            {
                self.playeritai02.currentTime = 0
                self.playeritai02.play()
                
                let iv:UIImageView = UIImageView(image:imgW02)
                iv.frame = CGRectMake(35,100, 250, 350)
                self.view.addSubview(iv)
                
            }
                
            else if accelerometerData.acceleration.y < -0.1
            {
                self.playeruha03.currentTime = 0
                self.playeruha03.play()
                let iv:UIImageView = UIImageView(image:imgW02)
                iv.frame = CGRectMake(35,100, 250, 350)
                self.view.addSubview(iv)
                
               
                
                
            }
            else if  accelerometerData.acceleration.x < -0.1
            {
                self.playeruha03.currentTime = 0
                self.playeruha03.play()
                
                let iv:UIImageView = UIImageView(image:imgW02)
                iv.frame = CGRectMake(35,100, 250, 350)
                self.view.addSubview(iv)
                
            }

        
            else
            {
                
                let iv:UIImageView = UIImageView(image:imgW01)
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
