//
//  File.swift
//  
//
//  Created by lujiaheng on 2020/7/16.
//

import Foundation

indirect enum LinkList<Element> {
    
    case tail
    case node(value: Element, next: LinkList)
    
    
    func next() -> LinkList {
        switch self {
        case .tail:
            return .tail
        case .node(value: _, next: let next):
            return next
        }
    }
    
    var value: Element? {
        switch self {
        case .tail:
            return nil
        case .node(value: let v, next: _):
            return v
        }
    }
    
    /// Return a new list by prepending a node with value `x` to the
    /// front of a list.
    func cons(_ x: Element) -> LinkList {
        return .node(value: x, next: self)
    }
}


extension LinkList: ExpressibleByNilLiteral {
    
    init(nilLiteral: ()) {
        self = .tail
    }
}

extension LinkList: ExpressibleByArrayLiteral {
    
    init(arrayLiteral: Element...) {
        self = arrayLiteral.reversed().reduce(.tail, {
            .node(value: $1, next: $0)
        })
    }
    
}

extension LinkList {
    
    init<S>(_ s: S) where S: Sequence, S.Element == Element {
        self = s.reversed().reduce(.tail, {
            .node(value: $1, next: $0)
        })
    }
}

extension LinkList {
    func traverse(_ f: (Element) -> ()) {
        switch self {
        case .tail:
            return
        case let .node(value: v, next: n):
            f(v)
            n.traverse(f)
        }
    }
}


extension LinkList: Equatable where Element: Equatable {}


extension LinkList {
    func reversed() -> LinkList {
        
        var r = LinkList.tail
        self.traverse {
            r = r.cons($0)
        }
        
        return r
    }
    
}


