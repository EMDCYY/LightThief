function rxBits = bpskRx(sps, opticalRate, rxWaveform)

% agc = comm.AGC;
% rcvAGC = agc(rxWaveform); % Perform AGC
% rcvDCFree = rcvAGC - mean(rcvAGC); % Remove the DC offset
% release(agc);

halfSinePulse = sin(0:pi/sps:(sps)*pi/sps);
decimationFactor = 1; % reduce spc to 4, for faster processing
matchedFilter = dsp.FIRDecimator(decimationFactor, halfSinePulse);
filteredBPSK = matchedFilter(rxWaveform); % matched filter output

% Coarse frequency compensation of BPSK signal
coarseFrequencyCompensator = comm.CoarseFrequencyCompensator('Modulation', 'BPSK', ...
      'SampleRate', sps*opticalRate/decimationFactor, 'FrequencyResolution', 1e3);
coarseCompensatedBPSK = coarseFrequencyCompensator(filteredBPSK);


% Fine frequency compensation of BPSK signal
fineFrequencyCompensator = comm.CarrierSynchronizer('Modulation', 'BPSK', 'SamplesPerSymbol', sps/decimationFactor);
fineCompensatedBPSK = fineFrequencyCompensator(coarseCompensatedBPSK);

% Timing recovery of OQPSK signal, via its QPSK-equivalent version
symbolSynchronizer = comm.SymbolSynchronizer('Modulation', 'PAM/PSK/QAM', 'SamplesPerSymbol', sps/decimationFactor);
syncedBPSK = symbolSynchronizer(fineCompensatedBPSK);

rxBits = real(syncedBPSK)>0;

end