//
//  PostData.swift
//  Instagram
//
//  Created by 水野 隆夫 on 2017/08/05.
//  Copyright © 2017年 ghard1053. All rights reserved.
//

//import Foundation

import UIKit
import Firebase
import FirebaseDatabase

class PostData: NSObject {
  var id: String?
  var image: UIImage?
  var imageString: String?
  var name: String?
  var caption: String?
  var date: NSDate?
  var likes: [String] = []
  var isLiked: Bool = false
  var comments: [String: String] = [:]
  
  init(snapshot: FIRDataSnapshot, myId: String) {
    self.id = snapshot.key
    
    let valueDictionary = snapshot.value as! [String: AnyObject]
    
    imageString = valueDictionary["image"] as? String
    image = UIImage(data: NSData(base64Encoded: imageString!, options: .ignoreUnknownCharacters)! as Data)
    
    self.name = valueDictionary["name"] as? String
    
    self.caption = valueDictionary["caption"] as? String
    
    let time = valueDictionary["time"] as? String
    self.date = NSDate(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
    
    if let likes = valueDictionary["likes"] as? [String] {
      self.likes = likes
    }

    if let comments = valueDictionary["comments"] as? [String: String] {
      self.comments = comments
    }
    
    for likeId in self.likes {
      if likeId == myId {
        self.isLiked = true
        break
      }
    }
  }
}
