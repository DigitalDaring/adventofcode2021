using Xunit;
using AdventOfCode.models;

namespace bingoboard.Tests;

public class BingoBoardTests
{

    //10, 1, 15, 46, 10, 16, 9, 21, 5, 32, 4 
    BingoBoard testBoard = new BingoBoard(0) {
        RawNumbers = new List<List<int>> { 
            new List<int> {0, 1, 2, 3, 4 },
            new List<int> {9, 10, 11, 12, 13},
            new List<int> {20, 21, 22, 23, 24},
            new List<int> {45, 46, 47, 48, 49},
            new List<int> {31, 32, 33, 34, 35}
            },
        NumbersSoFar = new List<int> { 10, 0, 15, 20, 2, 1, 9, 3, 5, 12, 4 }
    };
    [Fact]
    public void CheckForRowWin_ShouldReturnTrue_WhenRowNumbersIntersect()
    {
        var (didWin, intersect) = testBoard.CheckForRowWin(0);

        Assert.True(didWin);
    }

    [Fact]
    public void CheckForRowWin_ShouldReturnFalse_WhenRowNumbersDontIntersect()
    {
        testBoard.NumbersSoFar = new List<int> { 10, 0, 15, 20, 2, 16, 9, 3, 5, 12, 4 };
        var (didWin, intersect) = testBoard.CheckForRowWin(0);

        Assert.False(didWin);
    }

    [Fact]
    public void CheckForColumnWin_ShouldReturnTrue_WhenRowNumbersIntersect()
    {
        testBoard.NumbersSoFar = new List<int> { 10, 1, 15, 46, 10, 16, 9, 21, 5, 32, 4 };
        var (didWin, intersect) = testBoard.CheckForColumnWin(1);

        Assert.True(didWin);
    }

    [Fact]
    public void CheckForColumnWin_ShouldReturnFalse_WhenRowNumbersDontIntersect()
    {
        testBoard.NumbersSoFar = new List<int> { 10, 1, 15, 46, 10, 16, 9, 21, 5, 33, 4 };
        var (didWin, intersect) = testBoard.CheckForColumnWin(1);

        Assert.False(didWin);
    }

    [Fact]
    public void GetWinningScore_ShouldReturnSumOfAllNonMarkedNumbers()
    {
        testBoard.NumbersSoFar = new List<int> { 10, 1, 15, 46, 10, 16, 9, 21, 5, 4, 32 };
        var winningScore = testBoard.GetWinningScore(32);

        Assert.Equal(14464, winningScore);
    }
}