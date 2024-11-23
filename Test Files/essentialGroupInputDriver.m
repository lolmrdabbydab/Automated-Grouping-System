clear; clc;

% -= Test Correct Return Values =- (No Repeated Names)
disp("Input: 3 2 " + ...
    "john cindy mike rick luke ken");
fprintf("Expected Output: \n\t" + ...
    "- numGroup: 3\n\t" + ...
    "- numIndPerGroup: 2\n\t" + ...
    "- nameList of Titled Inputted Names: ['John' 'Cindy' 'Mike' 'Rick' 'Luke' 'Ken']\n\t" + ...
    "- groupTable: A matrix of zeros with dimension 2x3\n");
disp("Actual Output:");
[numGroup, numIndPerGroup, nameList, groupTable] = essentialGroupInput();
fprintf("numGroup: %d\n" + ...
    "numIndPerGroup: %d\n" + ...
    "nameList: ", numGroup, numIndPerGroup);
disp(nameList);
disp("-= Group Table =- ");
disp(groupTable);

pauser = input("Press Enter To Continue");
clc;

% -= Test Unique Name Input Functionality =- (Repeated Names)
disp("Input: 3 2 " + ...
    "john cindy mike rick rick luke ken");
fprintf("Expected Output: \n\t" + ...
    "- numGroup: 3\n\t" + ...
    "- numIndPerGroup: 2\n\t" + ...
    "- Warning Message That Rick has already been entered" + ...
    "- nameList of Titled Inputted Names: ['John' 'Cindy' 'Mike' 'Rick' 'Luke' 'Ken']\n\t" + ...
    "- groupTable: A matrix of zeros with dimension 3x2\n\t");
disp("Actual Output:");
[numGroup, numIndPerGroup, nameList, groupTable] = essentialGroupInput();
fprintf("numGroup: %d\n" + ...
    "numIndPerGroup: %d\n" + ...
    "nameList: ", numGroup, numIndPerGroup);
disp(nameList);
disp("-= Group Table =- ");
disp(groupTable);