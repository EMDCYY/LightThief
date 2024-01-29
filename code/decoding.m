function ber = decoding(filename)

sps = 4;
opticalRate = 400e3;
checkPattern = [1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 0; 1];
wholePattern = [1; 1; 0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 0; 1];
dataPattern = [1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 0];

% Reading the complex vector from the file
fid = fopen(filename, 'r');
rawData = fread(fid, [2, inf], 'float32');
fclose(fid);
rxWaveform = complex(rawData(1, :), rawData(2, :));


rxBits = bpskRx(sps, opticalRate, rxWaveform.');
ber = berCal(rxBits, checkPattern, dataPattern);

end

