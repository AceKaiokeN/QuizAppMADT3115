//
//  Questions.swift
//  QuizAppMADT3115
//
//  Created by Kaushil Prajapati on 08/11/21.
//

import Foundation
class Questions {
    var question: String
    var opts: [String]
    var AnsInd : Int
    
    init(question:String, opts: [String], AnsInd : Int)
    {
        self.question = question
        self.opts = opts
        self.AnsInd = AnsInd
    }
    
    func isRight(_ IndexSelected : Int) -> Bool
    {
        return AnsInd == IndexSelected
        
    }
    
    
}
