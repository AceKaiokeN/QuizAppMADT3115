//
//  ShowResult.swift
//  QuizAppMADT3115
//
//  Created by Kaushil Prajapati on 08/11/21.
//

import UIKit

class ShowResult: UIViewController {
    
   
    @IBOutlet weak var ScoreValue: UILabel!
    @IBOutlet weak var Msg: UILabel!
    
    
    @IBOutlet weak var Resubmit: UIButton!
    
    var RightansCount = 0
    
    func GetMsg(fill: Int)-> String{
        switch fill{
        case 3:
            return "Good Job!"
        case 4:
            return "Excellent Work!"
        case 5:
            return
             "You are a Genius!"
        default:
            Resubmit.isHidden = false
            return "Please Try Again!"
        }
        
    }
    
    
    @IBAction func onResubmit(_ sender: Any) {
        performSegue(withIdentifier: "ReSubmit", sender: self)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        ScoreValue.text = "\(RightansCount) Out of 5"
        
        Msg.text = GetMsg(fill: RightansCount)

        
    }
    
    

   

}
