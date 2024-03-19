//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    var currentResult = 0;
    var inputs:[String]=[]
    var numStack:[Int]=[]
    var opStack:[Character]=[]
    
    //Handle multiply, division and modulor operations
    func mulDivMod(num1:Int, num2:Int, op:Character){
        if op=="x"{
            numStack.append(num1*num2)
        }else if op=="/"{
            if(num2==0){
                Utility.exitWithError("Division by zero")
            }
            numStack.append(num1/num2)
        }else if op=="%"{
            if(num2==0){
                Utility.exitWithError("Division by zero")
            }
            numStack.append(num1%num2)
        }
    }
    
    //Handle add and minus operations
    func addMin(num1:Int, num2:Int, op:Character){
        if op=="+"{
            numStack.insert(num1+num2, at: 0)
        }else if op=="-"{
            numStack.insert(num1-num2, at: 0)
        }
    }
    
    //Main function to calculate
    func calculate(args: [String]) -> String {
        inputs=args
        
        //Use as a flag to mark whenever iterating through x,/ or % operator
        var isOperated=false
        for input in inputs{
            //Check current input to see it is number or operator
            if let num=Utility.isNumber(input){
                //If the previous operator is x,/,% then implement the function to calculate them first
                //Else append the current number to the stack to calculate later
                isOperated ? mulDivMod(num1: numStack.removeLast(), num2: num, op: opStack.removeLast()) :
                numStack.append(num)
            }else if let op=Utility.isOperator(input){
                //Append the operator to it's stack for later calculating
                //And change the state of the flag variable
                self.opStack.append(op)
                isOperated=(op=="+" || op=="-") ? false : true
            }
        }
        //Calculate the +,- operation
        while(!opStack.isEmpty){
            let num1=numStack.removeFirst()
            let num2=numStack.removeFirst()
            addMin(num1: num1, num2: num2, op: opStack.removeFirst())
        }
        //The last number left in the number stack is the result
        return String(numStack.removeLast())
    }
}
