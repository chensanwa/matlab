function f = sequentially(data)
% data = importdata('english.txt');

S1 = data;
n = 10;
year = 53;
% % 一次移动平滑数列
% for index = 1:60
%     temp = 0;
%     for i = 1:n
%         temp = temp + S1(index+i-1);
%     end
%     S1(n+index) = temp ./ n;
% end
% plot(S1,'-*');
% title('一次指数')

% 一次指数平滑数列
a = 1/n;
for index = 1:year
    S1(n+index) = S1(n+index-1) + a .* S1(n+index-1) - a .* S1(n+index - n);
end
% figure(1)
% plot(S1,'-*');
% title('一次指数')                           

% 二次指数平滑数列
S2 = S1;
nb = 10;
b = 1 / nb;
for index = 1:year
    S2(n+index) = b .* S1(n+index) + (1 - b) .* S2(n+index-1);
end

% figure(2)
% plot(S2,'-*');
% title('二次指数') 


% 时间序列最终模型
S_result = S2;
for index = 1:n+year
    S_result(index) = 2 .* S1(index) - S2(index) + a .* (S1(index) - S2(index)) ./ (1 - a);
end

f = S_result;

% figure(3)
% plot(S_result,'-*');
% title('指数平滑法') 

% z=iddata(S_result);
% m=armax(z(1:69),'na',3,'nc',1);
% yp = predict(m,S_result,1);
% 
% figure(4)
% plot(S_result,'-.');
% hold on
% plot(yp,'r')
% grid
% legend('Original Data','Forecasting Data ARMA(2,1)')

end




