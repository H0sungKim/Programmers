//
//  P12940.swift
//  P12940
//
//  Created by Hosung.Kim on 2026.07.16.
//

import Testing

struct P12940 {
    
    func solution(_ n: Int, _ m: Int) -> [Int] {
        return [gcd(n, m), lcm(n, m)]
    }
    
    func lcm(_ x: Int, _ y: Int) -> Int {
        guard x != 0, y != 0 else { return 0 }
        return x / gcd(x, y) * y
    }
    
    func gcd(_ x: Int, _ y: Int) -> Int {
        return y == 0 ? x : gcd(y, x%y)
    }
    
    @Test func test() async throws {
        let testCases: [(input: (Int, Int), expected: [Int])] = [
            (input: (3, 12), expected: [3, 12]),
            (input: (2, 5), expected: [1, 10]),
        ]
        
        zip(
            testCases.map(\.input).map(solution),
            testCases.map(\.expected)
        ).forEach { output, expected in
            #expect(output == expected)
        }
    }
}
