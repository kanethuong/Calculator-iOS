//
//  Validation.swift
//  calc
//
//  Created by Duy Thuong on 18/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

class Validation{
    var isNegative=1
    var opVisited = false
    var normalizedArgs:[String]=[]
    var isContainedOp=false
    
    //Validate all the input string
    func validateArg(_ args:[String]) -> [String]{
        normalizedArgs=args
        for (index, arg) in args.enumerated(){
            //Remove all the whitespace in the string array
            if arg==" "{
                normalizedArgs.remove(at: index)
                continue
            }
            
            //Check current input to see it is number or operator to handle appropriately
            if let num=Utility.isNumber(arg){
                validateNum(num,index)
            }else if let op=Utility.isOperator(arg){
                validateOp(op, index)
            }else{
                Utility.exitWithError("Invalid input. Input can only contains numbers, operators and whitespaces!")
            }
        }
        //Handle the case user input more than a number but without operator
        if !isContainedOp && args.count>1{
            Utility.exitWithError("Invalid input. Operation must contain operator!")
        }
        return normalizedArgs
    }
    
    //Validate number
    func validateNum(_ number:Int, _ index:Int){
        //Replace the current number in the array with the negative one
        normalizedArgs[index] = String(number*isNegative)
        //Handle the case negative number appear in a long operation with multi operators
        if opVisited{
            opVisited=false
        }
    }
    
    //Validate operator
    func validateOp(_ op:Character, _ index:Int){
        //Change the state of the flag to mark the operation does contain operator
        isContainedOp=true
        
        //Handle the case of negative number
        if opVisited{
            if op=="-"{
                isNegative = -1
                normalizedArgs.remove(at: index)
            }else if op == "+"{
                normalizedArgs.remove(at: index)
            }else{
                Utility.exitWithError("Invalid input. You may missing the number or inputting redundant operator.")
            }
        }
        opVisited=true
    }
}
