/*************************************************************************************
 The count-and-say sequence is the sequence of integers beginning as follows:
 1, 11, 21, 1211, 111221, ...
 
 1 is read off as "one 1" or 11.
 11 is read off as "two 1s" or 21.
 21 is read off as "one 2, then one 1" or 1211.
 Given an integer n, generate the nth sequence.
 
 Note: The sequence of integers will be represented as a string.
 **************************************************************************************/


func countAndSay(_ n: Int) -> String {
    var sequence = "1"
    if n <= 1 {
        return sequence
    }
    
    for _ in 0 ..< n - 1 {
        var count: Int = 0
        var prev = sequence.characters.first!
        var say = ""
        
        for c in sequence.characters {
            if c == prev {
                count += 1
            }
            else {
                say.append(String(count))
                say.append(prev)
                
                prev = c
                count = 1
            }
        }
        say.append(String(count))
        say.append(prev)
        
        sequence = say
    }
    
    return sequence
}

countAndSay(6)