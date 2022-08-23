//
//  LoginViewController.swift
//  fashion
//
//  Created by Ahmed Yamany on 23/08/2022.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    // MARK: - IBOuetlets
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK: - views
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLoginBtn()
        
    }
    
    // MARK: - IBActions
    
    @IBAction func TextFieldsEditingChanged(_ sender: UITextField) {
        updateLoginBtn()
    }
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        // email:  yamany@gmail.com
        // password: 123456
        guard let email = emailTF.text, let password = passwordTF.text else{return}
        
        loginProccess(email: email, password: password) { loginData in
            print(loginData)
            guard let status = loginData.status, status == true, let data = loginData.data else{return}
            
            let userDefualts = UserDefaults.standard
            userDefualts.set(data.token, forKey: "Token")
            userDefualts.set(data.email, forKey: "email")
            userDefualts.set(data.name, forKey: "name")
            
            
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "Home")
            homeVC?.modalPresentationStyle = .fullScreen
            self.present(homeVC!, animated: true)
        }
        
    }
    
    
    @IBAction func moveToSignUpVC(_ sender: Any) {
        guard let signUpVC = storyboard?.instantiateViewController(withIdentifier: "signUpVC") as? SignUPViewController else{return}
        
        self.navigationController?.pushViewController(signUpVC, animated: true)

    }
    
    
    // MARK: Helper Functions
    func updateLoginBtn(){
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        loginBtn.isHidden = email.isEmpty || password.isEmpty
    }
    
    
    func loginProccess(email: String, password: String, withComplation complation: @escaping (_ response: Login) -> Void){
        
        let requestBody = [
          "email": email,
          "password": password
        ]
        let requestHeaders = HTTPHeaders(["Content-Type": "application/json", "lang": "ar"])
        
        let url = baseURL + "login"
        
        AF.request(url, method: .post, parameters: requestBody, encoding: JSONEncoding.default, headers: requestHeaders)
            .validate()
            .responseDecodable(of: Login.self) { response in
                switch response.result{
                case .success(_):
                    guard let loginData = response.value else{return}
                    
                    complation(loginData)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
     

}
