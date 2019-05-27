//
//  ViewController.swift
//  InduslandDemoApp
//
//  Created by Mac on 22/05/19.
//  Copyright © 2019 Mac software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aadharNumberTextField: UITextField!
    @IBOutlet weak var logIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        aadharNumberTextField.delegate = self
        //Looks for single or multiple taps.
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//
//        view.addGestureRecognizer(tap)
    }
    
//    //Calls this function when the tap is recognized.
//    func dismissKeyboard() {
//        view.endEditing(true)
//    }

    @IBAction func LoginButtonAction(_ sender: Any) {
        self.view.endEditing(true)
        let loginResponse = ApiMethod.init().login(aadhar: aadharNumberTextField.text ?? "")
        var dictonary:NSDictionary?
        
        if let data = loginResponse.data(using: String.Encoding.utf8) {
            
            do {
                dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] as NSDictionary?
                
                if let myDictionary = dictonary, let status = myDictionary["status"] as? String {
                    if status == "Fail" {
                        let alert = UIAlertController(title: myDictionary["status"] as? String, message: myDictionary["Description"] as? String, preferredStyle: UIAlertController.Style.alert)
                        
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
                            //Cancel Action
                        }))
                        
                        self.present(alert, animated: true, completion: nil)
                    } else if status == "Success"{
                        print("Dict %@",myDictionary)
//                        let dashboard = DashboardViewController()
//                        self.navigationController?.pushViewController(dashboard, animated: true)
                        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "dashboardID") as UIViewController
                        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
                        
                        self.navigationController?.pushViewController(viewController, animated: true)
                    }
                }
            } catch let error as NSError {
                print(error)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 12
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }

}
