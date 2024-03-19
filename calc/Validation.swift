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
    
    static func validateArg(_ args:[String]) -> [Any]{
//        for (index, char) in args.enumerated(){
//            if let num=char as? Int{
//                validateNum(num,index)
//            }else if let op=char as? Character{
//                validateOp(op, index)
//            }
//        }
//        
//        if let op=args[0] as? Character{
//            if op=="-"{
//                isNegative = -1
//            }
//        }
        var newArgs=args
        for (index,arg) in args.enumerated(){
            if arg==" "{
                newArgs.remove(at: index)
            }
        }
        return newArgs
    }
    
    func validateNum(_ number:Int, _ index:Int){}
    func validateOp(_ op:Character, _ index:Int){}
}
