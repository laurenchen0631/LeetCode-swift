/*************************************************************************************
 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 
 Note:
 You may assume that nums1 has enough space (size that is greater or equal to m + n) 
 to hold additional elements from nums2. 
 The number of elements initialized in nums1 and nums2 are m and n respectively.
 **************************************************************************************/

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var m = m
    var n = n
    while m > 0, n > 0 {
        if nums1[m - 1] < nums2[n - 1] {
            nums1[m + n - 1] = nums2[n - 1]
            n -= 1
        }
        else {
            nums1[m + n - 1] = nums1[m - 1]
            m -= 1
        }
    }
    
    while n > 0 {
        nums1[n - 1] = nums2[n - 1] // m == 0
        n -= 1
    }
}