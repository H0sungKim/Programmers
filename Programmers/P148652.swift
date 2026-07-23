//
//  P148652.swift
//  Programmers
//
//  Created by Hosung.Kim on 2026.07.23.
//

import Foundation
import Testing

struct P148652 {
    @Test func test() async throws {
        assert(solution, testCases: [
            TestCase(input: (2, 4, 17), expected: 8),
        ])
    }
}

extension P148652 {
    func solution(_ n: Int, _ l: Int64, _ r: Int64) -> Int {
        let length = Int(pow(Double(5), Double(n)))
        
        if l == 1 && r == length {
            return Int(pow(Double(4), Double(n)))
        }
        
        let previousLength = Int64(pow(Double(5), Double(n-1)))
        let range = l...r
        
        return [0, 1, 3, 4].map {
            let sectionIndex = Int64($0)
            let sectionL = 1 + previousLength * sectionIndex
            let sectionR = previousLength * (sectionIndex+1)
            guard (sectionL...sectionR).overlaps(range) else { return 0 }
            let sectionRange = (sectionL...sectionR).clamped(to: range)
            return solution(n-1, sectionRange.lowerBound - previousLength * sectionIndex, sectionRange.upperBound - previousLength * sectionIndex)
        }.reduce(0, +)
    }
}
