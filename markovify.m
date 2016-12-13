%
% Converts matrix/vector to markov matrix/vector
%
function markovMatrix = markovify(freqMatrix)

    matrixSize = size(freqMatrix);

    markovMatrix = zeros(matrixSize(1),matrixSize(2));

    for col = 1:matrixSize(2)
       
        colSum = sum(freqMatrix(:,col));
        
        for row = 1:matrixSize(1)
            
            if(colSum == 0)
                 markovMatrix(row,col) = 1/matrixSize(1);
            else
                 markovMatrix(row,col) = freqMatrix(row,col)/colSum;
            end
           
        end
        
    end

end