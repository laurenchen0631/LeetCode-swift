/*************************************************************************************
 Given two non-negative integers num1 and num2 represented as strings, 
 return the product of num1 and num2.
 
 Note:
 
 The length of both num1 and num2 is < 110.
 Both num1 and num2 contains only digits 0-9.
 Both num1 and num2 does not contain any leading zero.
 You must not use any built-in BigInteger library or convert the inputs to integer directly.
 **************************************************************************************/

// "523" x "95412"
// "95412" x "3"
// 0 1 2 3 4 5 6 7
//             0 6, i = 4, j = 2
//           0 3    i = 3, j = 2
//         1 2      i = 2, j = 2
//       1 5        i = 1, j = 2
//     2 7          i = 0, j = 2
// "95412" x "20"
//           0 4    i = 4, j = 1
//         0 2
//  ...

func multiply(_ num1: String, _ num2: String) -> String {
    if num1 == "0" || num2 == "0" {
        return "0"
    }
    
    let numsA: [Character] = Array(num1.characters)
    let numsB: [Character] = Array(num2.characters)
    let m = numsA.count
    let n = numsB.count

    var product: [Int] = Array(repeating: 0, count: m + n)
    for i in stride(from: m - 1, through: 0, by: -1) {
        for j in stride(from: n - 1, through: 0, by: -1) {
            let position = i + j
            let (carry, digit) = digitMultiply(numsA[i], numsB[j], carry: product[position + 1])
            
            product[position] += carry
            product[position + 1] = digit
        }
    }
    
    if product.first! == 0 {
        product.removeFirst()
    }
    return product.map({ String($0) }).joined()
}

func digitMultiply(_ a: Character, _ b: Character, carry: Int) -> (carry: Int, digit: Int) {
    let numA = Int(String(a))!
    let numB = Int(String(b))!
    let sum = numA * numB + carry
    
    return (sum / 10, sum % 10)
}

multiply("123", "99")