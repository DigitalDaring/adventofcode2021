import {
    getInputs,
    parseLines,
    convertStraightLinesToArrays,
    convertDiagonalLinesToArrays
} from './helpers.js';

const allLines = getInputs('inputs.txt');
const allVentLines = parseLines(allLines);
const straightVentLines = allVentLines.filter(line => line.isAStraightLine);
const diagonalVentLines = allVentLines.filter(line => !line.isAStraightLine);

const pointsWithStraightVents = convertStraightLinesToArrays(straightVentLines);
const pointsWithDiagonalVents = convertDiagonalLinesToArrays(diagonalVentLines);
const allStraightPoints = pointsWithStraightVents.reduce((acc, cur) => {
    return [...acc, ...cur];
}, []);
const allDiagonalPoints = pointsWithDiagonalVents.reduce((acc, cur) => {
    return [...acc, ...cur];
}, []);

const allPoints = [...allStraightPoints, ...allDiagonalPoints];

const blankMap = [];
for (let i = 0; i < 1000; i++) {
    const blankLine = [];
    for (let j = 0; j < 1000; j++) {
        blankLine.push(0);
    }
    blankMap.push(blankLine);
}

let overlappingPoints = [];

allPoints.forEach(point => {
    const x = point[0];
    const y = point[1];

    blankMap[x][y]+=1;

    if(blankMap[x][y] === 2) {
        overlappingPoints.push([x, y]);
    }
});

console.log(overlappingPoints.length);