namespace AdventOfCode.models {
    public class BingoBoard {
        public int BoardNumber { get; init; }
        //  Row is first, Column is second
        public List<List<int>> RawNumbers = new List<List<int>>();
        public List<int> NumbersSoFar = new List<int>();
        public int CheckForWin() {
            return -1;
        }

        public (Boolean, List<int>) CheckForRowWin(int rowNumber) {
            var checkIntersect = RawNumbers[rowNumber];
            var intersectedResults = checkIntersect.Intersect(NumbersSoFar.Distinct()).ToList();
            var didWin = intersectedResults.Count() >= 5;
            if(didWin) {
                Console.WriteLine("ROW WON!");
                intersectedResults.ForEach((result) => {
                    Console.Write($"{result}, ");
                });
                Console.Write("\r\n");
            }
            return (didWin, intersectedResults);
        }

        public (Boolean, List<int>) CheckForColumnWin(int columnNumber) {
            var checkIntersect = RawNumbers.Select(row => row[columnNumber]);
            var intersectedResults = checkIntersect.Intersect(NumbersSoFar.Distinct()).ToList();
            var didWin = intersectedResults.Count() >= 5;
            if(didWin) {
                Console.WriteLine("CONSOLE WON!");
                intersectedResults.ForEach((result) => {
                Console.Write($"{result}, ");
            });
            Console.Write("\r\n");
            }
            
            return (didWin, intersectedResults);
        }

        public int GetWinningScore(int winningNumber) {
            var allNumbers = new List<int>();
            RawNumbers.ForEach((row) => {
                allNumbers.AddRange(row);
            });
            var nonWinningNumbers = allNumbers.Where((number) => !NumbersSoFar.Contains(number));
            var sumOfWin = nonWinningNumbers.Sum();
            return sumOfWin * winningNumber;
        }

        public BingoBoard(int myBoardNumber) {
            this.BoardNumber = myBoardNumber;
        }
    }
}