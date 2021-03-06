//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 水野 隆夫 on 2017/08/06.
//  Copyright © 2017年 ghard1053. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

  @IBOutlet weak var postImageView: UIImageView!
  @IBOutlet weak var likeButton: UIButton!
  @IBOutlet weak var likeLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var captionLabel: UILabel!
  @IBOutlet weak var commentButton: UIButton!
  @IBOutlet weak var commentLabel: UILabel!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func setPostData(postData: PostData) {
    self.postImageView.image = postData.image
    
    self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
    let likeNumber = postData.likes.count
    likeLabel.text = "\(likeNumber)"
    
    let formatter = DateFormatter()
    formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    
    let dateString: String = formatter.string(from: postData.date! as Date)
    self.dateLabel.text = dateString
    
    if postData.isLiked {
      let buttonImage = UIImage(named: "like_exist")
      self.likeButton.setImage(buttonImage, for: UIControlState.normal)
    } else {
      let buttonImage = UIImage(named: "like_none")
      self.likeButton.setImage(buttonImage, for: UIControlState.normal)
    }
    
    if let comments: [String: String] = postData.comments {
      var setComments = ""
      for (key, value) in comments {
        print("key: value")
        print("\(key): \(value)")
        setComments = setComments + ("\(key): \(value)\n")
        setComments = "\(key): \(value)\n"
      }
      self.commentLabel.text = setComments
    }
    

  }
  
}
