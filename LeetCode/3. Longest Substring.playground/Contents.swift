// : Playground - noun: a place where people can play

import UIKit

/**
 * Given a string, find the length of the longest substring without repeating characters.
 * Examples:
 * Given "abcabcbb", the answer is "abc", which the length is 3.
 * Given "bbbbb", the answer is "b", with the length of 1.
 * Given "pwwkew", the answer is "wke", with the length of 3.
 * Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

/* Sliding Window O(2n) O(min(m, n)) */
// If a substring Sij rom index i to j - 1 is already checked to have no duplicate characters.
// We only need to check if Sj is already in the substring Sij

// The size of the Set is upper bounded by the size of the string n and the size of the charset/alphabet m.
func lengthOfLongestSubstring(s: String) -> Int {
	let sLength = s.count
	var substringLength = 0
	var maxLength = 0
	var headNIndex = 0
	var record = Set<Character>()

	var tailIndex = s.startIndex
	var headIndex = s.startIndex

	while headNIndex + maxLength < sLength {
		let char = s[tailIndex]

		if record.contains(char) {
			substringLength -= 1

			record.remove(s[headIndex])
			headNIndex += 1
			headIndex = s.index(after: headIndex)
		} else {
			substringLength += 1
			record.insert(char)
            tailIndex = s.index(after: tailIndex)
		}

		if substringLength >= maxLength {
			maxLength = substringLength
		}

	}

	return maxLength
}

/* Sliding Window Optimized */
// Instead of using a set to tell if a character exists or not,
// we could define a mapping of the characters to its index.
// Then we can skip the characters immediately when we found a repeated character.

let string = "aacdaadcff"
print(lengthOfLongestSubstring(s: string))
