//
//  ActivitiesListViewController.swift
//  Spedu
//
//  Created by Hazimi Asyraf on 5/1/18.
//  Copyright © 2018 Hazimi Asyraf. All rights reserved.
//

import UIKit

class ActivitiesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var activitiesTable: UITableView!
    
    
    let activityTypes = ["Person", "Environment", "Occupation"]
    var selectedType = Int()
    
    @IBAction func scoringSheetPressed(_ sender: Any) {
        guard let url = URL(string: "https://drive.google.com/file/d/1RD6HvWX5OcipkOCVcXvNetp1Nob_LE6l/view?usp=sharing") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Activities"
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let homeButton = UIBarButtonItem(image: UIImage(named: "home"), style: .done, target: self, action: #selector(exitToHome))
        self.navigationItem.rightBarButtonItem = homeButton
        activitiesTable.dataSource = self
        activitiesTable.delegate = self
        activitiesTable.tableFooterView = UIView()
        activitiesTable.alwaysBounceVertical = false
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = activitiesTable.dequeueReusableCell(withIdentifier: "activityCell")!
        let cellTitle = activityTypes[indexPath.row]
        cell.textLabel?.text = cellTitle
        cell.textLabel?.font = UIFont(name:"Avenir-Heavy", size:18)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return activitiesTable.bounds.size.height/CGFloat(activityTypes.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedType = indexPath.row
        if indexPath.row == 0 {
            self.performSegue(withIdentifier: "showActivitySubtype", sender: self)
        } else if indexPath.row == 1 {
            self.performSegue(withIdentifier: "showEnvironmentInfo", sender: self)
        } else {
            self.performSegue(withIdentifier: "showActivitySubtype", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
        if segue.identifier == "showActivitySubtype" {
            var nextViewController : ActivitySubtypeListViewController = segue.destination as! ActivitySubtypeListViewController
            nextViewController.selectedType = selectedType
        }
    }
    
    func exitToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
