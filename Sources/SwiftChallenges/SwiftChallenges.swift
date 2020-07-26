import Foundation
import System
import Algorithms

func C1(input: String) -> Bool {
    var set: Set<Character> = []
    for char in input {
        if set.contains(char) { return false}
        else { set.insert(char) }
    }
    return true
}

func C2(input: String) -> Bool {
    //    var i = input.startIndex
    //    var j = input.index(before: input.endIndex)
    //
    //    while i < j {
    //        if input[i].lowercased() != input[j].lowercased() { return false }
    //        input.formIndex(after: &i)
    //        input.formIndex(before: &j)
    //    }
    //
    //    return true
    
    let half = input.count / 2
    
    return zip(input.prefix(half), input.suffix(half).reversed())
        .allSatisfy { $0.lowercased() == $1.lowercased() }
}


func C3(_ s1: String,_ s2: String) -> Bool {
    s1.sorted() == s2.sorted()
}

extension String {
    func fuzzyContains(_ other: String) -> Bool {
        guard !other.isEmpty else { return true }
        
        var str = self[...]
        
        while let firstMatch = str.firstIndex(where: { $0.lowercased() == other.first!.lowercased()}) {
            if str[firstMatch...].prefix(other.count).lowercased() == other.lowercased() { return true }
            str = str.dropFirst()
        }
        
        return false
        
        //        range(of: other, options: .caseInsensitive) != nil
    }
}

func C5(_ str: String) -> [Character: Int] {
    .init(str.map { ($0, 1)}, uniquingKeysWith: + )
}

func C6(_ str: String) -> String {
    var set: Set<Character> = []
    return str.filter {
        if set.contains($0) {
            return false
        } else {
            set.insert($0)
            return true
        }
    }
}


