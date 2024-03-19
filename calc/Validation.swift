//
//  Validation.swift
//  calc
//
//  Created by Duy Thuong on 18/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

class Validation{
    var isNegative=1;
    var opVisited = false
    var normalizedArgs:[String]=[]
    var isContainedOp=false
    
    func validateArg(_ args:[String]) -> [String]{
        normalizedArgs=args
        for (index, arg) in args.enumerated(){
            if arg==" "{
                normalizedArgs.remove(at: index)
                continue
            }
            
            if let num=Utility.isNumber(arg){
                validateNum(num,index)
            }else if let op=Utility.isOperator(arg){
                validateOp(op, index)
            }else{
                Utility.exitWithError("Invalid input. Input can only contains numbers, operators and whitespaces!")
            }
        }
        if !isContainedOp && args.count>1{
            Utility.exitWithError("Invalid input. Operation must contain operator!")
        }
        return normalizedArgs
    }
    
    func validateNum(_ number:Int, _ index:Int){
        normalizedArgs[index] = String(number*isNegative)
        if opVisited{
            opVisited=false
        }
    }
    
    func validateOp(_ op:Character, _ index:Int){
        isContainedOp=true
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
