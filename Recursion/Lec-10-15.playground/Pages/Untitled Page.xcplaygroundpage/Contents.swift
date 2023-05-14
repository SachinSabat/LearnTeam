import UIKit

// Lec-10 subset

// Print all the sum of all the subset
// Time - 2* power(n) * log (2*power(n)) - log condition to sort the array
// Space - 2* power(n)

var emptyArr = [Int]()
var sum = 0
var arr = [3,1,2]

func printAllTheSum(index: Int, emptyArr: inout [Int], sum: inout Int, arr: [Int]) {
    if index == arr.count {
        emptyArr.append(sum)
        print(emptyArr.sorted())
        return
    }
    var suma = sum + arr[index]
    printAllTheSum(index: index + 1, emptyArr: &emptyArr, sum: &suma, arr: arr)
    printAllTheSum(index: index + 1, emptyArr: &emptyArr, sum: &sum, arr: arr)

}

printAllTheSum(index: 0, emptyArr: &emptyArr, sum: &sum, arr: arr)

// Lec 11- print all subset without any duplicate

func printAllSubsetWithDuplicate(index: Int, emptyArr: inout [Int], arr: [Int]) {

    print(emptyArr.sorted())

    for i in index..<arr.count {
        if i != index && arr[i] == arr[i - 1] {continue}
        emptyArr.append(arr[i])
        printAllSubsetWithDuplicate(index: i + 1, emptyArr: &emptyArr, arr: arr)
        emptyArr.removeLast()
    }
}

var emptyArr1 = [Int]()
var arr1 = [1,2,2]
printAllSubsetWithDuplicate(index: 0, emptyArr: &emptyArr1, arr: arr1)

// Lec 12- print all permutations of array and strings
func printAllPermutation(empttArr: inout [Int], emptyDict: inout [[Int: Bool]]) {

    if emptyDict.count == empttArr.count {
        print(empttArr)
        return 
    }

    for i in 0..<emptyDict.count {
        if !emptyDict[i].values.first! {
            emptyDict[i][i + 1] = true
            empttArr.append(contentsOf: emptyDict[i].keys)
            printAllPermutation(empttArr: &empttArr, emptyDict: &emptyDict)
            empttArr.removeLast()
            emptyDict[i][i + 1] = false
        }
    }

}

var emptyArr12 = [Int]()
var arr11 = [[1: false], [2: false], [3: false]]
printAllPermutation(empttArr: &emptyArr12, emptyDict: &arr11)

// Lec 13- print all permutations of array and strings using swap method

func printAllPermutationSwap(index: Int, arr: inout [Int]) {

    if index == arr.count {
        print(arr)
        return
    }

    for i in index..<arr.count  {
        arr.swapAt(i, index)
        printAllPermutationSwap(index: index + 1, arr: &arr)
        arr.swapAt(i, index)
    }

}

var swapArr = [1,2,3]

printAllPermutationSwap(index: 0, arr: &swapArr)

// N-queens Problem

func nQueen(n: Int) {

    var myQueens = [[[String]]]()
    var leftRow = Array(repeating: 0, count: n)
    var lowerDiagonal = Array(repeating: 0, count: (2 * n) - 1)
    var upperDiagonal = Array(repeating: 0, count: (2 * n) - 1)
    var board = Array(repeating: Array(repeating: ".", count: n), count:n)

    func solve(col: Int) {
        if col == n{
            myQueens.append(board)
            return
        }

        for row in 0..<n {
            if leftRow[row] == 0 && lowerDiagonal[col + row] == 0 && upperDiagonal[n-1 + (col - row)] == 0 {
                board[row][col] = "Q"
                leftRow[row] = 1
                lowerDiagonal[col + row] = 1
                upperDiagonal[n-1 + (col - row)] = 1
                solve(col: col + 1)
                board[row][col] = "."
                leftRow[row] = 0
                lowerDiagonal[col + row] = 0
                upperDiagonal[n-1 + (col - row)] = 0
            }
        }
    }

    solve(col: 0)
    for board in myQueens {
        for row in board {
            print(row)
        }
    }

}

nQueen(n: 4)


func sudokuSolver() {
    
    var board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
    
    func solveSudoku(board: inout [[String]]) -> Bool {
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == "." {
                    for c in 1...9 {
                        if isValid(board: &board, row: i, col: j, c: c) {
                            board[i][j] = "\(c)"
                        
                        if solveSudoku(board: &board) {
                            return true
                        } else {
                            board[i][j] = "."
                        }
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    
    func isValid(board: inout [[String]], row: Int, col: Int, c: Int) -> Bool {
        for k in 0..<board.count {
            if board[k][col] == "\(c)" {
                return false
            }
            
            if board[row][k] == "\(c)" {
                return false
            }
            
            if (board[3 * (row / 3) + k / 3][3 * (col / 3) + k % 3] == "\(c)"){
                return false
            }
        }
        return true
    }
    
    solveSudoku(board: &board)
    
    for i in board {
      print(i)
    }
}

sudokuSolver()
