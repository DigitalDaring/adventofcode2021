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
    
    func betterMap<T>(iterator: (_ nextItem: T, _ index: Int, _ allItems: Array) -> T) -> [T] {
        var results: [T] = []
        for (index, element) in self.enumerated() {
            results.append(iterator(element as! T, index, self))
        }
        return results
    }
}
