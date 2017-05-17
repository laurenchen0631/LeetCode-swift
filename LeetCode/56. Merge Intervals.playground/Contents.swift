/*************************************************************************************
 Given a collection of intervals, merge all overlapping intervals.
 
 For example,
 Given [1,3],[2,6],[8,10],[15,18],
 return [1,6],[8,10],[15,18].
 **************************************************************************************/


public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

func merge(_ intervals: [Interval]) -> [Interval] {
    guard intervals.count > 0 else {
        return []
    }
    
    let sortedIntervals = intervals.sorted { $0.start < $1.start }
    var mergedIntervals: [Interval] = [sortedIntervals.first!]
    
    for interval in sortedIntervals.dropFirst() {
        let unmerged = mergedIntervals.last!
        if interval.start <= unmerged.end {
            unmerged.end = max(interval.end, unmerged.end)
        }
        else {
            mergedIntervals.append(interval)
        }
    }
    return mergedIntervals
}

let intervals = [Interval(1,3), Interval(2,6), Interval(8,10), Interval(15, 18)]
merge(intervals)
