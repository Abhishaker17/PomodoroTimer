//
//  AppDelegate.swift
//  MultiKlopp
//
//  Created by Abhishek Banthia on 10/22/15.
//  Copyright © 2015 Abhishek Banthia. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSUserNotificationCenterDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var quitMenuItem: NSMenuItem!
    @IBOutlet weak var actualMenu: NSMenu!
    var timer = NSTimer()
    
    let menuName = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        
        
        menuName.title = "No Timer running!"
        menuName.menu = actualMenu
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func quitMenuItemAction(sender: AnyObject) {
        
        NSApplication.sharedApplication().terminate(self);
    }

    @IBAction func startTimer(sender: AnyObject)
    {
        timer.invalidate()
        
        menuName.title = "Timer is on";
        menuName.enabled = false
        
        timer = NSTimer.scheduledTimerWithTimeInterval(900, target: self, selector: "alarmNotification", userInfo: nil, repeats: false)
    }
    
    @IBAction func startA60secondtimer(sender: AnyObject)
    {
        timer.invalidate()
        
        menuName.title = "Timer is on";
        menuName.enabled = false
        
        timer = NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: "alarmNotification", userInfo: nil, repeats: false)

    }
    
    @IBAction func startA90SecondTime(sender: AnyObject)
    {
        timer.invalidate()
        
        menuName.title = "Timer is on";
        menuName.enabled = false
        
        timer = NSTimer.scheduledTimerWithTimeInterval(90, target: self, selector: "alarmNotification", userInfo: nil, repeats: false)

    }
    func alarmNotification() -> Void
    {
        menuName.title = "No Timer running!"
        menuName.enabled = true
        let notification = NSUserNotification()
        notification.actionButtonTitle = "Repeat"
        notification.title = "Timer Up"
        notification.informativeText = "Drink your water, wash your face!"
        notification.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.defaultUserNotificationCenter().delegate = self
        NSUserNotificationCenter.defaultUserNotificationCenter().deliverNotification(notification)
        
    }
    
    func userNotificationCenter(center: NSUserNotificationCenter, didActivateNotification notification: NSUserNotification) {
       startTimer(self)
    }
    
}

