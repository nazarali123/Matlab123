function fft_28_10_16

load TEXT.TXT
data = TEXT(:,:);         %loading all columns and rows from TEXT

Ts = 0.001;               % Sampling period  *
Fs = 1/Ts;                % Sampling frequency
T_measure = 0.05;         % Time spent taking measurements *
L =4*(T_measure/Ts);      % Length of signal
time = 0:Ts:T_measure;    % Time vector


 for n = 4
 treading= data(1 : n: L);  % => 1 5 9 11
 Xreading= data(2 : n: L);  
 Yreading= data(3 : n: L);
 Zreading= data(4 : n: L);
 
 end
 
 
 exit_flag=0;

while (exit_flag == 0)
    
    fprintf('Display data in time and/or frequency domain\n');
    fprintf('1. Time Domain\n');
    fprintf('2. Frequency domain\n');
    fprintf('3. before halving\n');
    fprintf('4. Peak amplitude\n');
%     fprintf('5. Peak frequency\n');
%     fprintf('6. Peak to peak values\n');
%     fprintf('7. Peak amplitude\n');
    fprintf('5. end programme\n');


    choice = input('Please select: ', 's');
     
    switch (choice)
        case '1'
            plotgraph(treading,Xreading)
        case '2'
            plotFFT(Xreading) ;
        case '3'
            %plot(abs(halfX),'k');
            
            %plot(treading, M, '.r')
        case '4'
            %findpeaks(abs(X), 'NPeaks', 2);
            %findpeaks(abs(X), 'MinPeakDistance',5)
        case '5'
            exit_flag=1;
            fprintf('Program ended.\n')
        otherwise
            disp('Invalid entry');
    
        end
end

end

function [treading,Xreading] = plotgraph(treading,Xreading) % plotting 'time' against Xreading
    
    plot(treading, Xreading);
    findpeaks(Xreading, 'NPeaks', 2);
    xlabel('t(ms)'); 
    ylabel('X reading(t)');
 
end
    
    
function [Xreading]=plotFFT(Xreading) % fft plotting frequency domain
    
%     fprintf('%d',length(Xreading));
%     Lt=length(Xreading);       %length of time domain signal
%     Lt2=2^nextpow2(Lt);        %length of signal in the power of 2
%     A = fft(Xreading);         %fast fourier transform
%     halfX=A(1:Lt2/2);          %discards repeated half of the data
    
         nfft=length(Xreading);  %length of time domain signal
         nfft2=2^nextpow2(nfft); %length of signal in the power of 2
         X = fft(Xreading,nfft2);      %fast fourier transform
         plot(abs(X));
%        halfX=X(1:nfft2/2);
%        plot(abs(halfX));
         xlabel('f(Hz)');
         ylabel('X(f)');
  
end