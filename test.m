close all;
clear;
clc;

filename = append('./Data/', 'partio_4_1.bin');
readSignalStrength(filename)
decoding(filename)