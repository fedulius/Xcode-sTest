

//
//  TestsUITests.swift
//  TestsUITests
//
//  Created by Fedul on 4/24/20.
//  Copyright © 2020 Fedul. All rights reserved.
//

import XCTest

class TestsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func valid(_ email: String, _ pass: String) {
        let app = XCUIApplication()
        app.launch()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        
        let emailTextField = element.children(matching: .textField).element(boundBy: 0)
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText(email)
        
        let passTextField = element.children(matching: .textField).element(boundBy: 1)
        XCTAssertTrue(passTextField.exists)
        passTextField.tap()
        passTextField.typeText(pass)
        
        element.tap()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Войти"]/*[[".buttons[\"Войти\"].staticTexts[\"Войти\"]",".staticTexts[\"Войти\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let alertDialog = app.alerts["Внимание!"].scrollViews.otherElements.buttons["OK"]
        XCTAssertFalse(alertDialog.exists)
    }
    
    func wrongValue(_ emailStr: String, _ passwordStr: String) {
        let app = XCUIApplication()
        app.launch()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        
        let emailTextField = element.children(matching: .textField).element(boundBy: 0)
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText(emailStr)
        
        let passTextField = element.children(matching: .textField).element(boundBy: 1)
        XCTAssertTrue(passTextField.exists)
        passTextField.tap()
        passTextField.typeText(passwordStr)
        
        element.tap()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Войти"]/*[[".buttons[\"Войти\"].staticTexts[\"Войти\"]",".staticTexts[\"Войти\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let alertDialog = app.alerts["Внимание!"].scrollViews.otherElements.buttons["OK"]
        XCTAssertTrue(alertDialog.exists)
        alertDialog.tap()
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        wrongValue("al,s", "la")
        wrongValue("HEdkm", "laax")
        wrongValue("smx", "ekl")
        valid("fedulov@mail.ru", "Hello1")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
