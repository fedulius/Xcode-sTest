//
//  TestsTests.swift
//  TestsTests
//
//  Created by Fedul on 4/24/20.
//  Copyright © 2020 Fedul. All rights reserved.
//

import XCTest
@testable import Tests

class TestsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        func test(_ email: String, _ pass: String) {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            let passReg = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[A-Za-z0-9]{3,}"
            let passPred = NSPredicate(format:"SELF MATCHES %@", passReg)
            
            XCTAssert(emailPred.evaluate(with: email) && passPred.evaluate(with: pass))
        }
        
        test("Nj@mail.ri", "amwkmx2K")
        test("23m1km@yandex.ru", "HelloWorld2")
        test("em@mk.com", "9lskm1w4e0H")
        test("1234@google.com", "Mm2")
        test("JKLP@yahoo.ru", "123JJSs123")
        test("onetwoTHREE@gmail.com", "LAlaLand1")
        test("hello@bd.ru", "FirstDrive1")
        test("batman@launch.ua", "ImScatMAAAAN0")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
