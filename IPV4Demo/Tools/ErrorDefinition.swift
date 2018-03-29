//
//  ErrorDefinition.swift
//  IPV4Demo
//
//  Created by Harly on 2018/3/28.
//  Copyright © 2018年 Harly. All rights reserved.
//

import Foundation

typealias ErrorTurpleType = (code : String , message : String)

// Error definitions
enum DemoError: Error {

    case invalidStringCount
    case invalidType(errorStr : String)
    case invalidInt(errorInt : Int32)
    
    func errorDescription() -> String
    {
        switch self {
        case .invalidStringCount:
            return "IP地址格式都不对，说好的x.x.x.x呢"
        case .invalidType(let error):
            return "\(error)  -> 这个没法转成Int32呀"
        case .invalidInt(let error):
            return "\(error)  -> 这个数字不在0-256之间呀"
        }
    }
}
