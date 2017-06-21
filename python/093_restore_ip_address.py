def restore(ip_str):
    result = []
    tmp = []
    restore_imp(ip_str, tmp, result)

    return result


def restore_imp(s, tmp, result):
    if len(tmp) == 4:
        result.append(".".join(tmp))
        return

    min_length = len(s) - 3*(4 - len(tmp) - 1)
    max_length = len(s) - (4 - len(tmp) - 1)
    for n in range(max(1, min_length), min(3, max_length) + 1):
        ip = s[:n]
        if not is_validate(ip):
            return
        tmp.append(ip)
        restore_imp(s[n:], tmp, result)
        tmp.pop()


def is_validate(ip):
    if len(ip) >= 2 and ip[0] == "0":
        return False
    elif len(ip) == 3 and int(ip) > 255:
        return False
    return True


print(restore("010010"))
