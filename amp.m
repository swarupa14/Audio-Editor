ampli = input('Please enter how much you want to raise/decrease the volume: ');    
in_f= 'ben_trim.wav';
[y, fs] = audioread(in_f);
%sound(y,fs);
amp_new = y*ampli;
audiowrite('bensound_amp_high.wav', amp_new, fs);
% clear y fs;
% out_f = 'bensound_amp.wav';
% [y, fs] = audioread(out_f);
%  player = audioplayer (y, fs)
%  play(player);
%sound(y,fs);