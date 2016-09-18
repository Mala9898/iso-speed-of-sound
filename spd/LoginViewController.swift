//
//  LoginViewController.swift
//  spd
//
//  Created by Stanley Malec on 18/09/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

import UIKit
//import Alamofire
//import KeychainSwift

//import SwiftyJSON

class LoginViewController: UIViewController {

   // let keychain = KeychainSwift()
    let SOSSession = SOSHTTPSessionManager.shared()
    
    @IBOutlet weak var fieldEmail: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view.
    }
    func Login() {
  
    }
    @IBAction func OnLoginButton(_ sender: AnyObject) {
        var username = fieldEmail.text! as String
        var password = fieldPassword.text! as String
        
        SOSSession?.login(withUsername: username, password: password, completion: { error in
            if error == nil{
                print("success")
                    self.move()
            } else {
                print("failed to login \(error)!    ")
            }
        })
        
    }
    func move (){
        performSegue(withIdentifier: "login", sender: self)

    }
    //non login, both an error and an id
    func CreateUser(){
     
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
