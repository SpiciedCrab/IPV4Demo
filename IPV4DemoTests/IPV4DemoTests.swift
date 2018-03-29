//
//  IPV4DemoTests.swift
//  IPV4DemoTests
//
//  Created by Harly on 2018/3/28.
//  Copyright © 2018年 Harly. All rights reserved.
//

import Quick
import Nimble

@testable import IPV4Demo

class IPV4DemoTests: QuickSpec {
    
    override public func spec() {
        describe("String testing") {
            
            context("String spliting", {
                
                let testString = "sss.33.111.1"
                it("【\(testString)】 can be split into 4", closure: {
                    
                    do
                    {
                        expect(try testString.splitTo4Parts()).to(haveCount(4))
                    }
                    catch
                    {
                        print(error)
                    }
                    
                })
                
            })

            context("String trimming", {
                
                let testString = " ss "
                it("【\(testString)】 can be trimed to ss", closure: {
                    
                    expect(testString.trimingStartEnd()).to(equal("ss"))
                })
                
                let anotherTestString = " s s "
                it("【\(anotherTestString)】 can be trimed to ss", closure: {
                    
                    expect(anotherTestString.trimingStartEnd()).to(equal("s s"))
                })
                
            })
            
            context("String To Int32", {
                
                let testString = "2a"
                it("【\(testString)】 cannot convert to Int32", closure: {
                    
                    expect { try testString.int() }.to(throwError())
                })
                
                let anotherTestString = "2"
                it("【\(anotherTestString)】 can be convert to Int32", closure: {
                    
                    do
                    {
                        expect(try anotherTestString.int()).to(equal(2))
                    }
                    catch
                    {
                        print(error)
                    }
                    
                    
                })
                
                let maxTestString = "2147483648"
                it("【\(maxTestString)】 can be convert to Int32 since it's to large", closure: {
                    
                    expect { try maxTestString.int() }.to(throwError())
                })
            })
        }
        
        intTesting()
    }
    
    func intTesting()
    {
        describe("Int testing") {
            
            context("IP int validating", {
                
                let testInt : Int32 = 2
                it("【\(testInt)】 is a validate IP part", closure: {
                    
                    do
                    {
                        expect(try testInt.validInt32()).to(equal(2))
                    }
                    catch
                    {
                        print(error)
                    }
                    
                })
                
                let anotherTestInt : Int32 = 257
                it("【\(anotherTestInt)】 is not a validate IP part", closure: {

                    expect { try anotherTestInt.validInt32() }.to(throwError())

                })
                
            })
        }
    }
    
}
