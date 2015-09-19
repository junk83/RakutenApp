//
//  RakutenAPI.swift
//  RakutenApp
//
//  Created by jun on 2015/09/12.
//  Copyright (c) 2015年 jun. All rights reserved.
//

import Foundation
import Alamofire

class RakutenAPI{
    
    let urlString = "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20140222?format=json&keyword=20%E4%B8%96%E7%B4%80%E5%B0%91%E5%B9%B4&applicationId=1023089145858868379"
    
    func download(callback : [RakutenItem] -> Void){
        Alamofire.request(.GET, urlString).responseJSON { _, _, JSON, _ in
            
            if let json:AnyObject = JSON,
                let items = json["Items"] as? [AnyObject]{
    
                    var returnArray:[RakutenItem] = []
                    
                    
                    for(var i = 0; i<items.count; i++){
                        
                        if let item = items[i]["Item"] as? [String:AnyObject]{
                            
                            let ritem = RakutenItem()
                            
                            if let name = item["itemName"] as? String,
                                let price = item["itemPrice"] as? Int,
                                let caption = item["itemCaption"] as? String{
                                ritem.name = name
                                ritem.price = price
                                ritem.caption = caption
                            }
                            
                            if let images = item["smallImageUrls"] as? [AnyObject],
                               let image = images[0]["imageUrl"] as? String{
                                
                                ritem.image = image
                            }
                            
                            returnArray.append(ritem)
                        }
                        
                    }
                    callback(returnArray)
            }
        }

    }
}
