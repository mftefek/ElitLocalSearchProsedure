%% Yazm�� oldu�um Elit Local Search 13.02.2021
function [xnew]=EliteLocalSearch(x,f,mini,maxi)
%y=zeros();
bbest=f;
 xnew1=[];
 xnew2=[];
 [row,col]=size(x);
y=[];

kat=rand;
C=kat*reshape(x,col,row);
y=C';

%%%ama� fonksiyonu hesaplama
flocal=objective(y);%%%hangi y de�erinde min oluyor


for i=1:row%%col
                      
    if (bbest(i)<flocal(i))%%%%
               xnew1(i,:)=x(i,:);
    else
               xnew1(i,:)=y(i,:);
                  
    end
    
end
     
         
xnew=xnew1;

end