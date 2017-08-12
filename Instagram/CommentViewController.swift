//
//  CommentViewController.swift
//  Instagram
//
//  Created by 水野 隆夫 on 2017/08/11.
//  Copyright © 2017年 ghard1053. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

class CommentViewController: UIViewController {

  @IBOutlet weak var textField: UITextField!
  var postData: PostData!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//-------------------------------------------------------------

  @IBAction func postCommentButton(_ sender: Any) {
    let comment: String! = textField.text
    if comment.isEmpty {
      SVProgressHUD.showError(withStatus: "コメントを入力してください")
      return
    }
    
    if let uid = FIRAuth.auth()?.currentUser?.uid {
      postData.comments.updateValue(comment, forKey: uid)

      let postRef = FIRDatabase.database().reference().child(Const.PostPath).child(postData.id!)
      let comments = ["comments": postData.comments]
      postRef.updateChildValues(comments)
    }

    self.dismiss(animated: true, completion: nil)

  }
  
  @IBAction func cancelButton(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  

}
