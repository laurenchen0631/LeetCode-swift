def generate_parentheses(n):
    combinations = []
    generate_parentheses_imp("", n, n, combinations)
    return combinations


def generate_parentheses_imp(parenthese, left, right, combinations):
    # stop when right parenthese is more than left's
    if right < left:
        return

    if left == 0 and right == 0:
        combinations.append(parenthese)
        return

    if left > 0:
        generate_parentheses_imp(parenthese+"(", left-1, right, combinations)
    if right > 0:
        generate_parentheses_imp(parenthese+")", left, right-1, combinations)


print(generate_parentheses(1))
print(generate_parentheses(2))
print(generate_parentheses(3))
