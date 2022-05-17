//
//  ViewController.swift
//  login&registerPage
//
//  Created by Santosh Dudhat on 26/02/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var firstPageImageView: UIImageView!
    @IBOutlet weak var loginAndSignUpBackgroundView: UIImageView!
    @IBOutlet weak var startLineLabel: UILabel!
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLoginAndSignUpBackgroundView()
        setUpTitleAndTagLine()
        setUpButtons()
    }
    
    // MARK: - set up background & textfield
    private func setUpLoginAndSignUpBackgroundView() {
        loginAndSignUpBackgroundView.layer.cornerRadius = 75
        loginAndSignUpBackgroundView.layer.masksToBounds = true
    }
    private func setUpTitleAndTagLine() {
        startLineLabel.textColor = .white
        startLineLabel.textAlignment = .center
        tagLineLabel.textColor = .black
        tagLineLabel.font = UIFont.systemFont(ofSize: 20)
    }
    
    // MARK: - set up buttons
    private func setUpButtons() {
        // MARK:- Sign in button
        signInButton.tintColor = .white
        signInButton.backgroundColor = .black
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.layer.cornerRadius = 10
        // MARK:- Sign up button
        signUpButton.tintColor = .black
        signUpButton.setTitle("Create a new account ?", for: .normal)
    }
    @IBAction func signInButtonTapped(_ sender: Any) {
        pushSignInButton()
    }
    private func pushSignInButton() {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signInViewController: SignInViewController = mainStoryBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        navigationController?.pushViewController(signInViewController, animated: true)
    }
    @IBAction func signUpButtonTapped(_ sender: Any) {
        pushSignUpButton()
    }
    private func pushSignUpButton() {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signupViewController: SignUpViewController = mainStoryBoard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        navigationController?.pushViewController(signupViewController, animated: true)
    }
}

