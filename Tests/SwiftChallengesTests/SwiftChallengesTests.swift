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
    
    func testC14() {
        XCTAssertEqual(C14("a"), ["a"])
        XCTAssertEqual(Set(C14("ab")), ["ab", "ba"])
        XCTAssertEqual(Set(C14("abc")), ["abc", "acb", "bac", "bca", "cab", "cba"])
        XCTAssertEqual(C14("wombat").count, 720)
    }
    
    
    func testC15() {
        XCTAssertEqual(c15("Swift Coding Challenges"), "tfiwS gnidoC segnellahC")
        XCTAssertEqual(c15("The quick brown fox"), "ehT kciuq nworb xof")
    }
    
    
    func testC18() {
        XCTAssertEqual(c18(base: 4, pow: 3), 64)
        XCTAssertEqual(c18(base: 2, pow: 8), 256)
    }
    
    func testC20() {
        XCTAssertTrue(c20(11))
        XCTAssertTrue(c20(13))
        XCTAssertTrue(c20(16777259))
        
        XCTAssertFalse(c20(4))
        XCTAssertFalse(c20(9))
        
        XCTAssertFalse(c20(1))
        
        XCTAssertTrue(c20(3))
        XCTAssertTrue(c20(2))
    }
    
    func testC21() {
        XCTAssertTrue(c21(12) == (17, 10))
        XCTAssertTrue(c21(28) == (35, 26))
        XCTAssertTrue(c21(1) == (2, nil))
        XCTAssertTrue(c21(3) == (5, nil))
    }
    
    func testC22() {
        XCTAssertEqual(c22(32), 4)
        XCTAssertEqual(c22(4), 32)
        XCTAssertEqual(c22(41), 148)
        XCTAssertEqual(c22(148), 41)
    }
    
    func testC23() {
        XCTAssertTrue(c23("01010101"))
        XCTAssertTrue(c23("123456789"))
        XCTAssertTrue(c23("9223372036854775808"))
        XCTAssertFalse(c23("1.01"))
        XCTAssertFalse(c23("㊈"))
    }
    
    func testC24() {
        XCTAssertEqual(c24("a1b2c3"), 6)
        XCTAssertEqual(c24("a10b20c30"), 60)
        XCTAssertEqual(c24("h8ers"), 8)
        XCTAssertEqual(c24("hello"), nil)
    }
    
    func testC25() {
        
        (1...5000).forEach { i in
            XCTAssertEqual(c25_1(i), Int(sqrt(Double(i))))
        }
        XCTAssertEqual(c25_1(16777216), 4096)
    }
    
    func testC26() {
        XCTAssertEqual(c26(subtract: 5, from: 9), 4)
        XCTAssertEqual(c26(subtract: 9, from: 5), -4)
        XCTAssertEqual(c26(subtract: 10, from: 30), 20)
    }
    
    func testC27() {
        let url = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .appendingPathComponent("input.txt")
        let x = c27(url: url, last: 5)
     
        XCTAssertEqual(x, ["Twelfth Night", "Othello", "Macbeth", "King Lear", "Julius Caesar"])
    }
    
    func testC28() throws{
        
        var url = FileManager.default.homeDirectoryForCurrentUser
        url.appendPathComponent("log.txt", isDirectory: false)
  
        print(url.path)
        try c28(path: url.path, message: "hello")
    }
    
    func testC31() {
        let source = FileManager.default.homeDirectoryForCurrentUser
        print(c31(source: source.appendingPathComponent("temp").path,
            destination: source.appendingPathComponent("temp1").path))
    }
    
    func testC33() {
        let source = FileManager.default.homeDirectoryForCurrentUser
        print(c33(path: source.appendingPathComponent("temp1").path))
    }


    static var allTests = [
        ("testC1", testC1),
    ]
}
