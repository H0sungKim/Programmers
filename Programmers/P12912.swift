//
//  P12912.swift
//  Programmers
//
//  Created by Hosung.Kim on 2026.07.24.
//

import Testing

struct P12912 {
    @Test func test() async throws {
        assert(solution, testCases: [
            TestCase(input: (3, 5), expected: 12),
            TestCase(input: (3, 3), expected: 3),
            TestCase(input: (5, 3), expected: 12),
        ])
    }
}

extension P12912 {
    func solution(_ a: Int, _ b: Int) -> Int64 {
        return Int64((a+b) * (abs(a-b) + 1) / 2)
    }
}
