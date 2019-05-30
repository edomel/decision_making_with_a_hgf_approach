function [response_sequence] = compute_response_sequence(cat_dog_sequence, response_sequence, length, start_point, p_owner_given_dog)
%Initialize the response sequence
%   A single section of the response sequence is assigned. Its position
%   depends on the starting point in th ecomplete sequence and the length
%   of the section.

for i = 1:length
    if cat_dog_sequence(start_point + i) == 0
        if response_sequence(i) < p_owner_given_dog
            response_sequence(i) = 1;
        else
            response_sequence(i) = 0;
        end
    else
        if response_sequence(i) < p_owner_given_dog
            response_sequence(i) = 0;
        else
            response_sequence(i) = 1;
        end
    end
end

end

