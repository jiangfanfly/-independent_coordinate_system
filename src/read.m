[filename,pathname]=uigetfile({'*.xlsx;*.xls','data Files(*.xlsx;*.xls)'},'���ļ�');
   if(isempty(pathname))
    returen;
end
filepath=strcat(pathname,filename);
[data,str]=xlsread(filepath,'sheet1','A:F');
n=data(:,1);
x=data(:,4);
y=data(:,5);
h=data(:,6);
str([1],:)=[];
dname=str(:,2);
dnd=str(:,3);
ym=mean(y);
Hm=mean(h);
mm=(0.00123*ym^2-15.7*Hm)*10^5;   %��ǰ�ۺϱ���

%���Ʊ��ι�ϵͼ
plot(y./1000,h,'*r');
hold on;
y1=linspace(0,500,100);
y2=linspace(0,500,100);
H1=((0.00123/15.7)*y1.^2+10^5*m/15.7)*1000;
H2=((0.00123/15.7)*y2.^2-10^5*m/15.7)*1000;
plot(y1,H1,'-.b',y2,H2,'-.b');

%ѡ��ͶӰ��
[B,L]=xy2BL(x,y,L0,n);  %x,y ��˹ƽ������,L0���뾭������,n�����
B=dms2rad(B);
L=dms2rad(L);
Bm=mean(B);          %��γ�ȵľ�ֵ
Lm=mean(L);
N=a/(sqrt(1+e1^2*(cosBm)^2));   %ƽ��γ�ȴ���î��Ȧ�뾶
Rm=(a*sqrt(1-e^2))/(1-e^2*(sinB)^2);
l=ym/N*cosBm;    %���Ȳ�(����)
L0=L-l;        %����ͶӰ�����뾭��
L0=rad2dms(L0);  %ת��Ϊdms��ʽ

%���л�������
L0=dms2rad(L0);
[B,L]=xy2BL(x',y',l,n1);
[X2,Y2]=BL2xy(B,L,L0,n1);
X2m=mean(X2);
Y2m=mean(Y2);   %����ƽ������,ȷ��"���ԭ��"
H=0.785*(Y2/1000)^2;
Hd=Hm-H;
xx=x+(x-x0).*Hd./R;
yy=y+(y-y0).*Hd./R;





%�ж�ʹ�÷���
H1=((0.00123/15.7)*ym.^2+10^5*m/15.7)*1000;
H2=((0.00123/15.7)*ym.^2-10^5*m/15.7)*1000;
if H2<h<H1
    msgbox('��ʾ!','����Ҫ�����ط�����ϵ');
else if (ym/1000)<10
     msgbox('��ʾ!','���õֳ��߳�����ΪͶӰ��');
    else if (Hm<10)
            msgbox('��ʾ!!','������ѡͶӰ��');
        else 
            msgbox('��ʾ','���õֳ��߳����Լ���ѡͶӰ���ķ���');
        end
    end
end
