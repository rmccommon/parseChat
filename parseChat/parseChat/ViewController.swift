//
//  ViewController.swift
//  parseChat
//
//  Created by Sierra Klix on 10/3/18.
//  Copyright © 2018 Ryan McCommon. All rights reserved.
//
import Parse
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signUpBut: UIButton!
    
    @IBOutlet weak var loginBut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUpClick(_ sender: Any)
    {
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameField.text!
        newUser.password = passwordField.text!
        print(newUser.username!)
        print(newUser.password!)
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print("HRERE")
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                // manually segue to logged in view
            }
        }
        
        
        
    }
    @IBAction func loginClick(_ sender: Any)
    {
        let usernameT = usernameField.text ?? ""
        let passwordT = passwordField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: usernameT , password: passwordT)
        { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                // display view controller that needs to shown after successful login
            }
        }
        
        
    }
    
}

