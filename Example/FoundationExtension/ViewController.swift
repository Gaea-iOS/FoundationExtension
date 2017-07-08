//
//  ViewController.swift
//  FoundationExtension
//
//  Created by wangxiaotao on 07/07/2017.
//  Copyright (c) 2017 wangxiaotao. All rights reserved.
//

import UIKit
import FoundationExtension

class ViewController: UIViewController {
    
    @IBOutlet weak var barButtomItem: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tabBarItem.markType = .number
        tabBarItem.markValue = "5"
        tabBarItem.markPosition = .topLeft(.zero)
//        tabBarItem.badgeValue = "558"
        
        barButtomItem?.markType = .dot
        barButtomItem?.markValue = "6"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickType1( sender: UIButton) {
        var sender = sender
        tabBarItem.markType = .dot
        sender.markValue = "5"
    }
    
    @IBAction func clickType2(sender: Any) {
        tabBarItem.markType = .number
    }
    
    @IBAction func clickNumber1(sender: Any) {
        tabBarItem.markPosition = .topRight(.zero)
    }
    
    @IBAction func clickNumber2(sender: Any) {
        tabBarItem.markPosition = .topLeft(.zero)
    }
    
    @IBAction func clickColor1(sender: Any) {
        tabBarItem.markBackgroundColor = .cyan
    }
    
    @IBAction func clickColor2(sender: Any) {
        tabBarItem.markBackgroundColor = .red
    }
}

