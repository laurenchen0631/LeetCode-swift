/*************************************************************************************
 Given a string containing only digits, restore it by returning all possible valid IP address combinations.
 
 For example:
 Given "25525511135",
 
 return ["255.255.11.135", "255.255.111.35"]. (Order does not matter)
 **************************************************************************************/

import Foundation

func restoreIpAddresses(_ s: String) -> [String] {
    guard s.characters.count >= 4 && s.characters.count <= 12 else {
        return []
    }
    
    func isValidate(ip: String) -> Bool {
        if ip.characters.count >= 2 && ip[ip.startIndex] == "0" {
            return false
        }
        else if ip.characters.count == 3 && Int(ip)! > 255 {
            return false
        }
        
        return true
    }
    
    func helper(_ s: String, tmp: inout [String], output result: inout [String]) {
        if tmp.count == 4 {
            result.append(tmp.joined(separator: "."))
            return
        }
        
        let remaining = 4 - tmp.count - 1
        let min_length = s.characters.count - 3 * remaining
        let max_length = s.characters.count - remaining
        
        for n in max(1, min_length) ... min(3, max_length) {
            let toIndex = s.index(s.startIndex, offsetBy: n)
            let ip = s.substring(to: toIndex)
            if !isValidate(ip: ip) {
                return
            }
            tmp.append(ip)
            helper(s.substring(from: toIndex), tmp: &tmp, output: &result)
            tmp.popLast()
        }
    }
    
    var result: [String] = []
    var tmp: [String] = []
    helper(s, tmp: &tmp, output: &result)
    return result
}

restoreIpAddresses("1231231231234")