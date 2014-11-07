//
//  ViewController.swift
//  HackHuaApp
//
//  Created by 横山祥平 on 2014/11/03.
//  Copyright (c) 2014年 Hua. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation
//struct AVAudioPlayerUtil {
//
//    static var audioPlayer:AVAudioPlayer = AVAudioPlayer();
//    static var sound_data:NSURL = NSURL();
//    
//    static func setValue(nsurl:NSURL){
//        self.sound_data = nsurl;
//        self.audioPlayer = AVAudioPlayer(contentsOfURL: self.sound_data, error: nil);
//        self.audioPlayer.prepareToPlay();
//    }
//    static func play(){
//        self.audioPlayer.play();
//    }
//}


class ViewController: UIViewController {

    var myMotionManager: CMMotionManager!
  

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Labelを作成.
        let myXLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        myXLabel.backgroundColor = UIColor.grayColor()
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
        
        let myWLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        myWLabel.backgroundColor = UIColor.greenColor()
        myWLabel.layer.masksToBounds = true
        myWLabel.layer.cornerRadius = 10.0
        myWLabel.textColor = UIColor.whiteColor()
        myWLabel.shadowColor = UIColor.grayColor()
        myWLabel.textAlignment = NSTextAlignment.Center
        myWLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 420)
        

        
        // Viewの背景色を青にする.
        self.view.backgroundColor = UIColor.blackColor()
        
        // ViewにLabelを追加.
       
        self.view.addSubview(myXLabel)
        self.view.addSubview(myYLabel)
        self.view.addSubview(myZLabel)
        self.view.addSubview(myWLabel)
        
        // MotionManagerを生成.
        myMotionManager = CMMotionManager()
        
        // 更新周期を設定.
        myMotionManager.accelerometerUpdateInterval = 0.01
       
        
        // 加速度の取得を開始.
        myMotionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {(accelerometerData:CMAccelerometerData!, error:NSError!) -> Void in
            
            let w  = accelerometerData.acceleration.x + accelerometerData.acceleration.y + accelerometerData.acceleration.z//xyz軸の加速度の合計
            let a = "migi"
            let b = "hidari"
            let img:UIImage! = UIImage(named:"j1.jpeg")//画像
            let img2:UIImage! = UIImage(named:"j2.jpeg")
//   
//            var audioPlayer:AVAudioPlayer = AVAudioPlayer()
//            var sound_data = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("uaboy", ofType: "wav")!)
//            audioPlayer = AVAudioPlayer(contentsOfURL: sound_data, error: nil);
//            audioPlayer.prepareToPlay();
//           
            
            //テキストラベルに　xyz　の加速度の値を代入
            myXLabel.text = "x=\(accelerometerData.acceleration.x)"
            myYLabel.text = "y=\(accelerometerData.acceleration.y)"
            myZLabel.text = "z=\(accelerometerData.acceleration.z)"
            
          

            if (accelerometerData.acceleration.x > 0.1 )
            {
                let iv:UIImageView = UIImageView(image:img)
                iv.frame = CGRectMake(100,100, 200, 300)
                self.view.addSubview(iv)
                myWLabel.text = "w=\(a)"
//                AVAudioPlayerUtil.play();//再生
                
                           }

            else if (accelerometerData.acceleration.x < -0.1 )
            {
                let iv:UIImageView = UIImageView(image:img2)
                iv.frame = CGRectMake(100,100, 200, 300)
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


}
