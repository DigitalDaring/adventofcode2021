//
//  extensions.swift
//  day_1
//
//  Created by EBates on 12/1/21.
//

extension Array {
    func betterReduce<T>(initialValue: T, iterator: (_ accumulator: T, _ nextItem: T, _ index: Int, _ allItems: Array) -> T) -> T {
        var acc = initialValue
        for (index, element) in self.enumerated() {
            acc = iterator(acc, element as! T, index, self)
        }
        return acc
    }
}
