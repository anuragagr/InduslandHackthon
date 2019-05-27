//
//  DepositeViewController.swift
//  InduslandDemoApp
//
//  Created by Mac on 24/05/19.
//  Copyright © 2019 Mac software. All rights reserved.
//

import UIKit

class DepositeViewController: UIViewController {
    @IBOutlet weak var aadharNumber: UITextField!
    @IBOutlet weak var accountNumber: UITextField!
    @IBOutlet weak var currencyType: UITextField!
    @IBOutlet weak var Amount: UITextField!
    @IBOutlet weak var debitNarration: UITextField!
    @IBOutlet weak var BalaceUpdated: UITextField!
    @IBOutlet weak var creditNarration: UITextField!
    @IBOutlet weak var depositWithDrawButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       // addSlideMenuButton()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func submitButtonAction(_ sender: Any) {
        self.view.endEditing(true)
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

extension DepositeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == aadharNumber {
            let maxLength = 12
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        
        if textField == accountNumber {
            let maxLength = 12
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        return false
    }
    
}

