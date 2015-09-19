//
//  RakutenItemViewController.swift
//  RakutenApp
//
//  Created by jun on 2015/09/12.
//  Copyright (c) 2015年 jun. All rights reserved.
//

import UIKit

class RakutenItemViewController: UITableViewController {
    
    
    //JSONデータの格納
    var dataArray:[RakutenItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RakutenAPI().download{(ritems) -> Void in
            self.dataArray = ritems
            self.tableView.reloadData()
        }
        
    
    }
    


    //テーブルの件数を登録
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    //テーブルの内容を代入
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //セルを内部的にリサイクルしているのでこちらが必須になります。
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let item = dataArray[indexPath.row]
        cell.textLabel?.text = item.name
        
        //if let imageURLString = item.image,
          //let imageURL = NSURL(string: imageURLString){
                
                cell.imageView?.sd_setImageWithURL(NSURL(string: item.image), placeholderImage: UIImage(named: "placeholderimage"))
                
        //}
        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let vc = self.storyboard?.instantiateViewControllerWithIdentifier("showDetail") as? ViewController{
            
            vc.item = self.dataArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}








