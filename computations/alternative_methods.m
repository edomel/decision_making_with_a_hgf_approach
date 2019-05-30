n_trials = 115;
n_partecipant = 12;

for p = 1:n_partecipant
    name = strcat('../collected_data/data_from_experiment_', int2str(p), '.mat');
    load(name);
    questionnaire_responses = zeros(3, 1);
    
    simulated_output_1_cat_dog = zeros(n_trials, 1);
    simulated_output_2_cat_dog = zeros(n_trials, 1);
    simulated_output_3_cat_dog = zeros(n_trials, 1);
    simulated_output_1_figures = zeros(n_trials, 1);
    simulated_output_2_figures = zeros(n_trials, 1);
    simulated_output_3_figures = zeros(n_trials, 1);
    simulated_output_1_sounds = zeros(n_trials, 1);
    simulated_output_2_sounds = zeros(n_trials, 1);
    simulated_output_3_sounds = zeros(n_trials, 1);
    
    for t = 1:3
    
        alpha_1 = 0.9;

        if t == 1
            basic_sequence = cat_dog_sequence;
            actual_response = response_sequence_cat_dog;
            simulated_output_1 = zeros(n_trials, 1);
            simulated_output_2 = zeros(n_trials, 1);
            simulated_output_3 = zeros(n_trials, 1);
        elseif t == 2
            basic_sequence = figures_sequence;
            actual_response = response_sequence_figures;
            simulated_output_1 = zeros(n_trials, 1);
            simulated_output_2 = zeros(n_trials, 1);
            simulated_output_3 = zeros(n_trials, 1);
        elseif t == 3
            basic_sequence = sounds_sequence;
            actual_response = response_sequence_sounds;
            simulated_output_1 = zeros(n_trials, 1);
            simulated_output_2 = zeros(n_trials, 1);
            simulated_output_3 = zeros(n_trials, 1);
        end
        
        q_input_1 = 0.5;
        q_input_2 = 0.5;

        for i = 1:n_trials
            temp = rand(1);
            if basic_sequence(i) == 0
                if temp < q_input_1
                    simulated_output_1(i) = 1;
                else
                    simulated_output_1(i) = 0;
                end
            else
                if temp < q_input_2
                    simulated_output_1(i) = 1;
                else
                    simulated_output_1(i) = 0;
                end
            end
            if basic_sequence(i) == 0
                q_input_1 = q_input_1 * alpha_1 + (1 - alpha_1) * actual_response(i);
                q_input_2 = q_input_2 * alpha_1 + (1 - alpha_1) * abs(1 - actual_response(i));
            else
                q_input_2 = q_input_2 * alpha_1 + (1 - alpha_1) * actual_response(i);
                q_input_1 = q_input_1 * alpha_1 + (1 - alpha_1) * abs(1 - actual_response(i));
            end
        end

        q_function = 0.5;
        alpha_2 = 0.5;

        for i = 1:n_trials
            temp = rand(1);
            if basic_sequence(i) == 0
                if temp < q_function
                    simulated_output_2(i) = 1;
                else
                    simulated_output_2(i) = 0;
                end
            else
                if temp > q_function
                    simulated_output_2(i) = 1;
                else
                    simulated_output_2(i) = 0;
                end
            end
            if i == 1
                q_function_new = (1 - basic_sequence(i)) * actual_response(i) + basic_sequence(i) * (1 - actual_response(i));
            elseif i == 2
                q_function_new = 0.5 * (1 - basic_sequence(i)) * actual_response(i) + 0.5 * basic_sequence(i) * (1 - actual_response(i)) ...
                    + 0.5 * (1 - basic_sequence(i - 1)) * actual_response(i - 1) + 0.5 * basic_sequence(i - 1) * (1 - actual_response(i - 1));
            elseif i == 3
                q_function_new = 0.4 * (1 - basic_sequence(i)) * actual_response(i) + 0.4 * basic_sequence(i) * (1 - actual_response(i)) ...
                    + 0.3 * (1 - basic_sequence(i - 1)) * actual_response(i - 1) + 0.3 * basic_sequence(i - 1) * (1 - actual_response(i - 1)) ...
                    + 0.3 * (1 - basic_sequence(i - 2)) * actual_response(i - 2) + 0.3 * basic_sequence(i - 2) * (1 - actual_response(i - 2));
            elseif i == 4
                q_function_new = 0.25 * (1 - basic_sequence(i)) * actual_response(i) + 0.25 * basic_sequence(i) * (1 - actual_response(i)) ...
                    + 0.25 * (1 - basic_sequence(i - 1)) * actual_response(i - 1) + 0.25 * basic_sequence(i - 1) * (1 - actual_response(i - 1)) ...
                    + 0.25 * (1 - basic_sequence(i - 2)) * actual_response(i - 2) + 0.25 * basic_sequence(i - 2) * (1 - actual_response(i - 2)) ...
                    + 0.25 * (1 - basic_sequence(i - 3)) * actual_response(i - 3) + 0.25 * basic_sequence(i - 3) * (1 - actual_response(i - 3));
            elseif i == 5
                q_function_new = 0.2 * (1 - basic_sequence(i)) * actual_response(i) + 0.2 * basic_sequence(i) * (1 - actual_response(i)) ...
                    + 0.2 * (1 - basic_sequence(i - 1)) * actual_response(i - 1) + 0.2 * basic_sequence(i - 1) * (1 - actual_response(i - 1)) ...
                    + 0.2 * (1 - basic_sequence(i - 2)) * actual_response(i - 2) + 0.2 * basic_sequence(i - 2) * (1 - actual_response(i - 2)) ...
                    + 0.2 * (1 - basic_sequence(i - 3)) * actual_response(i - 3) + 0.2 * basic_sequence(i - 3) * (1 - actual_response(i - 3)) ...
                    + 0.2 * (1 - basic_sequence(i - 4)) * actual_response(i - 4) + 0.2 * basic_sequence(i - 4) * (1 - actual_response(i - 4));
            elseif i == 6
                q_function_new = 0.2 * (1 - basic_sequence(i)) * actual_response(i) + 0.2 * basic_sequence(i) * (1 - actual_response(i)) ...
                    + 0.2 * (1 - basic_sequence(i - 1)) * actual_response(i - 1) + 0.2 * basic_sequence(i - 1) * (1 - actual_response(i - 1)) ...
                    + 0.15 * (1 - basic_sequence(i - 2)) * actual_response(i - 2) + 0.15 * basic_sequence(i - 2) * (1 - actual_response(i - 2)) ...
                    + 0.15 * (1 - basic_sequence(i - 3)) * actual_response(i - 3) + 0.15 * basic_sequence(i - 3) * (1 - actual_response(i - 3)) ...
                    + 0.15 * (1 - basic_sequence(i - 4)) * actual_response(i - 4) + 0.15 * basic_sequence(i - 4) * (1 - actual_response(i - 4)) ...
                    + 0.15 * (1 - basic_sequence(i - 5)) * actual_response(i - 5) + 0.15 * basic_sequence(i - 5) * (1 - actual_response(i - 5));
            else
                q_function_new = 0.15 * (1 - basic_sequence(i)) * actual_response(i) + 0.15 * basic_sequence(i) * (1 - actual_response(i)) ...
                    + 0.15 * (1 - basic_sequence(i - 1)) * actual_response(i - 1) + 0.15 * basic_sequence(i - 1) * (1 - actual_response(i - 1)) ...
                    + 0.15 * (1 - basic_sequence(i - 2)) * actual_response(i - 2) + 0.15 * basic_sequence(i - 2) * (1 - actual_response(i - 2)) ...
                    + 0.15 * (1 - basic_sequence(i - 3)) * actual_response(i - 3) + 0.15 * basic_sequence(i - 3) * (1 - actual_response(i - 3)) ...
                    + 0.15 * (1 - basic_sequence(i - 4)) * actual_response(i - 4) + 0.15 * basic_sequence(i - 4) * (1 - actual_response(i - 4)) ...
                    + 0.15 * (1 - basic_sequence(i - 5)) * actual_response(i - 5) + 0.15 * basic_sequence(i - 5) * (1 - actual_response(i - 5)) ...
                    + 0.1 * (1 - basic_sequence(i - 6)) * actual_response(i - 6) + 0.1 * basic_sequence(i - 6) * (1 - actual_response(i - 6));
            end
            q_function = alpha_2 * q_function_new + (1 - alpha_2) * q_function;
        end

        q_0 = 1;
        q_1 = 0;
        update0_0 = 0;
        update1_0 = 0;
        update0_1 = 0;
        update0_2 = 0;
        update1_1 = 0;
        update1_2 = 0;

        for i = 1:n_trials
            if q_0 >= q_1
                b = 1;
            else
                b = 0;
            end
            if basic_sequence(i) == 0
                simulated_output_3(i) = b;
            else
                simulated_output_3(i) = abs(b - 1);
            end
            if basic_sequence(i) == 0
                % update q_0
                update0_0 = actual_response(i) - simulated_output_3(i);
                if update0_0 == 0
                    q_0 = q_0 + (2 * b) - 1;
                else
                    q_0 = q_0 + 2 * update0_0 + update0_1 + update0_2;
                end
            else
                % update q_1
                update1_0 = actual_response(i) - simulated_output_3(i);
                if update1_0 == 0
                    q_1 = q_1 + (2 * abs(b - 1)) - 1;
                else
                    q_1 = q_1 + 2 * update1_0 + update1_1 + update1_2;
                end
            end
            update0_2 = update0_1;
            update0_1 = update0_0;
            update1_2 = update1_1;
            update1_1 = update1_0;
            if q_0 >= q_1
                q_0 = q_0 - q_1;
                q_1 = 0;
                if q_0 > 7
                    q_0 = 7;
                end
            else
                q_1 = q_1 - q_0;
                q_0 = 0;
                if q_1 > 7
                    q_1 = 7;
                end
            end
        end
        if t == 1
            simulated_output_1_cat_dog = simulated_output_1;
            simulated_output_2_cat_dog = simulated_output_2;
            simulated_output_3_cat_dog = simulated_output_3;
        elseif t == 2
            simulated_output_1_figures = simulated_output_1;
            simulated_output_2_figures = simulated_output_2;
            simulated_output_3_figures = simulated_output_3;
        elseif t == 3
            simulated_output_1_sounds = simulated_output_1;
            simulated_output_2_sounds = simulated_output_2;
            simulated_output_3_sounds = simulated_output_3;
        end
    end
    name = strcat('sintetically_simulated_method1_', int2str(p), '.mat');
    experiment_output_cat_dog = simulated_output_1_cat_dog;
    experiment_output_figures = simulated_output_1_figures;
    experiment_output_sounds = simulated_output_1_sounds;
    save(name, 'cat_dog_sequence', 'experiment_output_cat_dog', 'response_sequence_cat_dog', ...
        'figures_sequence', 'experiment_output_figures', 'response_sequence_figures', ...
        'sounds_sequence', 'experiment_output_sounds', 'response_sequence_sounds', 'questionnaire_responses');
    name = strcat('sintetically_simulated_method2_', int2str(p), '.mat');
    experiment_output_cat_dog = simulated_output_2_cat_dog;
    experiment_output_figures = simulated_output_2_figures;
    experiment_output_sounds = simulated_output_2_sounds;
    save(name, 'cat_dog_sequence', 'experiment_output_cat_dog', 'response_sequence_cat_dog', ...
        'figures_sequence', 'experiment_output_figures', 'response_sequence_figures', ...
        'sounds_sequence', 'experiment_output_sounds', 'response_sequence_sounds', 'questionnaire_responses');
    name = strcat('sintetically_simulated_method3_', int2str(p), '.mat');
    experiment_output_cat_dog = simulated_output_3_cat_dog;
    experiment_output_figures = simulated_output_3_figures;
    experiment_output_sounds = simulated_output_3_sounds;
    save(name, 'cat_dog_sequence', 'experiment_output_cat_dog', 'response_sequence_cat_dog', ...
        'figures_sequence', 'experiment_output_figures', 'response_sequence_figures', ...
        'sounds_sequence', 'experiment_output_sounds', 'response_sequence_sounds', 'questionnaire_responses');
end