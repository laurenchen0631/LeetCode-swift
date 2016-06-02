// : Playground - noun: a place where people can play

import UIKit

/**
 * Implement atoi to convert a string to an integer.
 * Hint: Carefully consider all possible input cases.
 * If you want a challenge, please do not see below and ask yourself what are the possible input cases.
 * Notes: It is intended for this problem to be specified vaguely (ie, no given input specs).
 * You are responsible to gather all the input requirements up front.
 */

// Int Max: 2147483647
// Int Min: -2147483648
func myAtoi(str: String) -> Int {
	let str = str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
	if str.isEmpty {
		return 0
	}

	let firstChar = str[str.startIndex]
	if (firstChar != "+" && firstChar != "-" && firstChar != " ") && (firstChar < "0" || firstChar > "9") {
		return 0
	}

	var endNIndex = 1
	for s in str.substringFromIndex(str.startIndex.successor()).characters {
		if (s >= "0" && s <= "9") {
			endNIndex += 1
		} else {
			endNIndex -= 1
			break
		}
	}
	print(endNIndex)

//	if (firstChar == "+" || firstChar == "-") && endNIndex > 10 {
//		endNIndex = 11
//	} else if endNIndex > 10 {
//		endNIndex = 10
//	} else
	if endNIndex >= str.characters.count {
		endNIndex -= 1
	} else if endNIndex < 0 {
		endNIndex = 0
	}

	let numString = Int(str[str.startIndex ... str.startIndex.advancedBy(endNIndex)])
	if numString == nil {
		if endNIndex > 1 && firstChar == "-" {
			return -2147483648
		} else if endNIndex > 1 {
			return 2147483647
		}

		return 0
	} else {
		print(numString)
		if numString! > 2147483647 {
			return 2147483647
		} else if numString! < -2147483648 {
			return -2147483648
		}
		return numString!
	}
}

let s1 = "-2147483647"
let s2 = "-11919730356x"
let s3 = "9223372036854775809"
myAtoi(s3)

//Int("-3213213213213213213213213321321")
