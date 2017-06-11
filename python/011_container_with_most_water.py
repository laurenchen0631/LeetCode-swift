def max_area(height):
    left = 0
    right = len(height) - 1
    max_area = 0
    while left < right:
        if height[left] < height[right]:
            area = (right - left) * height[left]
            if area > max_area:
                max_area = area
            left += 1
        else:
            area = (right - left) * height[right]
            if area > max_area:
                max_area = area
            right -= 1
    return max_area


print(max_area([1,2,1,1,1,1,2,1]))
