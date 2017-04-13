//
//  LoginViewController.swift
//  CodepathParse
//
//  Created by Padmanabhan, Avinash on 4/12/17.
//  Copyright © 2017 Intuit. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = emailTextField.text ?? ""
        user.password = pwdTextField.text ?? ""
        user.email = emailTextField.text ?? ""
        
        user.signUpInBackground { (Bool, error: Error?) in
            if let error = error {
                let errorString = error.localizedDescription
                let alertController = UIAlertController(title: "Email/Password Incorrect", message: errorString, preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                }
                alertController.addAction(OKAction)
            }
        }
    }
    
    @IBAction func onLogin(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: emailTextField.text!, password: pwdTextField.text!) { (user: PFUser?, error: Error?) in
            if user != nil {
                print("Login Successful")
                self.performSegue(withIdentifier: "ToChatView", sender: nil)
            } else {
                let errorString = error?.localizedDescription
                let alertController = UIAlertController(title: "Email/Password Incorrect", message: errorString, preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                }
                alertController.addAction(OKAction)
            }

        }
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
