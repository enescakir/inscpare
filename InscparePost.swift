//
//  InscparePhoto.swift
//  Instagramer
//
//  Created by Mustafa Enes Cakir on 1/25/17.
//  Copyright © 2017 EnesCakir. All rights reserved.
//

import Foundation
import SwiftyJSON

class InscparePost: Inscpare {
  var id:String?
  var photo:URL?
  var caption:String?
  var dimensions:CGSize?
  var json:JSON? {
    if let dataFromString = self.string?.data(using: .utf8, allowLossyConversion: false) {
      return JSON(data: dataFromString)
    }
    return nil
  }
  
  override init(_ url: URL?) {
    super.init(url)
    if let data = json {
      if let p = URL(string: data["entry_data"]["PostPage"][0]["media"]["display_src"].stringValue){
        photo = p
      }
      caption = data["entry_data"]["PostPage"][0]["media"]["caption"].string
      dimensions = CGSize(width: data["entry_data"]["PostPage"][0]["media"]["dimensions"]["width"].intValue, height: data["entry_data"]["PostPage"][0]["media"]["dimensions"]["height"].intValue)
      
    }
  }
  
  convenience init(string:String) {
    self.init(URL(string: string))
  }
}
