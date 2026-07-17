//
//  P468370.swift
//  Programmers
//
//  Created by Hosung.Kim on 2026.07.16.
//

import Testing

struct P468370 {
    @Test func test() async throws {
        assert(solution, testCases: [
            TestCase(input: ("here is muzi here is a secret message", [[0, 3], [23, 28]]), expected: 1),
            TestCase(input: ("my phone number is 01012345678 and may i have your phone number", [[5, 5], [25, 28], [34, 40], [53, 59]]), expected: 4),
            TestCase(input: (" here is muzi here is a secret message", [[0, 3], [23, 28]]), expected: 1),
            TestCase(input: ("here is muzi here is a secret message ", [[0, 3], [23, 28]]), expected: 1),
        ])
    }
}

extension P468370 {
    func solution(_ message: String, _ spoiler_ranges: [[Int]]) -> Int {
        let spoilerIndices = Set(spoiler_ranges.flatMap { $0[0]...$0[1] })
        
        let wordRanges: [(word: String, range: ClosedRange<Int>)] = message.split(whereSeparator: \.isWhitespace).map {
            (String($0), $0.startIndex...$0.index(before: $0.endIndex))
        }
        
        let rangesByWord = Dictionary(grouping: wordRanges, by: \.word)
            .mapValues { $0.map(\.range) }
        
        return rangesByWord.values.count { ranges in
            ranges.allSatisfy { range in
                !spoilerIndices.isDisjoint(with: range)
            }
        }
    }
}
