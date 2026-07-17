//
//  P12903.swift
//  Programmers
//
//  Created by Hosung.Kim on 2026.07.14.
//

import Testing

struct P12903 {
    @Test func test() async throws {
        assert(solution, testCases: [
            TestCase(input: "abcde", expected: "c"),
            TestCase(input: "qwer", expected: "we"),
        ])
    }
}

extension P12903 {
    func solution(_ s: String) -> String {
        let startIndex = s.index(s.startIndex, offsetBy: (s.count-1)/2)
        let endIndex = s.index(s.startIndex, offsetBy: s.count/2)
        return String(s[startIndex...endIndex])
    }
}
