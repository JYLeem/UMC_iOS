//
//  RegisterViewController.swift
//  Section4_LoginPage
//
//  Created by Jinyoung Leem on 4/8/24.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    
    var name: String = ""
    var email: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    
    
    // 유효성 검사
    var isValidEmail = false {
        didSet { // property observer setting 후 코드 실행
            self.validateUserInfo()
        }
    }
    
    var isValidName = false {
        didSet { // property observer setting 후 코드 실행
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false {
        didSet { // property observer setting 후 코드 실행
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false {
        didSet { // property observer setting 후 코드 실행
            self.validateUserInfo()
        }
    }
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
        
    }
    
    // Buttons
    @IBOutlet weak var popToLoginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    // Textfields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        
        // bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
}
    
    // MARK: - Actions
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        
        let text = sender.text ?? ""
        
        switch sender {
            case emailTextField:
                self.isValidEmail = text.isValidEmail()
                self.email = text
                //print(text)
                
            case nameTextField:
                self.isValidName = text.count > 2
                self.name = text
                //print(text)
            
            case nicknameTextField:
                self.isValidNickname = text.count > 2
                self.nickname = text
                //print(text)
                
            case passwordTextField:
                self.isValidPassword = text.isValidPassword()
                self.password = text
                
            default:
                fatalError("Missing Textfield...")
        }
    }

    
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        // 뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func registerButtonDidtap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(
            email: self.email,
            nickname: self.nickname,
            name: self.name, 
            password: self.password)
        
        self.userInfo?(userInfo)
    }
    
    
    
    // MARK: - Helpers
    private func setupTextField() {
        textFields.forEach{tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    
    // 사용자가 입력한 회원정보 확인하고 -> UI 업데이트
    private func validateUserInfo() {
        //if isValidEmail == false
        if isValidEmail && isValidName && isValidNickname && isValidPassword {
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.facebookColor
            }

        } else {
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.disabledButtonColor
            }
        }
    }
    
    private func setupAttribute() {
        // registerButton
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(
            self.popToLoginButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
    }
}

// 정규 표현식
extension String {
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

