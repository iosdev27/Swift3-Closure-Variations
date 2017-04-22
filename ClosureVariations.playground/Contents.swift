//: Playground - noun: a place where people can play

import UIKit

extension Array {
    func accumulate<Result>(_ initialResult: Result, _ nextPartialResult:(Result, Element) -> Result) -> [Result] {
        var running = initialResult
        return map { next in
            running = nextPartialResult(running, next)
            return running
        }
    }
}

let npr:(Int, Int) -> Int
npr = {(a: Int, b: Int) in return a + b}


// These all produce the same results, showcasing various syntactical variations of closures in Swift 3
print([1, 2, 3, 4].accumulate(0, npr))
print([1, 2, 3, 4].accumulate(0, {(a: Int, b: Int) in return a + b}))
print([1, 2, 3, 4].accumulate(0, {(a: Int, b: Int) in a + b}))
print([1, 2, 3, 4].accumulate(0, {a, b in return a + b}))
print([1, 2, 3, 4].accumulate(0, {a, b in a + b}))
print([1, 2, 3, 4].accumulate(0, {$0 + $1}))
print([1, 2, 3, 4].accumulate(0) {a, b in a + b})
print([1, 2, 3, 4].accumulate(0, +))









