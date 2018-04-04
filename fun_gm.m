function f = fun_gm(x0)
% x1:x0�ۼ�����
x1 = zeros(1,length(x0));

for index = 1:length(x0)
    if index == 1
        x1(1,index) = x0(1,index);
    else 
        x1(1,index) = x1(1,index-1) + x0(1,index);
    end
end

% ��С���˷��������
B = ones(length(x0)-1,2);
% ����B����
for index = 1:length(x0)-1
    B(index,1) = -(x1(1,index) + x1(1,index+1))/2;
end

% yn:��С���˷�����������
yn = ones(length(x0)-1,1);

% ����yn
for index = 1:length(x0)-1
    yn(index,1) = x0(1,index+1);
end

% a_:�����Ʋ�������
a_ = inv(B' * B) * B' * yn;

a = a_(1,1);
u = a_(2,1);

prediction_length = 5;     % Ԥ��ĸ�������Ԥ��ĳ���

% i:�Ա��������   ����ʵ��������и���(�䳤��ΪԤ�����Ŀ)
i = [1:prediction_length];

% y1_:GM(1,1)Ԥ��ģ��
y1_ = (x0(1) - u./a) .* exp(-a .* i) + u./a;

% ���ڴ�ӡ��ԭʼ��ɫԤ��ģ��ͼ��,���ڸ���ʵ��������д�ӡ����
% figure(1)
% plot(i,y1_)
% title('1��ԭʼ��ɫԤ��ģ��')


% �Ӵ˴���ʼGM��1��1���в�ģ��

x1_ = ones(1,prediction_length);         % �ɳ���GM��1��1��ģ�����ɵ�����y1_��ģ��ֵ

% ����x1_
for index = 1:prediction_length
    x1_(1,index) = y1_(1,index);
end

% xx0:����x1����ģ��ֵx1_ֻ�����ɵ�����
xx0 = ones(1,prediction_length);


for index = 1:prediction_length
    xx0(1,index) = x1(1,index) - x1_(1,index);
end

% xx1:xx0�ۼ�����
xx1 = zeros(1,length(xx0)-1); 
for index = 1:length(xx0-1)
    if index == 1
        xx1(1,index) = xx0(1,index);
    else 
        xx1(1,index) = xx1(1,index-1) + xx0(1,index);
    end
end

% ��С���˷��������
xB = ones(length(xx0)-1,2);
% ����B����
for index = 1:length(xx0)-1
    xB(index,1) = -(xx1(index) + xx1(index+1))./2;
end

% xyn:��С���˷�����������
xyn = ones(length(xx0)-1,1);

% ����xyn
for index = 1:length(xx0)-1
    xyn(index,1) = xx0(1,index+1);
end

% xa_:�����Ʋ�������
xa_ = inv(xB' * xB) * xB' * xyn;

xa = xa_(1,1);
xu = xa_(2,1);


xprediction_length = 5;     % Ԥ��ĸ�������Ԥ��ĳ���

% xi:�Ա��������   ����ʵ��������и���(�䳤��ΪԤ�����Ŀ)
xi = [1:xprediction_length];

% xy1_:GM(1,1)�в�ģ�ͻ�õĻ�ɫģ�ͣ�
xy1_ = (xx0(1,1) - xu./xa) .* exp(-xa .* xi) + xu./xa;

% ���ڴ�ӡ��GM(1,1)�в�ģ�ͻ�õ�ԭʼ��ɫģ��ͼ��,���ڸ���ʵ��������д�ӡ����
% figure(2)
% plot(xi,xy1_)
% title('2��GM(1,1)�в�ģ�ͻ�õ�ԭʼ��ɫģ��')



% xy0_����xy1_��������
xy0_ = (-xa) .* (xx0(1,1) - xu./xa) .* exp(-xa .* xi);
% figure(3)
% plot(xi,xy0_)
% title('3��GM(1,1)�в�ģ�ͻ�õ�ԭʼ��ɫģ������')


% t֮�����������
fix=ones(1,4.*xprediction_length);      % ��������
for index = 1:xprediction_length
    if index <= xprediction_length
        fix(1,index) = 0;
    end
    fix(1,index) = index;
end

% GM(1,1)�в�ģ������ģ��
% xyy1_ = y1_ +  fix .* xy0_;


xxi = [2017:1:2065];
xyy1_ = (x0(1) - u./a) .* exp(-a .* (xxi-2007)) + (-xa) .* (xx0(1) - xu./xa) .* exp(-xa .* (xxi-2007));

f = xyy1_;


end