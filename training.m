clear all;
clc;
close all;
m = 1;
srcFiles = dir('E:\Fourth\Project\training\*.jpg'); % the folder in which ur images exists
files = srcFiles;
for i = 1 : length(srcFiles)
    filename = strcat('E:\Fourth\Project\training\',srcFiles(i).name);
    rgb = imread(filename);
    rgb=imresize(rgb,[255 255]);
    I = rgb2hsv(rgb);
    gray = rgb2gray(rgb);
nn = rgb;
H = I(:, :, 1);             % hue channel.
%figure,imshow(R);
S = I(:, :, 2);             % sat channel
%figure,imshow(G);
V = I(:, :, 3);             % value channel
%figure,imshow(B);
mn = rgb2gray(nn);
% mn = rgb2ycbr(n);
[T,GM] = graythresh(S);
bw_img = im2bw(S,T);
bw_img = im2bw(S,T);
se = strel('diamond',2);
bw_img = imdilate(bw_img,se);
seg_image = bw_img;
seg_im =  double(mn) .* double(seg_image);; 
 figure, imshow(S);
 %figure, imshow(seg_im);


%%
%Feature Extraction Based on Shape Measurements

seg_data1 = regionprops(bw_img, 'all');
     imarea = seg_data1.Area;
     imMinorAxisLength = seg_data1.MinorAxisLength;
     imMajorAxisLength = seg_data1.MajorAxisLength;
     imPerimeter = seg_data1.Perimeter;
    trainingmatrix(i,1) = imarea;
    trainingmatrix(i,2) = imMinorAxisLength;
    trainingmatrix(i,3) = imMajorAxisLength;
    trainingmatrix(i,4) = imPerimeter;
%     switch  imgFiles(i,1).name(1)
%          case 'a'
%             traininggroups(i,1) = {'Alpinia Galanga (Rasna)'};
%             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
%             
%         case 'b'
%             traininggroups(i,1) = {'Amaranthus Viridis (Arive-Dantu)'};
%             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% 	
% % 	    case 'c'
% %             traininggroups(i,1) = {'Artocarpus Heterophyllus (Jackfruit)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% % 
% % 	    case 'd'
% %             traininggroups(i,1) = {'Azadirachta Indica (Neem)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% %       
% %         case 'e'
% %             traininggroups(i,1) = {'Basella Alba (Basale))'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% 
% % 	   case 'f'
% %             traininggroups(i,1) = {'Brassica Juncea (Indian Mustard)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% %             
% %        case 'g'
% %             traininggroups(i,1) = {'Carissa Carandas (Karanda)'};
% %             trainingmatrixfilename(i,1) = {imgFiles(i,1).name };
% %             
% %        case 'h'
% %             traininggroups(i,1) = {'Citrus Limon (Lemon)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% %             
% %        case 'i'
% %             traininggroups(i,1) = {'Ficus Religiosa (Peepal Tree)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% %             
% %        case 'j'
% %             traininggroups(i,1) = {'Hibiscus Rosa-sinensis'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% %             
% %        case 'k'
% %             traininggroups(i,1) = {'Jasminum (Jasmine)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% %             
% %        case 'l'
% %             traininggroups(i,1) = {'Mangifera Indica (Mango)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% %             
% %        case 'm'
% %             traininggroups(i,1) = {'Mentha (Mint)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% %             
% %       case 'n'
% %             traininggroups(i,1) = {'Moringa Oleifera (Drumstick)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name }; 
% %             
% %       case 'o'
% %             traininggroups(i,1) = {'Murraya Koenigii (Curry)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% %             
% %       case 'p'
% %             traininggroups(i,1) = {'Nerium Oleander (Oleander)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% %             
% %       case 'q'
% %             traininggroups(i,1) = {'Nyctanthes Arbor-tristis (Parijata)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% %             
% %       case 'r'
% %             traininggroups(i,1) = {'Ocimum Tenuiflorum (Tulsi)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% %             
% %       case 's'
% %             traininggroups(i,1) = {'Piper Betle (Betel)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name };
% %             
% %       case 't'
% %             traininggroups(i,1) = {'Trigonella Foenum-graecum (Fenugreek)'};
% %             trainingmatrixfilename(i,1) = { imgFiles(i,1).name }; 
% %             
%         otherwise
%            traininggroups(i,1) = {'other value'};
%             disp('other value');
            
    switch files(i).name(1)
        case 'H'
            traininggroups(i,1) = {'Health'};
            trainingmatrixfilename(i,1) = { srcFiles(i,1).name };
        case 'D'
            traininggroups(i,1) = {'Diseased'};
            trainingmatrixfilename(i,1) = { srcFiles(i,1).name };
        otherwise
           traininggroups(i,1) = {'other value'};
            disp('other value');
    end

end     
