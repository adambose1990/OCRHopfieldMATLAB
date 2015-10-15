function TestWithExemplars(exemplarType)
% funtion for test with trained/untrained exemplar
global Exemplars;

str = [];
for i = 1 : 3 % Count exemplar
    switch exemplarType
        case 'trained'
            j = i;
        case 'untrained'
            j = i + 3;
    end
    Propagation(Exemplars(j).input);
    [output] = Classification();
    if strcmp(output.Name, Exemplars(j).name)
        astr = ['Training set: ' num2str(j), ': Pass'];
    else
        astr = ['Training set: ' num2str(j), ': Untrained'];
    end
    str = char(str, astr);
end
disp(str);
end