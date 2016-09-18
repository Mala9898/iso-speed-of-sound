//
//  LoginViewController.swift
//  spd
//
//  Created by Stanley Malec on 18/09/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

import UIKit
import Alamofire
import KeychainSwift
//import SwiftyJSON

class LoginViewController: UIViewController {

    let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Login()
        // Do any additional setup after loading the view.
    }
    func Login() {
        let parameters: Parameters = [
            "username": "stan",
            "password": "hello"
            
        ]
        Alamofire.request("http://sos.joseb.me/api/user/login", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.result {
                case .success:
                    print("Validation Successful \n\n\n <YYYYY>\(response)")
                case .failure(let error):
                    print(error)
            }
        }
    }
    func CreateUser(){
        let parameters: Parameters = [
            "username": "stan",
            "password": "hello"
            
        ]
        Alamofire.request("http://sos.joseb.me/api/user/create", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                print("Validation Successful \n\n\n <YYYYY>\(response)")
                //keychain.set(response.results(["token"], forKey: "token") 

            case .failure(let error):
                print(error)
            }
        }
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
