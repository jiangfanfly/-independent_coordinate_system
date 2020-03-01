x=handles.x;
y=handles.y;
h=handles.h;
L0=str2num(get(handles.edit5,'string'));
n1=get(handles.popupmenu2,'value');
[B,L]=xy2BL(x',y',L0,n1);  %x,y ��˹ƽ������,L0���뾭������,n�����
ellipsoid=get_ellipsoid(n1); %��ȡ�������
a=ellipsoid.a;
b=ellipsoid.b;
e1=(sqrt(a^2-b^2))/a;
e2=(sqrt(a^2-b^2))/b;
c=a.*sqrt(1+e2^2);
B=dms2rad(B);
L=dms2rad(L);
Hm=mean(h);
ym=mean(y);
Bm=mean(B);          %��γ�ȵľ�ֵ
Lm=mean(L);
N=a/(sqrt(1-e1^2*(sin(Bm))^2));   %ƽ��γ�ȴ���î��Ȧ�뾶
Rm=(a*sqrt(1-e1^2))/(1-e1^2*(sin(Bm))^2); %�������ƽ���뾶
l=7362*sqrt(Hm)/(N*cos(Bm))*10^5;    %���Ȳ�(����)
L0=Lm-l;        %����ͶӰ�����뾭��
L0=rad2dms(L0);  %ת��Ϊdms��ʽ
% L0=rad2dms(Lm);
set(handles.edit2,'string',num2str(L0));
%���л�������
B=rad2dms(B);
L=rad2dms(L);
[X2,Y2]=BL2xy(B,L,L0,n1);
%����ֳ�����ԭ����߳�
X2m=mean(X2);
Y2m=mean(Y2);   %����ƽ������,ȷ��"���ԭ��"
set(handles.edit6,'string',num2str(Y2m));
H=Y2m^2/(2*Rm);
Hd=Hm-H;      %�ֳ�����ԭ����߳�
hh=h-Hd;      %�黯��߳�
set(handles.edit3,'string',num2str(Hd));
xx=X2+(X2-X2m).*Hd./Rm;           %ת������
yy=Y2+(Y2-Y2m).*Hd./Rm;
%�����γ��Ⱥ�ͶӰ�����
Ye=max(y);           %���λ�õĵ��y����
i=find(abs(y-Ye)<=1e-4);
He=hh(i);
Yw=min(y);           %������λ�õĵ��y����
j=find(abs(y-Yw)<=1e-4);
Hw=hh(j);
bxze=(Ye*1000)^2/(2*Rm^2)-He*1000/Rm;    %������߱���/mm
bxzw=(Yw*1000)^2/(2*Rm^2)-Hw*1000/Rm;    %���������߱���/mm
set(handles.edit7,'string',num2str(bxze));
set(handles.edit8,'string',num2str(bxzw));
Yemax=(+sqrt((2.5*10^(-5)+He/Rm)*(2*Rm^2)))/1000;   %���㶫�߾����������������/km
Ywmax=(-sqrt((2.5*10^(-5)+Hw/Rm)*(2*Rm^2)))/1000;   %�������߾����������������/km
dY=Yemax-Ywmax;                            %��������/km
set(handles.edit9,'string',num2str(Yemax));
set(handles.edit10,'string',num2str(Ywmax));
set(handles.edit11,'string',num2str(dY));
handles.B=B;
handles.L=L;
handles.Hd=Hd;
handles.hh=hh;
handles.X2=X2;
handles.Y2=Y2;
handles.xx=xx;
handles.yy=yy;
handles.Yemax=Yemax;
handles.Ywmax=Ywmax;
handles.dY=dY;
guidata(hObject,handles);