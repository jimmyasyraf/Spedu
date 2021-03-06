//
//  ViewController.swift
//  Spedu
//
//  Created by Hazimi Asyraf on 4/24/18.
//  Copyright © 2018 Hazimi Asyraf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var g4pTitle: UILabel!
    @IBOutlet weak var learningDisabilitiesButton: UIButton!
    @IBOutlet weak var occupationalTherapistButton: UIButton!
    @IBOutlet weak var handwritingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

