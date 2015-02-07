//
//  AppDelegate.swift
//  SineWaver_Test1
//
//  Created by george on 7/02/2015.
//  Copyright (c) 2015 george. All rights reserved.
//

import Cocoa

 let pi = M_PI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
       
        
       
        
               
      
        
        var sineWave1 = SineWave()
        
        println("the period of \(sineWave1.frequencyWave)Hz is \(sineWave1.periodWave)ms")
        println("\(sineWave1.valueArray)")
        
        
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

