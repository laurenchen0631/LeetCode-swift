/******************************************************************
	Given an integer, convert it to a roman numeral.
	Input is guaranteed to be within the range from 1 to 3999.
********************************************************************/


let ROMAN_NUMERAL: [Int: String] = [
	0: "", // special case
	1: "I", 2: "II", 3: "III", 4: "IV",
	5: "V", 6: "VI", 7: "VII", 8: "VIII", 9: "IX",
	10: "X", 20: "XX", 30: "XXX", 40: "XL",
	50: "L", 60: "LX", 70: "LXX", 80: "LXXX", 90: "XC",
	100: "C", 200: "CC", 300: "CCC", 400: "CD",
	500: "D", 600: "DC", 700: "DCC", 800: "DCCC", 900: "CM",
	1000: "M", 2000: "MM", 3000: "MMM"
]

func intToRoman(_ num: Int) -> String {
	
	var romanNumeral = ""
	
	// splice the number into sum of each digital value, e.g. 321 = 300 + 20 + 1
	spliceByDigital(num: num).forEach {
		(digitalValue) in
		// fetch the roman numeral symbol of the digital value from data
		// combine the roman numeral symbol
		romanNumeral = ROMAN_NUMERAL[digitalValue]! + romanNumeral
	}

	return romanNumeral
	
}

// 1432 = 1000 + 400 + 30 + 2
func spliceByDigital(num: Int) -> [Int] {
	var digitalValues: [Int] = []
	
	var digitalUnit = 10
	var splitNum = num
	while (splitNum != 0) {
		let digitalValue = splitNum % digitalUnit
		digitalValues.append(digitalValue)
		
		splitNum -= digitalValue
		digitalUnit *= 10
	}
	
	return digitalValues
}

print(intToRoman(10))
