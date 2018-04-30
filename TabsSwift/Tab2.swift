//
//  Tab2.swift
//  TabsSwift
//
//  Created by MAC2 on 30/04/18.
//  Copyright © 2018 MAC2. All rights reserved.
//

import Foundation
import UIKit

class Tab2: UIViewController {
    
    let botonHi:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        botonHi.frame = CGRect(x: self.view.frame.width * 0.2, y: self.view.frame.height * 0.4, width: self.view.frame.width * 0.45, height: self.view.frame.height * 0.15)
        botonHi.backgroundColor = UIColor.lightGray
        botonHi.setTitle("Second tab", for: .normal)
        self.view.addSubview(botonHi)
        
    }
}
