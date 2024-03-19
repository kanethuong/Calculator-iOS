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
    var inputs:[Any]=[]
    var numStack:[Int]=[]
    var opStack:[Character]=[]
    
    
    func mulDivMod(num1:Int, num2:Int, op:Character){
        if op=="x"{
            numStack.append(num1*num2)
        }else if op=="/"{
            numStack.append(num2/num1)
        }else if op=="%"{
            numStack.append(num2%num1)
        }
    }
    
    func addMin(num1:Int, num2:Int, op:Character){
        if op=="+"{
            numStack.append(num1+num2)
        }else if op=="-"{
            numStack.append(num2-num1)
        }
    }
    
    func calculate(args: [Any]) -> String {
        // Todo: Calculate Result from the arguments. Replace dummyResult with your actual result;
        inputs=args
        
        var isOperated=false
        for input in inputs{
            if let num=input as? Int{
                isOperated ? mulDivMod(num1: numStack.removeLast(), num2: num, op: opStack.removeLast()) :
                numStack.append(num)
            }else if let op=input as? Character{
                self.opStack.append(op)
                isOperated=(op=="+" || op=="-") ? false : true
            }
        }
        while(!opStack.isEmpty){
            let num1=numStack.removeLast()
            let num2=numStack.removeLast()
            addMin(num1: num1, num2: num2, op: opStack.removeLast())
        }
        return String(numStack.removeLast())
    }
}
