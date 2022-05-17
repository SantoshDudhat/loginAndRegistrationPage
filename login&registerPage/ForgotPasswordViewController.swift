//
//  ForgotPasswordViewController.swift
//  login&registerPage
//
//  Created by Santosh Dudhat on 01/03/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var forgotPasswordBackgroundView: UIImageView!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpForgotPasswordBackground()
        setUpBackground()
        setUpTextFields()
        setUpDoneButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        newPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Enter New Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Enter Confirm Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    // MARK: - set up background & textfield
    private func setUpForgotPasswordBackground() {
        forgotPasswordBackgroundView.backgroundColor = .white
        forgotPasswordBackgroundView.layer.cornerRadius = 75
    }
    private func setUpBackground() {
        view.backgroundColor = .black
    }
    private func setUpTextFields() {
        newPasswordTextField.backgroundColor = .black
        newPasswordTextField.textColor = .white
        newPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
        newPasswordTextField.layer.borderWidth = 2
        newPasswordTextField.layer.cornerRadius = 10
        newPasswordTextField.isSecureTextEntry = true
        
        confirmPasswordTextField.backgroundColor = .black
        confirmPasswordTextField.textColor = .white
        confirmPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
        confirmPasswordTextField.layer.borderWidth = 2
        confirmPasswordTextField.layer.cornerRadius = 10
        confirmPasswordTextField.isSecureTextEntry = true
    }
    
    // MARK: - set up buttons
    private func setUpDoneButton() {
        doneButton.setTitle("Done", for: .normal)
        doneButton.tintColor = .black
        doneButton.backgroundColor = .white
        doneButton.layer.cornerRadius = 10
    }
    @IBAction func doneButtonTapped(_ sender: Any) {
        if newPasswordTextField.text == "" {
            newPasswordTextFieldAlertView()
        }
        else if confirmPasswordTextField.text == "" {
            confirmPasswordTextFieldAlertView()
        }
        if newPasswordTextField.text != confirmPasswordTextField.text{
            passwordEntryIsSameAlertView()
        }
        else {
            pushDoneButton()
        }
    }
    private func pushDoneButton() {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signInViewController: SignInViewController = mainStoryBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        navigationController?.pushViewController(signInViewController, animated: true)
    }
    
    // MARK: - set up text field alert view
    private func newPasswordTextFieldAlertView() {
        let newPasswordAlert: UIAlertController = UIAlertController(title: "Oops!", message: "Enter New Password", preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        newPasswordAlert.addAction(okButton)
        present(newPasswordAlert, animated: true, completion: nil)
    }
    private func confirmPasswordTextFieldAlertView() {
        let confirmPasswordAlert: UIAlertController = UIAlertController(title: "Oops!", message: "Enter Confirm Password", preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        confirmPasswordAlert.addAction(okButton)
        present(confirmPasswordAlert, animated: true, completion: nil)
    }
    private func passwordEntryIsSameAlertView() {
        let passwordEntryIsSameAlert: UIAlertController = UIAlertController(title: "Oops!", message: "Enter Same Password", preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        passwordEntryIsSameAlert.addAction(okButton)
        present(passwordEntryIsSameAlert, animated: true, completion: nil)
    }
}
