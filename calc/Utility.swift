//
//  Utility.swift
//  calc
//
//  Created by Duy Thuong on 18/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

class Utility{
    static let operators: [Character]=["+","-","x","/","%"]
    
    //Check if the inputted string is a valid number
    static func isNumber(_ input:String)->Int?{
        let num=Int(input) ?? nil
        if num != nil{
            return num
        }
        return nil
    }
    
    //Check if the inputted string is a valid operator
    static func isOperator(_ input:String)->Character?{
        let op=Character(input)
        if operators.contains(op){
            return op
        }
        return nil
    }
    
    //Exit the program and print out the error for user
    static func exitWithError(_ message: String) -> Never {
        print("Error: \(message)")
        exit(EXIT_FAILURE)
    }

}
