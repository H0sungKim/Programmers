//
//  P12909.swift
//  Programmers
//
//  Created by Hosung.Kim on 2026.07.15.
//

import Testing

struct P12909 {
    @Test func test() async throws {
        assert(solution, testCases: [
            TestCase(input: "()()", expected: true),
            TestCase(input: "(())()", expected: true),
            TestCase(input: ")()(", expected: false),
            TestCase(input: "(()(", expected: false),
        ])
    }
}

extension P12909 {
    func solution(_ s: String) -> Bool {
        var parenthesesCount: Int = 0
        
        for char in s {
            switch char {
            case "(":
                parenthesesCount += 1
            case ")":
                guard parenthesesCount > 0 else { return false }
                parenthesesCount -= 1
            default:
                return false
            }
        }
        
        guard parenthesesCount == 0 else { return false }
        return true
    }
}
