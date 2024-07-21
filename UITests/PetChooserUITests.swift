//
//  Tractive_Demo_AppUITests.swift
//  Tractive Demo AppUITests
//
//  Created by Ramy Rizkalla on 18/07/2024.
//

import XCTest
@testable import Tractive_Demo_App

final class PetChooserUITests: XCTestCase {
  enum AccessibilityIdentifier: String {
    case titleLabel = "petChooser.titleLabel"
    case subTitleLabel = "petChooser.subTitleLabel"
  }

  let app = XCUIApplication()

  override func setUpWithError() throws {
    app.launch()
    continueAfterFailure = false
  }

  func testExample() throws {
    XCTAssertTrue(app.staticTexts[AccessibilityIdentifier.titleLabel.rawValue].exists)
    XCTAssertTrue(app.staticTexts[AccessibilityIdentifier.subTitleLabel.rawValue].exists)
  }
}
