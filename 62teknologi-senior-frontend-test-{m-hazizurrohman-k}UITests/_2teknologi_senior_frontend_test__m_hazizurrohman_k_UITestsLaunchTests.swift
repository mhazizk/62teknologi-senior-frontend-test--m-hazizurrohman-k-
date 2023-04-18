//
//  _2teknologi_senior_frontend_test__m_hazizurrohman_k_UITestsLaunchTests.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}UITests
//
//  Created by Haziz on 18/04/23.
//

import XCTest

final class _2teknologi_senior_frontend_test__m_hazizurrohman_k_UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
