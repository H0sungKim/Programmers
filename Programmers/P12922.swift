//
//  P12922.swift
//  Programmers
//
//  Created by Hosung.Kim on 2026.07.23.
//

import Foundation

import Testing

struct P12922 {
    @Test func test() async throws {
        assert(solution, testCases: [
            TestCase(input: 3, expected: "수박수"),
            TestCase(input: 4, expected: "수박수박"),
        ])
    }
}

extension P12922 {
    func solution(_ n: Int) -> String {
        return (0..<n).map { $0.isMultiple(of: 2) ? "수" : "박" }.joined()
    }
}
