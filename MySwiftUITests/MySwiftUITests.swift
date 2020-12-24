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
        app.launch()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testNetwork() throws {
//        app.tabBars["Tab Bar"].buttons["Other"].tap()
        let tabbar = app.tabBars.allElementsBoundByIndex[0]
        let tabbarItems = tabbar.children(matching: XCUIElement.ElementType.button)
        let page3 = tabbarItems.element(boundBy: 3)
        page3.tap()
        
        app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["原生网络请求"]/*[[".cells.staticTexts[\"原生网络请求\"]",".staticTexts[\"原生网络请求\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Get"].tap()
        Thread.sleep(forTimeInterval: 5)
        app.buttons["Post"].tap()
        app.buttons["Form data"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["uploadTask"]/*[[".buttons[\"uploadTask\"].staticTexts[\"uploadTask\"]",".staticTexts[\"uploadTask\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
