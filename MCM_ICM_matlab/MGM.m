clear all
clc
%�����Ԥ��ʱ�� k ��ԭʼ���� X0
% k=9;%k����9����ʾ��9����Ԥ��ֵ
X0=[481.8, 509.3, 532.9, 544.5, 554.2, 576.7, 617.3, 618.2, 623.5, 614.7, 621.0;
    166.2, 175.9, 200.1, 258.1, 293.5, 334.8, 376.4, 405.9, 421.3, 390.1, 389.7];
X0=X0';
%��ԭʼ���� X0 �ۼ��������� X1
[n,m]=size(X0);%mΪָ�꣬nΪ��������
for j=1:m 
    c=0;
    for i=1:n
 	  c=X0(i,j)+c;
      X1(i,j)=c;
    end
end
%�������ݾ��� L
for j=1:m
    for i=1:n- 1
        l(i,j)=(X1(i,j)+X1(i+1,j))/2;
    end
end
L=[l ones(n- 1,1)];
%���� Y ����������ֵ
for j=1:m
    Y(1:n-1,j)=X0(2:n,j);
    D(:,j)=inv(L'*L)*L'*Y(1:n- 1,j) ;
end
D=D';
A=D(1:end,1:end- 1);
B=D(1:end,end);
% %����ģ�͵����ֵ��Ԥ��ֵ
% S=X1(1,1:end);
% if k==1
%     Z=S'
% elseif k>1
% %     Z=expm2(A*(k- 1))*S' +inv(A)*(expm2(A*(k- 1))- eye(size(expm2(A*(k- 1)))))*B- (expm2(A*(k- 2))*S'+inv(A)*(expm2(A*(k- 2))- eye(size(expm2(A*(k- 2)))))*B)
%     Z=myFunction(A*(k- 1))*S' +inv(A)*(myFunction(A*(k- 1))- eye(size(myFunction(A*(k- 1)))))*B- (myFunction(A*(k- 2))*S'+inv(A)*(myFunction(A*(k- 2))- eye(size(myFunction(A*(k- 2)))))*B)
% else
%     disp(' �������! k ����С�� 1')
% end
S=X1(1,1:end);
year=13;
Z=zeros(year,m);
Z(1,1:m)=S';
for i=2:year
    Z(i,1:m)=myFunction(A*(i- 1))*S' +inv(A)*(myFunction(A*(i- 1))- eye(size(myFunction(A*(i- 1)))))*B- (myFunction(A*(i- 2))*S'+inv(A)*(myFunction(A*(i- 2))- eye(size(myFunction(A*(i-2)))))*B)
end
