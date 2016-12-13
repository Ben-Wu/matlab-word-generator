function [freqMatrix, wordLength, charMap] = readTextFile(filepath)

    wordLength = [];

    charMap = containers.Map({'a'}, 1);

    for c = 'A' : 'Z'

        value = c - 'A' + 2;

        charMap(c) = value;
        charMap(char(c+32)) = value;

    end
    
    charMap(' ') = 1;


    fileID = fopen(filepath,'r');

    A = fscanf(fileID,'%c');

    fclose(fileID);
    
    freqMatrix = zeros(27,27);

    lengthCounter = 0;
    
    for i = 1:length(A) 

        currentChar = A(i);

        if(currentChar == ' ')
            if(lengthCounter > 0)
                if(length(wordLength) < lengthCounter) 
                    wordLength(lengthCounter, 1) = 1;
                else
                    wordLength(lengthCounter, 1) = wordLength(lengthCounter, 1) + 1;
                end
                lengthCounter = 0;
            end
            clear lastChar;

        elseif(~(currentChar < 'A' || (currentChar > 'Z' && currentChar < 'a') || currentChar > 'z'))

            if(exist('lastChar', 'var'))
                freqMatrix(charMap(currentChar), charMap(lastChar)) = freqMatrix(charMap(currentChar), charMap(lastChar)) + 1;
            else
                freqMatrix(charMap(currentChar), charMap(' ')) = freqMatrix(charMap(currentChar), charMap(' ')) + 1;
            end
            lengthCounter = lengthCounter + 1;
            lastChar = currentChar;
        end

    end