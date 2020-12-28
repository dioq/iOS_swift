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
        for _ in 0...9 {
            let uuid0 = UUID()
            let uuid = "\(uuid0)"
            print("uuid : ", uuid)
            let uuid_2 = uuid.replacingOccurrences(of: "-", with: "")
            print("uuid_2 : ", uuid_2," count : ", uuid_2.count)
        }
    }
    
    public func test_json(){
        let tmp =  UUID()
        print(tmp)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
