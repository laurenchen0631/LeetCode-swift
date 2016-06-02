import UIKit

/**
 * Given a string S, find the longest palindromic substring in S.
 * You may assume that the maximum length of S is 1000, and there exists one unique longest palindromic substring.
 */
typealias Index = String.CharacterView.Index

func longestPalindrome(s: String) -> String {
	var maxPalindromicString = String(s[s.startIndex])
	let dict = getCharIndices(s)
	var NIndex = 0
	var index = s.startIndex

	func isPalindrome(start left: Index, end right: Index) -> String? {
		var head = left
		var tail = right
		let n = head.distanceTo(tail)

		if n == 0 {
			return String(s[left])
		}

		for _ in [1 ... n] {
			if s[head] != s[tail] {
				return nil
			}

			head = head.successor()
			tail = tail.predecessor()
		}

		return s[left ... right]
	}

	while NIndex + maxPalindromicString.characters.count < s.characters.count {
		let currentChar = s[index]

//        print(dict[currentChar]!.indexOf(index)!.advancedBy(1)..<dict[currentChar]!.endIndex)
		for i in dict[currentChar]!.indexOf(index)!.advancedBy(1) ..< dict[currentChar]!.endIndex {
			let end = dict[currentChar]![i]
			if index.distanceTo(end) < maxPalindromicString.characters.count {
				continue
			}

			if let palindromeString = isPalindrome(start: index, end: end) {
				maxPalindromicString = palindromeString
			}
		}

		index = index.successor()
		NIndex += 1
	}

	return maxPalindromicString
}

func getCharIndices(s: String) -> [Character: [Index]] {
	var dict: [Character: [Index]] = [:]
	var index = s.startIndex

	for (_, c) in s.characters.enumerate() {
		if let arr = dict[c] {
			dict.updateValue(arr + [index], forKey: c)
		} else {
			dict.updateValue([index], forKey: c)
		}

		index = index.successor()
	}

	return dict
}

/* Dynamic programming solution: O(n^2) O(n^2) */
// If we already knew that “bab” is a palindrome,
// it is obvious that “ababa” must be a palindrome since the two left and right end letters are the same.
func longestPalindromeDP(s: String) -> String {
	let n = s.characters.count
	var longestBegin = 0
	var maxLen = 1
	var table: [[Bool]] = Array(count: n, repeatedValue: Array(count: n, repeatedValue: false))

	for i in 0 ..< n {
		table[i][i] = true
	}

	for i in 0 ..< n - 1 {
		if s[s.startIndex.advancedBy(i)] == s[s.startIndex.advancedBy(i + 1)] {
			table[i][i + 1] = true
			longestBegin = i
			maxLen = 2
		}
	}

	for len in 3 ... n {
		for i in 0 ..< n - len + 1 {
			let j = i + len - 1
			if s[s.startIndex.advancedBy(i)] == s[s.startIndex.advancedBy(j)] && table[i + 1][j - 1] {
				table[i][j] = true;
				longestBegin = i;
				maxLen = len;
			}
		}
	}

	return s.substringWithRange(s.startIndex.advancedBy(longestBegin) ..< s.startIndex.advancedBy(longestBegin + maxLen))
}

/* Simpler Dynamic programming: O(n^2) O(1) */
// Palindrome mirrors around its center.
// Therefore, a palindrome can be expanded from its center,
// and there are only 2N-1 such centers.

// the center of a palindrome can be in between two letters.
// Such palindromes have even number of letters (such as “abba”) and its center are between the two ‘b’s.

// Since expanding a palindrome around its center could take O(N) time,
// the overall complexity is O(N2).

