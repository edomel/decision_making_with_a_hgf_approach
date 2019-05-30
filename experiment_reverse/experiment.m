%% Experimental setup for the specific experiment of the project and variable definition

n_trials = 115;
cat_dog_sequence = rand(n_trials, 1);
figures_sequence = rand(n_trials, 1);
sounds_sequence = rand(n_trials, 1);
% dog = 0 and cat = 1
 for i = 1:n_trials
     if cat_dog_sequence(i) < 0.5
         cat_dog_sequence(i) = 0;
     else
         cat_dog_sequence(i) = 1;
     end
     if figures_sequence(i) < 0.5
         figures_sequence(i) = 0;
     else
         figures_sequence(i) = 1;
     end
     if sounds_sequence(i) < 0.5
         sounds_sequence(i) = 0;
     else
         sounds_sequence(i) = 1;
     end
 end
 response_sequence_cat_dog = rand(n_trials, 1);
 response_sequence_figures = rand(n_trials, 1);
 response_sequence_sounds = rand(n_trials, 1);
 % pet has owner = 1 and pet has no owner = 0
 experiment_output_cat_dog = zeros(n_trials, 1);
 experiment_output_figures = zeros(n_trials, 1);
 experiment_output_sounds = zeros(n_trials, 1);
 p = 0;
 questionnaire_responses = zeros(3, 1);
 cat = imread('cat.png');
 dog = imread('dog.png');
 owner = imread('owner.png');
 no_owner = imread('no_owner.png');
 circle = imread('circle.png');
 empty = imread('empty.png');
 square = imread('square.png');
 line = imread('line.png');
 amp=20;
 fs=20500;  % sampling frequency
 duration=0.2;
 freq=5000;
 values=0:1/fs:duration;
 sound_1 =amp*sin(2*pi* freq*values);
 freq=1000;
 values=0:1/fs:duration;
 sound_2 =amp*sin(2*pi* freq*values);

%% Initial questionnaire

fprintf('Thank you for partecipatinfìg in the experiment!\n');
pause(1);
fprintf('First you will be asked a few questions:\n\n');
pause(1);
prompt = 'How do you feel today?\n(5 being excellent, 1 being poor)\n';
questionnaire_responses(1) = input(prompt);
prompt = 'How satisfied with life do you feel in general?\n(5 being excellent, 1 being poor)\n';
questionnaire_responses(2) = input(prompt);
prompt = 'Do you prefer dogs or cats?\n(0 for dog, 1 for cat)\n';
questionnaire_responses(3) = input(prompt);

%% Instruction for the experiment

pause(1);
fprintf('The experiment will be divided in three parts\nIn each part you will have two possible inputs and an output that may or may not appear\nAt each trial you will be shown one of the two inputs and you will have to decide if the output will appear\nIf you think the output will appear you press y and if you think it will not appear you press n\n');
pause(12);
fprintf('The appearance of the output is related to the input that you observe with a probabilistic model\n');
pause(2);
fprintf('Specifically, if given one input the probability of having the output is p,\nthe probability of having the output for the other input will be 1 - p\n');
pause(5);
fprintf('P(output|input1) = P(no output|input2) = 1 - P(no output|input1) = 1 - P(output|input2)\n');
pause(2);
fprintf('After you make your prediction the actual response will appear\n');
pause(2);
fprintf('Try to be quick in answering the questions!\n');
pause(2);
fprintf('You will be able to learn from trial to trial the probabilities\nPay attention! Throughout the experiment the probabilities can sometimes change\n');
pause(3);

%% sequence creation

p = 0.7;
response_sequence_cat_dog(1:30) = compute_response_sequence(cat_dog_sequence, response_sequence_cat_dog(1:30), 30, 0, p);
p = 0.5;
response_sequence_cat_dog(31:55) = compute_response_sequence(cat_dog_sequence, response_sequence_cat_dog(31:55), 25, 30, p);
p = 0.2;
response_sequence_cat_dog(56:87) = compute_response_sequence(cat_dog_sequence, response_sequence_cat_dog(56:87), 32, 55, p);
p = 0.9;
response_sequence_cat_dog(88:115) = compute_response_sequence(cat_dog_sequence, response_sequence_cat_dog(88:115), 28, 87, p);

p = 0.2;
response_sequence_figures(1:30) = compute_response_sequence(figures_sequence, response_sequence_figures(1:30), 30, 0, p);
p = 0.7;
response_sequence_figures(31:55) = compute_response_sequence(figures_sequence, response_sequence_figures(31:55), 25, 30, p);
p = 0.5;
response_sequence_figures(56:87) = compute_response_sequence(figures_sequence, response_sequence_figures(56:87), 32, 55, p);
p = 0.9;
response_sequence_figures(88:115) = compute_response_sequence(figures_sequence, response_sequence_figures(88:115), 28, 87, p);

