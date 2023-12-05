function ber = berCal(rxBits, strPattern, dataPattern)


lgthRx = length(rxBits);
lgthDp = length(dataPattern);

strIdx = strfind(rxBits', strPattern');
strBerCal = strIdx(1) + lgthDp + 2;


num = round((lgthRx-strBerCal)/(lgthDp+6))-2;
errSum = 0;
for ii = 1:1:num
    dataRange =  strBerCal + 5 + (ii-1)*(lgthDp+6): strBerCal + 5 + lgthDp - 1 + (ii-1)*(lgthDp+6);
    dataRx = rxBits(dataRange);
    errSum = errSum + sum(abs(dataRx - dataPattern));
end

ber = errSum / num / lgthDp;

end