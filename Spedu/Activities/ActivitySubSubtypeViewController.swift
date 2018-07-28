//
//  ActivitySubSubtypeViewController.swift
//  Spedu
//
//  Created by Hazimi Asyraf on 5/1/18.
//  Copyright © 2018 Hazimi Asyraf. All rights reserved.
//

import UIKit

class ActivitySubSubtypeViewController: UITableViewController {

    var section = Int()
    var row = Int()
    var selectedSubtype = Int()
    
    let activityTypes = [["Hand & Fingers Strength", "Crossing Midlines","Upper Body Strength", "Hand Dominance"],
                         ["Eye Hand Coordination"],
                         ["Pencil Grasp","Object Manipulation","Hand Division"],
                         ["Bilateral Integration"],
                         ["Visual Perception"],
                         ["Memory"]]
    
    let activitySubSubtypes = [
        [["Transfer cookies","Playing dough", "Fill container with water using sponge"],["Matching activity","Be a drummer", "Play pat-a-cake"],["Wall painting","Throw ball into net", "Animal imitating walk"],["Pounding clay", "Ring toss"]],
        [["Shape rubbing", "Throwing and catching ball", "Marble tracking"]],
        [["Adaptation"],["Put coin into container", "Crumple a piece of paper"],["Dart", "Drawing using brush","Buttoning snake"]],
        [["Cutting scissor","Find a marble using two hands","Lacing"]],
        [["Building blocks design","Hidden pictures","Maze"]],
        [["Snap card","Let’s recall", "Guess me"]]
    ]
    
    var activitySubSubtype = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeButton = UIBarButtonItem(image: UIImage(named: "home"), style: .done, target: self, action: #selector(exitToHome))
        self.navigationItem.rightBarButtonItem = homeButton
        self.title = activityTypes[section][row]
        activitySubSubtype = activitySubSubtypes[section][row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activitySubSubtype.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activitySubSubtypeCell")!
        let cellTitle = activitySubSubtype[indexPath.row]
        cell.textLabel?.text = cellTitle
        cell.textLabel?.font = UIFont(name:"Avenir-Heavy", size:18)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSubtype = indexPath.row
        self.performSegue(withIdentifier: "showActivityInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
        var nextViewController : ActivityInfoViewController = segue.destination as! ActivityInfoViewController
        nextViewController.section = section
        nextViewController.row = row
        nextViewController.subtype = selectedSubtype
    }
    
    func exitToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
