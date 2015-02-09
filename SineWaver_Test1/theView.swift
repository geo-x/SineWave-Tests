//
//  theView.swift
//  SineWaver_Test1
//
//  Created by george on 9/02/2015.
//  Copyright (c) 2015 george. All rights reserved.
//

import Foundation
import Cocoa

class SimpleView: NSView {
    
//    // Should drawing be sloppy with graphic saves and restores?
//    var beSloppy : Bool = false {
//        willSet {
//            needsDisplay = true
//        }
//    }
    
    private var currentContext : CGContext? {
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
    
    private func saveGState(drawStuff: () -> ()) -> () {
        CGContextSaveGState (currentContext)
        drawStuff()
        CGContextRestoreGState (currentContext)
    }
    
    // --------------------------------------------------
 
    // --------------------------------------------------
    
    func drawNicely () {
        CGContextSetRGBStrokeColor (currentContext, 0.0, 0.0, 0.0, 1.0) // Black
        CGContextSetRGBFillColor (currentContext, 1.0, 1.0, 1.0, 1.0) // White
        CGContextSetLineWidth (currentContext, 3.0)
        
        drawNiceBackground()
        drawNiceContents()
        drawNiceBorder()
    }
    
    func drawNiceBackground() {
        saveGState {
            CGContextFillRect (self.currentContext, self.bounds)
        }
    }
    
    func drawNiceContents() {
        saveGState {
            let innerRect = CGRectInset(self.bounds, 20.0, 20.0)
            
            CGContextSetRGBFillColor (self.currentContext, 0.0, 1.0, 0.0, 1.0) // Green
            CGContextFillEllipseInRect (self.currentContext, innerRect)
            
            CGContextSetRGBStrokeColor (self.currentContext, 0.0, 0.0, 1.0, 1.0) // Blue
            CGContextSetLineWidth (self.currentContext, 6.0)
            CGContextStrokeEllipseInRect (self.currentContext, innerRect)
        }
    }
    
    func drawNiceBorder() {
        saveGState {
            CGContextStrokeRect (self.currentContext, self.bounds)
        }
    }
    
    
    // --------------------------------------------------


    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
                   drawNicely()
        }
        
  
    
}





//    override func drawRect(dirtyRect: NSRect) {
//        super.drawRect(dirtyRect)
//        
//        if beSloppy {
//            drawSloppily()
//        } else {
//            drawNicely()
//        }
//        
//    }
//    
//}
