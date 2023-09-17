clear all;
close all;
L=20000; %number of samples
x1 = -1 + (1+1)*rand(1,L); %노이즈 생성 
x2 = -1 + (1+1)*rand(1,L); %노이즈 생성 
x3 = -1 + (1+1)*rand(1,L); %노이즈 생성 
x4 = -1 + (1+1)*rand(1,L); %노이즈 생성 
x5 = -1 + (1+1)*rand(1,L); %노이즈 생성 
X=x1+x2+x3+x4+x5;


[A,B]=hist(X,40); % Bin 40개, A는 B가 얼마나 분포하는지
area=(B(2)-B(1))*sum(A);
pdf=A/area; % Scaling to meet the constraint that the integration of a pdf is "unitity"
mu = mean(X); % X의 평균
sigma = std(X); % X의 표준편차
normpdfX = normpdf(B,mu, sigma); % 정규분포 구하기
plot(B,pdf,'b--o',B,normpdfX);
xlabel('x','fontsize',14);
ylabel('Probability density f_X(x)','fontsize',14);
grid;
axis([-5 5 0 0.35]);


