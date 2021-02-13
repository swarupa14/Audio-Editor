[y,fs]=audioread('ben_trim.wav'); %original file to be edited
%sound(y, fs);
N=length(y);
display(fs);
nsemitones = input('Change pitch by a factor of : ');
Z = shiftPitch(y,nsemitones);

% sound(Z,fs)

audiowrite('ben_pitch_low.wav', Z, fs);
