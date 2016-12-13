count = zeros(26,1);

for i = 1:100000
    
    val = randomNextState(markovMatrix,1);
    
    count(val) = count(val) + 1;
    
end

bar(count)