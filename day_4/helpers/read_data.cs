using System.Collections.Generic;
using AdventOfCode.models;

namespace AdventOfCode.helpers {
    public class ReadDataHelper {

        public List<int> GetNumbers(){
            var allText = System.IO.File.ReadAllText("./numbers.txt");
            var allNumbers = allText.Split(",").Select(word => int.Parse(word)).ToList();
            return allNumbers;
        }

        public List<BingoBoard> GetBoards() {
            var allLines = System.IO.File.ReadAllLines("./boards.txt").ToList();
            var allBoards = new List<BingoBoard>();
            var currentBoardNumber = 0;
            var currentBoard = new BingoBoard(currentBoardNumber);
            
            allLines.ForEach((line) => {
                // empty line = new board
                if (line.Trim() == "") {
                    allBoards.Add(currentBoard);
                    currentBoardNumber++;
                    currentBoard = new BingoBoard(currentBoardNumber);
                } else {
                    var allNumbers = line.Split(" ").Where(text => text.Trim() != "").Select(text => int.Parse(text));
                    currentBoard.RawNumbers.Add(allNumbers.ToList());
                }
            });
            return allBoards;
        }

    }
}
