//
//  Inscpare.swift
//
//  Created by Mustafa Enes Cakir on 1/24/17.
//  Copyright © 2017 EnesCakir. All rights reserved.
//

import Foundation
class Inscpare {
  var url:URL?
  var string:String?
  
  init(_ url:URL?) {
    if let url = url {
      do {
        let insta_source = try String(contentsOf: url, encoding: .utf8)
        var shards = insta_source.components(separatedBy: "window._sharedData = ")
        var insta_json = shards[1].components(separatedBy: ";</script")
        string = insta_json[0]
      } catch let error {
        print("Error: \(error)")
      }
    }
  }
  
  convenience init(string:String) {
    self.init(URL(string: string))
  }
}
