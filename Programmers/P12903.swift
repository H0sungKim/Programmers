//
//  P12903.swift
//  P12903
//
//  Created by Hosung.Kim on 2026.07.14.
//

import Testing

struct P12903 {
    
    func solution(_ s: String) -> String {
        let startIndex = s.index(s.startIndex, offsetBy: (s.count-1)/2)
        let endIndex = s.index(s.startIndex, offsetBy: s.count/2)
        return String(s[startIndex...endIndex])
    }
    
    @Test func test() async throws {
        let testCases: [(input: String, expected: String)] = [
            (input: "abcde", expected: "c"),
            (input: "qwer", expected: "we"),
        ]
        
        zip(
            testCases.map(\.input).map(solution),
            testCases.map(\.expected)
        ).forEach { output, expected in
            #expect(output == expected)
        }
    }
}
