//
//  P468371.swift
//  Programmers
//
//  Created by Hosung.Kim on 2026.07.15.
//

import Testing

struct P468371 {
    @Test func test() async throws {
        assert(solution, testCases: [
            TestCase(input: [[2, 1, 2], [5, 1, 1]], expected: 13),
            TestCase(input: [[2, 3, 2], [3, 1, 3], [2, 1, 1]], expected: 11),
            TestCase(input: [[3, 3, 3], [5, 4, 2], [2, 1, 2]], expected: 193),
            TestCase(input: [[1, 1, 4], [2, 1, 3], [3, 1, 2], [4, 1, 1]], expected: -1),
        ])
    }
}

extension P468371 {
    func solution(_ signals: [[Int]]) -> Int {
        let cycles = signals.map { signal in
            let cycleSize = signal.reduce(0, +)
            
            let start = signal[TrafficLight.green.rawValue]
            let end = start - 1 + signal[TrafficLight.yellow.rawValue]
            let values = start...end
            
            return Cycle(size: cycleSize, values: Set(values))
        }
        let mergedCycle = cycles.reduce(nil) { partialResult, cycle in
            merge(partialResult, cycle)
        }
        guard let minimum = mergedCycle?.values.min() else {
            return .resultNotFound
        }
        return minimum + 1
    }
    
    func merge(_ x: Cycle?, _ y: Cycle) -> Cycle {
        guard let x else { return y }
        let cycleSize = lcm(x.size, y.size)
        
        let xValues = x.repeatedValues(count: cycleSize / x.size)
        let yValues = y.repeatedValues(count: cycleSize / y.size)
        
        return Cycle(size: cycleSize, values: xValues.intersection(yValues))
    }
    
    func lcm(_ x: Int, _ y: Int) -> Int {
        guard x != 0, y != 0 else { return 0 }
        return x / gcd(x, y) * y
    }
    
    func gcd(_ x: Int, _ y: Int) -> Int {
        return y == 0 ? x : gcd(y, x%y)
    }
    
    enum TrafficLight: Int {
        case green
        case yellow
        case red
    }
    
    struct Cycle {
        let size: Int
        let values: Set<Int>
        
        func repeatedValues(count: Int) -> Set<Int> {
            let repeated = (0..<count).flatMap { multiplier in
                values.map { $0 + (size * multiplier) }
            }
            return Set(repeated)
        }
    }
}

extension Int {
    fileprivate static let resultNotFound = -1
}
