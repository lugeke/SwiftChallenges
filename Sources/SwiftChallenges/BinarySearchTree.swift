//
//  File.swift
//  
//
//  Created by lujiaheng on 2020/7/18.
//

import Foundation
import Algorithms



typealias BinarySearchTree<T> = BinaryTree<T> where T: Comparable



extension BinarySearchTree{
    
    
    mutating func insert(_ element: T) {
        switch self {
        case .null:
            self = .init(element)
        case .node(left: var l, value: let v, right: var r):
            if element < v { l.insert(element) }
            if element > v { r.insert(element) }
            self = .node(left: l, value: v, right: r)
        }
    }
    
    
    
}


extension BinarySearchTree {
    var elements: [T] {
        switch self {
        case .null:
            return []
        case let .node(left, value, right):
            return left.elements + [value] + right.elements
        }
    }
}


extension BinarySearchTree: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        self = .init()
        for e in elements {
            self.insert(e)
        }
    }
}
