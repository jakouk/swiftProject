//
//  JoinViewController.swift
//  PictureDiary
//
//  Created by jakouk on 2017. 2. 23..
//  Copyright © 2017년 jakouk. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func touchupInsideJoinButton(_ sender: UIButton) {
        
        
        if let id = emailTextField.text {
            if let name = userNameTextField.text {
                if let password = passwordTextField.text {
                    
                    PDLoginJoinManager.requestJoinData(userId: id , userPassword: password, userName: name, userProfile: nil, updateFinishDataClosure: {
                        self.userJoin()
                        
                    })
                    
                }
            }
            
        }
    }
    
    func userJoin() {
        
        self.dismiss(animated: true, completion: nil)
        
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
