//
//  ActivitySubtypeListViewController.swift
//  Spedu
//
//  Created by Hazimi Asyraf on 5/1/18.
//  Copyright © 2018 Hazimi Asyraf. All rights reserved.
//

import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class ActivitySubtypeListViewController: UITableViewController {

    let activityTypes = ["Person", "Environment", "Occupation"]
    var selectedType = Int()
    var selectedSection = Int()
    var selectedRow = Int()
    
    var tableData = [cellData]()
    var activityTableData = [cellData]()
    var occupationTableData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = activityTypes[selectedType]
        let homeButton = UIBarButtonItem(image: UIImage(named: "home"), style: .done, target: self, action: #selector(exitToHome))
        self.navigationItem.rightBarButtonItem = homeButton
        
        activityTableData = [cellData(opened: false, title: "Small Muscle Development", sectionData: ["Hand & Fingers Strength","Crossing Midlines","Upper Body Strength", "Hand Dominance"]),
                             cellData(opened: false, title: "Eye Hand Coordination", sectionData: ["Eye Hand Coordination"]),
                             cellData(opened: false, title: "Ability to Hold Utensils or Writing Tools", sectionData: ["Pencil Grasp","Object Manipulation","Hand Division"]),
                             cellData(opened: false, title: "Ability to Form Basic Strokes Smoothly", sectionData: ["Bilateral Integration"]),
                             cellData(opened: false, title: "Letter Perception", sectionData: ["Visual Perception"]),
                             cellData(opened: false, title: "Oriented to Printed Language", sectionData: ["Memory"])]
        
        occupationTableData = [cellData(opened: false, title: "Formal Education Participation", sectionData: ["Academic", "Extracurricular","Vocational Education Activities"]),
                               cellData(opened: false, title: "Beyond Formal Education", sectionData: ["Informal Personal Education Needs"])]
        
        if selectedType == 0 {
            tableData = activityTableData
        } else {
            tableData = occupationTableData
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableData[section].opened == true {
            return tableData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "activitySubtypeCell") else {return UITableViewCell()}
            cell.textLabel?.text = tableData[indexPath.section].title
            cell.textLabel?.font = UIFont(name:"Avenir-Heavy", size:18)
            return cell
        } else {
            //use different cell identifier if needed
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "activitySubtypeCell") else {return UITableViewCell()}
            cell.textLabel?.text = tableData[indexPath.section].sectionData[indexPath.row - 1]
            cell.textLabel?.font = UIFont(name:"Avenir", size:18)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableData[indexPath.section].opened == true {
                tableData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                tableData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        } else {
            selectedSection = indexPath.section
            selectedRow = indexPath.row - 1
            if selectedType == 0 {
                self.performSegue(withIdentifier: "showActivitySubSubtype", sender: self)
            }
            else {
                self.performSegue(withIdentifier: "showOccupationInfo", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
        if segue.identifier == "showActivitySubSubtype" {
            var nextViewController : ActivitySubSubtypeViewController = segue.destination as! ActivitySubSubtypeViewController
            nextViewController.section = selectedSection
            nextViewController.row = selectedRow
        }
        else {
            var nextViewController : OccupationInfoViewController = segue.destination as! OccupationInfoViewController
            nextViewController.section = selectedSection
            nextViewController.row = selectedRow
        }
    }
    
    func exitToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
