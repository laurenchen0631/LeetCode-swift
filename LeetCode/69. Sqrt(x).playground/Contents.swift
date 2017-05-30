/*************************************************************************************
 Implement int sqrt(int x).
 
 Compute and return the square root of x.
 **************************************************************************************/

func mySqrt(_ x: Int) -> Int {
    if x < 2 {
        return x
    }
    var hi = x / 2
    var lo = 0
    var mid = (hi + lo) / 2
    while lo < hi {
        if (mid * mid <= x), ((mid+1) * (mid+1) > x) {
            break
        }
        else if mid * mid < x {
            lo = mid + 1
        }
        else {
            hi = mid - 1
        }
        mid = (hi + lo) / 2
    }
    return mid
}

mySqrt(0)
