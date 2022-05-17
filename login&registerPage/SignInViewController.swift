//
//  LoginViewController.swift
//  login&registerPage
//
//  Created by Santosh Dudhat on 13/03/34.
//

import UIKit

class SignInViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var signInBackgroundView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundColor()
        setUpSignInBackground()
        setUpUsernameTextField()
        setUpPasswordTextField()
        setUpSignInButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "Enter your Username or Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter your Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    // MARK: - set up background & textfield
    private func setUpBackgroundColor() {
        view.backgroundColor = .black
    }
    private func setUpSignInBackground() {
        signInBackgroundView.backgroundColor = .white
        signInBackgroundView.layer.cornerRadius = 75
        signInBackgroundView.layer.masksToBounds = true
    }
    private func setUpUsernameTextField() {
        usernameTextField.textColor = .white
        usernameTextField.layer.borderColor = UIColor.lightGray.cgColor
        usernameTextField.layer.borderWidth = 2
        usernameTextField.layer.cornerRadius = 10
        usernameTextField.textAlignment = .center
    }
    private func setUpPasswordTextField() {
        passwordTextField.textColor = .white
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.textAlignment = .center
        passwordTextField.isSecureTextEntry = true
    }
    
    // MARK: - set up SignIn button
    private func setUpSignInButton() {
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.tintColor = .black
        signInButton.backgroundColor = .white
        signInButton.layer.cornerRadius = 10
        forgotPasswordButton.tintColor = .white
    }
    @IBAction func signInButtonTapped(_ sender: Any) {
        if usernameTextField.text == "" {
            usernameTextFieldAlertView()
        }
        else if passwordTextField.text == "" {
            passwordTextFieldAlertView()
        }
        else {
            pushSignInButton()
        }
    }
    private func pushSignInButton() {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signInSucessfullViewController: SignInSucessFullViewController = mainStoryBoard.instantiateViewController(withIdentifier: "SignInSucessFullViewController") as! SignInSucessFullViewController
        navigationController?.pushViewController(signInSucessfullViewController, animated: true)
    }
    
    // MARK: - set up forgot password button
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        pushForgotPasswordButton()
    }
    private func pushForgotPasswordButton() {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let forgotPasswordViewController: ForgotPasswordViewController = mainStoryBoard.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        navigationController?.pushViewController(forgotPasswordViewController, animated: true)
    }
    
    // MARK: - set up text field alert view
    private func usernameTextFieldAlertView() {
        let usernameAlert: UIAlertController = UIAlertController(title: "Oops!", message: "Enter Username or Email", preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        usernameAlert.addAction(okButton)
        present(usernameAlert, animated: true, completion: nil)
    }
    private func passwordTextFieldAlertView() {
        let passwordAlert: UIAlertController = UIAlertController(title: "Oops!", message: "Enter Password", preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        passwordAlert.addAction(okButton)
        present(passwordAlert, animated: true, completion: nil)
    }
}
