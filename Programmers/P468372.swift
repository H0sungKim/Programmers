//
//  P468372.swift
//  Programmers
//
//  Created by Hosung.Kim on 2026.07.18.
//

import Testing

struct P468372 {
    @Test func test() async throws {
        assert(solution, testCases: [
            TestCase(input: (3, 6), expected: 6),
            TestCase(input: (0, 10), expected: 1),
            TestCase(input: (3, 100), expected: 7),
            TestCase(input: (5, 16), expected: 9),
        ])
    }
}

extension P468372 {
    func solution(_ dist_limit: Int, _ split_limit: Int) -> Int {
        let distLimit = dist_limit
        let splitLimit = split_limit
        
        func searchMaxLeafCount(usedDist: Int, usedSplit: Int, leaf: Int) -> Int {
            let leftDist = distLimit - usedDist
            
            if leftDist == 0 {
                return leaf
            }
            
            let distNode = min(leftDist, leaf)
            
            var result = leaf
            for dist in [2, 3] {
                guard usedSplit * dist <= splitLimit else { continue }
                result = max(
                    result,
                    searchMaxLeafCount(
                        usedDist: usedDist + distNode,
                        usedSplit: usedSplit * dist,
                        leaf: leaf + distNode * (dist - 1)
                    )
                )
            }
            return result
        }
        
        return searchMaxLeafCount(usedDist: 0, usedSplit: 1, leaf: 1)
    }
}
