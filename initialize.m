% Create character to number map

charMap = containers.Map({'a'}, 1);

for c = 'A' : 'Z'
   
    value = c - 'A' + 1;
    
    charMap(c) = value;
    charMap(char(c+32)) = value;
  
end

% Create empty frequency matrix

freqMatrix = zeros(26,26);