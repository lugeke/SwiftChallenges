import XCTest
@testable import SwiftChallenges
import GameKit
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
    
    func testC36() {
        let url = FileManager.default.homeDirectoryForCurrentUser
            .appendingPathComponent("Downloads")
            .appendingPathComponent("2sum.txt")
        
        if let sr = StreamReader(path: url.path, delimiter: "\n") {
            defer {
                sr.close()
            }
            for line in sr {
                print(line)
            }
        }
    }
    
    
    func testC37() {
        XCTAssertEqual([5, 15, 55, 515].c37Count(of: "5"), 6)
        XCTAssertEqual([5, 15, 55, 515].c37Count(of: "1"), 2)
        XCTAssertEqual([55555].c37Count(of: "5"), 5)
        XCTAssertEqual([55555].c37Count(of: "1"), 0)
    }
    
    func testC38() {
        XCTAssertEqual([1, 2, 3, 4].smallest(3), [1, 2, 3])
        XCTAssertEqual(["q", "f", "k"].smallest(10), ["f", "k", "q"])
        XCTAssertEqual([256, 16].smallest(3), [16, 256])
        XCTAssertEqual([String]().smallest(3), [])
    }
    
    func testC39() {
        XCTAssertEqual(["a", "abc", "ab"].sortByLength(), ["abc", "ab", "a"])
        XCTAssertEqual(["paul", "taylor", "adele"].sortByLength(), ["taylor", "adele", "paul"])
        XCTAssertEqual([String]().sortByLength(), [])
    }
    
    func testC40() {
        var testArray = Array(1...100)
        testArray.remove(at: 25)
        testArray.remove(at: 20)
        testArray.remove(at: 6)
        XCTAssertEqual(Set(c40(testArray)), [7, 21, 26])
    }
    
    func testFindNthSmallest() {
        var ary = Array(1...1000)
        ary.shuffle()
        for i in 1...1000 {
            XCTAssertEqual(ary.findNSmallest(i), i)
        }
    }
    
    func testC41() {
        XCTAssertEqual(c41([1,2,3]), 2)
        XCTAssertEqual(c41([1,2,9]), 2)
        XCTAssertEqual(c41([1,3,5,7,9]), 5)
        XCTAssertEqual(c41([1,2,3,4]), 2.5)
        XCTAssertEqual(c41([] as [Int]), nil)
    }
    
    func testC42() {
        XCTAssertEqual([1,2,3].firstIndexC42(of: 1), 0)
        XCTAssertEqual([1,2,3].firstIndexC42(of: 2), 1)
        XCTAssertEqual([1,2,3].firstIndexC42(of: 3), 2)
        XCTAssertEqual([1,2,4].firstIndexC42(of: 3), nil)
    }
    
    
    func testC43() {

        XCTAssertEqual(c43(), "abcdefghijklmnopqrstuvwxyz".map { String.init($0) }.joined(separator: " "))
    }
    
    func testC51() {
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        let list = LinkList(alphabet).reversed()
        
        var result = ""
        list.traverse { result += "\($0)" }
        XCTAssertEqual(result, String(alphabet.reversed()))
    }
    
    func testC44() {
        XCTAssertEqual(([1,2,3,4,5] as LinkList).middlePoint(), 3)
        XCTAssertEqual(([1,2,3,4] as LinkList).middlePoint(), 2)
        XCTAssertEqual(([] as LinkList<Int>).middlePoint(), nil)
        XCTAssertEqual(([1] as LinkList<Int>).middlePoint(), 1)
        XCTAssertEqual((LinkList("abcdefghijklmnopqrstuvwxyz")).middlePoint(), "m")
    }
    
    func testBST() {
        var bst: BinarySearchTree<Int> = nil
        bst.insert(5)
        bst.insert(1)
        bst.insert(2)
        
        bst.inorder {
            print($0)
        }
        
        var bst1 = bst
        bst1.insert(6)
        
        print(bst.elements)
        print(bst1.elements)
        
    }
    
    func testC47() {
        XCTAssertEqual([1, 2, 3].minC47(), 1)
        XCTAssertEqual(["q", "f", "k"].minC47(), "f")
        XCTAssertEqual([4096, 256, 16].minC47(), 16)
        XCTAssertNil([String]().minC47())
    }
    
    func testC54() {
        var bst: BinarySearchTree = [2, 1, 3]
        XCTAssertTrue(bst.isBalanced)
        bst = [5, 1, 7, 6, 2, 1, 9]
        XCTAssertTrue(bst.isBalanced)
        bst = [5, 1, 7, 6, 2, 1, 9, 1]
        XCTAssertTrue(bst.isBalanced)
        bst = [5, 1, 7, 6, 2, 1, 9, 1, 3]
        XCTAssertFalse(bst.isBalanced)
        bst = [50, 25, 100, 26, 101, 24, 99]
        XCTAssertTrue(bst.isBalanced)
        var bst1: BinarySearchTree  = ["k", "t", "d", "a", "z", "m", "f"]
        XCTAssertTrue(bst1.isBalanced)
        bst = [1]
        XCTAssertTrue(bst.isBalanced)
      

        let bst2: BinarySearchTree<Character> = []
        XCTAssertTrue(bst2.isBalanced)
        
        bst = [1, 2, 3, 4, 5]
        XCTAssertFalse(bst.isBalanced)
        bst = [10, 5, 4, 3, 2, 1, 11, 12, 13, 14, 15]
        XCTAssertFalse(bst.isBalanced)
        bst1 = ["f", "d", "c", "e", "a", "b"]
        XCTAssertFalse(bst.isBalanced)
    }
    
    func testC49() {
        XCTAssertEqual(c49(1, 2, 2, 3, 3, 4), 5)
        XCTAssertEqual(c49(5, 5, 5, 12, 12), 12)
        XCTAssertEqual(c49(1, 1, 2, 2, 3, 3, 4, 4), 10)
    }
    
    func testC50() {
        XCTAssertEqual(c50([0, 1, 1, -1, 2, 3, 1]), 4...6)
        XCTAssertEqual(c50([10, 20, 30, -10, -20, 10, 20]), 0...2)
        XCTAssertEqual(c50([1, -1, 2, -1]), 2...2)
        XCTAssertEqual(c50([2, 0, 2, 0, 2]), 0...0)
        XCTAssertNil(c50([Int]()))
    }
    
    func testC52() {
        XCTAssertEqual([1, 2, 3].sum(), 6)
        XCTAssertEqual([1.0, 2.0, 3.0].sum(), 6.0)
        XCTAssertEqual(([1.0, 2.0, 3.0] as [Float]).sum(), 6.0)
    }
    
    
    func testC55() {
        
        XCTAssertEqual([12, 5, 4, 9, 3, 2, 1].bubbleSorted(), [1, 2, 3, 4, 5, 9, 12])
        XCTAssertEqual(["f", "a", "b"].bubbleSorted(), ["a", "b", "f"])
        XCTAssertEqual([String]().bubbleSorted(), [])
    }
    
    func testC56() {
        
        XCTAssertEqual([12, 5, 4, 9, 3, 2, 1].insertionSorted(), [1, 2, 3, 4, 5, 9, 12])
        XCTAssertEqual(["f", "a", "b"].insertionSorted(), ["a", "b", "f"])
        XCTAssertEqual([String]().insertionSorted(), [])
    }
    
    func test58() {
        XCTAssertTrue(c58("()"))
        XCTAssertTrue(c58("([])"))
        XCTAssertTrue(c58("(([])(<{}>))"))
        XCTAssertTrue(c58("([]{}<[{}]>)"))
        XCTAssertTrue(c58(""))
        
        XCTAssertFalse(c58("}{"))
        XCTAssertFalse(c58("([)]"))
        XCTAssertFalse(c58("([)"))
        XCTAssertFalse(c58("(["))
        XCTAssertFalse(c58("[<<<{}>>]"))
        XCTAssertFalse(c58("hello"))
    }
    
    func testC60() {
        XCTAssertTrue(c60([["X", "", "O"], ["", "X", "O"], ["", "", "X"]]))
        XCTAssertTrue(c60([["X", "", "O"], ["X", "", "O"], ["X", "", ""]]))
        XCTAssertTrue(c60([["", "X", ""], ["O", "X", ""], ["O", "X", ""]]))
        
        XCTAssertFalse(c60([["", "X", ""], ["O", "X", ""], ["O", "", "X"]]))
        XCTAssertFalse(c60([["", "", ""], ["", "", ""], ["", "", ""]]))
    }
    
    func testC61() {
        XCTAssertEqual(c61(upTo: 10), [2,3,5,7])
        XCTAssertEqual(c61(upTo: 11), [2,3,5,7])
        XCTAssertEqual(c61(upTo: 12), [2,3,5,7,11])
        print(c61(upTo: 100))
    }
    
    func testC63() {
        let random = GKMersenneTwisterRandomSource(seed: 1)
        let grid = (1...10).map{ _ in (1...10).map { _ in
            Int(random.nextInt(upperBound: 2))
        }}
        
        let answer = [[5, 5, 5, 5, 5, 1, 5, 5, 1, 1],
                      [5, 1, 1, 5, 5, 5, 5, 1, 0, 0],
                      [5, 1, 5, 5, 5, 5, 5, 5, 1, 1],
                      [1, 0, 1, 5, 5, 1, 1, 5, 5, 5],
                      [1, 0, 1, 5, 1, 1, 1, 1, 1, 5],
                      [1, 0, 1, 1, 5, 5, 5, 5, 5, 5],
                      [0, 0, 0, 0, 1, 1, 1, 5, 1, 1],
                      [1, 1, 1, 0, 0, 1, 1, 1, 1, 1],
                      [1, 1, 0, 1, 1, 1, 1, 0, 0, 0],
                      [0, 1, 1, 0, 0, 1, 0, 1, 1, 1]]
        let g = c63(fill: 5, in: grid, at: (0, 2))
        XCTAssertEqual(g, answer)
    }
    
    func testC64() {
        print(c64(n: 4))
        XCTAssertEqual(c64(n: 8).count, 92)
        XCTAssertEqual(c64(n: 10).count, 724)
    }
    

    static var allTests = [
        ("testC1", testC1),
    ]
}
