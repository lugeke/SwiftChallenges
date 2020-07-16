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
