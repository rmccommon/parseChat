//
//  mainViewController.swift
//  parseChat
//
//  Created by Sierra Klix on 10/6/18.
//  Copyright © 2018 Ryan McCommon. All rights reserved.
//

import UIKit
import Parse

class mainViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTable: UITableView!
    
    var messages: [PFObject] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTable.dataSource = self
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.getMessage), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMes(_ sender: Any) {
        let newMes = Message()
        newMes.author = PFUser.current()!
        print(newMes.author.username!)
        newMes.mess = messageField.text!
        newMes.saveInBackground(block: { (success, error) in
            if success {
                print("The message was saved!")
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messageTable.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! messageCell
        if messages != []{
        let message = messages[indexPath.item]
            let author = message.object(forKey: "author") as! PFUser
            if author.username != nil{
                cell.authorLabel.text = author.username
            }else{
                cell.authorLabel.text = ""
            }
        cell.messageLabel.text = message.object(forKey: "mess") as? String
        }
        
        return cell
    }
    @objc func getMessage() {
        let query = Message.query()!
        query.addDescendingOrder("createdAt")
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) -> Void in
            if let posts = posts {
                // do something with the data fetched
                self.messages = posts
            } else {
                // handle error
            }
            }
        self.messageTable.reloadData()
    }
    
    /*
    // MARK: - Navigation
     
     

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
