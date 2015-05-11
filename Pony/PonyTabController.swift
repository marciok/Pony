//
//  PonyTabController.swift
//  Pony
//
//  Created by Marcio Klepacz on 28/03/15.
//  Copyright (c) 2015 Marcio Klepacz. All rights reserved.
//

import UIKit

public class PonyTabController: UITabBarController {
  
  override public func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    if !userDefaults.boolForKey("appIntroHasBeenPresented") {
      let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
      let appIntroViewController = storyboard.instantiateViewControllerWithIdentifier("appIntroViewControllerID") as! AppIntroViewController
        
      appIntroViewController.delegate = self
      
      self.presentViewController(appIntroViewController, animated: true) {
        userDefaults.setBool(true, forKey: "appIntroHasBeenPresented")
      }
    }
  }
  
}


extension PonyTabController: AppIntroDelegate {
    
// MARK: - AppIntroDelegate
    
  public func appIntroDidFinish(appIntro: UIViewController!) {
    // Dismissing app intro
    dismissViewControllerAnimated(true, completion:nil)
  }
}
