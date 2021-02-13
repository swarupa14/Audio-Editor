% 'bensoundcute.wav' file already exists in the directory
% before writing into it

[y,fs]=audioread('bensoundcutemono.wav'); %original file to be edited
%sound(y, fs);
num_samp = round(fs); %no of sample in each second
display(fs);
a=input('Please enter starting point : ');
b=input('Please enter the stopping point : ');
audiowrite('ben_trim.wav',y((num_samp*(a-1))+1:num_samp*b),fs); %trimming the audio and writing the trimmed version in new file

%[y,fs]=audioread('ben_trim.wav');
%sound(y, fs);