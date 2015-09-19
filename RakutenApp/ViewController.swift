//
//  ViewController.swift
//  RakutenApp
//
//  Created by jun on 2015/09/12.
//  Copyright (c) 2015年 jun. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var item = RakutenItem()
    var money = 0
    
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var priceLb: UILabel!
    @IBOutlet weak var captionLb: UILabel!
    @IBOutlet weak var moneyLb: UILabel!
    
    //画面が生成された後の初期化イベント
    override func viewDidLoad() {
        updateDisplay()
    }
    
    private func updateDisplay(){
        if let image = NSURL(string: item.image){
            imageV.sd_setImageWithURL(image)
        }
        
        nameLb.text = item.name
        priceLb.text = String(item.price)
        captionLb.text = item.caption
        
    }
    
    
    @IBAction func tapButton(sender: AnyObject) {
        
        
        money = money + item.price
        moneyLb.text = String(money)
        
    }
    

}

