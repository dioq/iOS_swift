//
//  MySwiftTests.swift
//  MySwiftTests
//
//  Created by lzd_free on 2020/12/22.
//  Copyright © 2020 Dio. All rights reserved.
//

import XCTest

class MySwiftTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //        default_param()
        test_str()
    }
    
    public func test_str(){
        let str = "aaaa"
        guard let data =  str.data(using: String.Encoding.utf8) else { return }
        if let str2 = String.init(data: data, encoding: .utf8) {
            print("result : \(str2)")
        }
//        if let data =  Data.init(base64Encoded: str) {
//
//            if let str2 = String.init(data: data, encoding: .utf8) {
//                print("result : \(str2)")
//            }
//
//        }
    }
    
    func default_param(mimeType:String = "image/jpeg") {
        print(mimeType)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
