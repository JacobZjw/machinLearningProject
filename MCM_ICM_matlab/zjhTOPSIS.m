name='20��������ˮ���������.xlsx';
poi='B2:E21';
datas=xlsread(name,poi);                %���Excel�ļ�������
num=[];% input('������Ҫ���������,��[1 2 3]');
w=ones(1,size(num,1));
Type=[];% input('�������Ӧ�����ͣ�1�Ǽ�С�ͣ�2���м��ͣ�3�������ͣ���[2 3 1]��');
Judge=0;% input('�����Ƿ���Ҫ����Ȩ�أ���Ҫ������1������Ҫ������0��');
if Judge==1
    w=[];% input('������ÿһ�е���ӦȨ��,��[0.6 0.9 0.8]��');
end
for i=1:size(num,2)
    if Type(i)==1
        datas(:,num(i))=TOPSIS_MIN(datas(:,num(i)));           %��С��
    elseif Type(i)==2
        datas(:,num(i))=TOPSIS_MID(datas(:,num(i)),num(i));     %�м���
    elseif Type(i)==3
        datas(:,num(i))=TOPSISInterval(datas(:,num(i)),num(i));        %������
    end
end
%�����ֻ�����׼��
for i=1:size(num,2)
    datas2(:,i)=datas(:,i)./sum(datas(:,i));   %��׼��
end

%��һ��sum(datas2,1)
DPositive=((datas2-repmat(max(datas2),size(datas2,1),1)).^2).^0.5;
DPositive=repmat(w,size(datas2,1),1).*DPositive;
DNegative=((datas2-repmat(min(datas2),size(datas2,1),1)).^2).^0.5;
DNegative=repmat(w,size(datas2,1),1).*DNegative;
datas3=DNegative./(DPositive+DNegative);
for i=1:size(num,2)
    datas4(:,i)=datas(:,i)./sum(datas(:,i));   %��׼��
end

