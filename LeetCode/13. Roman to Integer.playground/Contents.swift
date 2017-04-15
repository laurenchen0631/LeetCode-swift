/******************************************************************
	Given a roman numeral, convert it to an integer.

	Input is guaranteed to be within the range from 1 to 3999.
********************************************************************/

let ROMAN_SYMBOL: [Character: Int] = [
	"I": 1,
	"V": 5,
	"X": 10,
	"L": 50,
	"C": 100,
	"D": 500,
	"M": 1000
]

func romanToInt(_ s: String) -> Int {
	// MMCDLXXIII = I + I + I + X + X + L + D - C + M + M
	
	var sum = 0
	
	// Add value of each symbol
	let characters = strToArray(str: s)
	for (index, symbol) in characters.enumerated() {
		
		// but if the value of the next symbol is larger than current, subtract it
		let nextSymbolValue = index < characters.count - 1 ?
			ROMAN_SYMBOL[characters[index + 1]]! : 0
		let symbolValue = ROMAN_SYMBOL[symbol]!
		
		if symbolValue < nextSymbolValue {
			sum -= symbolValue
		}
		else {
			sum += symbolValue
		}
	}
	
	return sum
}

func strToArray(str: String) -> [Character] {
	return str.characters.map { $0 }
}

