//
//  OccupationalTherapistViewController.swift
//  Spedu
//
//  Created by Hazimi Asyraf on 4/28/18.
//  Copyright © 2018 Hazimi Asyraf. All rights reserved.
//

import UIKit

class OccupationalTherapistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Occupational Therapist"
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let homeButton = UIBarButtonItem(image: UIImage(named: "home"), style: .done, target: self, action: #selector(exitToHome))
        self.navigationItem.rightBarButtonItem = homeButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func exitToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
