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
       
        
       
        
        class SineWave {
            //properties
            
            var amplitudeWave :Double
            var frequencyWave:Float
            let periodWave:Float
            var phase:Float
            var valueArray = [Double]()
            
            
            
            //methods
            
            
            init(){
                
                
                amplitudeWave = 1.00
                frequencyWave = 100.00
                periodWave = 10.00
                phase = 0.00
                
            
                
                var instantaneousAmpValue :Double
                
               for i in 0...359 {
                    var degreeCount:Double = Double(i)
                    instantaneousAmpValue = sin(degreeCount * pi / 180)
                
                
                
                    self.valueArray.append(instantaneousAmpValue)
//                    
//                    
               }
//                
                
            }
            
            
        } // end of class definition
        
        
      
        
        var sineWave1 = SineWave()
        
        println("the period of \(sineWave1.frequencyWave)Hz is \(sineWave1.periodWave)ms")
        println("\(sineWave1.valueArray)")
        
        
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

