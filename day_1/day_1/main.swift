//
//  main.swift
//  day_1
//
//  Created by DigitalDaring on 12/1/21.
//

import Foundation;

func processDepths(depths: Array<Int>) -> Int {
    return depths.betterReduce(initialValue: 0, iterator: {(acc: Int, cur: Int, idx: Int, items: Array<Int>) -> Int in return idx > 0 && cur > items[idx - 1] ? acc + 1 : acc})
}

let result = processDepths(depths: inputs)

debugPrint(result)