p = 0.9;
response_sequence_sounds(1:30) = compute_response_sequence(sounds_sequence, response_sequence_sounds(1:30), 30, 0, p);
p = 0.5;
response_sequence_sounds(31:55) = compute_response_sequence(sounds_sequence, response_sequence_sounds(31:55), 25, 30, p);
p = 0.2;
response_sequence_sounds(56:87) = compute_response_sequence(sounds_sequence, response_sequence_sounds(56:87), 32, 55, p);
p = 0.7;
response_sequence_sounds(88:115) = compute_response_sequence(sounds_sequence, response_sequence_sounds(88:115), 28, 87, p);

%% actual experiment

prompt = 'Press enter when you are ready to go on\n';
temp = input(prompt, 's');
fprintf('In this first part you will either hear this sound\n');
pause(3);
sound(sound_1);
fprintf('or this sound\n');
pause(2);
sound(sound_2);
fprintf('And you will have to predict if a line will appear (pressing y)\n');
pause(4);
imshow(line)
pause(1);
close
fprintf('or not (pressing n)\n');
pause(2);
imshow(empty)
pause(1);
close
fprintf('Putting the general explenation in the specific context then the basic rule to consider is:\n');
pause(2);
fprintf('If the higher tone is likely to be followed by a line than the lower tone is less likely to be followed by the line as\n');
pause(2);
fprintf('p(line|high tone) = p(no line|low tone)\n');
pause(2);
prompt = 'Press enter when you are ready to start\n';
temp = input(prompt, 's');
fprintf('The experiment will start in 3 seconds\n');
pause(3);

for i = 1:n_trials
    if sounds_sequence(i) == 0
        sound(sound_1)
        prompt = 'Does this sound give a line? (y/n)';
        resp = input(prompt, 's');
        pause(1);
        close
    else
        sound(sound_2)
        prompt = 'Does this sound give a line? (y/n)';
        resp = input(prompt, 's');
        pause(1);
        close
    end
    if resp == 'y'
        experiment_output_sounds(i) = 1;
    else
        experiment_output_sounds(i) = 0;
    end
    if response_sequence_sounds(i) == 0
        imshow(empty)
        pause(1);
        close
    else
        imshow(line)
        pause(1);
        close
    end
    pause(1);
end

prompt = 'Press enter when you are ready to go on\n';
temp = input(prompt, 's');
fprintf('In this second part you will either see a circle\n');
pause(3);
imshow(circle)
pause(1);
close
fprintf('or a square\n');
pause(2);
imshow(square)
pause(1);
close
fprintf('And you will have to predict if a line will appear (pressing y)\n');
pause(4);
imshow(line)
pause(1);
close
fprintf('or not (pressing n)\n');
pause(3);
imshow(empty)
pause(1);
close
prompt = 'Press enter when you are ready to start\n';
temp = input(prompt, 's');
fprintf('The experiment will start in 3 seconds\n');
pause(3);

for i = 1:n_trials
    if figures_sequence(i) == 0
        imshow(circle)
        prompt = 'Is there a line for the circle? (y/n)';
        resp = input(prompt, 's');
        pause(1);
        close
    else
        imshow(square)
        prompt = 'Is there a line for the square? (y/n)';
        resp = input(prompt, 's');
        pause(1);
        close
    end
    if resp == 'y'
        experiment_output_figures(i) = 1;
    else
        experiment_output_figures(i) = 0;
    end
    if response_sequence_figures(i) == 0
        imshow(empty)
        pause(1);
        close
    else
        imshow(line)
        pause(1);
        close
    end
    pause(1);
end

prompt = 'Press enter when you are ready to go on\n';
temp = input(prompt, 's');
fprintf('In this last part you will either see a dog\n');
pause(3);
imshow(dog)
pause(1);
close
fprintf('or a cat\n');
pause(2);
imshow(cat)
pause(1);
close
fprintf('And you will have to predict if the pet has an owner (pressing y)\n');
pause(4);
imshow(owner)
pause(1);
close
fprintf('or not (pressing n)\n');
pause(3);
imshow(no_owner)
pause(1);
close
prompt = 'Press enter when you are ready to start the experiment\n';
temp = input(prompt, 's');
fprintf('The experiment will start in 3 seconds\n');
pause(3);

for i = 1:n_trials
    if cat_dog_sequence(i) == 0
        imshow(dog)
        prompt = 'Does the dog have an owner? (y/n)';
        resp = input(prompt, 's');
        pause(1);
        close
    else
        imshow(cat)
        prompt = 'Does the cat have an owner? (y/n)';
        resp = input(prompt, 's');
        pause(1);
        close
    end
    if resp == 'y'
        experiment_output_cat_dog(i) = 1;
    else
        experiment_output_cat_dog(i) = 0;
    end
    if response_sequence_cat_dog(i) == 0
        imshow(no_owner)
        pause(1);
        close
    else
        imshow(owner)
        pause(1);
        close
    end
    pause(1);
end



%% save the results

save('data_from_experiment.mat', 'cat_dog_sequence', 'experiment_output_cat_dog', 'response_sequence_cat_dog', 'figures_sequence', 'experiment_output_figures', 'response_sequence_figures', 'sounds_sequence', 'experiment_output_sounds', 'response_sequence_sounds', 'questionnaire_responses');