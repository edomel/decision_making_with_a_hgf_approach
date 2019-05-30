%% takes and stores as input in one file all the data acquired before

n_partecipant = 12;

for i = 1:n_partecipant
    name = strcat('../collected_data/data_from_experiment_', int2str(i), '.mat');
    [n_mistakes, questionnaire, input_cat_dog, gt_cat_dog, input_figures, gt_figures, input_sounds, gt_sounds] = data_adjustment(name);
    name = strcat('collected_data/data_for_hgf_', int2str(i), '.mat');
    save(name, 'questionnaire', 'n_mistakes', 'input_cat_dog', 'gt_cat_dog', 'input_figures', 'gt_figures', 'input_sounds', 'gt_sounds');
    y=dec2bin(input_cat_dog,1);
    new=cellstr(y);
    name = strcat('collected_data/response_cat_dog_', int2str(i), '.txt');
    fileID = fopen(name,'w');
    fprintf(fileID,'%s\n',new{:});
    fclose(fileID);
    y=dec2bin(gt_cat_dog,1);
    new=cellstr(y);
    name = strcat('collected_data/input_cat_dog_', int2str(i), '.txt');
    fileID = fopen(name,'w');
    fprintf(fileID,'%s\n',new{:});
    fclose(fileID);
    y=dec2bin(input_figures,1);
    new=cellstr(y);
    name = strcat('collected_data/response_figures_', int2str(i), '.txt');
    fileID = fopen(name,'w');
    fprintf(fileID,'%s\n',new{:});
    fclose(fileID);
    y=dec2bin(gt_figures,1);
    new=cellstr(y);
    name = strcat('collected_data/input_figures_', int2str(i), '.txt');
    fileID = fopen(name,'w');
    fprintf(fileID,'%s\n',new{:});
    fclose(fileID);
    y=dec2bin(input_sounds,1);
    new=cellstr(y);
    name = strcat('collected_data/response_sounds_', int2str(i), '.txt');
    fileID = fopen(name,'w');
    fprintf(fileID,'%s\n',new{:});
    fclose(fileID);
    y=dec2bin(gt_sounds,1);
    new=cellstr(y);
    name = strcat('collected_data/input_sounds_', int2str(i), '.txt');
    fileID = fopen(name,'w');
    fprintf(fileID,'%s\n',new{:});
    fclose(fileID);
end

for i = 1:n_partecipant
    for m = 1:3
        name = strcat('sintetically_simulated_method', int2str(m), '_', int2str(i), '.mat');
        [n_mistakes, questionnaire, input_cat_dog, gt_cat_dog, input_figures, gt_figures, input_sounds, gt_sounds] = data_adjustment(name);
        name = strcat('simulated_data/simulated_data_for_hgf_method', int2str(m), '_', int2str(i), '.mat');
        save(name, 'questionnaire', 'n_mistakes', 'input_cat_dog', 'gt_cat_dog', 'input_figures', 'gt_figures', 'input_sounds', 'gt_sounds');
        y=dec2bin(input_cat_dog,1);
        new=cellstr(y);
        name = strcat('simulated_data/simulated_response_cat_dog_method', int2str(m), '_', int2str(i), '.txt');
        fileID = fopen(name,'w');
        fprintf(fileID,'%s\n',new{:});
        fclose(fileID);
        y=dec2bin(gt_cat_dog,1);
        new=cellstr(y);
        name = strcat('simulated_data/simulated_input_cat_dog_method', int2str(m), '_', int2str(i), '.txt');
        fileID = fopen(name,'w');
        fprintf(fileID,'%s\n',new{:});
        fclose(fileID);
        y=dec2bin(input_figures,1);
        new=cellstr(y);
        name = strcat('simulated_data/simulated_response_figures_method', int2str(m), '_', int2str(i), '.txt');
        fileID = fopen(name,'w');
        fprintf(fileID,'%s\n',new{:});
        fclose(fileID);
        y=dec2bin(gt_figures,1);
        new=cellstr(y);
        name = strcat('simulated_data/simulated_input_figures_method', int2str(m), '_', int2str(i), '.txt');
        fileID = fopen(name,'w');
        fprintf(fileID,'%s\n',new{:});
        fclose(fileID);
        y=dec2bin(input_sounds,1);
        new=cellstr(y);
        name = strcat('simulated_data/simulated_response_sounds_method', int2str(m), '_', int2str(i), '.txt');
        fileID = fopen(name,'w');
        fprintf(fileID,'%s\n',new{:});
        fclose(fileID);
        y=dec2bin(gt_sounds,1);
        new=cellstr(y);
        name = strcat('simulated_data/simulated_input_sounds_method', int2str(m), '_', int2str(i), '.txt');
        fileID = fopen(name,'w');
        fprintf(fileID,'%s\n',new{:});
        fclose(fileID);
    end
end