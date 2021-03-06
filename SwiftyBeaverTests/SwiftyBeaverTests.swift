//
//  SwiftyBeaverTests.swift
//  SwiftyBeaverTests
//
//  Created by Sebastian Kreutzberger (Twitter @skreutzb) on 28.11.15.
//  Copyright © 2015 Sebastian Kreutzberger
//  Some rights reserved: http://opensource.org/licenses/MIT
//

import XCTest
@testable import SwiftyBeaver

class SwiftyBeaverTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFormattedDate() {
        // empty format
        var str = SwiftyBeaver.formattedDate("")
        XCTAssertEqual(str, "")
        // no time format
        str = SwiftyBeaver.formattedDate("--")
        XCTAssertGreaterThanOrEqual(str, "--")
        // year
        str = SwiftyBeaver.formattedDate("yyyy")
        XCTAssertGreaterThanOrEqual(Int(str)!, 2015)
    }
    
    func testQuickIntegration() {
        // quick test if logging output works
        // to console and file
        let log = SwiftyBeaver.self
    
        log.Options.Console.active = true
        log.Options.File.active = true
        log.Options.File.minLevel = log.Level.Verbose
        log.Options.File.logFileURL = NSURL(string: "file:///tmp/testSwiftyBeaver.log")!
        
        log.verbose("not so important")
        log.debug("something to debug")
        log.info("a nice information")
        log.warning("oh no, that won’t be good")
        log.error("ouch, an error did occur!")
    }
    
}
