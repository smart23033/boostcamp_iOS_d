//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Yoo Seok Kim on 2017. 7. 1..
//  Copyright © 2017년 Nois. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Confirm that the Meal initializer returns a Meal object when passed valid parameters.
    func testMealInitializationSucceeds() {
        // Zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)

        // Highest positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    func testMealInitializationFails() {
        self.measure {
            // Negative rating
            let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
            XCTAssertNil(negativeRatingMeal)
            
            // Empty String
            let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
            XCTAssertNil(emptyStringMeal)
            
            // Rating exceeds maximum
            let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
            XCTAssertNil(largeRatingMeal)
        }
    }
}
