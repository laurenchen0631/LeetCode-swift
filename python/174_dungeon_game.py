
"""
If we start from left top, in addition to minimize initial HP required to get (i,j), 
we also have to maximize HP left when we get (i,j) in order to decide whether we need more initial HP in the next step.
It doesn’t directly depend on things at (i-1,j) and (i,j-1).

For example, at some point we have two paths, from left or from up.
Left: min HP required is 1, max HP left is 1
Up: min HP required is 5, max HP left is 100

How do we choose now?
    If we choose smaller min HP required,
    this requirement may increase to 5 later anyway and 95 HP is wasted.
"""
def calculateMinimumHP(dungeon):
    """
    https://leetcode.com/problems/dungeon-game/description/
    :type dungeon: List[List[int]]
    :rtype: int
    """
    if not dungeon or not dungeon[0]:
        return 1
    num_cols = len(dungeon[0])

    # [None, None, 1, None]
    dp = [None] * (num_cols + 1)
    dp[num_cols - 1] = 1

    num_rows = len(dungeon)
    for row in range(num_rows - 1, -1, -1):
        for col in range(num_cols - 1, -1, -1):
            min_health_requirement = min(dp[col], dp[col + 1]) if dp[col] and dp[col + 1] else dp[col] or dp[col + 1]
            dp[col] = max(1, min_health_requirement - dungeon[row][col])
    return dp[0]

calculateMinimumHP(
    [
        [-2, -3, 3],
        [-5, -10, 1],
        [10, 30, -5],
    ]
)