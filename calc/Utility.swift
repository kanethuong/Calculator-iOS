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
    
    static func isNumber(_ input:String)->Int?{
        let num=Int(input) ?? nil
        if num != nil{
            return num
        }
        return nil
    }
    
    static func isOperator(_ input:String)->Character?{
        let op=Character(input)
        if operators.contains(op){
            return op
        }
        return nil
    }
    
    static func exitWithError(_ message: String) -> Never {
        print("Error: \(message)")
        exit(EXIT_FAILURE)
    }

}
