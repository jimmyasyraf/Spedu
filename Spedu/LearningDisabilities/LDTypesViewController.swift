//
//  LDTypesViewController.swift
//  Spedu
//
//  Created by Hazimi Asyraf on 4/24/18.
//  Copyright © 2018 Hazimi Asyraf. All rights reserved.
//

import UIKit

class LDTypesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var typesTable: UITableView!
    
    let learningDisabilitiesTypes = ["Visual Perception/ Visual Motor Deficit", "Non-Verbal Processing Disorder", "Language Processing Disorder", "Dyslexia", "Dyscalculia", "Dysgraphia", "Auditory Processing Disorder"]
    var selectedType = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Types of LD"
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let homeButton = UIBarButtonItem(image: UIImage(named: "home"), style: .done, target: self, action: #selector(exitToHome))
        self.navigationItem.rightBarButtonItem = homeButton
        typesTable.dataSource = self
        typesTable.delegate = self
        typesTable.tableFooterView = UIView()
        typesTable.alwaysBounceVertical = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return learningDisabilitiesTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = typesTable.dequeueReusableCell(withIdentifier: "typeCell")!
        let cellTitle = learningDisabilitiesTypes[indexPath.row]
        cell.textLabel?.text = cellTitle
        cell.textLabel?.font = UIFont(name:"Avenir-Heavy", size:18)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedType = indexPath.row
        self.performSegue(withIdentifier: "showLearningDisabilityInfo", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return typesTable.bounds.size.height/CGFloat(learningDisabilitiesTypes.count)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
        var nextViewController : LDInformationViewController = segue.destination as! LDInformationViewController
        nextViewController.disabilityType = selectedType
    }
    
    func exitToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
