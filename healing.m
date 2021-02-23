clear all; clc; close all;

f=imread('C:\imge\8bit\barbara.png');
[w,h]=size(f);
fs=3;
o=zeros(w,h);
J = adapthisteq(f);

for i=ceil(fs/2):1:w-floor(fs/2)
    for j=ceil(fs/2):1:h-floor(fs/2)
        
     block = f(i-floor(fs/2):i+floor(fs/2),j-floor(fs/2):j+floor(fs/2));      
     mf=ones(3/3)/9;
     mfi=filter2(mf,block);
     lm=mean2(mfi);
     
     mfg=filter2(mf,f);
     gm=mean2(mfg);
     o(i,j)=f(i,j) + (lm-gm);
    
    end
end

%  y = adapthisteq(o);

% % % clear all; clc; close all;
% % % 
% % % Img=imread('C:\imge\cameraman.tif');
% % % [m,n]=size(Img);
% % % output=zeros(m,n);
% % % 
% % % gm=mean2(Img);
% % % 
% % % for i=1:m
% % %     for j=1:n
% % %         
% % %         rmin=max(1,i-1);
% % %         rmax=min(m,i+1);
% % %         cmin=max(1,j-1);
% % %         cmax=min(n,j+1);
% % %         
% % %         temp=Img(rmin:rmax,cmin:cmax);
% % %         output(i,j)=mean(temp(:));
% % %         lm=output(i,j);
% % %         tplm=lm-gm;
% % %         output(i,j)=Img(i,j)+ tplm;
% % %     end
% % % end
% % % 
% % % y=adapthisteq(Img);
% % % 
% % % output=uint8(output);
% % % figure;imshow(Img)
% % % figure; imshow(y);
% % % figure;imshow(output);
o=uint8(o);
figure;imshow(f);
figure;imshow(J);
figure;imshow(o);