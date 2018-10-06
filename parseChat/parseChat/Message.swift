//
//  Message.swift
//  parseChat
//
//  Created by Sierra Klix on 10/6/18.
//  Copyright © 2018 Ryan McCommon. All rights reserved.
//

import UIKit
import Parse

class Message: PFObject, PFSubclassing {
    @NSManaged var author: PFUser
    @NSManaged var mess: String
    
    static func parseClassName() -> String {
        return "Message"
    }
    
    class func makeMessage(message: String){
        let newMes = Message()
        newMes.author = PFUser.current()!
        newMes.mess = message
        
        newMes.saveInBackground(block: { (success, error) in
            if success {
                print("The message was saved!")
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        })
    }
    

}
