//
//  SignInSucessFullViewController.swift
//  login&registerPage
//
//  Created by Santosh Dudhat on 01/03/22.
//

import UIKit

class SignInSucessFullViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var signInSucessBackground: UIImageView!
    @IBOutlet weak var sucessLabel: UILabel!
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackground()
        setUpSucessLabel()
    }
    
    // MARK: - set up background & label
    private func setUpBackground() {
        signInSucessBackground.backgroundColor = .white
        signInSucessBackground.layer.cornerRadius = 75
        
        view.backgroundColor = .black
    }
    private func setUpSucessLabel() {
        sucessLabel.textColor = .white
        sucessLabel.textAlignment = .center
    }
}
