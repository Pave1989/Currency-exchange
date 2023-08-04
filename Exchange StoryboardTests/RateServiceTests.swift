//
//  RateServiceTests.swift
//  Exchange StoryboardTests
//
//  Created by Павел Галкин on 23.07.2023.
//

import XCTest
@testable import Exchange_Storyboard


final class RateServiceTests: XCTestCase {
    
    var rateService: RateService!
    var rateServiceProtocolSpy: RateServiseProtocolSpy!
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        rateServiceProtocolSpy = RateServiseProtocolSpy()
        rateService = RateService()
    }
    
    override func tearDownWithError() throws {
        
        rateService = nil
        rateServiceProtocolSpy = nil
        try super.tearDownWithError()
    }
    
    // Проверка на ожидаемое значение
    func testRateServiceReceiveData() throws {
        
        // Given
        let inputDate = "2000-10-20"
        let expectedDataType = ""
        // When
        rateService.getUSD(date: inputDate) { value in
            switch value {
            case.success(let usd):
                print(usd)
            case.failure(let error):
                print(error)
            }
        }
        rateService.getEUR(date: inputDate) { value in
            switch value {
            case.success(let eur):
                print(eur)
            case.failure(let error):
                print(error)
            }
        }
        // Then
        XCTAssertNotEqual(rateServiceProtocolSpy.catchedEUR, expectedDataType)
        XCTAssertNotEqual(rateServiceProtocolSpy.catchedUSD, expectedDataType)
    }
    // Проверка реального HTTP запроса на таймауту
    func testExpectationRequestEUR() {
        // Given
        let didReceiveResponce = expectation(description: #function)
        let sut = RateService()
        let inputDate = "2000-10-20"
        var result: Result<MoneyModel, Error>?
        // When
        sut.getEUR(date: inputDate) {
            result = $0
            didReceiveResponce.fulfill()
        }
        wait(for: [didReceiveResponce], timeout: 5) // ожидание 5секунд если больше то провал
        //Then
        switch result {
        case let .success(data):
            print(data)
            XCTAssertNotNil(data)
        case .failure:
            XCTFail("Test failed")
        case .none:
            XCTFail("Test failed")
        }
    }
    // Проверка реального HTTP запроса на таймауту
    func testExpectationRequestUSD() {
        // Given
        let didReceiveResponce = expectation(description: #function)
        let sut = RateService()
        let inputDate = "2000-10-20"
        var result: Result<MoneyModel, Error>?
        // When
        sut.getUSD(date: inputDate) {
            result = $0
            didReceiveResponce.fulfill()
        }
        wait(for: [didReceiveResponce], timeout: 5) // ожидание 5секунд если больше то провал
        //Then
        switch result {
        case let .success(data):
            print(data)
            XCTAssertNotNil(data)
        case .failure:
            XCTFail("Test failed")
        case .none:
            XCTFail("Test failed")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
