//
//  ViewController.swift
//  fashion
//
//  Created by Ahmed Yamany on 23/08/2022.
//

import UIKit

class mainScreenViewController: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    // MARK: - Helper Functions
    func updateUI(){
        signUpBtn.layer.cornerRadius = 15
        loginBtn.layer.cornerRadius = 15

    }

        
    //MARK: IBACTIONS
    
    @IBAction func LoginBtn(_ sender: UIButton) {
        guard let LoginVC = storyboard?.instantiateViewController(withIdentifier: "loginVC") as? LoginViewController else{return}

        self.navigationController?.pushViewController(LoginVC, animated: true)
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        guard let SignUpVC = storyboard?.instantiateViewController(withIdentifier: "signUpVC") as? SignUPViewController else{return}
        
        self.navigationController?.pushViewController(SignUpVC, animated: true)

    }
    
    
    
}

