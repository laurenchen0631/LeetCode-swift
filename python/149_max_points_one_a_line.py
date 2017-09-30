
from math import gcd

class Point(object):
    def __init__(self, a=0, b=0):
        self.x = a
        self.y = b


def max_points(points):
    """
    Given n points on a 2D plane,
    find the maximum number of points that lie on the same straight line.
    """
    if len(points) < 3:
        return len(points)

    global_max = 0
    for i in range(len(points) - 1):
        local_max = 1
        num_same_point = 0
        num_point_in_vertical = 1
        slope_record = {}
        for j in range(i + 1, len(points)):
            if points[i].x == points[j].x:
                if points[i].y == points[j].y:
                    num_same_point += 1
                else:
                    num_point_in_vertical += 1
            else:
                dy = points[j].y - points[i].y
                dx = points[j].x - points[i].x
                factor = gcd(dy, dx)
                slope = str(dy / factor) + "/" + str(dx / factor)
                slope_record[slope] = slope_record.get(slope, 2) + 1
                local_max = max(slope_record[slope], local_max)
        local_max = max(
            local_max + num_same_point,
            num_same_point + num_point_in_vertical)
        global_max = max(global_max, local_max)
    return global_max


points = [
    Point(1, 1), Point(2,2), Point(-5,-5),
    Point(1, 5), Point(3,4), Point(2,2),
]
max_points(points)
