
%%Performing Monte Carlo Analysis for Current Equation 
for i=1:4
        N=10^(i+2);
      for j=1:25
        F=zeros(N,1);
        L=(0.01*1e-6)*randn(N,1);
        Vt=(0.03)*randn(N,1); 
        I=0.5*100*10^-6*((1*10^-6)./(10^-7+L)).*(1-0.4-Vt).*(1-0.4-Vt);
        
            for k=1:N
                if I(k)>275*10^-6
                    F(k)=1;
            else
                F(k)=0;
            end
       end
       Pf(j,i)= nnz(F)/N; 
end
end



xcoordinates=[1 2 3 4];
ycoordinates=[Pf(:,1) Pf(:,2) Pf(:,3) Pf(:,4)];

plot(xcoordinates,ycoordinates,'ro');
xlabel('N');
ylabel('P(I>=275uA)');