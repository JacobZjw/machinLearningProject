function result=TOPSIS_MID(datas,poi)                   %�м���ת��Ϊ������
mid=input(['���ǵ�' num2str(poi) '�����ݣ���������ѵ���ֵ:']);                       %���ֵ
M=max(abs(datas-mid));                                  %����!!!!!!!
result=1-abs(datas-mid)./M;