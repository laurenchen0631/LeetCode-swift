// : Playground - noun: a place where people can play

import UIKit

/**
 * The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this:
 * P   A   H   N
 * A P L S I I G
 * Y   I   R
 *
 * And then read line by line: "PAHNAPLSIIGYIR"
 *
 */
// gap = 6

// row = 3

// 0 1 2 3 4 5 6 7 8 9 0 1 2 3
// 0 1 2 1 0 1 2 1 0 1 2 1 0 1
// P A Y P A L I S H I R I N G
"PAHNAPLSIIGYIR"

// P   I   N   0      6      12
// A L S I G   1  5   7  11  13
// Y A H R     2  4   8  10
// P   I       3      9

// rows = 4

// 0 1 2 3 4 5
// 0 1 2 3 2 1 0 1 2 3 2 1 0 1
// P A Y P A L I S H I R I N G

"PINALSIGYAHRPI"

// P   H       0      8
// A S I       1  7   9
// Y I R G     2  6  10
// P L I       3  5  11  13
// A   N       4     12

// 0 1 1 0

func convert(s: String, rows numRows: Int) -> String {

	// Make Sure that numRows is legal
	if numRows == 0 {
		return ""
	} else if numRows == 1 {
		return s
	}

	// store the characher index into its row
	let n = s.characters.count
	var rows: [[String.CharacterView.Index]] = Array(repeating: [], count: numRows)
    
	var shouldReverse = false
	var r = 0
	var index = s.startIndex
	for _ in 0 ..< n {
		rows[r] += [index]
        index  = s.index(after: index)
        
        // ZigZg order
		if r == numRows - 1 {
			shouldReverse = true
		} else if r == 0 {
			shouldReverse = false
		}

		if shouldReverse {
			r -= 1
		} else {
			r += 1
		}
	}

	var str = ""
	for row in rows {
		for index in row {
			str += String(s[index])
		}
	}

	return str
}
// P P A S
// A Y L I

convert(s: "PAYPALISHIRING", rows: 2)
