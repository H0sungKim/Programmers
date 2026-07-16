//
//  Core.swift
//  Programmers
//
//  Created by Hosung.Kim on 2026.07.16.
//

import Testing

struct TestCase<Input, Output: Equatable> {
    let input: Input
    let expected: Output
}

func assert<Input, Output: Equatable>(_ target: (Input) -> Output, testCases: [TestCase<Input, Output>]) {
    zip(
        testCases.map(\.input).map(target),
        testCases.map(\.expected)
    ).forEach { output, expected in
        #expect(output == expected)
    }
}
