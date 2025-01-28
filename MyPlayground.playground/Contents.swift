import UIKit

var greeting = "Hello, playground"
var arr: [Int] = [24,78,32,56,7,92,46]
let target = 92

let index = findTarget(for: target, arr: arr)
print(index)

func findTarget( for target: Int, arr: [Int]) -> Int {
    let length = arr.count
    for i in 0...length {
        if arr[i] == target {
            return i
        }
    }
    
    return -1
}

print(sortArr(arr: arr))

func sortArr( arr: [Int]) -> [Int] {
    var arr1 = arr
    for i in 0..<arr1.count {
        for j in 0..<arr1.count - i - 1{
            if arr1[j] > arr1[j + 1] {
                let temp = arr1[j]
                 arr1[j] = arr1[j+1]
                arr1[j+1] = temp
                
            }
        }
    }
    
    return arr1
}








