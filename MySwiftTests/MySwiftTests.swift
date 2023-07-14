//
//  MySwiftTests.swift
//  MySwiftTests
//
//  Created by zd on 12/7/2023.
//  Copyright © 2023 Dio. All rights reserved.
//

import XCTest


final class MySwiftTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() throws {
        let urlStr = "http://dorachat.com:9091/v1/login"
        var param_dict = Dictionary<String,Any>()
        param_dict["username"] = "dora123"
        param_dict["password"] = "dora123"
        let param = NetworkManager.shareManager().dictToJsonStr(dict: param_dict)
//        NetworkManager.shareManager().doPost(urlStr: urlStr, params: param) { (response) in
//            print(response)
//        } failure: { (error) in
//            print(error)
//        }
        NetworkManager.shareManager().submitFormdata(urlStr: urlStr, params: param) { responseObject in
            print(responseObject)
        } failure: { error in
            print(error)
        }

        Thread.sleep(forTimeInterval: 10)
    }
    
    func testExample() throws {
        let urlStr = "http://dorachat.com:9092"
        var param_dict = Dictionary<String,Any>()
        param_dict["username"] = "dora123"
        param_dict["password"] = "dora123"
        
        let param = NetworkManager.shareManager().dictToJsonStr(dict: param_dict)
        NetworkManager.shareManager().doPost(urlStr: urlStr, params: param) { (response) in
            print(response)
        } failure: { (error) in
            print(error)
        }
        Thread.sleep(forTimeInterval: 10)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
