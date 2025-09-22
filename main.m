%% PRI Modulation Recognition and Parameter Estimation
%
% Dr. Emrah Onat
% 17.08.2025

clear; clc; close all;

% Parameters
N = 500;                  % Number of pulses per repeat
repeats = 3;              % Repeat pattern multiple times
modulations = {'Constant', 'Sliding', 'Jittered', 'Staggered', 'Wobulated', 'DwellSwitch'};
t = 1:N;

% Loop over each PRI pattern
for i = 1:length(modulations)
    modulation_type = modulations{i};
    
    % Generate base PRI
    switch modulation_type
        case 'Constant'
            PRI_base = ones(1, N) * 1e-3;
            
        case 'Sliding'
            PRI_base = linspace(0.9e-3, 1.1e-3, N);
            
        case 'Jittered'
            PRI_base = 1e-3 + (rand(1, N) - 0.5) * 0.2e-3;
            
        case 'Staggered'
            base = [0.9e-3, 1.1e-3, 1.3e-3];
            PRI_base = base(mod(0:N-1, numel(base)) + 1);
            
        case 'Wobulated'
            PRI_base = 1e-3 + 0.1e-3 * sin(2 * pi * 0.01 * t);
        
        case 'DwellSwitch'
            dwell_len = 50;
            values = [0.9e-3, 1.1e-3, 1.3e-3];
            PRI_base = zeros(1, N);
            for k = 1:N
                blk = floor((k-1)/dwell_len);
                PRI_base(k) = values(mod(blk, numel(values)) + 1);
            end
    end

    % Repeat PRI pattern
    PRI = repmat(PRI_base, 1, repeats);
    pulse_times = cumsum(PRI);
    total_len = length(PRI);

    % Plot repeated PRI sequence
    figure(2*i - 1);
    plot(pulse_times, PRI, 'b');
    xlabel('Time (s)');
    ylabel('PRI (s)');
    title([modulation_type ' - Repeated PRI Sequence']);
    grid on;

end
