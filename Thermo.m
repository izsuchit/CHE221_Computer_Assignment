clc
clear
A12=-0.1464;
A21=-0.0259;
%Given experimental value T (deg C) & Mol fraction of 2 butanol
x1=[0.0000 0.0752 0.1793 0.2403 0.2771 0.3675 0.47960 0.5132 0.6744 0.7164 0.7962 0.8603 1.0000];
T=[117.46 116.56 114.60 113.60 112.80 111.00 108.70 108.00 105.20 104.50 103.11 102.10 99.56];
%Given constant
A=7.47429;
B=1314.188;
C=186.500;
A2=7.83800;
B2=1558.190;
C2=196.881;
Ptotal=760.00;
x2=1-x1;
%calculation of gamma1 and gamma2
for k=1:13
if x1(k)==0.0000  
    l1(k)=0.86;  
    l2(k)=exp((A21+2*(A12-A21)*x2(k))*(x1(k)^2));
elseif x1(k)==1.0000
     l1(k)=exp((A12+2*(A21-A12)*x1(k))*(x2(k)^2));
    l2(k)=0.97;
   
else  
l1(k)=exp((A12+2*(A21-A12)*x1(k))*(x2(k)^2));
l2(k)=exp((A21+2*(A12-A21)*x2(k))*(x1(k)^2));
end

Psat1(k)=10^(A-(B/(T(k)+C)));
Psat2(k)=10^(A2-(B2/(T(k)+C2)));
y1(k)=(Psat1(k)*l1(k)*x1(k))/Ptotal;
y2(k)=(Psat2(k)*l2(k)*x2(k))/Ptotal;
end

yexp=[0.0000 0.1146 0.2770 0.3615 0.4077 0.5152 0.6270 0.6580 0.7900 0.8247 0.8780 0.9180 1.0000];

%percentage error calculation

for k=1:13
    err(k)=(abs(y1(k)-yexp(k))/y1(k))*100;
end



  
figure
plot(x1,y1,'b',x1,y1+y2,'r')  % red line in this graph show y1+y2 value that should be equal to 1
hold on
grid on;
title('Y1X1 diagram: 2 Butanol & 1 Butanol');
xlabel('Experimental Mole fraction of 2 Butanol in liquid phase');
ylabel('Calculated Mole fraction of 2 Butanol in vapour phase');



figure
plot(x1,T,'g',y1,T,'r')
hold on
grid on;
title('TXY diagram: 2 Butanol & 1 Butanol');
xlabel('Experimental Mole fraction of 2 butanol in liquid phase');
ylabel('Temperature (in deg C)');


