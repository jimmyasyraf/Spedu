//
//  LDInformationViewController.swift
//  Spedu
//
//  Created by Hazimi Asyraf on 4/24/18.
//  Copyright © 2018 Hazimi Asyraf. All rights reserved.
//

import UIKit

class LDInformationViewController: UIViewController {
    
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var problemLabel: UILabel!
    
    var disabilityType = Int()
    let disabilityNames = ["Visual Perception/ Visual Motor Deficit", "Non-Verbal Processing Disorder", "Language Processing Disorder", "Dyslexia", "Dyslexia", "Dyscalculia", "Dysgraphia", "Auditory Processing Disorder"]
    
    //definitions
    let visualPerceptionDef = "Affects the understanding of information that a person sees, or the ability to draw or copy."
    let nonVerbalDef = "Difficulty interpreting non-verbal cues liek facial expressions or boy language, and may have poor coordination."
    let languageProcessingDef = "-Affects sound groups that form words, sentences and stories.\n - Affect expressive language and receptive language"
    let dyslexiaDef = "Affect reading, recall, writing, spelling, and sometimes speech."
    let dyscalculiaDef = "Poor math symbols, may struggle with memorizing and organizing numbers, have difficulty telling time, or have trouble with counting."
    let dysgraphiaDef = "Problems in handwriting, inconsistent spacing, poor spatial planning on paper, poor spelling, and difficulty composing writing as well as thinking and writing at the same time."
    let auditoryProcessingDef = "- Unable to differentiate nearly same of sounds even when the sounds are loud and clear enough to be heard.\n - Unable to tell where sounds are coming from."
    
    //problems
    let visualPerceptionProblem = " - Reversals: b for d, p for q or inversions: u for n, w for m\n - Difficulty negotiating around campus\n - Cannot copy accurately \n - Does not recognize an object/word if only part of it is shown \n - Misalign letters; may have messy papers"
    let nonVerbalProblem = " - Difficult recognizing nonverbal cues such as facial expression or body language \n - Shows poor psycho-motor coordination; clumsy; seems to be constantly “getting in the way,” bumping into people and objects \n - Using fine motor skills a challenge: tying shoes, writing, using scissors \n - Difficult to follow multi-step instructions"
    let languageProcessingProblem = " - Difficult gaining meaning from spoken language \n - Demonstrates poor written output \n - Poor reading comprehension \n - Difficult expressing thoughts in verbal form \n - Difficult labeling objects or recognizing labels \n - Feels that words are “right on the tip of my tongue” \n - Describe an object and draw it, but can’t think of the word for it \n - May be depressed or having feelings of sadness \n - Has difficulty getting jokes"
    let dyslexiaProblem = " - Reads slowly and painfully \n - Experiences decoding errors, especially with the order of letters \n - Trouble with spelling \n - Difficulty with handwriting \n - Difficulty recalling known words \n - Difficulty with written language \n - Difficulty in math computations"
    let dyscalculiaProblem = "- Difficult understanding concepts of place value, and quantity, number lines, positive and negative value, carrying and borrowing \n - Difficult sequencing information or events \n - Difficulty using steps involved in math operations \n - Difficulty understanding fractions \n - Difficult handling money \n - Difficulty in adding, subtracting, multiplying, or dividing \n - Difficulty understanding concepts related to time such as days, weeks, months, seasons, quarters, etc"
    let dysgraphiaProblem = " - Handwriting not clear to be read (despite appropriate time and attention given the task) \n - Shows inconsistencies: upper and lower case, or irregular sizes, shapes or slant of letters \n - Unfinished words or letters \n - Inconsistent spacing between words and letters \n - \n Show strange wrist, body or paper position \n - Has difficulty pre-visualizing letter formation \n - Slow copying or writing \n - Shows poor spatial planning on paper \n - Unusual grip \n - Difficulty in taking notes"
    let auditoryProcessingProblem = " - Has difficulty processing and remembering language-related tasks but may have no trouble interpreting or recalling non-verbal environmental sounds, music, etc. \n - Slowly process thoughts and ideas and difficult explaining them \n - Misspells and mispronounces similar-sounding words or omits syllables (celery/salary; belt/built; three/free; jab/job; bash/batch) \n - Distracted by background sounds/noises \n - Difficult to focused or remember a verbal presentation or lecture \n - Difficulty following directions in a series \n - Says “What?” a lot, even when has heard much of what was said"
    
    var disabilityDefinitions = [String]()
    var disabilityProblems = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let homeButton = UIBarButtonItem(image: UIImage(named: "home"), style: .done, target: self, action: #selector(exitToHome))
        self.navigationItem.rightBarButtonItem = homeButton
        disabilityDefinitions = [visualPerceptionDef, nonVerbalDef, languageProcessingDef, dyslexiaDef, dyscalculiaDef, dysgraphiaDef, auditoryProcessingDef]
        self.title = disabilityNames[disabilityType]
        disabilityProblems = [visualPerceptionProblem, nonVerbalProblem, languageProcessingProblem, dyslexiaProblem, dyscalculiaProblem, dysgraphiaProblem, auditoryProcessingProblem]
        definitionLabel.text = disabilityDefinitions[disabilityType]
        problemLabel.text = disabilityProblems[disabilityType]
        definitionLabel.sizeToFit()
        problemLabel.sizeToFit()
    }
    
    func exitToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
