//
//  PonyTabController.swift
//  Pony
//
//  Created by Marcio Klepacz on 28/03/15.
//  Copyright (c) 2015 Marcio Klepacz. All rights reserved.
//

import UIKit

public class PonyTabController: UITabBarController {
  
  public override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    if !userDefaults.boolForKey("appIntroHasBeenPresented") {
      let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
      let appIntroViewController = storyboard.instantiateViewControllerWithIdentifier("appIntroViewControllerID") as! AppIntroViewController
      
      self.presentViewController(appIntroViewController, animated: true) {
        
        appIntroViewController.dismissButtonTapHandler = {
          userDefaults.setBool(true, forKey: "appIntroHasBeenPresented")
          self.dismissViewControllerAnimated(true, completion:nil)
        }
      }
    }
  }
}
