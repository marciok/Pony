//
//  AppIntroViewController.swift
//  Pony
//
//  Created by Marcio Klepacz on 15/03/15.
//  Copyright (c) 2015 Marcio Klepacz. All rights reserved.
//

import UIKit

@objc public protocol AppIntroDelegate {
  
  func appIntroDidFinish(appIntro: UIViewController!)
}

public class AppIntroViewController: UIViewController {
    
    public var dismissButton: UIButton?
    weak public var delegate: AnyObject?
  
    @IBAction public func dismissButtonTapped() {
        
    if let delegate = self.delegate as? AppIntroDelegate  {
      delegate.appIntroDidFinish(self)
    }
  }
}