func C7(_ str: String) -> String {
    var previous = Character("a")
    
    return str.filter { current -> Bool in
        defer {
            previous = current
        }
        if current == (" " as Character) && previous == current {
            return false
        } else {
            return true
        }
    }
    
    //    return str.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}


func C8(_ s1: String, _ s2: String) -> Bool {
    guard s1.count == s2.count else {
        return false
    }
    let double = s1 + s1
    
    return double.contains(s2)
}



func C9(_ str: String) -> Bool {
    var dict = [Bool].init(repeating: false, count: 26)
    str.lowercased().forEach {
        if "a" <= $0 && $0 <= "z" {
            dict[Int($0.asciiValue! - ("a" as Character).asciiValue!)] = true
        }
    }
    return dict.allSatisfy{ $0 }
    
    //    let set = Set(str.lowercased())
    //    let letters = set.filter { $0 >= "a" && $0 <= "z" }
    //    return letters.count == 26
}

func C10(_ str: String) -> (Int, Int) {
    let vowels = Set("AEIOU")
    let consonants = Set("BCDFGHJKLMNPQRSTVWXYZ")
    var result = (0, 0)
    for character in str.uppercased() {
        if vowels.contains(character) {
            result.0 += 1
        } else if consonants.contains(character) {
            result.1 += 1
        }
    }
    return result
}

func C11(_ s1: String, _ s2: String) -> Bool {
    guard s1.count == s2.count else {
        return false
    }
    var sum = 0
    for (c1, c2) in zip(s1, s2) {
        if c1 != c2 {
            sum += 1
            if sum > 3 { return false}
        }
    }
    return true
}


func C12(_ str: String) -> String {
    let words = str.split(separator: " ")
    
    var iters = words.map { $0.makeIterator() }
    var result = ""
    guard iters.count > 1 else {
        return result
    }
    
    while true {
        
        let chars = (0..<iters.count).compactMap { iters[$0].next() }
        guard chars.count == iters.count else {
            break
        }
        let char = chars[0]
        guard chars.dropFirst().allSatisfy({ $0 == char }) else {  break }
        result.append(char)
    }
    
    return result
}


func C13(_ str: String) -> String {
    guard var previous = str.first else {
        return ""
    }
    var result = ""
    var count = 1
    for char in str.dropFirst() {
        if char == previous {
            count += 1
        } else {
            result.append("\(previous)\(count)")
            count = 1
            previous = char
        }
        
    }
    
    result.append("\(previous)\(count)")
    
    return result
}

extension Array {
    
    func permutations() -> [[Element]] {
        var result = [[Element]]()
        var ary = self
        ary.permutations(start: 0, result: &result)
        return result
    }
    
    mutating func permutations(start: Int, result: inout [[Element]]){
        if start == count - 1 {
            result.append(self)
            return
        }
        
        for i in start ..< count {
            swapAt(i, start)
            permutations(start: start+1, result: &result)
            swapAt(i, start)
        }
    }
}

func C14(_ str: String) -> [String] {
    let ary = Array(str)
    
    return  ary.permutations().map { String.init($0) }
}


func c15(_ str: String) -> String {
    let words = str.split(separator: " ").map { String($0.reversed())}
    return words.joined(separator: " ")
}


func c18(base: Int, pow: Int) -> Int {
    if pow == 1 { return base}
    
    var result = c18(base: base, pow: pow / 2)
    
    result *= result
    
    if pow % 2 == 1 {
        result *=  base
    }
    
    return result
}

func c20(_ n: Int) -> Bool {
    guard n >= 2 else { return false }
    let s = Int(sqrt(Double(n)))
    if s < 2 { return true }
    for i in 2...s {
        if n.isMultiple(of: i) {
            return false
        }
    }
    return true
}


func c21(_ n: Int) -> (Int?, Int?) {
    
    func binaryCount(_ n: Int) -> Int {
        let s = String(n, radix: 2)
        
        let one = s.filter{ $0 == "1" }.count
        return one
    }
    
    guard n > 0 else {
        return (nil, nil)
    }
    
    let count = binaryCount(n)
    
    var high: Int?
    for i in n+1...Int.max {
        if binaryCount(i) == count {
            high = i
            break
        }
    }
    var low: Int?
    
    for i in (0...n-1).reversed() {
        if binaryCount(i) == count {
            low = i
            break
        }
    }
    
    return (high, low)
}


func c22(_ n: UInt8) -> UInt8 {
    let s = String(n, radix: 2)
    let reversed = s.reversed() + String(repeating: "0", count: 8-s.count)
    
    return UInt8(reversed, radix: 2)!
}

func c23(_ str: String) -> Bool {
    str.allSatisfy {
        CharacterSet.decimalDigits.contains($0.unicodeScalars.first!)
        //        $0.isNumber
    }
}

func c24(_ str: String) -> Int? {
    
    let nums = str.components(separatedBy: CharacterSet.decimalDigits.inverted)
        .filter { $0 != ""}
    
    guard !nums.isEmpty else {
        return nil
    }
    
    return nums.reduce(0) {
        $0 + Int($1)!
    }
}


func c25(_ n: Int) -> Int {
    
    for i in 1...Int.max {
        if i*i > n {
            return i-1
        }
    }
    
    fatalError()
}

func c25_1(_ n: Int) -> Int {
    
    var low = 1, high = n
    
    while low <= high {
        let mid = low + (high - low) / 2
        if n < mid*mid {
            high = mid - 1
        } else if n < (mid+1)*(mid+1) {
            return mid
        } else {
            low = mid + 1
        }
        
    }
    
    fatalError()
}

func c26(subtract a: Int, from b: Int) -> Int {
    if b >= a {
        return (a...b).count - 1
    } else {
        return -((b...a).count - 1)
    }
    // return b + (~a + 1)
}


func c27(url: URL, last n: Int) -> [String] {
    let s = try! String(contentsOf: url)
        .components(separatedBy: .newlines)
        .reversed()
        .prefix(n)
    
    return .init(s)
}


func c28(path: String, message: String) throws {
    
    
    
    //    let fd = try FileDescriptor.open(path, .writeOnly, options: [.create, .append])
    //
    //
    //    try _ = fd.closeAfter {
    //        try fd.writeAll("\(Date()) \(message)".utf8)
    //    }
    let message = "\(Date()) \(message)\n"
    if FileManager.default.fileExists(atPath: path) {
        
        let fileHandle = try FileHandle(forWritingTo: URL(fileURLWithPath: path))
        defer { fileHandle.closeFile() }
        fileHandle.seekToEndOfFile()
        fileHandle.write(message.data(using: .utf8)!)
        
        
    } else {
        try message.write(toFile: path, atomically: true, encoding: .utf8)
    }
    
}

func c30(_ path: String) throws -> [String]  {
    let files = try FileManager.default.contentsOfDirectory(at: URL(fileURLWithPath: path, isDirectory: true), includingPropertiesForKeys: nil)
    var result = [String]()
    
    for file in files {
        if file.pathExtension == "jpg" || file.pathExtension == "jpeg" {
            guard let date = try? FileManager.default.attributesOfItem(atPath: file.path)[.creationDate] as? Date else {
                continue
            }
            
            if date >= Date.init(timeIntervalSinceNow: -48*60*60) {
                result.append(file.lastPathComponent)
            }
            
        }
    }
    return result
}

func c31(source: String, destination: String) -> Bool {
    let fm = FileManager.default
    
    var isDirectory: ObjCBool = false
    guard fm.fileExists(atPath: source, isDirectory: &isDirectory) && isDirectory.boolValue else {
        return false
    }
    
    do {
        try fm.copyItem(atPath: source, toPath: destination)
    } catch {
        print("Copy error: \(error.localizedDescription)")
        return false
    }
    return true
}

func c33(path: String) -> [String] {
    let fm = FileManager.default
    
    let directoryURL = URL(fileURLWithPath: path)
    
    guard let files = fm.enumerator(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
    
    var duplicates: Set<String> = []
    var seen = duplicates
    
    for case let file as URL in files {
        guard !file.hasDirectoryPath else {
            continue
        }
        let filename = file.lastPathComponent
        if seen.contains(filename) {
            duplicates.insert(filename)
        } else {
            seen.insert(filename)
        }
    }
    
    return .init(duplicates)
}

extension Sequence where Element: BinaryInteger {
    func c37Count(of n: Character) -> Int {
        
        reduce(0) {
            $0 + String($1).filter { $0 == n }.count
        }
    }
}

extension Collection where Element: Comparable {
    func smallest(_ n: Int) -> [Element] {
        let x = sorted()
        return .init(x.prefix(n))
    }
}


extension Collection where Element==String {
    func sortByLength() -> [Element] {
        sorted{ $0.count > $1.count }
    }
}


func c40(_ ary: [Int]) -> [Int] {
    Array(Set(1...100).subtracting(ary))
}


extension Collection where Element: Comparable {
    func findNSmallest(_ k: Int) -> Element? {
        guard !isEmpty && (1...count).contains(k) else {
            return nil
        }
        
        var ary = Array(self)
        var range = 0..<ary.count
        var k = k
        
        while true {
            
            ary[range].swapAt(range.lowerBound, range.randomElement()!)
            
            let first = ary[range].first!
            
            
            let i = ary[range.dropFirst()].partition(by: { $0 > first }) - 1 - range.lowerBound + 1
            
            ary.swapAt(range.lowerBound, range.lowerBound+i-1)
            
            if i == k { return ary[range][range.lowerBound+k-1] }
            else if k > i {
                k -= i
                range = range.dropFirst(i)
            } else {
                range = range.prefix(i-1)
            }
            
        }
        
        
    }
}


func c41(_ ary: [Int]) -> Double? {
    let count = ary.count
    guard count > 0 else {
        return nil
    }
    let median: Int
    if count % 2 == 0 {
        median = ary.findNSmallest(count/2)! + ary.findNSmallest(count/2+1)!
        
    } else {
        median =  ary.findNSmallest(count/2+1)! * 2
    }
    
    return Double(median) / 2
}


extension Collection where Element: Equatable {
    func firstIndexC42(of e: Element) -> Index? {
        
        var i = startIndex
        
        while i != endIndex {
            if self[i] == e {
                return i
            }
            formIndex(after: &i)
        }
        return nil
    }
}


func c43() -> String {
    var result = ""
    let list = LinkList("abcdefghijklmnopqrstuvwxyz")
    list.traverse {
        if result == "" {
            result.append($0)
        } else {
            result += " \($0)"
        }
    }
    return result
}


extension LinkList {
    
    func middlePoint() -> Element? {
        
        func traverse(current: LinkList, ahead: LinkList) -> Element? {
            
            switch ahead {
            case .tail:
                return current.value
            case let .node(_, next: next):
                return traverse(current: current.next(), ahead: next.next())
            }
            
        }
        
        
        return traverse(current: self, ahead: self.next().next())
        
    }
}

extension Collection {
    
    func mapC46<T>(_ f: (Element) throws -> T ) rethrows ->  [T] {
        var result: [T] = []
        
        for x in self {
            result.append(try f(x))
        }
        
        return result
    }
}


extension Collection where Element: Comparable {
    func minC47() -> Element? {
        guard let first = first else {
            return nil
        }
        
        return dropFirst().reduce(first) { Swift.min($0, $1)}
    }
}

extension Sequence where Element: Hashable {
    var frequency: [Element: Int] {
        Dictionary(map{ ($0,1)}, uniquingKeysWith:+)
    }
}


func c49(_ n: Int...) -> Int? {
    guard !n.isEmpty else {
        return nil
    }
    let f = n.frequency
    return f.reduce(0) { $0 + ($1.value % 2 == 0 ? $1.key : 0) }
}

func c50(_ ary: [Int]) -> ClosedRange<Int>? {
    
    let x = ary.split(omittingEmptySubsequences: false) {
        $0 <= 0
    }
    
    var result: ClosedRange<Int>?
    var max = 0, index = 0
    for i in  x {
        let sum = i.reduce(0, +)
        if sum > max {
            max = sum
            result = index...index+i.count-1
        }
        
        index += i.count + 1
        
    }
    
    return result
    
}

extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element {
        reduce(.zero, +)
    }
}


extension Array where Element: Comparable {
    mutating func bubbleSort() {
        guard !isEmpty else {
            return
        }
        
        for i in 0..<count-1{
            for j in 0..<count-1-i {
                if self[j] > self[j+1] {
                    self.swapAt(j, j+1)
                }
            }
        }
        
    }
    
    func bubbleSorted() -> [Element] {
        var r = self
        r.bubbleSort()
        return r
        
    }
    
}

extension Array where Element: Comparable {
    mutating func insertionSort() {
        guard !isEmpty else {
            return
        }
        
        for i in 1..<count{
            var j = i
            while j > 0 && self[j] < self [j-1] {
                swapAt(j, j-1)
                j -= 1
            }
        }
        
    }
    
    func insertionSorted() -> [Element] {
        var r = self
        r.insertionSort()
        return r
        
    }
    
}

func c58(_ str: String) -> Bool {
    var stack = [Character]()
    
    for char in str {
        switch char {
        case "(", "[", "{", "<":
            stack.append(char)
        case ")":
            guard stack.popLast() == "(" else { return false }
        case "]":
            guard stack.popLast() == "[" else { return false }
        case "}":
            guard stack.popLast() == "{" else { return false }
        case ">":
            guard stack.popLast() == "<" else { return false }
        default:
            return false
            
        }
    }
    
    return stack.isEmpty
}

func c60(_ board: [[String]]) -> Bool {
    
    for i in 0..<3 {
        let row = board[i][0..<3]
        if row.allSatisfy({$0 == "X"}) || row.allSatisfy({$0 == "O"}) { return true}
        let col = board[0..<3].map(\.[i])
        if col.allSatisfy({$0 == "X"}) || col.allSatisfy({$0 == "O"}) { return true}
    }
    
    // two diaganol
    let d1 = (0..<2).map{ ($0, $0)}
    if d1.allSatisfy({board[$0.0][$0.1] == "X"}) || d1.allSatisfy({board[$0.0][$0.1] == "O"}) { return true}
    let d2 = (0..<2).map{ ($0, 2-$0)}
    if d2.allSatisfy({board[$0.0][$0.1] == "X"}) || d2.allSatisfy({board[$0.0][$0.1] == "O"}) { return true}
    
    return false
}


func c61(upTo: Int) -> [Int] {
    
    guard upTo > 1 else {
        return []
    }
    
    var seive = Array(repeating: true, count: upTo)
    
    for i in 2...Int(sqrt(Double(upTo))) {
        if seive[i] {
            for j in stride(from: i*i, to: upTo, by: i) {
                seive[j] = false
            }
        }
    }
    
    return (2..<upTo).reduce(into: [Int]()) { if seive[$1] { $0.append($1)}}
    

}


func c63(fill n: Int, in grid: [[Int]], at point: (Int, Int)) -> [[Int]] {
    let rows = grid.count
    guard rows > 0 else {
        return []
    }
    let cols = grid[0].count
    guard cols > 0 else {
        return []
    }
    
    var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: cols), count: rows)
    
    let x = grid[point.0][point.1]
    var result = grid
    
    /// - Invariant: start value equal to x
    func dfs(start: (Int, Int)) {
        let row = start.0
        let col = start.1
        result[row][col] = n
        visited[row][col] = true
        
        // up
        if row - 1 >= 0 && !visited[row-1][col] && grid[row-1][col] == x {
            dfs(start: (row-1, col))
        }
        // right
        if col + 1 < cols && !visited[row][col+1] && grid[row][col+1] == x {
            dfs(start: (row, col+1))
        }
        // down
        if row + 1 < rows && !visited[row+1][col] && grid[row+1][col] == x {
            dfs(start: (row+1, col))
        }
        // left
        if col - 1 >= 0 && !visited[row][col-1] && grid[row][col-1] == x {
            dfs(start: (row, col-1))
        }
    }
    
    dfs(start: point)
    
    return result
}


func c64(n: Int) -> [[String]] {
    
    
    var result = [[Int]]()
    
    // positions[i]  reprensent ith row queen's col position
    var positions = [Int](unsafeUninitializedCapacity: n) { buffer, count in
        for i in 0..<n {
            buffer[i] = i
        }
        count = n
    }
    
    func permutations(_ ary: inout [Int], n: Int) {
        
        
        if n == ary.count {
            result.append(ary)
        }
        
        for i in n..<ary.count {
            ary.swapAt(n, i)
            // check queens not in diagonal
            var conflict = false
            for j in 0..<n {
                if ary[j] - ary[n] == j - n || ary[j] - ary[n] == n - j {
                    conflict = true
                    break
                }
            }
            if !conflict {
                permutations(&ary, n: n+1)
            }
            
            ary.swapAt(n, i)
        }
        
    }
    
    permutations(&positions, n: 0)
    
    return result.map { solution in
        
        solution.map {
            var s = Array(repeating: ".", count: n)
            s[$0] = "Q"
            return s.joined()
        }
        
    }
}
