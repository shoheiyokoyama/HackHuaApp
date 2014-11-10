//
//  SoundViewController.swift
//  HackHuaApp
//
//  Created by 横山祥平 on 2014/11/08.
//  Copyright (c) 2014年 Hua. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {


    var audio00 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("uaboy", ofType: "wav")!)
    var playeruaboy = AVAudioPlayer()
    
    
    var audio01 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("kyaa1", ofType: "wav")!)
    var playerkyaa1 = AVAudioPlayer()
    
    
  
    @IBAction func playbtn(sender: UIButton) {
        playeruaboy.currentTime = 0
        playeruaboy.play()
    }
    @IBAction func pause(sender: UIButton) {
        playerkyaa1.currentTime = 0
        playerkyaa1.play()
    }
//    @IBAction func stop(sender: UIButton) {
//        player.stop()
//        player.currentTime = 0 //曲を頭に戻す
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playeruaboy = AVAudioPlayer(contentsOfURL: audio00, error: nil)
        playeruaboy.prepareToPlay()
        
        playerkyaa1 = AVAudioPlayer(contentsOfURL: audio01, error: nil)
        playerkyaa1.prepareToPlay()
        
       
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
