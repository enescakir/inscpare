//
//  Inscpare.swift
//
//  Created by Mustafa Enes Cakir on 1/24/17.
//  Copyright © 2017 EnesCakir. All rights reserved.
//

import Foundation
import Kanna

class Inscpare {
  var url:URL?
  var string:String?
  
  init(_ url:URL?) {
    if let url = url {
      if let doc = HTML(url: url, encoding: .utf8) {
        let insta_source = doc.body?.innerHTML
        var shards = insta_source?.components(separatedBy: "window._sharedData = ")
        var insta_json = shards?[1].components(separatedBy: ";</script")
        string = insta_json?[0]
      }
    }
  }
  
  convenience init(string:String) {
    self.init(URL(string: string))
  }
}
