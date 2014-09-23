%% export_STL_txt
% Below is a demonstration of the features of the |export_STL_txt| function

%%
clear all; close all; clc; 

%%
% Plot settings
fig_color='w'; 
fig_colordef='white'; 
faceAlpha=0.5;
fontSize=25; 

%% Get patch data sets
[F1,V1]=stanford_bunny;
meanV=mean(V1,1);
V1=V1-meanV(ones(1,size(V1,1)),:);
F2=F1; 
V2=V1/2;

%% Create the stlStruct

stlStruct.solidNames={'standford_bunny_big','standford_bunny_small'};
stlStruct.solidVertices={V1,V2};
stlStruct.solidFaces={F1,F2};
stlStruct.solidNormals={[],[]};

%%
% Plotting the models 
pColors=autumn(numel(stlStruct.solidNames));

figuremax(fig_color,fig_colordef);
title('Patch data to export to multi-solid STL','fontSize',fontSize);
xlabel('X','fontSize',fontSize);ylabel('Y','fontSize',fontSize); zlabel('Z','fontSize',fontSize); hold on;
for q=1:1:numel(stlStruct.solidNames)
    F=stlStruct.solidFaces{q};
    V=stlStruct.solidVertices{q};
    patch('Faces',F,'Vertices',V,'FaceColor',pColors(q,:),'EdgeColor','k','FaceAlpha',faceAlpha);
end
view(3); axis equal; axis tight; axis vis3d; grid on; 
camlight('headlight');
lighting phong; axis off; 
drawnow;

%% Exporting an STL file from the multi-solid patch data

%Set main folder and fileName
defaultFolder = fileparts(mfilename('fullpath'));
pathName=fullfile(defaultFolder,'data','STL'); 
fileName=fullfile(pathName,'standford_bunny_multi.stl'); 

export_STL_txt(fileName,stlStruct);

%% 
%
% <<gibbVerySmall.gif>>
% 
% GIBBON 
% 
% Kevin M. Moerman (kevinmoerman@hotmail.com)