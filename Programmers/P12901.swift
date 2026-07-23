//
//  P12901.swift
//  Programmers
//
//  Created by Hosung.Kim on 2026.07.23.
//

import Testing

struct P12901 {
    @Test func test() async throws {
        assert(solution, testCases: [
            TestCase(input: (5, 24), expected: "TUE"),
        ])
    }
}

extension P12901 {
    func solution(_ month: Int, _ day: Int) -> String {
        let days = day - 1 + Month.allCases.prefix(month-1).reduce(0, { partialResult, month in
            return partialResult + month.days
        })
        let result = DayOfWeek(rawValue: days % 7)!
        return "\(result)"
    }
    
    enum DayOfWeek: Int, CustomStringConvertible {
        case sun = 2
        case mon = 3
        case tue = 4
        case wed = 5
        case thu = 6
        case fri = 0
        case sat = 1
        
        var description: String {
            switch self {
            case .sun: return "SUN"
            case .mon: return "MON"
            case .tue: return "TUE"
            case .wed: return "WED"
            case .thu: return "THU"
            case .fri: return "FRI"
            case .sat: return "SAT"
            }
        }
    }
    
    enum Month: Int, CaseIterable {
        case jan = 1
        case feb
        case mar
        case apr
        case may
        case jun
        case jul
        case aug
        case sep
        case oct
        case nov
        case dec
        
        var days: Int {
            switch self {
            case .jan: return 31
            case .feb: return 29
            case .mar: return 31
            case .apr: return 30
            case .may: return 31
            case .jun: return 30
            case .jul: return 31
            case .aug: return 31
            case .sep: return 30
            case .oct: return 31
            case .nov: return 30
            case .dec: return 31
            }
        }
    }
}
