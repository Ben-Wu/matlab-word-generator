%
% Gives random state using probabilities in given markov vector
%
function nextState = randomState(markovVector)

    randomValue = rand;
        
    for row = 1:length(markovVector)
        randomValue = randomValue - markovVector(row);
        if(randomValue <= 0)
             nextState = row;
             break;
        end
    end

end