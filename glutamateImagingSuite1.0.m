tic
[row,column] = size(unnamed);

counter=1;
background=0;


med= medfilt1(unnamed,400);
norm=((unnamed-background)-(med-background))./(med-background);
aNetwork=mean(norm,2);

begining =1;

[row,column] = size(norm);
begining = 1;
fin =row;
timeScale=0.05 ;
totalTime=(fin-begining)*timeScale ;



for k=1:column
calcium =norm(begining:fin,k) ;
[Maxima,MaxIdx, Width, Prominence] = findpeaks(calcium,'MinPeakDistance',1,'MinPeakProminence',0.01);
eval(['max' num2str(k) '= Maxima'])
eval(['maxID' num2str(k) '= MaxIdx'])
eval(['Prominence' num2str(k) '= Prominence'])
eval(['Width' num2str(k) '= Width'])
end

for z= 1:column
    TF = isempty(eval(['Prominence',num2str(z)]));
  
    if TF == 1
    aProminence(z)=NaN;
    else
    temp=eval(['Prominence',num2str(z)]);
    number = numel(temp);
    aFrequency(z)=number;
    end
   
end

for z= 1:column
    TF = isempty(eval(['Prominence',num2str(z)]));
  
    if TF == 1
    aProminence(z)=NaN;
    else
    temp=eval(['max',num2str(z)]);
    number = mean(temp);
    aMax(z)=number;
    end
   
end

for z= 1:column
    TF = isempty(eval(['Prominence',num2str(z)]));
  
    if TF == 1
    aProminence(z)=NaN;
    else
    temp=eval(['Width',num2str(z)]);
    number = mean(temp);
    aWidth(z)=number*timeScale;
    end
   
end

 for z= 1:column
    TF = isempty(eval(['max',num2str(z)]));
  
    if TF == 1
    aProminence(z)=NaN;
    else
    temp=eval(['max',num2str(z)]);
    number = mean(temp);
    aMax(z)=number;
    end
   
end




%%replace norm by the normalized table delta/F0


