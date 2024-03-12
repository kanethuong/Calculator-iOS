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
    var opStack:[String]=[]
    
    /// Perform Addition
    ///
    /// - Author: Jacktator
    /// - Parameters:
    ///   - no1: First number
    ///   - no2: Second number
    /// - Returns: The addition result
    ///
    /// - Warning: The result may yield Int overflow.
    /// - SeeAlso: https://developer.apple.com/documentation/swift/int/2884663-addingreportingoverflow
    func mulDivMod(num1:Int, num2:Int, op:String){
        if op=="x"{
            numStack.append(num1*num2)
        }else if op=="/"{
            numStack.append(num1/num2)
        }else if op=="%"{
            numStack.append(num1%num2)
        }
    }
    
    func addMin(num1:Int, num2:Int, op:String){
        if op=="+"{
            numStack.append(num1+num2)
        }else if op=="-"{
            
            numStack.append(num1-num2)
        }
    }
    
    func inputReader(){
        var isOperated=false
        for input in inputs{
            if let op = input as? String{
                opStack.append(op)
                isOperated=(op=="+" || op=="-") ? false : true
            }else if let num=input as? Int{
                isOperated ? mulDivMod(num1: numStack.removeLast(), num2: num, op: opStack.removeLast()) :
                numStack.append(num)
            }
        }
        addMin(num1: <#T##Int#>, num2: <#T##Int#>, op: <#T##String#>)
        
    }
    
    func calculate(args: [String]) -> String {
        // Todo: Calculate Result from the arguments. Replace dummyResult with your actual result;
        
        
//        let result = String(dummyResult);
//        return(result)
    }
}
