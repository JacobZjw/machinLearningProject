% ��η�����

CR=0.1;
while CR>=0.1
    A = input( '�������' );            %����A
    [Vector,Values] = eig( A );         %Vector����������Values����ֵ
    % disp( Vector );
    % disp( Values );
    maxValue=max( max( Values ) );      %maxValue�������ֵ
    [n n]=size(A);                      %������Ŀ
    CI=( maxValue-n )/( n-1 );          %һ����ָ��consistency index
    RI=[0 0 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.599];
    % size(RI,2);
    CR=CI/RI(n);                        %��һ���Ա���CR,n>10�ɿ��Ƕ���ָ��
    if CR>=0.1
        disp( 'һ���Ա�������0.1������������' );
    end
end
disp( 'һ���Ա���Ϊ' );
CR;
%%
% % ����ƽ������Ȩ��
columnSum=sum( A );                     %��ÿһ��
columnSumMatrix=repmat(columnSum,n,1);  %��չ����
standardMatrix=A./columnSumMatrix;      %���
disp( '����ƽ����Ȩ��Ϊ' );
result1=sum( standardMatrix,2 )/n       %���
%%
% % ����ƽ������Ȩ��
rowProd=prod( A ,2);                    %����˽��
rowProd2=rowProd.^(1/n);                %�����n�η�
sumRow=sum(rowProd2);                   %�������
disp( '����ƽ������Ȩ��' );
result2=rowProd2./sumRow               %Ȩ��
%%
% % ����ֵ��Ȩ��
[Vector,Values] = eig( A );         %Vector����������Values����ֵ
maxValue=max( max( Values ) );           %��������ֵ
[row,column]=find(Values==maxValue ,1);%�������ֵ��λ��
disp( '����ֵ��Ȩ�ؽ��Ϊ' );
result3=Vector(:,column)/sum(Vector(:,column))