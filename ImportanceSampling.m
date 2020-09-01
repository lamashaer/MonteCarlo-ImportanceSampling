%%Importance Sampling

for i=1:4
        N=10^(2+j);
      for j=1:25        
        L=(0.02*1e-6)*randn(N,1);
        Vt=(0.06)*randn(N,1);
        
        Ids=0.5*100*10^-6*((1*10^-6)./(0.1*10^-6+L)).*(1-0.4-Vt).*(1-0.4-Vt);
        G=0;
        for k=1:M
            %sum all entries of G
            if Ids(k)>275*10^-6
                G=G+(normpdf(L(k),0,0.01*1e-6)*normpdf(Vt(k),0,0.03))/(normpdf(L(k),0,0.02*1e-6)*normpdf(Vt(k),0,0.06));
            end
         
        end
        Pf(i,j)= G/M;
        
      end
end


xcoordinate=[1 2 3 4];
ycoordinate=[Pf(:,1) Pf(:,2) Pf(:,3) Pf(:,4)];

plot(xcoordinate,ycooordinate,'*b');
xlabel('N');
ylabel('P(I>=275uA)');