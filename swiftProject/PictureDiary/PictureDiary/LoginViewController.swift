//
//  LoginViewController.swift
//  PictureDiary
//
//  Created by jakouk on 2017. 2. 23..
//  Copyright © 2017년 jakouk. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {

    var scrollView: UIScrollView = UIScrollView()
    var emailTextField: UITextField = UITextField()
    var passwordTextField: UITextField = UITextField()
    var emailLoginButton: UIButton = UIButton()
    var fbLogin: UIButton = UIButton()
    var joinButton: UIButton = UIButton()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createLayoutSubview()
        self.createTitle()
        self.createInputTextFields()
        self.createJoinButton()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - UI Method ( scroll, textfield, button )
    func createLayoutSubview() {
        
        scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height * 0.9)
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
        scrollView.delegate = self;
        scrollView.isPagingEnabled = true
        self.view.addSubview(scrollView)
        
    }
   
    func createTitle() {
        
        let titleLogo = UIImageView()
        titleLogo.frame = CGRect(x: self.view.center.x-30, y: self.view.frame.size.height*0.25, width: 60, height: 60)
        titleLogo.image = UIImage(named: "ladder-128")
        scrollView.addSubview(titleLogo)
    }
    
    func createInputTextFields() {
        
        emailTextField.frame = CGRect(x: self.view.frame.size.width*0.12, y: self.view.frame.size.height*0.525, width: self.view.frame.size.width*0.76, height: self.view.frame.size.height*0.06)
        emailTextField.borderStyle = UITextBorderStyle.none
        emailTextField.textColor = UIColor.white
        emailTextField.keyboardType = UIKeyboardType.emailAddress
        
        passwordTextField.frame = CGRect(x: self.view.frame.size.width*0.12, y: self.view.frame.size.height*0.615, width: self.view.frame.size.width*0.76, height: self.view.frame.size.height*0.06)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = UITextBorderStyle.none
        passwordTextField.textColor = UIColor.white
        
        // placeholder custome
        emailTextField.attributedPlaceholder = NSAttributedString(string: "이메일")
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호")
        
        // textfield bottom line
        let boarderWidth:CGFloat = 2
        
        let emailBottomBoarder = CALayer()
        
        emailBottomBoarder.borderColor = UIColor.white.cgColor
        emailBottomBoarder.frame = CGRect(x: 0, y: self.emailTextField.frame.size.height - boarderWidth, width: self.emailTextField.frame.size.width, height: 1)
        emailBottomBoarder.borderWidth = boarderWidth
        
        emailTextField.layer.addSublayer(emailBottomBoarder)
        scrollView.addSubview(emailTextField)
        
        let passwordBottomBorder = CALayer()
        
        passwordBottomBorder.borderColor = UIColor.white.cgColor
        passwordBottomBorder.frame = CGRect(x: 0, y: self.passwordTextField.frame.size.height - boarderWidth, width: self.passwordTextField.frame.size.width, height: 1)
        passwordBottomBorder.borderWidth = boarderWidth
        
        passwordTextField.layer.addSublayer(passwordBottomBorder)
        scrollView.addSubview(passwordTextField)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    func createLoginButtons() {
        
        
    }
    
    
    
    func createJoinButton() {
        
        joinButton.frame = CGRect(x: 0, y: self.view.frame.size.height*0.93, width: self.view.frame.size.width, height: self.view.frame.size.height*0.07)
        joinButton.setTitle("계정이 없으신가요? 회원가입", for: UIControlState.normal)
        joinButton.backgroundColor = UIColor(white: 1, alpha: 0.1)
        joinButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        joinButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        joinButton.addTarget(self, action: #selector(onTouchupInsideLoginButton(sender:)), for: UIControlEvents.touchUpInside)
        
        self.view .addSubview(joinButton)
        
        
    }
    
    //MARK: - Button Method
    func onTouchupInsideLoginButton(sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
        let joinViewController = storyBoard.instantiateViewController(withIdentifier: "JoinViewController")
        emailTextField.text = ""
        passwordTextField.text = ""
        self.present(joinViewController, animated: true, completion: nil)
   
    }
    
}
