//
//  ActivityInfoViewController.swift
//  Spedu
//
//  Created by Hazimi Asyraf on 5/1/18.
//  Copyright © 2018 Hazimi Asyraf. All rights reserved.
//

import UIKit

struct activityData {
    var method = String()
    var grading = String()
    var file = String()
}

class ActivityInfoViewController: UIViewController {
    @IBOutlet weak var methodLabel: UILabel!
    @IBOutlet weak var gradingLabel: UILabel!
    @IBOutlet weak var gradingTitle: UILabel!
    @IBOutlet weak var activityPicture: UIImageView!
    
    var section = Int()
    var row = Int()
    var subtype = Int()
    
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
    
    let subtypeData = [
        [[activityData(method: "1. Teacher provide cookies in a plate and chopstick.\n2. Student need to transfer cookies from one plate to another using chopstick.", grading: "Increase thickness of biscuit.", file:"TransferCookies.gif"),
          activityData(method: "Student squeeze the dough and try to make any objects such as robots.", grading: "Increase duration of playing dough", file:"PlayDough.gif"),
          activityData(method: "Student need to use sponge to transfer water from basin into container.\nNote: This activity can be done in a group of students.", grading: "Increase radius of container according to students’ ability.", file:"FillContainer.gif")],
         [activityData(method: "1. Print animal pictures and its name. Teacher stick onto whiteboard into two lines.\n2. Have the student to match the picture with the correct name for the animals with left or right stroke.\n3. Student use marker to match.", grading: "Teacher can arrange the picture in any ways", file:"Matching.gif"),
          activityData(method: "1. Teacher download drum kit apps (or any similar apps).\n2. Project infront of the class using projector.\n3. Ensure that the apps view only the drum instruments without the drummer (to avoid confusion of mirror movement). Educators need to intermittently pause and play so that student are able to follow the steps.", grading: "Change the speed of drummer.", file:"BeADrummer.gif"),
          activityData(method: "1. A pair of student sit on chair face-to- face.\n2. Teacher demonstrate on how to play the game.\nStudent need to follow step by step.", grading: "", file:"Pat-A-Cake.gif")],
         [activityData(method: "1. Teacher paste mahjong paper on the wall for each students.\n2. Painting wall using water color.\n3. Student doing this activity while standing.\nHand print and figure of eight movement apply on paper.", grading: "Frequency figure of eight within 5 minutes.", file:"WallPainting.gif"),
          activityData(method: "1. Teacher provide net on wall.\n2. Student throw ball into net.\nNote: this activity can do in group of student.", grading: "Duration of the activity", file:"BallNet.gif"),
          activityData(method: "Have the child imitate animals movement such as:\n i) Cat walk\n ii) Crocodile\n iii) Frog jumps\nChild need to reach the end of checkpoint.", grading: "Increase animal walk difficulty.", file:"AnimalImitatingWalk.gif")],
         [activityData(method: "Student use dominant hand to pound clay until its flat.", grading: "Thickness of clay.", file:"PoundingClay.gif"),
          activityData(method: "Student use dominance hand to toss into cone accurately.", grading: "Distance student from cone can be increase", file:"RingToss.gif")]],
        [[activityData(method: "Trace coins under paper using different color pencils.\nNote: Teacher may use other items:\n i) Leaves\n ii) Keys\n iii) Paper clips", grading: "", file:"ShapeRubbing.gif"),
          activityData(method: "Form a circle with one student at centre. Have the student throw the ball to each of friends in the group by calling their name.", grading: "Increase duration of the games", file:"ThrowingBall.gif"),
          activityData(method: "1. Student sit on table. Teacher sit in front of student.\n2. Teacher move marble on the table and have the students try to catch it.", grading: "Start with slow rolling of marble to fast", file:"MarbleTracking.gif")]],
        [[activityData(method: "Teacher can provide bigger size of pencil, binder clip and foam.", grading: "", file:"PencilGrasp.gif")],
         [activityData(method: "1. Teacher provide coin and container.\n2. Student need to pick coin to put into container.", grading: "Increase number of coin used", file:"CoinContainer.gif"),
          activityData(method: "1. Have student draw a picture of tree with some branches.\n2. Green color paper tear into pieces.\n3. Next, student need to crumple the paper and glue them on branches.", grading: "", file:"CrumplePaper.gif")],
         [activityData(method: "Demonstrate to students on how to throw the dart. Start with 2m distance and can be increase to 4m and 6m.", grading: "Distance can be adjust according to students’ ability", file:"Dart.gif"),
          activityData(method: "1. Have a student sit at the table.\n2. Teacher provide drawing block, water color and brush.\n3. Ask student to draw anything that they like.", grading: "", file:"DrawingBrush.gif"),
          activityData(method: "Square fabric with button holes in the center. Stitch large button on one end of the ribbon and smaller button at the other end. Large button act as stopper", grading: "Use from large button to small button.", file:"ButtoningSnake.gif")]],
        [[activityData(method: "1. Student are given black and white puzzle of cars and they are required to color it.\n2. Then cut the puzzle using scissor.\n3. Complete the puzzle.\n4. Paste the combined puzzle on a piece of paper.", grading: "Use simple to complex puzzles.", file:"CuttingScissor.gif"),
          activityData(method: "Student need to take out marble from theraputty and put it into a container.", grading: "Teacher may change to finding the small items in the theraputty such as beads or coins.", file:"FindMarble.gif"),
          activityData(method: "Child need to weave lace through the holes.\nTeacher can use a piece of paper and make holes using puncher.", grading: "Use simple to complex pictures for lacing.", file:"Lacing.gif")]],
        [[activityData(method: "Build blocks design according to model. Starts with 3 blocks and can be increase to 6 or 8 blocks model.", grading: "Increase number of block use.", file:"BuildingBlock.gif"),
          activityData(method: "Find hidden pictures in paper. Starts with find 10 pictures.", grading: "Grade the activities with more pictures need to find.", file:"HiddenPictures.gif"),
          activityData(method: "Teacher give an instruction to child such as “Help the dog get his bone.”", grading: "Increase mazes difficulty.", file:"Maze.gif")]],
        [[activityData(method: "1. Arrange card into two rows and have 6 pair as starter.\n2. Child need to turn the card and remember the picture and need to turn it back.\n3. Next, child have to pick another card and have to remember it.\n4. So if the child has findthe same picture, she or he can proceed to next pictures.\nNote: Teacher may use alphabets and numbers in this activity.", grading: "Increase number of cards the student have to memorize.", file:"SnapCard.gif"),
          activityData(method: "Teacher ask child on what they done for today morning or about yesterday. Let the child tell you the story.", grading: "Ask each steps they are doing in the activity.", file:"LetsRecall.gif"),
          activityData(method: "1. Teacher prepare cards, 3D number, alphabet or shape.\n2. Students have to memorize a number, alphabet or shape shown to him or her.\n3. They have to guess the same shape by touching 3D shape in the box.", grading: "Increase number and alphabet at one time student need to memorize.", file:"GuessMe.gif")]]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeButton = UIBarButtonItem(image: UIImage(named: "home"), style: .done, target: self, action: #selector(exitToHome))
        self.navigationItem.rightBarButtonItem = homeButton
        self.title = activitySubSubtypes[section][row][subtype]
        var selectedSubtypeData = subtypeData[section][row][subtype]
        methodLabel.text = selectedSubtypeData.method
        if selectedSubtypeData.grading != "" {
            gradingLabel.text = selectedSubtypeData.grading
        }
        else {
            gradingLabel.isHidden = true
            gradingTitle.isHidden = true
        }
        try activityPicture.loadGif(name: selectedSubtypeData.file.fileName())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func exitToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }

}

extension String {
    func fileName() -> String {
        return NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent ?? ""
    }
    
    func fileExtension() -> String {
        return NSURL(fileURLWithPath: self).pathExtension ?? ""
    }
}
