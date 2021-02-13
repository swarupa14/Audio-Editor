[x,fs]=audioread('ben_trim.wav');
N=length(x);

t=fft(x);
X=fftshift(t);

display('Compress the audio by a percentage of?');
c=input('Please enter a value within a range of 0 to 70%. For compression more than 70% the audio will get distorted) : ');

f=-fs/2:fs/N:(fs/2-fs/N);
% figure(1)
% subplot(2,1,1)
% plot(f,abs(x))
% title('original audio signal')

figure(1)
subplot(2,1,1)
plot(f,abs(X))
title('original audio signal')


start=(N*((c/100)/2))+1;
start=round(start);
stop=N*(1-(c/100)/2);
stop=round(stop);


Y=zeros(1,N);
Y(start:stop)= X(start:stop);   
subplot(2,1,2)
plot(f, abs((Y)));
title('Compressed audio signal')
xlabel('freq(hq)');ylabel('magnitude');


output= real(ifft(fftshift(Y)));%reconstruction
% subplot(2,1,2)
% plot(f, abs((output)));
% title('Compressed audio signal')
% xlabel('freq(hq)');ylabel('magnitude');
%sound(output,fs);
audiowrite('ben_compressed.wav',output,fs);
