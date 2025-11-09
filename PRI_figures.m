%% PRI Modulation Recognition and Parameter Estimation
%
%
% Interacting Multiple Model Kalman Filters for Pulse Repetition Interval 
% Value Estimation and Modulation Recognition in Electronic Warfare Systems
%
%
% Dr. Emrah Onat
% 08.11.2025


function [output] = PRI_figures(missing_prob)

    output = 1;
    
    load('params_IMMKF1.mat');
    params_IMMKF_1 = params_IMMKF;
    load('params_IMMKF2.mat');
    params_IMMKF_2 = params_IMMKF;
    load('params_IMMKF3.mat');
    params_IMMKF_3 = params_IMMKF;
    load('params_IMMKF4.mat');
    params_IMMKF_4 = params_IMMKF;
    load('params_IMMKF5.mat');
    params_IMMKF_5 = params_IMMKF;
    load('params_IMMKF6.mat');
    params_IMMKF_6 = params_IMMKF;
    
    %% PRI Modulation Accuracy
    missing_prob = 0:0.05:0.25;
    figure;
    plot(missing_prob,params_IMMKF_1.accuracy_IMMmean_miss);
    hold on;plot(missing_prob,params_IMMKF_2.accuracy_IMMmean_miss,'r');
    hold on;plot(missing_prob,params_IMMKF_3.accuracy_IMMmean_miss,'k');
    hold on;plot(missing_prob,params_IMMKF_4.accuracy_IMMmean_miss,'g');
    hold on;plot(missing_prob,params_IMMKF_5.accuracy_IMMmean_miss,'m');
    hold on;plot(missing_prob,params_IMMKF_6.accuracy_IMMmean_miss,'y');
    xlabel('Missin Probability');
    ylabel('Accuracy');
    title('IMMKF Modulation Recognition Accuracies');
    grid on;
    legend('Constant', 'Dwell_switch','Staggered', 'Jittered', 'Sliding', 'Wobulated');
    
    %% PRI Modulation Accuracy with Std
    figure;
    errorbar(missing_prob, params_IMMKF_1.accuracy_IMMmean_miss, params_IMMKF_1.accuracy_IMMstd_miss, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_2.accuracy_IMMmean_miss, params_IMMKF_2.accuracy_IMMstd_miss, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_3.accuracy_IMMmean_miss, params_IMMKF_3.accuracy_IMMstd_miss, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_4.accuracy_IMMmean_miss, params_IMMKF_4.accuracy_IMMstd_miss, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_5.accuracy_IMMmean_miss, params_IMMKF_5.accuracy_IMMstd_miss, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_6.accuracy_IMMmean_miss, params_IMMKF_6.accuracy_IMMstd_miss, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8);
    xlabel('Missin Probability');
    ylabel('Accuracy');
    title('IMMKF Modulation Recognition Accuracies');
    grid on;
    legend('Constant', 'Dwell_switch','Staggered', 'Jittered', 'Sliding', 'Wobulated');

    mean_Accmean_IMM = (params_IMMKF_1.accuracy_IMMmean_miss+params_IMMKF_2.accuracy_IMMmean_miss+params_IMMKF_3.accuracy_IMMmean_miss+params_IMMKF_4.accuracy_IMMmean_miss+params_IMMKF_5.accuracy_IMMmean_miss+params_IMMKF_6.accuracy_IMMmean_miss)/6;
    mean_Accstd_IMM = (params_IMMKF_1.accuracy_IMMstd_miss+params_IMMKF_2.accuracy_IMMstd_miss+params_IMMKF_3.accuracy_IMMstd_miss+params_IMMKF_4.accuracy_IMMstd_miss+params_IMMKF_5.accuracy_IMMstd_miss+params_IMMKF_6.accuracy_IMMstd_miss)/6;
    figure;
    errorbar(missing_prob, mean_Accmean_IMM, mean_Accstd_IMM, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8);
    xlabel('Missin Probability');
    ylabel('Accuracy');
    title('IMMKF Modulation Recognition Accuracies - ALL');
    grid on;

    %% PRI Value RMSE
    figure;
    errorbar(missing_prob, params_IMMKF_1.RMSE_IMMmean_miss, params_IMMKF_1.RMSE_IMMstd_miss, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_1.RMSE_RLSmean_miss, params_IMMKF_1.RMSE_RLSstd_miss, '*-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_1.RMSE_HISTmean_miss, params_IMMKF_1.RMSE_HISTmean_miss, '+-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8);
    xlabel('Missing Pulse Rate');
    ylabel('RMSE');
    title('RMSE vs Missing Pulse Rate - Constant');
    grid on;
    
    figure;
    errorbar(missing_prob, params_IMMKF_2.RMSE_IMMmean_miss, params_IMMKF_2.RMSE_IMMstd_miss, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_2.RMSE_RLSmean_miss, params_IMMKF_2.RMSE_RLSstd_miss, '*-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_2.RMSE_HISTmean_miss, params_IMMKF_2.RMSE_HISTmean_miss, '+-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8);
    xlabel('Missing Pulse Rate');
    ylabel('RMSE');
    title('RMSE vs Missing Pulse Rate - DS');
    grid on;
    
    figure;
    errorbar(missing_prob, params_IMMKF_3.RMSE_IMMmean_miss, params_IMMKF_3.RMSE_IMMstd_miss, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_3.RMSE_RLSmean_miss, params_IMMKF_3.RMSE_RLSstd_miss, '*-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_3.RMSE_HISTmean_miss, params_IMMKF_3.RMSE_HISTmean_miss, '+-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8);
    xlabel('Missing Pulse Rate');
    ylabel('RMSE');
    title('RMSE vs Missing Pulse Rate - staggered');
    grid on;
    
    figure;
    errorbar(missing_prob, params_IMMKF_4.RMSE_IMMmean_miss, params_IMMKF_4.RMSE_IMMstd_miss, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_4.RMSE_RLSmean_miss, params_IMMKF_4.RMSE_RLSstd_miss, '*-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_4.RMSE_HISTmean_miss, params_IMMKF_4.RMSE_HISTmean_miss, '+-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8);
    xlabel('Missing Pulse Rate');
    ylabel('RMSE');
    title('RMSE vs Missing Pulse Rate - jittered');
    grid on;
    
        
    figure;
    errorbar(missing_prob, params_IMMKF_5.RMSE_IMMmean_miss, params_IMMKF_5.RMSE_IMMstd_miss, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_5.RMSE_RLSmean_miss, params_IMMKF_5.RMSE_RLSstd_miss, '*-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_5.RMSE_HISTmean_miss, params_IMMKF_5.RMSE_HISTmean_miss, '+-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8);
    xlabel('Missing Pulse Rate');
    ylabel('RMSE');
    title('RMSE vs Missing Pulse Rate - Sliding');
    grid on;
    
    figure;
    errorbar(missing_prob, params_IMMKF_6.RMSE_IMMmean_miss, params_IMMKF_6.RMSE_IMMstd_miss, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_6.RMSE_RLSmean_miss, params_IMMKF_6.RMSE_RLSstd_miss, '*-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, params_IMMKF_6.RMSE_HISTmean_miss, params_IMMKF_6.RMSE_HISTmean_miss, '+-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8);
    xlabel('Missing Pulse Rate');
    ylabel('RMSE');
    title('RMSE vs Missing Pulse Rate - Wobulated');
    grid on;


    %% Sum of all RMSE Values
    mean_RMSEmean_IMM = (params_IMMKF_1.RMSE_IMMmean_miss+params_IMMKF_2.RMSE_IMMmean_miss+params_IMMKF_3.RMSE_IMMmean_miss+params_IMMKF_4.RMSE_IMMmean_miss+params_IMMKF_5.RMSE_IMMmean_miss+params_IMMKF_6.RMSE_IMMmean_miss)/6;
    mean_RMSEstd_IMM = (params_IMMKF_1.RMSE_IMMstd_miss+params_IMMKF_2.RMSE_IMMstd_miss+params_IMMKF_3.RMSE_IMMstd_miss+params_IMMKF_4.RMSE_IMMstd_miss+params_IMMKF_5.RMSE_IMMstd_miss+params_IMMKF_6.RMSE_IMMstd_miss)/6;

    mean_RMSEmean_RLS = (params_IMMKF_1.RMSE_RLSmean_miss+params_IMMKF_2.RMSE_RLSmean_miss+params_IMMKF_3.RMSE_RLSmean_miss+params_IMMKF_4.RMSE_RLSmean_miss+params_IMMKF_5.RMSE_RLSmean_miss+params_IMMKF_6.RMSE_RLSmean_miss)/6;
    mean_RMSEstd_RLS = (params_IMMKF_1.RMSE_RLSstd_miss+params_IMMKF_2.RMSE_RLSstd_miss+params_IMMKF_3.RMSE_RLSstd_miss+params_IMMKF_4.RMSE_RLSstd_miss+params_IMMKF_5.RMSE_RLSstd_miss+params_IMMKF_6.RMSE_RLSstd_miss)/6;

    mean_RMSEmean_HIST = (params_IMMKF_1.RMSE_HISTmean_miss+params_IMMKF_2.RMSE_HISTmean_miss+params_IMMKF_3.RMSE_HISTmean_miss+params_IMMKF_4.RMSE_HISTmean_miss+params_IMMKF_5.RMSE_HISTmean_miss+params_IMMKF_6.RMSE_HISTmean_miss)/6;
    mean_RMSEstd_HIST = (params_IMMKF_1.RMSE_HISTmean_miss+params_IMMKF_2.RMSE_HISTmean_miss+params_IMMKF_3.RMSE_HISTmean_miss+params_IMMKF_4.RMSE_HISTmean_miss+params_IMMKF_5.RMSE_HISTmean_miss+params_IMMKF_6.RMSE_HISTmean_miss)/6;

    figure;
    errorbar(missing_prob, mean_RMSEmean_IMM, mean_RMSEstd_IMM, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, mean_RMSEmean_RLS, mean_RMSEstd_RLS, '*-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8); hold on;
    errorbar(missing_prob, mean_RMSEmean_HIST, mean_RMSEstd_HIST, '+-', 'LineWidth', 1.5, 'MarkerSize', 6, 'CapSize', 8);
    xlabel('Missing Pulse Rate');
    ylabel('RMSE');
    title('RMSE vs Missing Pulse Rate - All');
    grid on;
end