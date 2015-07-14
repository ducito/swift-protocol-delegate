//
//  ViewController.swift
//  ProtocolAndDelegate
//
//  Created by Duc Nguyen on 7/14/15.
//  Copyright (c) 2015 Duc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyTimerDelegate {

    
    var timer:MyTimer = MyTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer.view.frame = self.view.frame
        // This is where we let the delegate know
        // we are listening for the timerFinished method
        timer.delegate = self
        self.view.addSubview(timer.view)
        timer.startTimer(5.0)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // This is where our delegate method is fired
    func timerFinished(count: Int){
        timer.startTimer(5.0)
        NSLog("Hey my delegate is working %d", count)
    }
}

