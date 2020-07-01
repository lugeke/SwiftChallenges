import Foundation

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
