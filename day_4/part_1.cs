using AdventOfCode.models;

namespace AdventOfCode.parts {
    public class Part1 {
        public void run(List<int> allNumbers, List<BingoBoard> allBoards) {
            
            var numbersSoFar = new List<int>();
            var winningNumber = -1;
            var firstBoardToWin = -1;
            var rowOrColumn = "";
            var which = -1;
            var intersect = new List<int>();

            for(int numIdx = 0; numIdx < allNumbers.Count(); numIdx++) {
                var currentNumber = allNumbers[numIdx];
                numbersSoFar.Add(currentNumber);
                if(winningNumber != -1) {
                    break;
                }

                allBoards.ForEach((board) => {
                    for (int i = 0; i < 5; i++) {
                        board.NumbersSoFar = numbersSoFar;
                        var (didColumnWin, columnIntersect) = board.CheckForColumnWin(i);
                        var (didRowWin, rowIntersect) = board.CheckForRowWin(i);
                        if((didColumnWin || didRowWin) && winningNumber == -1) {
                            winningNumber = currentNumber;
                            rowOrColumn = didColumnWin ? "column" : "row";
                            which = i;
                            intersect = didColumnWin ? columnIntersect : rowIntersect;
                            firstBoardToWin = board.BoardNumber;
                            break;
                        }
                    }
                });
            }

            var winningBoard = allBoards.SingleOrDefault(board => board.BoardNumber == firstBoardToWin);
            var winningScore = winningBoard.GetWinningScore(winningNumber);

            // Just some friendly output :-)
            Console.WriteLine($"Board number {firstBoardToWin} won first!");
            Console.WriteLine($"What won? {rowOrColumn} {which}");
            intersect.ForEach((num) => {
                Console.Write($"{num}, ");
            });
            Console.Write("\r\n");
            Console.WriteLine($"Winning number was: {winningNumber}");
            Console.WriteLine("===============");
            winningBoard.RawNumbers.ForEach((row) => {
                row.ForEach((column) => {
                    Console.Write($"{column} | ");
                });
                Console.Write("\r\n");
            });
            Console.WriteLine("===============");
            Console.WriteLine($"Winning score: {winningScore}");
        }
    }
};