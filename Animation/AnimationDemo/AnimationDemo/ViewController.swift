//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Yi on 2019/5/13.
//  Copyright © 2019 Yi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var heading: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var headingCenter: NSLayoutConstraint!
    
    @IBOutlet weak var loginButtonCenter: NSLayoutConstraint!
    @IBOutlet weak var passwordCenter: NSLayoutConstraint!
    @IBOutlet weak var usernameCenter: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        headingCenter.constant -= view.bounds.width
        usernameCenter.constant -= view.bounds.width
        passwordCenter.constant -= view.bounds.width
        loginButtonCenter.constant -= view.bounds.width
        loginButton.alpha = 0
        view.layoutIfNeeded()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        headingCenter.constant += view.bounds.width
        usernameCenter.constant += view.bounds.width
        passwordCenter.constant += view.bounds.width
        
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [ .curveEaseOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.loginButtonCenter.constant += self.view.bounds.width
            UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: [], animations: {
                self.view.layoutIfNeeded()
                self.loginButton.alpha = 1
            }, completion: { (_) in
                
            })
        })
        
        
    }

    @IBAction func login(_ sender: Any) {
        self.loginButtonCenter.constant += 6
        UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
            self.loginButton.backgroundColor = UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

