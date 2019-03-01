//
//  RegisterMVPTests.swift
//  RegisterMVPTests
//
//  Created by Nicolas on 2/5/19.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import XCTest
@testable import RegisterMVP

class RegisterMVPTests: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testRegister() {
        let expec = expectation(description: "email vacio")
        let registrationPresenter = RegisterPresenter(registerDelegate: MockUIViewController1(expectation: expec))
        registrationPresenter.registerNewUser(username: "", password: "2133")
         wait(for: [expec], timeout: 3)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

class MockUIViewController1: registerDelegate{
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func registerSuccess() {  }
    
    func registerFailed(message: String) {
        print(message)
        XCTAssertEqual(message, "email vacio")
        expec.fulfill()
    }
}


