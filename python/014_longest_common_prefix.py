def longest_common_prefix(strs):
    if len(strs) == 0:
        return ""
    elif len(strs) == 1:
        return strs[0]

    strs.sort()
    common_end_index = 0
    for i in range(len(strs[0])):
        if strs[0][i] == strs[-1][i]:
            common_end_index += 1
        else:
            break
    return strs[0][:common_end_index]


print(longest_common_prefix(["asdqewwq", "asdqcxzcqe", "asdq123", "as"]))
