//
//  AlarmViewController.swift
//  alarm
//
//  Created by Chris Chares on 6/3/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//

import UIKit
import MediaPlayer

class AlarmViewController: UIViewController {

    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer()
    var alarm:Alarm!
    
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = alarm.title
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        playMedia(alarm.media)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func playMedia(_ media:MPMediaItem!) {
        
        let array = [media]
        let collection = MPMediaItemCollection(items: array as! [MPMediaItem])
        
        musicPlayer.setQueue(with: collection)
        musicPlayer.play();
        
        
    }

    @IBAction func shutup(_ sender : AnyObject) {
        
        musicPlayer.stop()
        navigationController?.presentingViewController?.dismissModalViewControllerAnimated(true)
        
    }

}
