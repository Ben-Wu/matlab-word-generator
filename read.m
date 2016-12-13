%[freqMatrix, wordLength, charMap] = readTextFile('huckfinn.txt');

load('huckfinn.mat');

markovMatrix = markovify(freqMatrix);

lengthVector = markovify(wordLength);

text = [];

for j = 1:10

    currentState = 1;
    length = randomState(lengthVector);
    word = [];

    for i = 1:length
        currentState = randomState(markovMatrix(:,currentState));
        word = strcat(word, char(currentState + 'a' - 2));
    end

    text = [text ' ' word];

end