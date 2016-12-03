//
//  TartuWeatherTVUITests.swift
//  TartuWeatherTVUITests
//
//  Created by Kristaps Grinbergs on 03/12/2016.
//  Copyright © 2016 Kristaps Grinbergs. All rights reserved.
//

import XCTest

class TartuWeatherTVUITests: XCTestCase {
        
  override func setUp() {
    super.setUp()
    
    continueAfterFailure = false
  
    XCUIApplication().launch()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testLaunch() {
    
    sleep(5)
    
    let app = XCUIApplication()
    
    print(app.staticTexts)
    
    let tempLabel = app.staticTexts["Temperature"]
    let windLabel = app.staticTexts["Wind"]
    let measuredTimeLabel = app.staticTexts["Last meassured time"]
    
    print(tempLabel.label)
    
    XCTAssertNotNil(tempLabel.label)
    XCTAssert(tempLabel.label != "")

    XCTAssertNotNil(windLabel.label)
    XCTAssert(windLabel.label != "")
    
    XCTAssertNotNil(measuredTimeLabel.label)
    XCTAssert(measuredTimeLabel.label != "")
    
    let image = app.images["Current image"]
    XCTAssert(image.exists)
  }
    
}
