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


    let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("uaboy", ofType: "wav")!)
    var player = AVAudioPlayer()
  
    @IBAction func playbtn(sender: UIButton) {
        player.play()
    }
    @IBAction func pause(sender: UIButton) {
        player.pause()
    }
    @IBAction func stop(sender: UIButton) {
        player.stop()
        player.currentTime = 0 //曲を頭に戻す
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        player = AVAudioPlayer(contentsOfURL: audioPath, error: nil)
        player.prepareToPlay()//プレイヤーを再生する準備　再生した後スムーズに曲ができる
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
