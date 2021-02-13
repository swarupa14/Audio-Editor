[Y, fs] = audioread('originalsample.wav');
% Y is the audio data, fs is the sampling rate

%Plotting the input in Time Domain
t = linspace(0, length(Y)/fs, length(Y));
figure; 
subplot(2,2,1);
plot(t, Y);
xlabel("Time"); ylabel("Amplitude");
title("Original Audio Signal in Time Domain");

% Apply FFT

N = length(Y);
X = fft(Y, N);

%Plotting it in frequency domain
f = linspace(0, fs, N); 
subplot(2,2,2);
plot(f(1:N/2), X(1:N/2));
xlabel("Frequency"); ylabel("Amplitude");
title("Original Audio Signal in Frequency Domain");


% Zeroing Out Noise
X(1:10) = 0;
for i = 1:length(X)
  if abs(X(i)) < 30
    X(i) = 0;
  end
end

%Plotting modified signal in frequency domain
subplot(2,2,4);
plot(f(1:N/2), X(1:N/2));
xlabel("Frequency"); ylabel("Amplitude");
title("Modified Audio Signal in Frequency Domain (Zeroing Out Noise)");

% Apply IFFT
y_prime = real(ifft(X));
t = linspace(0, length(y_prime), length(y_prime));

%Plotting modified signal in time domain
subplot(2,2,3);
plot(t, y_prime);
xlabel("Time"); ylabel("Amplitude");
title("Modified Audio Signal in Time Domain (Zeroing Out Noise)");

%Saving the audio file
audiowrite( 'denoisedsample.wav', y_prime, fs);

