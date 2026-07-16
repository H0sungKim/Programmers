//
//  P12909.swift
//  P12909
//
//  Created by Hosung.Kim on 2026.07.15.
//

import Testing

struct P12909 {
    
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
    
    @Test func test() async throws {
        let testCases: [(input: String, expected: Bool)] = [
            (input: "()()", expected: true),
            (input: "(())()", expected: true),
            (input: ")()(", expected: false),
            (input: "(()(", expected: false),
        ]
        
        zip(
            testCases.map(\.input).map(solution),
            testCases.map(\.expected)
        ).forEach { output, expected in
            #expect(output == expected)
        }
    }
}
