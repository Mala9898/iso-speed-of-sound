//
//  TextViewController.swift
//  spd
//
//  Created by Stanley Malec on 17/09/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    @IBAction func OpenQuizlet(_ sender: AnyObject) {
    }
    @IBOutlet weak var buttonBackgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonBackgroundView.layer.cornerRadius = 25

        // Do any additional setup after loading the view.
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
