function [errorrate] = RecognitionWithError(nBitError)
% Function for recognition with error

testData = GenerateTestData(nBitError);
sizeT = size(testData);
str = [];
success = 0;
for i = 1: sizeT(2) % count number of testdata
    [nIter] = Propagation(testData(i).input);
    [output] = Classification();
    strFormat = ' ';
    vstr = char(strFormat,num2str(i),num2str(nIter));
    if strcmp(output.Name, testData(i).name)
        success = success + 1;
        astr = [vstr(2,:), ': Pass -> Iternation: ', vstr(3,:),' Error: ', num2str(output.Error)];
    else
        astr = [vstr(2,:), ': Fail -> Iternation: ', vstr(3,:),];
    end
    str = char(str, astr);
end
errorrate = 100 - (success*100/sizeT(2));
astr = ['Error rate: ', num2str(errorrate),'%'];
str = char(str, astr);
disp(str);
end