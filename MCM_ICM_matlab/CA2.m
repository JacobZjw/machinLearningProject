%�н���ڵĳ���ģ�����
%ֱ�н����о�����
%function []=in_yuanbao(p,long)
%p ����ʻ��ĸ���
%long ��·���� m
%width С����� m
%nִ�еĲ��� Ϊ1000��
%����·��Ϊ4��
%С����·Ϊ����
p=20;
long=500;
width=500;
n=1000;
L_car=ones(width/5,long/5).*1.2;
V_car=ones(width/5,long/5).*1.2;
L_car(width/10,:)=0;
L_car(:,long/10)=0;
flag=0;%flag �����ж��Ƿ��г��ڵȴ��������뿪������
a=0;
 figure();
 H=imshow(L_car,[]);
 set(gcf,'position',[241 132 560 420]) ;%241 132 560 420(�趨plot���ͼƬ�ĳߴ�)
 set(gcf,'doublebuffer','on'); %�趨Ϊ˫����ģʽ
 title('Ԫ���Զ�����ͨģ��','color','b');
Tred=10;
Tgreen=10;%���̵�ʱ��
 L=L_car(width/10,1:long/10-1);
 V=V_car(width/10,1:long/10-1);
 L_1=L_car(width/10,long/10+1:end);%ֱ��·��ͳ��
 V_1=V_car(width/10,long/10+1:end);
 bL_2=L_car(width/10+1:end,long/10);%��ת·��ͳ��
 bV_2=V_car(width/10+1:end,long/10);
 bL_3=L_car(width/10-1:-1:1,long/10);%��ת·��ͳ��
 bV_3=V_car(width/10-1:-1:1,long/10);
 L_2=bL_2';
 L_3=bL_3';
 V_2=bV_2';
 V_3=bV_3';
 gs1=zeros(1,n);
for i=1:n
    a=a+1;%���ڼ�ʱ���������̵Ƽ���
        V(:,:)=0;
        V_1(:,:)=0;
        V_2(:,:)=0;
        V_3(:,:)=0;
    if   p>=rand(1)*100
         L(1,1)=1;
    end  
    %�ٶ��趨
    V(L(:,1:end-2)==1&L(:,2:end-1)==0&L(:,3:end)==0)=2;
    V(L(:,1:end-2)==1&L(:,2:end-1)==0&L(:,3:end)==1)=1;
    V(L(:,1:end-2)==1&L(:,2:end-1)==1)=0;
    %    a=a+1;      
       % V(:,long/5-1)=0
    %end
    if L(1,end)==0&&L(1,end-1)==1
        L(1,end)=1;
        L(1,end-1)=0;
    end
    L([zeros(1,1) V(:,1:end-1)]==1)=1;
    L([zeros(1,2) V(:,1:end-2)]==2)=1;
    L(V(:,1:end)==2|V(:,1:end)==1)=0;

%����Ϊ֮ǰ��ֱ��·�Ρ�
    if a>Tred
        if a<Tred+Tgreen               
            if L(1,end)==1 %����г��ȴ�
                L_car(width/10,1:long/10)=1;
                L_car(width/10,1:long/10)=0;
                L(1,end)=0;
                turn=randperm(3,1); 
                if turn==1
              %�ж�Ϊֱ��
                L_1(1,1)=1;   
                end
              if turn==2
              %�ж�Ϊ��ת
                L_2(1,1)=1;   
              end
                if turn==3
              %�ж�Ϊ��ת
                L_3(1,1)=1;   
                end
            end
        else
            a=0;
        end                             
    end
    %--------------------------------------------------------
    V_1(L_1(:,1:end-2)==1&L_1(:,2:end-1)==0&L_1(:,3:end)==0)=2;
    V_1(L_1(:,1:end-2)==1&L_1(:,2:end-1)==0&L_1(:,3:end)==1)=1;
    V_1(L_1(:,1:end-2)==1&L_1(:,2:end-1)==1)=0;

    L_1([zeros(1,1) V_1(:,1:end-1)]==1)=1;
    L_1([zeros(1,2) V_1(:,1:end-2)]==2)=1;
    L_1(V_1(:,1:end)==2|V_1(:,1:end)==1)=0;
    L_1(1,end)=0;
    L_1(1,end-1)=0;
    
    %--------------------------------------------------------
    V_2(L_2(:,1:end-2)==1&L_2(:,2:end-1)==0&L_2(:,3:end)==0)=2;
    V_2(L_2(:,1:end-2)==1&L_2(:,2:end-1)==0&L_2(:,3:end)==1)=1;
    V_2(L_2(:,1:end-2)==1&L_2(:,2:end-1)==1)=0;
    L_2([zeros(1,1) V_2(:,1:end-1)]==1)=1;
    L_2([zeros(1,2) V_2(:,1:end-2)]==2)=1;
    L_2(V_2(:,1:end)==2|V_2(:,1:end)==1)=0;
    L_2(1,end)=0;
    L_2(1,end-1)=0;
    %--------------------------------------------------------
    V_3(L_3(:,1:end-2)==1&L_3(:,2:end-1)==0&L_3(:,3:end)==0)=2;
    V_3(L_3(:,1:end-2)==1&L_3(:,2:end-1)==0&L_3(:,3:end)==1)=1;
    V_3(L_3(:,1:end-2)==1&L_3(:,2:end-1)==1)=0;
    L_3([zeros(1,1) V_3(:,1:end-1)]==1)=1;
    L_3([zeros(1,2) V_3(:,1:end-2)]==2)=1;
    L_3(V_3(:,1:end)==2|V_3(:,1:end)==1)=0;
    L_3(1,end)=0;
    L_3(1,end-1)=0;
    
    
    L_car(width/10,1:long/10-1)=L;
    L_car(width/10,long/10+1:end)=L_1;
    L_car(width/10+1:end,long/10)=L_2';%��ת·��ͳ��
    L_car(width/10-1:-1:1,long/10)=L_3';
    set(H,'CData',L_car);
    n1=find(L>=1);
    gs1(1,i)=length(n1);
    pause(0.1);
end
%end
