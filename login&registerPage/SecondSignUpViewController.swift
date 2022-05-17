//
//  SecondSignUpViewController.swift
//  login&registerPage
//
//  Created by Santosh Dudhat on 01/03/22.
//

import UIKit

class SecondSignUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak var secondSignUpBackground: UIImageView!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var genderPickerView: UIPickerView!
    
    let gender: [String] = ["Male","Female","Other"]

    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundAndTextField()
        setUpSignUpButton()
        setUpGenderPickerView()
    }
    override func viewWillAppear(_ animated: Bool) {
        newPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Enter New Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Enter Confirm Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        genderTextField.attributedPlaceholder = NSAttributedString(string: "Choose Gender", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    // MARK: - set up background & textfield
    private func setUpBackgroundAndTextField() {
        secondSignUpBackground.backgroundColor = .white
        secondSignUpBackground.layer.cornerRadius = 75
        
        view.backgroundColor = .black
        setUpTextFields(textField: newPasswordTextField)
        setUpTextFields(textField: confirmPasswordTextField)
    }
    private func setUpTextFields(textField: UITextField) {
        textField.textColor = .white
        textField.layer.borderColor = UIColor.lightGray.cgColor
        genderTextField.layer.borderColor = UIColor.lightGray.cgColor
        genderTextField.layer.borderWidth = 2
        genderTextField.textAlignment = .center
        genderTextField.layer.cornerRadius = 10
        genderTextField.allowsEditingTextAttributes = false
        genderTextField.textColor = .white
        textField.layer.borderWidth = 2
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
        textField.isSecureTextEntry = true
        newPasswordTextField.tag = 0
        confirmPasswordTextField.tag = 1
        genderTextField.tag = 2
    }
    private func setUpTextFieldsTag() {
        newPasswordTextField.tag = 0
        confirmPasswordTextField.tag = 1
        genderTextField.tag = 2
    }
    
    // MARK: - set up buttons
    private func setUpSignUpButton() {
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.tintColor = .black
        signUpButton.backgroundColor = .white
        signUpButton.layer.cornerRadius = 10
    }
    @IBAction func signUpButtonTapped(_ sender: Any) {
        if newPasswordTextField.text == "" {
            newPasswordTextFieldAlertView()
        }
        else if confirmPasswordTextField.text == "" {
            comfirmPasswordTextFieldAlertView()
        }
        else if genderTextField.text == "" {
            genderAlertView()
        }
    }
    
    // MARK: - TextField alert view
    private func newPasswordTextFieldAlertView() {
        let newPasswordAlert: UIAlertController = UIAlertController(title: "Oops!", message: "Enter New Password", preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        newPasswordAlert.addAction(okButton)
        present(newPasswordAlert, animated: true, completion: nil)
    }
    private func comfirmPasswordTextFieldAlertView() {
        let comfirmPasswordAlert: UIAlertController = UIAlertController(title: "Oops!", message: "Enter Confirm Password", preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        comfirmPasswordAlert.addAction(okButton)
        present(comfirmPasswordAlert, animated: true, completion: nil)
    }
    private func genderAlertView() {
        let genderAlert: UIAlertController = UIAlertController(title: "Oops!", message: "Choose Gender", preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        genderAlert.addAction(okButton)
        present(genderAlert, animated: true, completion: nil)
    }
    
    // MARK: - set picker view
    private func setUpGenderPickerView() {
        genderPickerView.backgroundColor = .black
        genderPickerView.setValue(UIColor.white, forKey: "textColor")
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        genderPickerView.isHidden = false
    }
    // MARK: - pickerView delegate method
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        gender[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.view.endEditing(true)
        self.genderTextField.text = gender[row]
    }
    
    // MARK:- text field delegate method
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        genderPickerView.isHidden = true
        return false
    }
    private func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.black.cgColor
    }
    private func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        genderPickerView.isHidden = true
        super.touchesBegan(touches, with: event)
    }
}
