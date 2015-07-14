//
//  MyTimer.swift
//  ProtocolAndDelegate
//
//  Created by Duc Nguyen on 7/14/15.
//  Copyright (c) 2015 Duc Nguyen. All rights reserved.
//

import UIKit

@objc protocol MyTimerDelegate{
    optional func timerFinished(count: Int)
}

class MyTimer: UIViewController {
    
    var time: NSTimer!       = NSTimer()
    var labelTimer: NSTimer! = NSTimer()
    var timerLabel: UILabel! = UILabel()
    var timeCount = 0
    var duration = 0
    
    var count: Int = 0
    
    var delegate: MyTimerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel = UILabel(frame: self.view.frame)
        timerLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(timerLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startTimer(timerDuration:Double){
        self.duration = Int(timerDuration)
        timerLabel.text = String(format: "%d", duration)
        
        time = NSTimer.scheduledTimerWithTimeInterval(timerDuration, target: self, selector: Selector("timerFired:"), userInfo: nil, repeats: false)
        
        labelTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateLabel:"), userInfo: nil, repeats: true)
    }
    
    func timerFired(timer:NSTimer){
        if(timer.valid){
            timer.invalidate()
        }
        if(labelTimer.valid){
            labelTimer.invalidate()
        }
        // This is the important part right here
        // we want to call our protocol method here
        // so the class implementing this delegate will know
        // when the timer has finished
        delegate?.timerFinished!(count++)
        
    }
    
    func updateLabel(timer:NSTimer){
        duration = duration - 1
        timerLabel.text = String(format: "%d", duration)
    }

}
