import fs from 'fs';

const getInputs = (fileName) => {
    try {
        const data = fs.readFileSync(fileName, 'utf8')
        const allLines = data.split('\n');
        return allLines;
      } catch (err) {
        return []
      }
};

const parseLines = (allLines) => {
    return allLines.map(line => {
        const halves = line.split(' -> ');
        let startCoords = halves[0].split(',').map(str => parseInt(str));
        let endCoords = halves[1].split(',').map(str => parseInt(str));
        const isAStraightLine = startCoords[0] === endCoords[0] || startCoords[1] === endCoords[1];
        const changeX = endCoords[0] - startCoords[0];
        const changeY = endCoords[1] - startCoords[1];

        if(isAStraightLine && (changeX < 0 || changeY < 0)) {
            const flipCoords = endCoords;
            endCoords = startCoords;
            startCoords = flipCoords;
        }
        
        return {
            start: startCoords,
            end: endCoords,
            theRun: endCoords[0] - startCoords[0],
            theRise: endCoords[1] - startCoords[1],
            isAStraightLine
        };
    });
};

const convertStraightLinesToArrays = (ventLines) => {
    const arrayResults = ventLines.map(line => {
        const thisArray = [];
        const changingSide = line.theRise === 0 ? 0 : 1;
        const changeAmount = line.theRise === 0 ? line.theRun : line.theRise;

        for (let i = 0; i <= changeAmount; i++) {
            const toAdd = [...line.start];
            toAdd[changingSide] += i;
            thisArray.push(toAdd);
        }
        
        return thisArray;
    });
    return arrayResults;
};

const convertDiagonalLinesToArrays = (ventLines) => {
    const arrayResults = ventLines.map(line => {
        const thisArray = [];

        const amountToChange = Math.abs(line.theRise);
        for(let i = 0; i <= amountToChange; i++) {
            const newPoint = [...line.start];
            const newX = line.theRun < 0 ? newPoint[0] - i : newPoint[0] + i;
            const newY = line.theRise < 0 ? newPoint[1] - i : newPoint[1] + i;
            thisArray.push([newX, newY]);
        }

        return thisArray;
    });
    return arrayResults;
};

export {
    getInputs,
    parseLines,
    convertStraightLinesToArrays,
    convertDiagonalLinesToArrays
}