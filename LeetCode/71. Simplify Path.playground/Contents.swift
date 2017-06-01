/*************************************************************************************
 Given an absolute path for a file (Unix-style), simplify it.
 
 For example,
 path = "/home/", => "/home"
 path = "/a/./b/../../c/", => "/c"
 **************************************************************************************/

func simplifyPath(_ path: String) -> String {
    var dirs: [String] = []
    let paths = path.characters.split(separator: "/").map {String($0)}
    for dir in paths {
        if dir == ".." {
            if dirs.count > 0 {
                dirs.popLast()
            }
        }
        else if dir == "." || dir == "" {
            continue
        }
        else {
            dirs.append(dir)
        }
    }
    
    return "/" + dirs.joined(separator: "/")
}
