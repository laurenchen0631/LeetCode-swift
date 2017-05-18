/*************************************************************************************
 Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).
 
 You may assume that the intervals were initially sorted according to their start times.
 
 Example 1:
 Given intervals [1,3],[6,9], insert and merge [2,5] in as [1,5],[6,9].
 
 Example 2:
 Given [1,2],[3,5],[6,7],[8,10],[12,16], insert and merge [4,9] in as [1,2],[3,10],[12,16].
 
 This is because the new interval [4,9] overlaps with [3,5],[6,7],[8,10].
 **************************************************************************************/

public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
    var inserted: [Interval] = []
    var i = 0
    var length = intervals.count
    
    // put the unaffected interval before newInterval into to ouptut
    while i < length, intervals[i].start <= newInterval.start {
        inserted.append(intervals[i])
        i += 1
    }
    
    // put newInterval into output, there will be 2 cases existing
    // case1: newInterval can be merged with previous interval
    if let tail = inserted.last, newInterval.start <= tail.end {
        tail.end = max(tail.end, newInterval.end)
    }
    // case2: newInterval doesn't overlap with previous interval
    else {
        inserted.append(newInterval)
    }
    
    // if the rest of interval's start is with the range of newInterval, merge it
    while i < length, intervals[i].start <= inserted.last!.end {
        let tail = inserted.last!
        tail.end = max(tail.end, intervals[i].end)
        i += 1
    }
    
    // put the unaffected interval after newInterval into to ouptut
    while i < length {
        inserted.append(intervals[i])
        i += 1
    }
    
    return inserted
}

let x = [Interval(1,2), Interval(6,9)]
insert(x, Interval(2,5))
