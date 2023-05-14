//: [Previous](@previous)
print("sachin")
import Foundation

// Recursion- wehn a func calls itself until a specified conditio is met
// without a base function it calls again and again into infinite recursion
// The wait to execute the last function in stack is not completed than the stack overflow (segmentation calls) occurs

// Base condition is used to stop recursion (exit)

// Recursion tree - Representation of the recursion flow

// Lecture 2
//Print name N times
// tIME Complexity - O(n) calling nth function, space complexity is stack space  O(n)
func printNameNTimes(name: String, i: Int) {
    if i == 5 {return}
    printNameNTimes(name: name, i: i + 1)
}

printNameNTimes(name: "sachin", i: 1)

// Print number n to 1
func printNTo1(n: Int) {
    if n <= 0 {
        return
    }
    print(n)
    printNTo1(n: n - 1)
}

printNTo1(n: 4)

// Backtracking -  the print line wont be exucuted the func call will go til the base condition is met
// we can do the task after the func call
func backtracking(i: Int, n: Int) {
    if i < 1 {
        return
    }
    backtracking(i: i - 1 , n: n)
    print(i)
}

backtracking(i: 3, n: 3)

//Parameterised
/* takes parameter and return the parameter*/

func parameterRecursion(i: Int, sum: Int) {
    if i < 1 {
        print(sum)
        return
    }
    parameterRecursion(i: i - 1, sum: sum + i)
}

parameterRecursion(i: 3, sum: 0)

//Fucntional - sum + func(i)
/* func should return a value */

func functionalRecursion(i: Int) -> Int {
    if i == 0 {
        return 0
    }
    return i + functionalRecursion(i: i - 1)
}

functionalRecursion(i: 3)

// Factorial of a number

func factorialOfNumber(n: Int) -> Int {
    
    if n == 0 {
        return 0
    }
    return n * factorialOfNumber(n: n - 1)
}

factorialOfNumber(n: 4)
// Above all the Time complexity and the space complexity will be O(n) as the function calls recusively and space taken in stack space to execute till base consition


// Lec- 4
// Recursion using two pointers - If pointer of left side swapped pointer at right side stop the recursion
// Reverse an array with two pointers

func reverseArray(l: Int, r: Int, a: inout [Int]) {
    if l >= r {return}
    a.swapAt(l, r)
    return reverseArray(l: l + 1, r: r - 1, a: &a)
}

//Reverse an array with one pointers
func reverseTwoArray(i: Int, a: inout [Int]) {
  if i >= a.count/2 {
    return
  }
  a.swapAt(i, a.count - i - 1)
  return reverseTwoArray(i: i + 1, a: &a)
}

var a = [1,2,3,4]
//reverseArray(l: 0, r: a.count - 1, a: &a)
reverseTwoArray(i: 0, a: &a)

print("helo".self.self.self.self)

// Fucntional check to check a palindrome
// Time complexity - half the iteration so O(n/2)
// Space complexity is - noauxillary stack space not container is used only internal stack space so O(n/2)
func isPalindrome(i: Int, str: String) -> Bool {

    if i >= (str.count / 2) {return true}
    let firstIndex = str.index(str.startIndex, offsetBy: i)
    let lastIndex = str.index(str.startIndex, offsetBy: str.count - 1 - i)

    if str[firstIndex] != str[lastIndex] {
        return false
    }
    return isPalindrome(i: i + 1, str: str)
}

let isPalin = isPalindrome(i: 0, str: "MADSM")

//: [Next](@next)
