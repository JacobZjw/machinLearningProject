function result=TOPSISInterval(datas,poi)           %������
minData=input(['���ǵ�' num2str(poi) '�����ݣ��������������½�:']);                 
maxData=input('�������������Ͻ�:');
result=zeros(size(datas,1),1);%Ԥ����
M=max(minData-min(datas),max(datas)-maxData);
for i=1:size(datas)
    if datas(i)<=maxData&&datas(i)>=minData
        result(i)=1;
    elseif datas(i)>maxData
        result(i)=1-(datas(i)-maxData)/M;
    else
        result(i)=1-(minData-min(datas))/M;       
    end
end