func longestPalindromeSimple(s: String) -> String {
	let n = s.characters.count
	if n < 2 {
		return s
	}

	func expandAroundCenter(c1: Int, c2: Int) -> String {
		var l = c1
		var leftIndex = s.startIndex.advancedBy(c1)
		var r = c2
		var rightIndex = s.startIndex.advancedBy(c2)
		let n = s.characters.count

		while l >= 0 && r <= n - 1 && s[leftIndex] == s[rightIndex] {

			if l > 0 {
				leftIndex = leftIndex.predecessor()
			}
			l = l - 1

			if r < n - 1 {
				rightIndex = rightIndex.successor()
			}
			r += 1

		}

		return s[leftIndex.successor() ..< rightIndex]
	}

	var longest = s[s.startIndex ... s.startIndex.successor()]
	for i in 0 ..< n - 1 {

		let p1 = expandAroundCenter(i, c2: i)
		if p1.characters.count > longest.characters.count {
			longest = p1
		}

		let p2 = expandAroundCenter(i, c2: i + 1)
		if p2.characters.count > longest.characters.count {
			longest = p2
		}
	}

	return longest
}

/* Manacher’s Algorithm: O(2N) */

// Transform S into T.
// For example, S = "abba", T = "^#a#b#b#a#$".
// ^ and $ signs are sentinels appended to each end to avoid bounds checking
func preProcess(s: String) -> String {
	let n = s.characters.count
	if n == 0 {
		return "^$"
	}

	var ret = "^"
	var index = s.startIndex
	for _ in 0 ..< n {
		ret += "#" + String(s[index])
		index = index.successor()
	}

	return ret + "#$"
}

func ManacherAlgorithm(s: String) -> String {
	let T = preProcess(s)
	let n = T.characters.count
	var P: [Int] = Array(count: n, repeatedValue: 0)
	var C = 0
	var R = 0

	var index = T.startIndex.advancedBy(1)
	for i in 1 ..< n - 1 {
		let i_mirror = 2 * C - i // equals to i' = C - (i-C)
		P[i] = R > i ? min(R - i, P[i_mirror]) : 0

		// Attempt to expand palindrome centered at i
		// T[left] == T[right]
		while T[index.advancedBy(1 + P[i])] == T[index.advancedBy(-1 - P[i])] {
			P[i] += 1
		}

		// If palindrome centered at i expand past R,
		// adjust center based on expanded palindrome.
		if i + P[i] > R {
			C = i
			R = i + P[i]
		}

		index = index.successor()
	}

	// Find the maximum element in P.
	var maxLength = 0
	var center = 0

	for i in 1 ..< n - 1 {
		if P[i] > maxLength {
			maxLength = P[i]
			center = i
		}
	}

	let left = s.startIndex.advancedBy((center - 1 - P[center]) / 2)

	return s[left ..< left.advancedBy(maxLength)]
}

// -----------------------------------
let s1 = "civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"

let s2 = "vaomxdtiuwqlwhgutkhxxhccsgvyoaccuicgybnqnslogtqhblegfudagpxfvjdacsxgevvepuwthdtybgflsxjdmmfumyqgpxatvdypjmlapccaxwkuxkilqqgpihyepkilhlfkdrbsefinitdcaghqmhylnixidrygdnzmgubeybczjceiybowglkywrpkfcwpsjbkcpnvfbxnpuqzhotzspgebptnhwevbkcueyzecdrjpbpxemagnwmtwikmkpqluwmvyswvxghajknjxfazshsvjkstkezdlbnkwxawlwkqnxghjzyigkvqpapvsntojnxlmtywdrommoltpbvxwqyijpkirvndwpgufgjelqvwffpuycqfwenhzrbzbdtupyutgccdjyvhptnuhxdwbmdcbpfvxvtfryszhaakwshrjseonfvjrrdefyxefqfvadlwmedpvnozobftnnsutegrtxhwitrwdpfienhdbvvykoynrsbpmzjtotjxbvemgoxreiveakmmbbvbmfbbnyfxwrueswdlxvuelbkrdxlutyukppkzjnmfmclqpkwzyylwlzsvriwomchzzqwqglpflaepoxcnnewzstvegyaowwhgvcwjhbbstvzhhvghigoazbjiikglbqlxlccrwqvyqxpbtpoqjliziwmdkzfsrqtqdkeniulsavsfqsjwnvpprvczcujihoqeanobhlsvbzmgflhykndfydbxatskf"

let s3 = "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

//longestPalindromeDP()
//longestPalindrome(s2)
//longestPalindromeSimple(s2)
ManacherAlgorithm(s3)
