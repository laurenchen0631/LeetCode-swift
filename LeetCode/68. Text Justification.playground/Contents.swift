/*************************************************************************************
 Given an array of words and a length L, 
 format the text such that each line has exactly L characters and is fully (left and right) justified.
 
 You should pack your words in a greedy approach; that is, pack as many words as you can in each line. 
 Pad extra spaces ' ' when necessary so that each line has exactly L characters.
 
 Extra spaces between words should be distributed as evenly as possible. 
 If the number of spaces on a line do not divide evenly between words, 
 the empty slots on the left will be assigned more spaces than the slots on the right.
 
 For the last line of text, it should be left justified and no extra space is inserted between words.
 
 For example,
 words: ["This", "is", "an", "example", "of", "text", "justification."]
 L: 16.
 
 Return the formatted lines as:
 [
 "This    is    an",
 "example  of text",
 "justification.  "
 ]
 Note: Each word is guaranteed not to exceed L in length.
 **************************************************************************************/

func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
    var output: [String] = []
    var wordsInLine: [String] = []
    var lengthInLine = -1
    for word in words {
        // the line can't contain next word
        if lengthInLine + 1 + word.characters.count > maxWidth {
            let unfilledSpaces = maxWidth - lengthInLine
            var s = wordsInLine.first!
            
            // only one word in a line, left justified
            if wordsInLine.count == 1 {
                s.append(nSpace(n: unfilledSpaces))
            }
            else {
                var extraSpace = unfilledSpaces % (wordsInLine.count - 1)
                let sharedSpace = unfilledSpaces / (wordsInLine.count - 1)
                for i in 1 ..< wordsInLine.count {
                    if extraSpace > 0 {
                        s.append(" ")
                        extraSpace -= 1
                    }
                    s.append(nSpace(n: sharedSpace + 1))
                    s.append(wordsInLine[i])
                }
            }
            output.append(s)
            wordsInLine = []
            lengthInLine = -1
        }
        wordsInLine.append(word)
        lengthInLine += (1 + word.characters.count)
    }
    
    if lengthInLine == -1 {
        return output
    }
    // process last line (it can't be empty, because we pushed word even if it's last word)
    let unfilledSpaces = maxWidth - lengthInLine
    let s = wordsInLine.joined(separator: " ") + nSpace(n: unfilledSpaces)
    output.append(s)
    
    return output
}

func nSpace(n: Int) -> String {
    let spaces = Array(repeating: " ", count: n)
    return spaces.joined()
}

let words = ["This", "is", "an", "example", "of", "text", "justification."]
for sentence in fullJustify(words, 16) {
    print(sentence)
}