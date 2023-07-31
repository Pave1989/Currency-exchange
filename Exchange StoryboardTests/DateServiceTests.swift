//
//  DateServiceTests.swift
//  Exchange StoryboardTests
//
//  Created by Павел Галкин on 23.07.2023.


import XCTest
@testable import Exchange_Storyboard


    class DateServiceTests: XCTestCase {
        
        var dateService: DateService!
        var dateServiceProtocolSpy: DateServiseProtocolSpy!
        
        override func setUpWithError() throws {

            try super.setUpWithError()
            dateServiceProtocolSpy = DateServiseProtocolSpy()
            dateService = DateService()
        }

        override func tearDownWithError() throws {

            dateService = nil
            dateServiceProtocolSpy = nil
            try super.tearDownWithError()
        }
        
        // Проверка на ожидаемое значение
        func testDateServiceReceiveData() throws{
            
            // Given
            let inputDays = 1
            let expectedDataType = [String]()
            // When
            dateService.getData(fetchDays: inputDays) { value in
                switch value {
                case.success(let datesArray):
                    print(datesArray)
                case.failure(let error):
                    print(error)
                }
            }
            // Then
            XCTAssertEqual(dateServiceProtocolSpy.catchedDateArray, expectedDataType)
        }
        
        func testPerformanceExample() throws {
            
            let inputDays = 0
            
            self.measure {
                dateService.getData(fetchDays: inputDays) { value in
                    switch value {
                    case.success(let dataArray):
                        print(dataArray)
                    case.failure(let error):
                        print(error)
                    }
                }
            }
        }
    }

