def next_permutation(nums):
    permute_from = 0
    for i in reversed(range(len(nums) - 1)):
        if nums[i] < nums[i + 1]:
            permute_from = i
            break

    # 5 2 4 3 1 -> 5 3 1 2 4
    predecessor = 0
    for i in reversed(range(permute_from+1, len(nums))):
        if nums[i] > nums[permute_from]:
            predecessor = i
            break

    if predecessor == permute_from:
        nums.reverse()
        return

    nums[permute_from], nums[predecessor] = (
        nums[predecessor], nums[permute_from])
    nums[permute_from+1:] = reversed(nums[permute_from+1:])


a = [1, 5, 4, 3, 2]
while a != [5, 4, 3, 2, 1]:
    next_permutation(a)
    print(a)
