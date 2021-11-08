//
//  ViewController.swift
//  QuizAppMADT3115
//
//  Created by Kaushil Prajapati on 08/11/21.
//

import UIKit

class ViewController: UIViewController {
    var selectedques : [Questions] = [Questions]()
    var QuesArr: [Questions] = [Questions]()
    var QuesCounter = 1
    var RightansCount = 0
    
    
    @IBOutlet weak var QuestionHead: UILabel!
    
    @IBOutlet weak var Ques: UILabel!
    
    @IBOutlet weak var Op1: UIButton!
    
    @IBOutlet weak var Op1text: UILabel!
    
    
    @IBOutlet weak var Op2: UIButton!
    
    @IBOutlet weak var Op2text: UILabel!
    
    
    @IBOutlet weak var Op3: UIButton!
    
    @IBOutlet weak var Op3text: UILabel!
    
    @IBOutlet weak var Op4: UIButton!
    
    @IBOutlet weak var Op4text: UILabel!
    
    
    @IBOutlet weak var Submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillQuestions()
        randomQuestions()
        screen()
        
    }
    
    
    
    func fillQuestions(){
        QuesArr = [
            Questions(question: "How many days do we have in a week?", opts: ["6","5","7","4"], AnsInd: 2),
       Questions(question: "How many days are there in a normal year?", opts: ["364","365","360","363"], AnsInd: 1),
        Questions(question: "How many colors are there in a rainbow?", opts: ["6","7","4","5"], AnsInd: 1),
        Questions(question: "Which animal is known as the ‘Ship of the Desert?’", opts: ["Giraffe","Lion","Camel","Snake"], AnsInd: 2),
       Questions(question: "How many letters are there in the English alphabet?", opts: ["24","25","21","26"], AnsInd: 3),
        Questions(question: "How many primary colors are there?", opts: ["One","Two","Three","Four"], AnsInd: 2),
        Questions(question: "How many consonants are there in the English alphabet?", opts: ["24","21","25","26"], AnsInd: 1),
        Questions(question: "How many sides are there in a triangle?", opts: ["4","5","3","1"], AnsInd: 2),
        Questions(question: "Which month of the year has the least number of days?", opts: ["January","February","March","April"], AnsInd: 1),
        Questions(question: "Which animal is called King of Jungle?", opts: ["Tiger","Dog","Lion","Cat"], AnsInd: 2),
            ]
        
        
        
        
    }
    
    
    func randomQuestions(){
        for i in 1...5{
            let randomNo = Int.random(in: 0..<QuesArr.count-i)
            selectedques.append(QuesArr[randomNo])
            QuesArr.remove(at: randomNo)
        }
        
    }
    
    func screen(){
        Submit.isHidden = true
        QuestionHead.text = "GK QUIZ Q No.\(QuesCounter) Out of 5"
        Ques.text = selectedques[QuesCounter-1].question
        Op1text.text = selectedques[QuesCounter-1].opts[0]
        Op2text.text = selectedques[QuesCounter-1].opts[1]
        Op3text.text = selectedques[QuesCounter-1].opts[2]
        Op4text.text = selectedques[QuesCounter-1].opts[3]
        if(QuesCounter == 5)
        {
            Submit.setTitle("Finish", for: .normal)
        }
        
        
        
    }
    
    func ClearOpts(){
        Submit.isHidden = false
        Op1.isSelected = false
        Op2.isSelected = false
        Op3.isSelected = false
        Op4.isSelected = false
    }
    
    func SelectedOptions(OpNumber:Int)
    {
        ClearOpts()
        if(OpNumber == 1)
        {
            Op1.isSelected = true
        }
        if(OpNumber == 2)
        {
            Op2.isSelected = true
        }
        if(OpNumber == 3)
        {
            Op3.isSelected = true
        }
        if(OpNumber == 4)
        {
            Op4.isSelected = true
        }
        
        }
    
    @IBAction func Op1Sel(_ sender: Any) {
        SelectedOptions(OpNumber: 1)
    }
    
    @IBAction func Op2Sel(_ sender: Any) {
        SelectedOptions(OpNumber: 2)
    }
    
    @IBAction func Op3Sel(_ sender: Any) {
        SelectedOptions(OpNumber: 3)
        
    }
    
    
    @IBAction func Op4Sel(_ sender: Any) {
        SelectedOptions(OpNumber: 4)
    }
    
    func VerifyAns(){
        if(Op1.isSelected && selectedques[QuesCounter-1].AnsInd == 0)
        {
            RightansCount = RightansCount + 1
        }
       else if(Op2.isSelected && selectedques[QuesCounter-1].AnsInd == 1)
        {
            RightansCount = RightansCount + 1
        }
        else if(Op3.isSelected && selectedques[QuesCounter-1].AnsInd == 2)
        {
            RightansCount = RightansCount + 1
        }
        else if(Op4.isSelected && selectedques[QuesCounter-1].AnsInd == 3)
        {
            RightansCount = RightansCount + 1
        }
    }
    
    func Result(){
        performSegue(withIdentifier: "Result", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gg = segue.destination as? ShowResult
        gg?.RightansCount = self.RightansCount
    }
    
    @IBAction func UsrSubmit(_ sender: Any) {
        VerifyAns()
        QuesCounter = QuesCounter + 1
        ClearOpts()
        if(QuesCounter <= 5)
        {
            screen()
        }
        else{
            Result()
        }
    }
    
}
    


    
    
    
    




