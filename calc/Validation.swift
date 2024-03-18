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
    
    func validateArg(_ args:[Any]) -> [Any]{
        for (index, char) in args.enumerated(){
            if let num=char as? Int{
                validateNum(num,index)
            }else if let op=char as? Character{
                validateOp(op, index)
            }
        }
        
        if let op=args[0] as? Character{
            if op=="-"{
                isNegative = -1
            }
        }
        for arg in args{
            
        }
    }
    
    func validateNum(_ number:Int, _ index:Int){}
    func validateOp(_ op:Character, _ index:Int){}
}
