//
//  AppDelegate.swift
//  alarm
//
//  Created by Chris Chares on 6/2/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//

import UIKit
import CoreLocation
import MediaPlayer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
    
    var window:UIWindow?
    var alarms: Dictionary<String, Alarm> = Dictionary(minimumCapacity: 0)
    let locationManager: CLLocationManager = CLLocationManager()
    var masterViewController : MasterViewController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        
        locationManager.delegate = self;
        
        if ( ios8() ) {
            locationManager.requestAlwaysAuthorization()
       
        }
        
        //get the master view controller
        let nav = application.windows[0].rootViewController as! UINavigationController
        masterViewController = nav.viewControllers[0] as! MasterViewController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
      }

    
 
    func addAlarm(_ alarm:Alarm!) {
        
        alarms.updateValue(alarm, forKey: alarm.region.identifier)
        locationManager.startMonitoring(for: alarm.region)
        
        
        masterViewController.objects.append(alarm)
        masterViewController.tableView.reloadData()
    }
    
    func launchAlarmViewController(_ alarm:Alarm!) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let alarmVC = storyboard.instantiateViewController(withIdentifier: "alarm") as! AlarmViewController
        alarmVC.alarm = alarm
        let nav = UINavigationController(rootViewController: alarmVC)
        masterViewController.present(nav, animated: true, completion: {})
        
    }
    
    func alarmForRegionIdentifier(_ identifier:String!) -> Alarm? {
        
        if let alarm = alarms[identifier] as? Alarm {
            return alarm
        } else {
            return nil
        }
        
    }

    
    /*
    iOS 8 Utility
    */
    func ios8() -> Bool {
        
        println("iOS " + UIDevice.current.systemVersion)
        
        if ( UIDevice.current.systemVersion == "8.0" ) {
            return true
        } else {
            return false
        }
        
    }
    
    
    
    //#pragma mark - CLLocationManagerDelegate
    
    func locationManager(_ manager:CLLocationManager, didEnterRegion region:CLRegion) {
        
        println("Entered Region " + region.identifier );
        if let alarm = alarmForRegionIdentifier(region.identifier) {
            launchAlarmViewController(alarm)
        }
        
    }
    
    func locationManager(_ manager:CLLocationManager, didExitRegion region:CLRegion) {
        
        println("Exited Region " + region.identifier );
        if let alarm = alarmForRegionIdentifier(region.identifier) {
            launchAlarmViewController(alarm)
        }
        
    }
    
    func locationManager(_ manager:CLLocationManager, monitoringDidFailForRegion region:CLRegion, withError error:NSErrorPointer) {
        
        println("Error monitoring regions " + error.memory.description);
    }
    
}

