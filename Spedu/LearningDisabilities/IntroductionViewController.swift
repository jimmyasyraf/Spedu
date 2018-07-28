//
//  IntroductionViewController.swift
//  Spedu
//
//  Created by Hazimi Asyraf on 4/24/18.
//  Copyright © 2018 Hazimi Asyraf. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Learning Disabilities"
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let homeButton = UIBarButtonItem(image: UIImage(named: "home"), style: .done, target: self, action: #selector(exitToHome))
        self.navigationItem.rightBarButtonItem = homeButton
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func exitToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
