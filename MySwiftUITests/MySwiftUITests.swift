//
//  MySwiftUITests.swift
//  MySwiftUITests
//
//  Created by lzd_free on 2020/12/23.
//  Copyright © 2020 Dio. All rights reserved.
//

import XCTest

class MySwiftUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//        app.launch()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        let urlStr = "https://192.168.1.14:58800/api/rec/hello"
        DioNetwork.shareManager().doGet(urlStr: urlStr) { (response) in
            print(response)
        } failure: { (error) in
            print(error)
        }
        sleep(20)
    }

    func test002() {
        self.app.launch()
        let infoDictionary = Bundle.main.infoDictionary! //获取Info.plist里的内容
        let appDisplayName = infoDictionary["google"]
        if appDisplayName != nil {
            print("appDisplayName: \(appDisplayName!)")
        }
        
        let bundleID = infoDictionary["CFBundleIdentifier"] //bundle identifier
        if bundleID != nil {
            print("Bundle Identifier: \(bundleID!)")
        }
    }
}
