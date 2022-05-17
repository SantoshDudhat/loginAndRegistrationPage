//
//  SignUpViewController.swift
//  login&registerPage
//
//  Created by Santosh Dudhat on 01/03/22.
//

import UIKit

class SignUpViewController: UIViewController {
    // MARK:- IBOutlets
    @IBOutlet weak var signUpBackground: UIImageView!
    @IBOutlet weak var signUpLabelView: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK:- view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroungsAndTextField()
        setUpNextButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        firstNameTextField.attributedPlaceholder = NSAttributedString(string: "Enter your First Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        lastNameTextField.attributedPlaceholder = NSAttributedString(string: "Enter your Last Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        emailIdTextField.attributedPlaceholder = NSAttributedString(string: "Enter your Email Id", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        phoneNumberTextField.attributedPlaceholder = NSAttributedString(string: "Enter your Phone Number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    // MARK: - set up background & textfield
    private func setUpBackgroungsAndTextField() {
        signUpBackground.backgroundColor = .white
        signUpBackground.layer.cornerRadius = 75
        
        view.backgroundColor = .black
        setUpTextFields(textField: firstNameTextField)
        setUpTextFields(textField: lastNameTextField)
        setUpTextFields(textField: emailIdTextField)
        setUpTextFields(textField: phoneNumberTextField)
    }
    private func setUpTextFields(textField: UITextField) {
        textField.textColor = .white
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 2
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
    }
    
    // MARK: - set up buttons
    @IBAction func nextButtonTapped(_ sender: Any) {
        if firstNameTextField.text == "" {
            TextFieldAlertView(title: "Oops!", message: "Enter Your First Name")
        }
        else if lastNameTextField.text == "" {
            TextFieldAlertView(title: "Oops!", message: "Enter Your Last Name")
        }
        else if emailIdTextField.text == "" {
            TextFieldAlertView(title: "Oops!", message: "Enter Your Email Id")
        }
        else if phoneNumberTextField.text == "" {
            TextFieldAlertView(title: "Oops!", message: "Enter Your Phone Number")
        }
        else {
            pushNextButton()
        }
    }
    private func setUpNextButton() {
        nextButton.tintColor = .black
        nextButton.backgroundColor = .white
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.cornerRadius = 10
    }
    private func pushNextButton() {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondSignUpViewController: SecondSignUpViewController = mainStoryBoard.instantiateViewController(withIdentifier: "SecondSignUpViewController") as! SecondSignUpViewController
        navigationController?.pushViewController(secondSignUpViewController, animated: true)
    }
    
    // MARK: - TextField alert view
    private func TextFieldAlertView(title: String, message: String) {
        let firstNameAlert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        firstNameAlert.addAction(okButton)
        present(firstNameAlert, animated: true, completion: nil)
    }
}
