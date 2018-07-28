//
//  OccupationInfoViewController.swift
//  Spedu
//
//  Created by Hazimi Asyraf on 5/4/18.
//  Copyright © 2018 Hazimi Asyraf. All rights reserved.
//

import UIKit

class OccupationInfoViewController: UIViewController {
    @IBOutlet weak var occupationInfoLabel: UILabel!
    
    let occupationTypes = [["Academic","Extracurricular","Vocational Education Activities"],["Informal Personal Education"]]
    var selectedType = Int()
    let occupationInfos = [["The primary intervention occurs within regular education and includes lesson plans based on school years. In order to ensure that all students have access to the curriculum, it is essential to provide intensive and ongoing professional development for teachers in mainstream schools. (Pesova, Sivevska, & Runceva, 2014)","Study by Brooks, Floyd, Robins, & Chan (2014) indicated that the more time spent doing unstructured activities was associated with higher levels of social competence for all children.","Harvey, (2001) in his study revealed that students with learning disabilities who participated in vocational education while in high school generally had higher employment rates compared to those who took no vocational education."],
                           ["Learning process has been proved to be most effective when informal and formal learning coexist and a variety of learning practices are followed within more flexible learning ecosystems which allow learners to build on and extend their formal learning as well as increasing personal agency in the learning process. (Harvey, 2001)"]]
    
    var section = Int()
    var row = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = occupationTypes[section][row]
        let homeButton = UIBarButtonItem(image: UIImage(named: "home"), style: .done, target: self, action: #selector(exitToHome))
        self.navigationItem.rightBarButtonItem = homeButton
        occupationInfoLabel.text = occupationInfos[section][row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func exitToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
