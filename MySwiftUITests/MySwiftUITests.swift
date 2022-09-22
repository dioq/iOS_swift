//
//  MySwiftUITests.swift
//  MySwiftUITests
//
//  Created by lzd_free on 2020/12/23.
//  Copyright © 2020 Dio. All rights reserved.
//

import XCTest

class MySwiftUITests: XCTestCase {
    
//    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//        app.launch()
    }
    
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
    
    func testExample() throws {
//        let btn:XCUIElement = self.app.buttons["允许访问所有照片"]
//        if(btn.exists) {
//            btn.tap()
//        }
                
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["多图选择HGImage"]/*[[".cells.staticTexts[\"多图选择HGImage\"]",".staticTexts[\"多图选择HGImage\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["HGImage"].buttons["选择"].tap()
        
        let elementsQuery = app.alerts["雨燕项目”想访问您的照片"].scrollViews.otherElements
        elementsQuery.buttons["不允许"].tap()
        
        
        elementsQuery.buttons["允许访问所有照片"].tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 8).otherElements.containing(.image, identifier:"hg_image_not_selected").element.tap()
        app/*@START_MENU_TOKEN@*/.toolbars["Toolbar"]/*[[".toolbars[\"工具栏\"]",".toolbars[\"Toolbar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["完成"].tap()
                
    }
    
    func test001() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Vender"].tap()
        
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["多图选择HGImage"]/*[[".cells.staticTexts[\"多图选择HGImage\"]",".staticTexts[\"多图选择HGImage\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["HGImage"].buttons["选择"].tap()
        
        let elementsQuery = app.alerts["雨燕项目”想访问您的照片"].scrollViews.otherElements
        elementsQuery.buttons["允许访问所有照片"].tap()
        sleep(5)
        app.collectionViews.children(matching: .cell).element(boundBy: 8).otherElements.containing(.image, identifier:"hg_image_not_selected").element.tap()
        app/*@START_MENU_TOKEN@*/.toolbars["Toolbar"]/*[[".toolbars[\"工具栏\"]",".toolbars[\"Toolbar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["完成"].tap()
    }
    
    func test002() throws {
        let app = XCUIApplication()
        let elementsQuery = app.alerts["雨燕项目”想访问您的照片"].scrollViews.otherElements
        
        let btn = elementsQuery.buttons["允许访问所有照片"]
        if btn.exists {
            btn.tap()
        }
        
//        for index in 0...elementsQuery.count {
//            let btn =  elementsQuery.index(ofAccessibilityElement: index)
//            print(btn.description.debugDescription)
//        }
//        for i in Range(0,elementsQuery.count) {
//            for btn in item.buttons {
//
//            }
//        }
    }
    
    func test003() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Vender"].tap()
        
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["多图选择HGImage"]/*[[".cells.staticTexts[\"多图选择HGImage\"]",".staticTexts[\"多图选择HGImage\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["HGImage"].buttons["选择"].tap()
        
        let elementsQuery = app.alerts["雨燕项目”想访问您的照片"].scrollViews.otherElements
        let btn = elementsQuery.buttons["允许访问所有照片"]
        if btn.exists {
            btn.tap()
        }
    }
    
    func testWX() throws {
        let app = XCUIApplication.init(bundleIdentifier: "com.tencent.xin")

        let elementsQuery = app.alerts["雨燕项目”想访问您的照片"].scrollViews.otherElements
        elementsQuery.buttons["不允许"].tap()
    }
}
