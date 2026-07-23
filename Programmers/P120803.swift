//
//  P120803.swift
//  Programmers
//
//  Created by Hosung.Kim on 2026.07.23.
//

import Testing

struct P120803 {
    @Test func test() async throws {
        assert(solution, testCases: [
            TestCase(input: (2, 3), expected: -1),
            TestCase(input: (100, 2), expected: 98),
        ])
    }
}

extension P120803 {
    func solution(_ num1: Int, _ num2: Int) -> Int {
        return num1 - num2
    }
}
