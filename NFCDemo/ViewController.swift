//
//  ViewController.swift
//  NFCDemo
//
//  Created by Mr_zhaohy on 2017/11/4.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var msgLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func clickStart(_ sender: UIButton) {
        NFCReader.shared.alertMsg = "请把NFC标签靠近手机背面"
        weak var weakSelf = self
        NFCReader.shared.statrScan{ (success, msg) in
            weakSelf?.msgLabel.text = msg
            weakSelf?.msgLabel.textColor = success ? UIColor.green : UIColor.red
            sender.setTitle(success ? "Restart" : "Try again", for: UIControlState.normal)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

