function [n_mistakes, questionnaire, input_cat_dog, gt_cat_dog, input_figures, gt_figures, input_sounds, gt_sounds] = data_adjustment(input_file_name)
%Preprocesses data for hgf fitting
%   Fets the data and depending on the probability for the experiment

load(input_file_name);
questionnaire = questionnaire_responses;
n_mistakes = zeros(3, 1);
n_trials = 115;
input_cat_dog = zeros(n_trials, 1);
gt_cat_dog = zeros(n_trials, 1);
input_figures = zeros(n_trials, 1);
gt_figures = zeros(n_trials, 1);
input_sounds = zeros(n_trials, 1);
gt_sounds = zeros(n_trials, 1);
for i = 1:30
    if cat_dog_sequence(i) == 0
        if experiment_output_cat_dog(i) == 0
            n_mistakes(1) = n_mistakes(1) + 1;
        end
    else
        if experiment_output_cat_dog(i) == 1
            n_mistakes(1) = n_mistakes(1) + 1;
        end
    end
    if figures_sequence(i) == 0
        if experiment_output_figures(i) == 1
            n_mistakes(2) = n_mistakes(2) + 1;
        end
    else
        if experiment_output_figures(i) == 0
            n_mistakes(2) = n_mistakes(2) + 1;
        end
    end
    if sounds_sequence(i) == 0
        if experiment_output_sounds(i) == 0
            n_mistakes(3) = n_mistakes(3) + 1;
        end
    else
        if experiment_output_sounds(i) == 1
            n_mistakes(3) = n_mistakes(3) + 1;
        end
    end
end
for i = 31:55
    if figures_sequence(i) == 0
        if experiment_output_figures(i) == 0
            n_mistakes(2) = n_mistakes(2) + 1;
        end
    else
        if experiment_output_figures(i) == 1
            n_mistakes(2) = n_mistakes(2) + 1;
        end
    end
end
for i = 56:87
    if cat_dog_sequence(i) == 0
        if experiment_output_cat_dog(i) == 1
            n_mistakes(1) = n_mistakes(1) + 1;
        end
    else
        if experiment_output_cat_dog(i) == 0
            n_mistakes(1) = n_mistakes(1) + 1;
        end
    end
    if sounds_sequence(i) == 0
        if experiment_output_sounds(i) == 1
            n_mistakes(3) = n_mistakes(3) + 1;
        end
    else
        if experiment_output_sounds(i) == 0
            n_mistakes(3) = n_mistakes(3) + 1;
        end
    end
end
for i = 88:115
    if cat_dog_sequence(i) == 0
        if experiment_output_cat_dog(i) == 0
            n_mistakes(1) = n_mistakes(1) + 1;
        end
    else
        if experiment_output_cat_dog(i) == 1
            n_mistakes(1) = n_mistakes(1) + 1;
        end
    end
    if figures_sequence(i) == 0
        if experiment_output_figures(i) == 0
            n_mistakes(2) = n_mistakes(2) + 1;
        end
    else
        if experiment_output_figures(i) == 1
            n_mistakes(2) = n_mistakes(2) + 1;
        end
    end
    if sounds_sequence(i) == 0
        if experiment_output_sounds(i) == 0
            n_mistakes(3) = n_mistakes(3) + 1;
        end
    else
        if experiment_output_sounds(i) == 1
            n_mistakes(3) = n_mistakes(3) + 1;
        end
    end
end

for i = 1:n_trials
    if cat_dog_sequence(i) == 0
        gt_cat_dog(i) = response_sequence_cat_dog(i);
        input_cat_dog(i) = experiment_output_cat_dog(i);
    else
        gt_cat_dog(i) = abs(1 - response_sequence_cat_dog(i));
        input_cat_dog(i) = abs(1 - experiment_output_cat_dog(i));
    end
    if figures_sequence(i) == 0
        gt_figures(i) = response_sequence_figures(i);
        input_figures(i) = experiment_output_figures(i);
    else
        gt_figures(i) = abs(1 - response_sequence_figures(i));
        input_figures(i) = abs(1 - experiment_output_figures(i));
    end
    if sounds_sequence(i) == 0
        gt_sounds(i) = response_sequence_sounds(i);
        input_sounds(i) = experiment_output_sounds(i);
    else
        gt_sounds(i) = abs(1 - response_sequence_sounds(i));
        input_sounds(i) = abs(1 - experiment_output_sounds(i));
    end
end

end