%Hexagonal Salt Pepper
NN=24;
col=zeros(NN);

  for yt=1:NN
  if mod(yt,2)==0
      
      col(1,yt)=+1;
      col(2,yt)=-1;
      
      for x1t=3:NN
          if mod(x1t-1,3)==0
              col(x1t,yt)=+1;
          else
              col(x1t,yt)=-1;
          end
      end
      
      
  else
      col(1,yt)=-1;
      col(2,yt)=+1;
      
     for x2t=3:NN
          if mod(x2t-2,3)==0
              col(x2t,yt)=+1;
          else
              col(x2t,yt)=-1;
          end
          
     end
  end
  end
  
  temp=col;
  col=transpose(temp);
  
  hex_g = grandGhex(col);
  save('myhex_antihex.mat','hex_g');
  
