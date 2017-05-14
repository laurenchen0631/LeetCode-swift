def n_queens(n):
    results = []
    place_queen(0, n, {}, {}, {}, [], results)
    return results


def place_queen(level, size, pos_col, pos_sum, pos_diff, queens, results):
    for i in range(size):
        if pos_col.get(i) or pos_sum.get(level + i) or pos_diff.get(level - i):
            continue

        queens.append((level, i))
        if level == size - 1:
            results.append(queens[:])
        else:
            pos_col[i] = pos_sum[level + i] = pos_diff[level - i] = True
            place_queen(
                    level+1, size,
                    pos_col, pos_sum, pos_diff,
                    queens, results)
            pos_col[i] = pos_sum[level + i] = pos_diff[level - i] = False
        queens.pop()
