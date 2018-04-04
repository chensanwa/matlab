function f = fun_gm(x0)
% x1:x0累加生成
x1 = zeros(1,length(x0));

for index = 1:length(x0)
    if index == 1
        x1(1,index) = x0(1,index);
    else 
        x1(1,index) = x1(1,index-1) + x0(1,index);
    end
end

% 最小二乘法所需矩阵
B = ones(length(x0)-1,2);
% 计算B矩阵
for index = 1:length(x0)-1
    B(index,1) = -(x1(1,index) + x1(1,index+1))/2;
end

% yn:最小二乘法所需列向量
yn = ones(length(x0)-1,1);

% 计算yn
for index = 1:length(x0)-1
    yn(index,1) = x0(1,index+1);
end

% a_:带估计参数向量
a_ = inv(B' * B) * B' * yn;

a = a_(1,1);
u = a_(2,1);

prediction_length = 5;     % 预测的个数或者预测的长度

% i:自变量的序号   根据实际情况进行更改(其长度为预测的数目)
i = [1:prediction_length];

% y1_:GM(1,1)预测模型
y1_ = (x0(1) - u./a) .* exp(-a .* i) + u./a;

% 用于打印出原始灰色预测模型图例,后期根据实际情况进行打印修饰
% figure(1)
% plot(i,y1_)
% title('1、原始灰色预测模型')


% 从此处开始GM（1，1）残差模型

x1_ = ones(1,prediction_length);         % 由初步GM（1，1）模型生成的数列y1_的模拟值

% 计算x1_
for index = 1:prediction_length
    x1_(1,index) = y1_(1,index);
end

% xx0:数列x1与其模拟值x1_只差生成的数列
xx0 = ones(1,prediction_length);


for index = 1:prediction_length
    xx0(1,index) = x1(1,index) - x1_(1,index);
end

% xx1:xx0累加生成
xx1 = zeros(1,length(xx0)-1); 
for index = 1:length(xx0-1)
    if index == 1
        xx1(1,index) = xx0(1,index);
    else 
        xx1(1,index) = xx1(1,index-1) + xx0(1,index);
    end
end

% 最小二乘法所需矩阵
xB = ones(length(xx0)-1,2);
% 计算B矩阵
for index = 1:length(xx0)-1
    xB(index,1) = -(xx1(index) + xx1(index+1))./2;
end

% xyn:最小二乘法所需列向量
xyn = ones(length(xx0)-1,1);

% 计算xyn
for index = 1:length(xx0)-1
    xyn(index,1) = xx0(1,index+1);
end

% xa_:带估计参数向量
xa_ = inv(xB' * xB) * xB' * xyn;

xa = xa_(1,1);
xu = xa_(2,1);


xprediction_length = 5;     % 预测的个数或者预测的长度

% xi:自变量的序号   根据实际情况进行更改(其长度为预测的数目)
xi = [1:xprediction_length];

% xy1_:GM(1,1)残差模型获得的灰色模型，
xy1_ = (xx0(1,1) - xu./xa) .* exp(-xa .* xi) + xu./xa;

% 用于打印出GM(1,1)残差模型获得的原始灰色模型图例,后期根据实际情况进行打印修饰
% figure(2)
% plot(xi,xy1_)
% title('2、GM(1,1)残差模型获得的原始灰色模型')



% xy0_：对xy1_进行求导数
xy0_ = (-xa) .* (xx0(1,1) - xu./xa) .* exp(-xa .* xi);
% figure(3)
% plot(xi,xy0_)
% title('3、GM(1,1)残差模型获得的原始灰色模型求导数')


% t之后的修正参数
fix=ones(1,4.*xprediction_length);      % 修正参数
for index = 1:xprediction_length
    if index <= xprediction_length
        fix(1,index) = 0;
    end
    fix(1,index) = index;
end

% GM(1,1)残差模型最终模型
% xyy1_ = y1_ +  fix .* xy0_;


xxi = [2017:1:2065];
xyy1_ = (x0(1) - u./a) .* exp(-a .* (xxi-2007)) + (-xa) .* (xx0(1) - xu./xa) .* exp(-xa .* (xxi-2007));

f = xyy1_;


end