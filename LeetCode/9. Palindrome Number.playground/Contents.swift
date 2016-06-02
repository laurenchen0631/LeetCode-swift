/* Determine whether an integer is a palindrome. Do this without extra space. */

func isPalindrome(x: Int) -> Bool {
	let num: String = String(x)
	let flag = num.characters.count % 2 == 0 ? num.characters.count / 2: (num.characters.count - 1) / 2
	var end = num.endIndex.predecessor()
	var start = num.startIndex

	for _ in 0 ..< flag {
		if num[start] != num[end] {
			return false
		}
		start = start.successor()
		end = end.predecessor()
	}

	return true
}

isPalindrome(13)