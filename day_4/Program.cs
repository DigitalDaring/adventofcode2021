// See https://aka.ms/new-console-template for more information
using AdventOfCode.helpers;
using AdventOfCode.parts;

var dataReader = new ReadDataHelper();
var allNumbers = dataReader.GetNumbers();
var allBoards = dataReader.GetBoards();

var partOne = new Part1();
var partTwo = new Part2();

partOne.run(allNumbers, allBoards);
partTwo.run(allNumbers, allBoards);
