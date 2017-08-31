//
//  LoginPage.swift
//  MapAnnotation
//
//  Created by Manpreet Singh on 31/08/17.
//  Copyright © 2017 Manpreet Singh. All rights reserved.
//

import UIKit

class LoginPage: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBAction func login(_ sender: Any) {
        let username = "manpreet"
        //var stringA = "Hello, Swift!"
        let password = "1234"
        
        if(username == "manpreet" && password == "1234") {
            /*let storyboard : UIStoryboard = UIStoryboard(name:"Main", bundle : nil)
            let nextview = storyboard.instantiateViewController(withIdentifier:  "ViewController") as!ViewController
            
            self.navigationController?.pushViewController(nextview, animated: true)*/
        }
    }
    
    func displayMyAlertMessage(userMessage:String) {
        //var myAlert = UIalertController(title:"Alert", message:userMessage, preferredStyle: UIAlertController.Alert);
    }
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signup(_ sender: Any) {
    }
        
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

