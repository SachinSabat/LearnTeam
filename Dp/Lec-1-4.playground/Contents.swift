import UIKit

//Overlapping subproblems - when we get a solution for a problem than we wont calculate again for that problem eg:- fib(2) is calculated so on backtracking we wont calculate again
// Memoization - we tend to store the value of sub problem
// Convert recursion to DP
// 1- store an array
// 2- return the stored value from array
// 3- recursion to DP

// Time - O(N) liner time
// Space - O(N) - stack space
//func fibonacciNumber() {
//
//    func sumFibonacci(n: Int) -> Int {
//        var prev = 1
//        var prev2 = 0
//
//        for i in 2...n {
//            let cur = prev + prev2
//            prev2 = prev
//            prev = cur
//        }
//        return prev
//    }
//
//    print(sumFibonacci(n: 5))
//
//}
//fibonacciNumber()

// Shortcut
// - Try to represent the problem in terms of index
// - do all possible stuffs on that index according to the problem statement
// - Sum of all stuffs - count all ways
//   - min (of all stuffs) - find min
// Recursion  - all possible ways
// L7 - best ways / count all ways

// Step 1- Try to represent the problem in terms of index
// Step 2- do all possible stuffs on that index according to the problem statement
// Step 3- Sum of all stuffs - count all ways || min (of all stuffs) - find min

// Frog jump

// Recursion to DP - Memoisation (Look at the params are changing)
// here the param change is index
// Step 1:- declare a array of size n + 1
// Step 2:- before returning add it up in an arr
// Step 3:- check if it is previously computed or not
// Time complexity - O(n) as there are n steps same as space

func frogJump() {
    
    var arrSize = [30,10,60,10,60,50]
    var arrDp = Array(repeating: -1, count: arrSize.count)
    
    func frogJumpedMin(index: Int) -> Int {
        if index == 0 {
            return 0
        }
        if arrDp[index] != -1 {
            return arrDp[index]
        }
        let minLeft = arrSize[index] - arrSize[index - 1]
        var left = frogJumpedMin(index: index - 1) + minLeft
        var right = Int.max
        if index > 1 {
            let minRight = arrSize[index] - arrSize[index - 2]
            right = frogJumpedMin(index: index - 2) + minRight
        }
        arrDp[index] = min(left, right)
        return min(left, right)
    }
    
    print(frogJumpedMin(index: 5))
    
}
frogJump()
// Tabulisation form using variable to optimise space
func frogJumpTabulization() {
    
    var arrSize = [30,10,60 , 10 , 60 , 50]
    var prev = 0
    var prev2 = 0
    func frogJumpedMin(index: Int) -> Int {
        
        for i in 1..<arrSize.count {
            let minLeft = arrSize[i] - arrSize[i - 1]
            var left = prev + minLeft
            var right = Int.max
            if i > 1 {
                let minRight = arrSize[i] - arrSize[i - 2]
                right = prev2 + minRight
            }
            var currI = min(left, right)
            prev2 = prev
            prev = currI
        }
        return prev
    }
    
    print(frogJumpedMin(index: 0))
    
}
frogJumpTabulization()


let aQueue = DispatchQueue(label: "com.tet.queue", qos: .utility, attributes: [.concurrent])

aQueue.sync {
    aQueue.sync {
        for i in 0..<4 {
            print("Data:", i)
        }
    }
}
for i in 1000..<1004 {
    print("Data:",i)
}
