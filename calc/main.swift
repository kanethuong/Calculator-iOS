//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

//Validate the whole arguments and return the normalised arguments
let val=Validation()
var normalizedArgs = val.validateArg(args)

// Initialize a Calculator object
let calculator = Calculator();

// Calculate the result
let result = calculator.calculate(args: normalizedArgs);

print(result)
