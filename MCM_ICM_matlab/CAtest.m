%���
clc;
clear;
set(gcf,'DoubleBuffer','on');   %gcf�ǵ�ǰͼ��ľ��
N=256;   %���ӵ���Ŀ
grid=zeros(N);  %���� N*N
grid(6,8)=1;       %�����ʼ��Ϊ1
Ii=imshow(1-grid,[]);  %1Ϊ��ɫ��0Ϊ��ɫ
axis square;
grid_calc=zeros(N+2);   %Ϊ�˼���߽�
while(1)
    grid_calc(2:end-1,2:end-1)=grid;
    tmp=grid_calc(1:end-2,2:end-1)+grid_calc(3:end,2:end-1)+grid_calc(2:end-1,1:end-2)+grid_calc(2:end-1,3:end);
    grid=mod(tmp,2);
    set(Ii,'CData',1-grid);
    pause(0.1);
end
figure;