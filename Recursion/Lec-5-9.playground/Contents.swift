//: [Previous](@previous)

import Foundation

//Multiple recursion calls
//Fibonacci number give nth number
// Time complexity is exponential 2*power(n), as the recursion of n takes two recursion down the line
func fibonacci(n: Int) -> Int{
    if n <= 1 {return n}
    return fibonacci(n: n - 1) + fibonacci(n: n - 2)
}
let fibo = fibonacci(n: 3)

// Print all subsequence - a contiguos/non- contigous sequence which follows the order
// arr = [3,1,2]
// contiguos 3, 1, 2, 31, 12
// non- contigous 32
// Not a subequence 321- as it does not follow an order
// An empty array is also a subsequence
/* print all posiible subsequence*/
// time complexity - 2*power(n) as , space- o(n) - depth will be n for auxilarry space
// every index has 2 options and its subsequence in n print for time complexity
func printAllSubsequence(index:Int, arrEmpty: inout [Int], arr: [Int])
{
    if index >= arr.count {
        print(arrEmpty)
        return
    }
    arrEmpty.append(arr[index])
    printAllSubsequence(index: index + 1, arrEmpty: &arrEmpty, arr: arr)
    arrEmpty.removeLast()
    printAllSubsequence(index: index + 1, arrEmpty: &arrEmpty, arr: arr)
}
var emptyArr = [Int]()
var arr = [3,1,2]

let index: () = printAllSubsequence(index: 0, arrEmpty: &emptyArr, arr: arr)


// Print all sub-sequence of a sum
func printSumOfSubsequence(index:Int, arrEmpty: inout [Int], arr: [Int], s: inout Int, sum: Int) {
    if index == arr.count {
        if s == sum {
            print(arrEmpty)
        }
        return
    }
    arrEmpty.append(arr[index])
    s = s + arr[index]
    printSumOfSubsequence(index: index + 1, arrEmpty: &arrEmpty, arr: arr, s: &s, sum: sum)
    s = s - arr[index]
    arrEmpty.removeLast()
    printSumOfSubsequence(index: index + 1, arrEmpty: &arrEmpty, arr: arr, s: &s, sum: sum)
}

//var emptyArr = [Int]()
//let arr = [1,2,1]
var s = 0
printSumOfSubsequence(index: 0, arrEmpty: &emptyArr, arr: arr, s: &s, sum: 2)

// Print only one sub-sequence whose sum is met
// Technique to print one answer-  If base condition is satisfied will return true else false
func printOnlySumOfSubsequence(index:Int, arrEmpty: inout [Int], arr: [Int], s: inout Int, sum: Int) -> Bool {
    if index == arr.count {
        if s == sum {
            print(arrEmpty)
            return true
        }
        return false
    }
    arrEmpty.append(arr[index])
    s = s + arr[index]
    if printOnlySumOfSubsequence(index: index + 1, arrEmpty: &arrEmpty, arr: arr, s: &s, sum: sum) == true {
        return true
    }
    s = s - arr[index]
    arrEmpty.removeLast()
    if printOnlySumOfSubsequence(index: index + 1, arrEmpty: &arrEmpty, arr: arr, s: &s, sum: sum) == true {
        return true
    }
    return false
}

var emptyArr1 = [Int]()
let arr1 = [1,2,1]
printOnlySumOfSubsequence(index: 0, arrEmpty: &emptyArr1, arr: arr1, s: &s, sum: 2)

// Print count of all sub sequence
func printCountOfSubsequence(index:Int, arr: [Int], s: inout Int, sum: Int) -> Int {
    // consition if all numbers are positive
    if s > sum { return 0 }
    if index == arr.count {
        if s == sum {
            return 1
        }
            return 0
    }
    s = s + arr[index]
    let l = printCountOfSubsequence(index: index + 1, arr: arr, s: &s, sum: sum)
    s = s - arr[index]
    let r = printCountOfSubsequence(index: index + 1, arr: arr, s: &s, sum: sum)
    return l + r
}

printCountOfSubsequence(index: 0, arr: arr, s: &s, sum: 2)

// Time complexity goes a s 2*power(n)
// Takeaways;- print ALL SUB-SEQUENCE - RECURSION PARAMETERISED
// Print 1- ret T/F & avoid recursion calls if we get true and false
// print count - return 1/0- add all func() sum and return


// Combination of sum - lec 8
// time complexity is exponential 2*power(n) * k, where k is some amount of recursion fucntion required in base case handling i.e a emptyArr taking other DS to stroe data
// space- k * x- average lenth k and x combination
// o-p [2,2,3][7]
func printAllCombination(index: Int, emptyArr: inout [Int], target: inout Int, arr: [Int]) {
    if index == arr.count {
        if target == 0 {
            print(emptyArr)
        }
        return
    }
    if arr[index] <= target {
        emptyArr.append(arr[index])
        var comb = target - arr[index]
        printAllCombination(index: index, emptyArr: &emptyArr, target: &comb, arr: arr)
        emptyArr.removeLast()
    }
    printAllCombination(index: index + 1, emptyArr: &emptyArr, target: &target, arr: arr)
}

var emptyArr123 = [Int]()
var arr123 = [2,3,6,7]
var sum123 = 7

printAllCombination(index: 0, emptyArr: &emptyArr123, target: &sum123, arr: arr123)

//Combination of sum Lec 9
// Find all combination without picking elements more than 1 and in a sorted manner
// To avoid duplicates we will pick subsequences and not pick and not-pick method

func printUniqueCombination(index: Int, emptyArr: inout [Int], target: inout Int, arr: [Int]){
    
    if target == 0 {
        print(emptyArr)
        return
    }
    
    for i in index..<arr.count {
        if i > index && arr[i] == arr [i - 1] {continue}
        if arr[i] > target {
            break
        }
        emptyArr.append(arr[i])
        var comb = target - arr[i]
        printUniqueCombination(index: i + 1, emptyArr: &emptyArr, target: &comb, arr: arr)
        emptyArr.removeLast()
    }
}

var arr321 = [1,1,1,2,2]
var emptyArr321 = [Int]()
var sum321 = 4

printUniqueCombination(index: 0, emptyArr: &emptyArr321, target: &sum321, arr: arr321)

//: [Next](@next)
