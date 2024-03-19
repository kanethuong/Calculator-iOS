//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    /// For multi-step calculation, it's helpful to persist existing result
    var currentResult = 0;
    var inputs:[String]=[]
    var numStack:[Int]=[]
    var opStack:[Character]=[]
    
    
    func mulDivMod(num1:Int, num2:Int, op:Character){
        if op=="x"{
            numStack.append(num1*num2)
        }else if op=="/"{
            numStack.append(num1/num2)
        }else if op=="%"{
            numStack.append(num1%num2)
        }
    }
    
    func addMin(num1:Int, num2:Int, op:Character){
        if op=="+"{
            numStack.insert(num1+num2, at: 0)
        }else if op=="-"{
            numStack.insert(num1-num2, at: 0)
        }
    }
    
    func calculate(args: [String]) -> String {
        // Todo: Calculate Result from the arguments. Replace dummyResult with your actual result;
        inputs=args
        
        var isOperated=false
        for input in inputs{
            if let num=Utility.isNumber(input){
                isOperated ? mulDivMod(num1: numStack.removeLast(), num2: num, op: opStack.removeLast()) :
                numStack.append(num)
            }else if let op=Utility.isOperator(input){
                self.opStack.append(op)
                isOperated=(op=="+" || op=="-") ? false : true
            }
        }
        while(!opStack.isEmpty){
            let num1=numStack.removeFirst()
            let num2=numStack.removeFirst()
            addMin(num1: num1, num2: num2, op: opStack.removeFirst())
        }
        return String(numStack.removeLast())
    }
}
