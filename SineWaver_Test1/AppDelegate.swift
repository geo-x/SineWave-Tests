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
       
        
        
        
        
        var currentContext : CGContext? {
            get {
                // The 10.10 SDK provdes a CGContext on NSGraphicsContext, but
                // that's not available to folks running 10.9, so perform this
                // violence to get a context via a void*.
                // iOS can use UIGraphicsGetCurrentContext.
                
                let unsafeContextPointer = NSGraphicsContext.currentContext()?.graphicsPort
                
                if let contextPointer = unsafeContextPointer {
                    let opaquePointer = COpaquePointer(contextPointer)
                    let context: CGContextRef = Unmanaged.fromOpaque(opaquePointer).takeUnretainedValue()
                    return context
                } else {
                    return nil
                }
            }
            
        }
        
        
        println("\(currentContext)")
        
         //println("\(currentContext)")
        
        CGContextSetRGBFillColor (currentContext, 1.0, 1.0, 1.0, 1.0)
        
        
        CGContextSetRGBFillColor(currentContext, 1, 0, 0, 1)
        CGContextFillRect(currentContext, CGRectMake(0, 0, 100, 100))
        CGContextFlush(currentContext)
        
    } // end of main loop
    
    
    

   
    
    
    

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

