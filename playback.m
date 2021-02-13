
[y,fs]=audioread('ben_trim.wav'); %original file to be edited
%sound(y, fs);
num_samp = round(fs); %no of sample in each second
display(fs);
a=input('please enter speed : ');

speed = a; % increase speed of sound 1.2 times than the given speed.
volume = 1; % increase volume of sound 2 times than the given volume.

y = stretchAudio(volume*y,speed);
%sound(y,fs); % my recommendation is to use sound instead of soundsc

%sound(y, fs);
%soundsc (y, fs*a);
audiowrite('ben_fast.wav',y,fs); %trimming the audio and writing the trimmed version in new file
%[y,fs]=audioread('benscale.wav');
%sound(y, fs);
