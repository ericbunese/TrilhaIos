//
//  User.swift
//  trilhas
//
//  Created by Eric Bunese on 19/08/17.
//  Copyright © 2017 Eric Bunese. All rights reserved.
//

import Foundation

class User {
  var name:String
  var id:String
  var username:String
  var admin:Bool
  var teacher:Bool
  var student:Bool
  var parent:Bool
  
  init (name:String, id:String, username:String, admin:Bool, teacher:Bool, student:Bool, parent:Bool)
  {
    self.name = name
    self.id = id
    self.username = username
    self.admin = admin
    self.teacher = teacher
    self.student = student
    self.parent = parent
  }
}
