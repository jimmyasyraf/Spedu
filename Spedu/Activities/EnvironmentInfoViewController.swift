//
//  EnvironmentInfoViewController.swift
//  Spedu
//
//  Created by Hazimi Asyraf on 5/4/18.
//  Copyright © 2018 Hazimi Asyraf. All rights reserved.
//

import UIKit

class EnvironmentInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeButton = UIBarButtonItem(image: UIImage(named: "home"), style: .done, target: self, action: #selector(exitToHome))
        self.navigationItem.rightBarButtonItem = homeButton
        self.title = "Environment"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func exitToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
