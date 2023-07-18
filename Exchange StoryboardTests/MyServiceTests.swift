//
//  MyServiceTests.swift
//  Exchange StoryboardTests
//
//  Created by Павел Галкин on 17.07.2023.
//

import XCTest
// чтобы можно было увидеть объекты из основного таргета
@testable import Exchange_Storyboard

final class DateServiceDelegateSpy {
    
    var catchedDateArray: [String] = []
    var catchedError: Error = "error" as! Error
}
extension DateServiceDelegateSpy: DateTableViewInput {
    
    func showDate(dates: [String]) {
        
        catchedDateArray = dates
    }

    func showError(error: String) {
        
        catchedError = NetworkingError.invalidData
}
    
class DateServiceTests: XCTestCase {
    
    // sut - system under test
    var sut: DateService!
    var dateServiceDelegateSpy: DateServiceDelegateSpy!
    
    override func setUp() {
        super.setUp()
        dateServiceDelegateSpy = DateServiceDelegateSpy()
        sut = DateService()
    }
    
    override func tearDown() {
        dateServiceDelegateSpy = nil
        sut = nil
        super.tearDown()
    }
    
    func testSut() {
        
        // arrange & act
        sut.getData(fetchDays: 3) { value in
            switch value {
            case.success(let dates):
                print(dates)
            case.failure(let error):
                    print(error)
            }
        }
        // assert
        XCTAssertEqual(dateServiceDelegateSpy.catchedDateArray.count, 2)
    }
  }
 }

