//
//  AppIntroViewController.swift
//  Pony
//
//  Created by Marcio Klepacz on 15/03/15.
//  Copyright (c) 2015 Marcio Klepacz. All rights reserved.
//

import UIKit

public class AppIntroViewController: UIViewController {
    
    public var dismissButton: UIButton?
    public var dismissButtonTapHandler: (() -> Void)?
    
    @IBAction public func dismissButtonTapped() {
        
    if let dismissButtonTapHandler = self.dismissButtonTapHandler {
      dismissButtonTapHandler()
    }
  }
}
