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
        navigationController?.tabBarItem.markType = .number
        navigationController?.tabBarItem.markValue = "56"
        
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
        navigationController?.tabBarItem.markType = .dot
        sender.markValue = "5"
    }
    
    @IBAction func clickType2(sender: Any) {
        navigationController?.tabBarItem.markType = .number
    }
    
    @IBAction func clickNumber1(sender: Any) {
        navigationController?.tabBarItem.markPosition = .topRight(.zero)
    }
    
    @IBAction func clickNumber2(sender: Any) {
        navigationController?.tabBarItem.markPosition = .topLeft(.zero)
    }
    
    @IBAction func clickColor1(sender: Any) {
        navigationController?.tabBarItem.markBackgroundColor = .cyan
        navigationController?.tabBarItem.markNumberColor = .red
    }
    
    @IBAction func clickColor2(sender: Any) {
        navigationController?.tabBarItem.markBackgroundColor = .red
        navigationController?.tabBarItem.markNumberColor = .cyan
    }
}

