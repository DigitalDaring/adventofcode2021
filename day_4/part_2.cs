using AdventOfCode.models;

namespace AdventOfCode.parts {
    public class Part2 {
        public void run(List<int> allNumbers, List<BingoBoard> allBoards) {
            
            var numbersSoFar = new List<int>();
            var allWinningBoards = new List<(BingoBoard, int)>();

            for(int numIdx = 0; numIdx < allNumbers.Count(); numIdx++) {

                if (allWinningBoards.Count() == allBoards.Count()) {
                    break;
                }

                var currentNumber = allNumbers[numIdx];
                numbersSoFar.Add(currentNumber);

                allBoards.ForEach((board) => {
                    if (!allWinningBoards.Select((boards) => boards.Item1).Contains(board)) {
                        for (int i = 0; i < 5; i++) {
                            board.NumbersSoFar = numbersSoFar;
                            var (didColumnWin, columnIntersect) = board.CheckForColumnWin(i);
                            var (didRowWin, rowIntersect) = board.CheckForRowWin(i);
                            if((didColumnWin || didRowWin)) {
                                allWinningBoards.Add((board, currentNumber));
                                break;
                            }
                        }
                    }
                });
            }

            Console.WriteLine($"Found {allWinningBoards.Count()} winning boards out of {allBoards.Count()}");
            var (lastWinningBoard, lastWinningNumber) = allWinningBoards[allWinningBoards.Count()-1];
            var winningScore = lastWinningBoard.GetWinningScore(lastWinningNumber);

            // Just some friendly output :-)
            Console.WriteLine($"Last winning board was: {lastWinningBoard.BoardNumber}");
            Console.WriteLine($"Winning number was: {lastWinningNumber}");
            Console.WriteLine("===============");
            Console.WriteLine($"Last Winning score: {winningScore}");
        }
    }
};