import XCTest
@testable import SwiftChallenges

final class SwiftChallengesTests: XCTestCase {
    func testC1() {
        XCTAssertEqual(C1(input: "No duplicates"), true)
        XCTAssertEqual(C1(input: "abcdefghijklmnopqrstuvwxyz"), true)
        XCTAssertEqual(C1(input: "AaBbCc"), true)
        XCTAssertEqual(C1(input: "Hello, world"), false)
    }
    
    func testC2() {
        XCTAssertEqual(C2(input: "rotator"), true)
        XCTAssertEqual(C2(input: "Rats live on no evil star"), true)
        XCTAssertEqual(C2(input: "Never odd or even"), false)
        XCTAssertEqual(C2(input: "Hello, world"), false)
    }
    
    func testC3() {
        XCTAssertEqual(C3("abca", "abca"), true)
        XCTAssertEqual(C3("abc", "cba"), true)
        XCTAssertEqual(C3("a1 b2", "b1 a2"), true)
        XCTAssertEqual(C3("abc", "abca"), false)
        XCTAssertEqual(C3("abc", "Abc"), false)
        XCTAssertEqual(C3("abc", "cbAa"), false)
    }
    
    func testC4() {
        XCTAssertEqual("Hello, world".fuzzyContains("Hello"), true)
        XCTAssertEqual("Hello, world".fuzzyContains("WORLD"), true)
        XCTAssertEqual("Hello, world".fuzzyContains("Goodbye"), false)
    }
    
    func testC5() {
        XCTAssertEqual(C5("The rain in Spain")["a"], 2)
        XCTAssertEqual(C5("Mississippi")["i"], 4)
        XCTAssertEqual(C5("Hacking with Swift")["i"], 3)
    }
    
    func testC6() {
        XCTAssertEqual(C6("wombat"), "wombat")
        XCTAssertEqual(C6("hello"), "helo")
        XCTAssertEqual(C6("Mississippi"), "Misp")
    }
    
    func testC7() {
        XCTAssertEqual(C7("a   b   c"), "a b c")
        XCTAssertEqual(C7("    a"), " a")
        XCTAssertEqual(C7("abc"), "abc")
    }
    
    func testC8() {
        
        XCTAssertTrue(C8("abcde", "eabcd"))
        XCTAssertTrue(C8("abcde", "cdeab"))
        XCTAssertFalse(C8("abcde", "abced"))
        XCTAssertFalse(C8("abc", "a"))
    }
    
    func testC9() {
        XCTAssertTrue(C9("The quick brown fox jumps over the lazy dog"))
        XCTAssertFalse(C9("The quick brown fox jumped over the lazy dog"))
    }
    
    func testC10() {
        XCTAssertTrue(C10("Swift Coding Challenges") == (6, 15))
        XCTAssertTrue(C10("Mississippi") == (4, 7))
    }
    
    
    func testC11() {
        XCTAssertTrue(C11("Clamp", "Cramp"))
        XCTAssertTrue(C11("Clamp", "Crams"))
        XCTAssertTrue(C11("Clamp", "Grams"))
        XCTAssertFalse(C11("Clamp", "Grans"))
        XCTAssertFalse(C11("Clamp", "Clam"))
        XCTAssertFalse(C11("clamp", "maple"))
    }
    
    func testC12() {
        XCTAssertEqual(C12("swift switch swill swim"), "swi")
        XCTAssertEqual(C12("flip flap flop"), "fl")
        XCTAssertEqual(C12("flip"), "")
    }
    
    func testC13() {
        XCTAssertEqual(C13("aabbcc"), "a2b2c2")
        XCTAssertEqual(C13("aaabaaabaaa"), "a3b1a3b1a3")
        XCTAssertEqual(C13("aaAAaa"), "a2A2a2")
        XCTAssertEqual(C13("aaAAab"), "a2A2a1b1")
        XCTAssertEqual(C13("baAAab"), "b1a1A2a1b1")
        XCTAssertEqual(C13(""), "")
    }


    static var allTests = [
        ("testC1", testC1),
    ]
}
