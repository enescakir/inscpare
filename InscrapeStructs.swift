//
//  InscrapeStructs.swift
//  Instagramer
//
//  Created by Mustafa Enes Cakir on 1/25/17.
//  Copyright © 2017 EnesCakir. All rights reserved.
//

import Foundation

struct Comment {
  let id:Int
  let user:User
  let text:String
  let createdAt:Date
}

struct User {
  let id:Int
  let username:String
  let picture:URL
}
