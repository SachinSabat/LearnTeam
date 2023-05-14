import UIKit

// Base case = node == n return true
// for col 1 to m
// if possible() than we will color the that node with color[node] = col
// if (node + 1) == true than return true
// else backtrack color[node] = 0
// return false if we cant color any node

func node() {
    let graph = [
           [0, 1, 1, 1],
           [1, 0, 1, 0],
           [1, 1, 0, 1],
           [1, 0, 1, 0]
    ]
    var color = [0,0,0,0]
    let m = 3
    let n = graph.count
    
    func isSafe(node: Int, color: [Int], col: Int) -> Bool {
        for k in 0..<n {
            if k != node && graph[k][node] == 1 && color[k] == col {
                return false
            }
            
        }
        return true
    }
    
    func solve(node: Int) -> Bool {
        if node == n {return true}
        for i in 1...m {
            if isSafe(node: node, color: color, col: i) {
                color[node] = i
                if solve(node: node + 1) == true {
                    return true
                }
                color[node] = 0
            }
        }
        return false
    }
        
    if solve(node: 0) == true {
        print("true")
        return
    }
    print("false")
    return
}
node()

// Lec 17th
// Plaindrome Partitioning
// Base case - If index ==  str.length -> arr.append -> retutn
// Partition = For i = index till str.lenth
// Palindrome- isPlaindrom -> arr.add(subStr(index, i+1))
//                            recursion(i+1)
//                            arr.remove(subStr(str.lenth - 1))
// isPlaindrome - true/false

func palindromePartition() {
    
    let str = "abab"
    var arrStr = [[String]]()
    var palindromeStr = [String]()
    
    func partition(index: Int) {
        
        if index == str.count {
            arrStr.append(palindromeStr)
            return
        }
        
        for i in index..<str.count {
            if isPalindrome(index: index, i: i) {
                let startIndex = str.index(str.startIndex, offsetBy: index)
                let endIndex = str.index(str.startIndex, offsetBy: i)
                let str = String(str[startIndex...endIndex])

                palindromeStr.append(str)
                partition(index: i + 1)
                palindromeStr.removeLast()
            }
        }
    }
    
    func isPalindrome(index: Int, i: Int) -> Bool {
        var index = index
        var i = i
        while(index <= i) {
            let firstIndex = str.index(str.startIndex, offsetBy: index)
            let lastIndex = str.index(str.startIndex, offsetBy: i)

            if str[firstIndex] != str[lastIndex] {
                return false
            }
            index = index + 1
            i = i - 1
        }
        return true
    }
    
    partition(index: 0)
    
    print(arrStr)
}

palindromePartition()

// Rat in a mace
// Time complexity- 4* power(n * m)
// sapce - auxillary space - 0(n * m)
// Make ith array and jth array of di and dj
// if i and j == n-1 append the string and return
// for i to n
//     get nextI and nextJ as i + itharr[i]
//     if check for wall and visited index
//          mark that index as visited arr[i][j] = 1
//          recursion (nextI nextJ and appendStr)
//          unmark that visited index arr[i][j] = 0
func ratInMaze() {
    
    let di = [+1, 0,0 ,-1]
    let dj = [0, -1,1,0]
    var a = [[1,0,0,0],[1,1,0,1],[1,1,0,0],[0,1,1,1]]
    var vis = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
    var n = a.count

    var arrStr = [String]()
    var dir = "DLRU"
    
    func solve(i: Int, j: Int, mov: String) {
        
        if (i == n-1 && j == n-1) {
            arrStr.append(mov)
            return
        }
        
        for ind in 0..<n {
            let nexti = i + di[ind]
            let nextj = j + dj[ind]
            if (nexti >= 0 && nextj >= 0 && nexti < n && nextj < n &&
                    vis[nexti][nextj] == 0 && a[nexti][nextj] == 1) {

                    vis[i][j] = 1
                let lastIndex = dir.index(dir.startIndex, offsetBy: ind)
                let cahrra = dir[lastIndex]
                let mov = mov + "\(cahrra)"
                    solve(i: nexti, j: nextj, mov: mov)
                    vis[i][j] = 0

            }
        }
    }
    
    solve(i: 0, j: 0, mov: "")
    print(arrStr)
}
ratInMaze()


// Kth permutation
// time - O(n2) space- O(n)
// Compute (n-1) fact store till i
// store n in number in arr
// substract k by 1 (17) 17 - 1
// Run infinite loop till arr.count == 0
// Pick first number of permutation
// Remove from arr k / fact
// Get next value of k by modulo
// Reduce fact at every step by dividing by arr.coun

func permutation() {
    
    let n = 4
    var k = 9
    var fact  = 1
    var numbers = [Int]()
    var ans = ""
    
    for i in 1..<n {
        fact = fact * i
        numbers.append(i)
    }
    numbers.append(n)
    k = k - 1
    while(true) {
        let firstNum = k / fact
        ans = ans + "\(numbers[firstNum])"
        numbers.remove(at: firstNum)
        if numbers.count == 0 {
            print(ans)
            return
        }
        k = k % fact
        fact = fact / numbers.count
    }
}

permutation()
