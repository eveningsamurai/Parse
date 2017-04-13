//
//  ChatViewController.swift
//  CodepathParse
//
//  Created by Padmanabhan, Avinash on 4/12/17.
//  Copyright © 2017 Intuit. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var messages: [PFObject]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSend(_ sender: Any) {
        let message = PFObject(className:"Message")
        message["text"] = chatTextField.text!
        message.saveInBackground { (success: Bool,
            error: Error?) in
            if(success) {
                print("Chat send successful")
                self.queryParse()
                self.tableView.reloadData()
            } else {
                print("Chat send not successful")
            }
        }
    }
    
    func queryParse() {
        let query = PFQuery(className:"Message")
        query.findObjectsInBackground { (pfObjects: [PFObject]?, error: Error?) in
            if pfObjects != nil {
                self.messages = pfObjects
                print("Message count: \(self.messages?.count)")
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        let message = (messages?[indexPath.row])! as PFObject
        cell.textLabel?.text = message.object(forKey: "text") as? String
        
        return cell
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
