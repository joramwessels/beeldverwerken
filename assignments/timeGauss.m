function T = timeGauss(F, samplesPerSigma, sigmaValues)
    T = [];
    times = zeros(samplesPerSigma, 1);
    for sigma = sigmaValues
        for i = 1:samplesPerSigma
            tic;
            H = imfilter(F, Gauss(sigma), 'conv', 'replicate');
            elapsedTime = toc;
            times(i) = elapsedTime;
        end
        T = [T, mean(times)];
    end
    plot(sigmaValues, T);
    ylabel('time');
    xlabel('sigma');
end