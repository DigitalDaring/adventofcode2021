//
//  main.swift
//  day_1
//
//  Created by DigitalDaring on 12/1/21.
//

import Foundation;

// part 1:  Count depth increases from radar pings
func processDepths(depths: Array<Int>) -> Int {
    return depths.betterReduce(initialValue: 0, iterator: {(acc: Int, cur: Int, idx: Int, items: Array<Int>) -> Int in return idx > 0 && cur > items[idx - 1] ? acc + 1 : acc})
}

let result = processDepths(depths: inputs)

debugPrint(result)

// part 2:  consolidate depth increases in chunks of 3

func groupInputsInThrees(curr: Int, idx: Int, items: Array<Int>) -> Int {
    let isDoneGrouping = idx > items.count - 3
    if (isDoneGrouping) {
        return Int.min
    } else {
        return curr + items[idx + 1] + items[idx + 2]
    }
}

func processConsolidatedDepths(depths: Array<Int>) -> Int {
    let groupedInputs = depths.betterMap(iterator: groupInputsInThrees(curr:idx:items:))
    let filteredInputs = groupedInputs.filter{$0 > Int.min}
    return processDepths(depths: filteredInputs)
}

let resultTwo = processConsolidatedDepths(depths: inputs);

debugPrint(resultTwo)
