/******************************************************************
	'.' Matches any single character.
	'*' Matches zero or more of the preceding element.

	The matching should cover the entire input string (not partial).

	The function prototype should be:
	bool isMatch(const char *s, const char *p)

	Some examples:
	isMatch("aa","a") → false
	isMatch("aa","aa") → true
	isMatch("aaa","aa") → false
	isMatch("aa", "a*") → true
	isMatch("aa", ".*") → true
	isMatch("ab", ".*") → true
	isMatch("aab", "c*a*b") → true
********************************************************************/

struct RegexPattern {
	init(str: String) {
		if str.characters.count == 2 && str.characters.last! == "*" {
			self.optionalMultiple = true
		}
		self.character = str.characters.first!
	}
	
	func match(character: Character) -> Bool {
		if self.character == "." {
			return true
		}
		
		return self.character == character
	}
	
	func isOptionalMultiple() -> Bool {
		return self.optionalMultiple
	}
	
	private var character: Character!
	private var optionalMultiple = false
}

// Is the string matched with the specific regular expression
func isMatch(_ s: String, _ p: String) -> Bool {
	
	// go through the regex pattern from start
	// when one regex pattern doesn't match the coresponding char, return false immediately
	// after every regex is matched and every char has also been matched
	// return true
	return isMatch(characters: s.characters.map{ return $0 }, with: splitRegex(regex: p))
}

func isMatch(characters: [Character], with regexes: [String]) -> Bool {
	
	// base case: every regex is matched and every char has also been matched
	if regexes.count == 0 {
		return characters.count == 0
	}
	
	let symbol = RegexPattern(str: regexes.first!)
	if symbol.isOptionalMultiple() {
		let remainedRegexes = Array(regexes.dropFirst())
		
		// if the regex is optional (match 0 characters)
		if isMatch(characters: characters, with: remainedRegexes) {
			return true
		}
		
		// otherwise try every sub string
		var i = 0
		while i < characters.count, symbol.match(character: characters[i]) {
			if isMatch(characters: Array(characters.dropFirst(i + 1)), with: remainedRegexes) {
				return true
			}
			i += 1
		}
		return false
	}
	// if pattern is single character
	else {
		// no more characters can be matched
		if characters.count == 0 {
			return false
		}
		
		if symbol.match(character: characters.first!) {
			return isMatch(characters: Array(characters.dropFirst()), with: Array(regexes.dropFirst()))
		} else {
			return false
		}
	}
	
	return false
}

// return the formatted regex symbol array
func splitRegex(regex str: String) -> [String] {
	
	var regexSymbols: [String] = []
	
	//put regex symbol into output array
	for c in str.characters {
		// if current char is '*', merge it to the last regex symbol
		if c == "*" {
			regexSymbols[regexSymbols.count - 1] += String(c)
		}
		// otherwise, create a new regex symbol and add it to array
		else {
			regexSymbols.append(String(c))
		}
	} //put regex symbol
	
	return regexSymbols
}



