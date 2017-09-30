/*************************************************************************************
 Evaluate the value of an arithmetic expression in Reverse Polish Notation.
 
 Valid operators are +, -, *, /. Each operand may be an integer or another expression.
 
 Some examples:
 ["2", "1", "+", "3", "*"] -> ((2 + 1) * 3) -> 9
 ["4", "13", "5", "/", "+"] -> (4 + (13 / 5)) -> 6
 **************************************************************************************/


func evalRPN(_ tokens: [String]) -> Int {
    var stack: [Int] = []
    for symbol in tokens {
        switch symbol {
        case "+":
            let a = stack.popLast()!
            let b = stack.popLast()!
            stack.append(a + b)
        case "*":
            let a = stack.popLast()!
            let b = stack.popLast()!
            stack.append(a * b)
        case "-":
            let b = stack.popLast()!
            let a = stack.popLast()!
            stack.append(a - b)
        case "/":
            let b = stack.popLast()!
            let a = stack.popLast()!
            stack.append(a / b)
        default:
            stack.append(Int(symbol)!)
        }
    }
    
    return stack.popLast()!
}


evalRPN(["2", "1", "+", "3", "*"])
