//
//  DashboardViewController.swift
//  InduslandDemoApp
//
//  Created by Mac on 23/05/19.
//  Copyright © 2019 Mac software. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController {

    @IBOutlet weak var depositWithdrawButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        navigationItem.hidesBackButton = true
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        }
    }
    @IBAction func depositWithDrawAction(_ sender: Any) {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "depositID") as UIViewController
        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func transferAction(_ sender: Any) {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "transferID") as UIViewController
        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
