import {
    getInputs,
    parseLines,
    convertLinesToArrays
} from './helpers.js';

const allLines = getInputs();
const ventLines = parseLines(allLines);
const pointsWithVents = convertLinesToArrays(ventLines);

const allPoints = pointsWithVents.reduce((acc, cur) => {
    return [...acc, ...cur];
}, []);

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

overlappingPoints.forEach(overlap => {
    const x = overlap[0];
    const y = overlap[1];
    var total = blankMap[x][y];
    console.log(`${x}, ${y} : ${total}\r\n`);
});

console.log(overlappingPoints.length);