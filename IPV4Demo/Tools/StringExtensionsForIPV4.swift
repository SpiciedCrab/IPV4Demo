//
//  StringExtensionsForIPV4.swift
//  IPV4Demo
//
//  Created by Harly on 2018/3/28.
//  Copyright © 2018年 Harly. All rights reserved.
//

import Foundation

let dot = "."
let iPV4Period = 4

extension String
{
    
    /// Split IP string into 4 parts using '.'
    ///
    /// - Returns: parts in arrays
    /// - Throws: Invalid string count
    func splitTo4Parts() throws -> [String]
    {
        let periods = components(separatedBy: dot)
        guard periods.count == 4 else { throw DemoError.invalidStringCount }
        
        return periods
    }
    
    /// Convert string into Int32
    ///
    /// - Returns: Int32 value
    /// - Throws: Invalid string type
    func int() throws -> Int32
    {
        guard let realInt = Int32(self) else
        {
            throw DemoError.invalidType(errorStr: self)
        }
        return realInt
    }
    
    /// Trim string
    ///
    /// - Returns: string without whitespaces
    func trimingStartEnd() -> String
    {
        return trimmingCharacters(in: .whitespaces)
    }
    
    
    /// Final caculate
    ///
    /// - Returns: caculate results
    /// - Throws: all erros
    func caculate() throws -> Int
    {
        var sum: Int = 0
        
        for (index , part) in try splitTo4Parts().enumerated()
        {
            let validateInt32 = try part.trimingStartEnd().int().validInt32()
            let plusResult = validateInt32.plusSingle(step: Int32(iPV4Period - (index + 1)) )
            
            sum += Int(plusResult)
        }
        
        return sum
        
    }
}

extension Int32
{
    /// Valid int of IP : 0 - 256
    ///
    /// - Returns: valid int
    /// - Throws: Invalid int error
    func validInt32() throws -> Int32
    {
        guard 0 <= self && self <= 256 else { throw DemoError.invalidInt(errorInt: self) }
        return self
    }
    
    /// Caculate int
    ///
    /// - Parameter step: step
    /// - Returns: result
    func plusSingle(step : Int32) -> Double
    {
        return Double(self) * (pow(Double(256),Double(step)))
    }
}
