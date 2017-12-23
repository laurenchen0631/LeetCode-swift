def maximum_gap(nums):
    if not nums or len(nums) < 2:
        return 0

    max_num = max(nums)
    min_num = min(nums)
    gap = max((max_num - min_num) // (len(nums) - 1), 1)
    num_buckets = (max_num - min_num) // gap + 1
    print(gap, num_buckets)
    buckets_min = [None for _ in range(num_buckets)]
    buckets_max = [None for _ in range(num_buckets)]

    for num in nums:
        index = (num - min_num) // gap
        buckets_max[index] = max(buckets_max[index] or min_num, num)
        buckets_min[index] = min(buckets_min[index] or max_num, num)
    print(buckets_max)
    print(buckets_min)

    max_gap = 0
    prev_min = min_num
    for i in range(num_buckets):
        if buckets_min[i]:
            max_gap = max(max_gap, buckets_min[i] - prev_min)
        if buckets_max[i]:
            prev_min = buckets_max[i]
    return max_gap

print(maximum_gap([1,2,5,6,9,10]))
