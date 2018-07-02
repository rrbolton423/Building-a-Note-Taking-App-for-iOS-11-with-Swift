//: Playground - noun: a place where people can play

import UIKit

// standard variable
var str1:String = "Example"
str1.replacingOccurrences(of: "Ex", with: "S")

// optional (?) variable
var str2:String? = nil
str2?.replacingOccurrences(of: "Ex", with: "S") // standard unwrap
//str2!.replacingOccurrences(of: "Ex", with: "S") // force unwrap

// implicitly unwrapped optional (!) variable
var str3:String! = "Example"
str3.replacingOccurrences(of: "Ex", with: "S")
