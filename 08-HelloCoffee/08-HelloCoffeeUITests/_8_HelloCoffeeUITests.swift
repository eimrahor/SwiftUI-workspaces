//
//  _8_HelloCoffeeUITests.swift
//  08-HelloCoffeeUITests
//
//  Created by Emirhan İmrahor on 6.02.2025.
//

import XCTest

final class when_adding_a_new_coffee_order: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV":"TEST"]
        app.launch()
        
        app.buttons["addNewOrderButton"].tap()
        let nameTextField = app.textFields["name"]
        let coffeeNameTextField = app.textFields["coffeeName"]
        let priceTextField = app.textFields["price"]
        let placeOrderButton = app.buttons["placeOrderButton"]
        
        nameTextField.tap()
        nameTextField.typeText("John")
        
        coffeeNameTextField.tap()
        coffeeNameTextField.typeText("Hot Coffee")
        
        priceTextField.tap()
        priceTextField.typeText("3.5")
        
        placeOrderButton.tap()
    }
    
    func test_that_the_order_is_displayed_on_the_list() {
        XCTAssertEqual("John",app.staticTexts["orderNameText"].label)
        XCTAssertEqual("Hot Coffee (Medium)",app.staticTexts["coffeeNameAndSizeText"].label)
        XCTAssertEqual("3.5",app.staticTexts["coffeePriceText"].label)
    }
    
    override func tearDown() {
        Task {
            guard let url = URL(string: "/clear-orders",relativeTo: URL(string: "https://island-bramble.glitch.me")) else {
                return
            }
            
            let (_,_) = try! await URLSession.shared.data(from: url)
        }
    }
}
