n_partecipants = 12;
average_mistake = zeros(3, 1);
average_omega_offset_cat_dog = zeros(1, 3);
average_omega_offset_figures = zeros(1, 3);
average_omega_offset_sounds = zeros(1, 3);

for i = 1:n_partecipants
    name = strcat('collected_data/fitted/collected_data_fitted_', int2str(i), '.mat');
    load(name);
    average_mistake = average_mistake + n_mistakes;
    average_omega_offset_cat_dog = average_omega_offset_cat_dog + abs(omega_ideal_cat_dog - omega_estimation_cat_dog);
    average_omega_offset_figures = average_omega_offset_figures + abs(omega_ideal_figures - omega_estimation_figures);
    average_omega_offset_sounds = average_omega_offset_sounds + abs(omega_ideal_sounds - omega_estimation_sounds);
end

average_mistake = average_mistake / n_partecipants;
average_omega_offset_cat_dog = average_omega_offset_cat_dog / n_partecipants;
average_omega_offset_figures = average_omega_offset_figures / n_partecipants;
average_omega_offset_sounds = average_omega_offset_sounds / n_partecipants;

name = strcat('collected_data/fitted/parameter_comparison.mat');
save(name, 'average_mistake', 'average_omega_offset_cat_dog', 'average_omega_offset_figures', 'average_omega_offset_sounds');

for m = 1:3
    average_mistake = zeros(3, 1);
    average_omega_offset_cat_dog = zeros(1, 3);
    average_omega_offset_figures = zeros(1, 3);
    average_omega_offset_sounds = zeros(1, 3);
    for i = 1:n_partecipants
        name = strcat('simulated_data/fitted/simulated_data_fitted_method', int2str(m), '_', int2str(i), '.mat');
        load(name);
        average_mistake = average_mistake + n_mistakes;
        average_omega_offset_cat_dog = average_omega_offset_cat_dog + abs(omega_ideal_cat_dog - omega_estimation_cat_dog);
        average_omega_offset_figures = average_omega_offset_figures + abs(omega_ideal_figures - omega_estimation_figures);
        average_omega_offset_sounds = average_omega_offset_sounds + abs(omega_ideal_sounds - omega_estimation_sounds);
    end
    average_mistake = average_mistake / n_partecipants;
    average_omega_offset_cat_dog = average_omega_offset_cat_dog / n_partecipants;
    average_omega_offset_figures = average_omega_offset_figures / n_partecipants;
    average_omega_offset_sounds = average_omega_offset_sounds / n_partecipants;

    name = strcat('simulated_data/fitted/parameter_comparison_method', int2str(m), '.mat');
    save(name, 'average_mistake', 'average_omega_offset_cat_dog', 'average_omega_offset_figures', 'average_omega_offset_sounds');
end

average_similarity = zeros(3, 1);

for m = 1:3
    for i = 1:n_partecipants
        name = strcat('simulated_data/simulated_data_for_hgf_method', int2str(m), '_', int2str(i), '.mat');
        load(name);
        temp_cat_dog = input_cat_dog;
        temp_cat_dog(31:55) = zeros(1, 25);
        temp_figures = input_figures;
        temp_figures(56:87) = zeros(1, 32);
        temp_sounds = input_sounds;
        temp_sounds(31:55) = zeros(1, 25);
        name = strcat('collected_data/data_for_hgf_', int2str(i), '.mat');
        load(name);
        input_cat_dog(31:55) = zeros(1, 25);
        input_figures(56:87) = zeros(1, 32);
        input_sounds(31:55) = zeros(1, 25);
        average_similarity(1) = average_similarity(1) + min([nnz(input_cat_dog(1:29) - temp_cat_dog(1:29)), nnz(input_cat_dog(1:29) - temp_cat_dog(2:30)), nnz(input_cat_dog(2:30) - temp_cat_dog(1:29))]) + ...
            min([nnz(input_cat_dog(56:86) - temp_cat_dog(56:86)), nnz(input_cat_dog(56:86) - temp_cat_dog(57:87)), nnz(input_cat_dog(57:87) - temp_cat_dog(56:86))]) + ...
            min([nnz(input_cat_dog(88:114) - temp_cat_dog(88:114)), nnz(input_cat_dog(88:114) - temp_cat_dog(89:115)), nnz(input_cat_dog(89:115) - temp_cat_dog(88:114))]);
        average_similarity(2) = average_similarity(2) + min([nnz(input_figures(1:29) - temp_figures(1:29)), nnz(input_figures(1:29) - temp_figures(2:30)), nnz(input_figures(2:30) - temp_figures(1:29))]) + ...
            min([nnz(input_figures(56:86) - temp_figures(56:86)), nnz(input_figures(56:86) - temp_figures(57:87)), nnz(input_figures(57:87) - temp_figures(56:86))]) + ...
            min([nnz(input_figures(88:114) - temp_figures(88:114)), nnz(input_figures(88:114) - temp_figures(89:115)), nnz(input_figures(89:115) - temp_figures(88:114))]);
        average_similarity(3) = average_similarity(3) + min([nnz(input_sounds(1:29) - temp_sounds(1:29)), nnz(input_sounds(1:29) - temp_sounds(2:30)), nnz(input_sounds(2:30) - temp_sounds(1:29))]) + ...
            min([nnz(input_sounds(56:86) - temp_sounds(56:86)), nnz(input_sounds(56:86) - temp_sounds(57:87)), nnz(input_sounds(57:87) - temp_sounds(56:86))]) + ...
            min([nnz(input_sounds(88:114) - temp_sounds(88:114)), nnz(input_sounds(88:114) - temp_sounds(89:115)), nnz(input_sounds(89:115) - temp_sounds(88:114))]);
    end
    average_similarity = average_similarity / n_partecipants;
end
    

