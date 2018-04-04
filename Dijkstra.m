% Dijkstra�㷨���Ȩ·��Դ���·��
map = ones(13,13);  % map:��ʼͼ 
% res;                % res�����ͼ
n = 13;     %�ڵ�����
distance = ones(1,13);      %��Ž�����·��
current = 1;    %��ǰ�ڵ㣨��ǰλ�ã�
destination = 13;        %Ŀ��ڵ�
book = zeros(1,13);      % �������

% ��ʼ������
for i = 1:n
    for j = 1:n
        if(i == j) map(i,j) = 0;
        else map(i,j) = +inf;
        end
    end
end
map(1,2) = 2.6;	map(2,1) = 2.6;
map(1,3) = 2.3;	map(3,1) = 2.3;
map(1,5) = 2.5;	map(5,1) = 2.5;
map(1,6) = 2.4;	map(6,1) = 2.4;
map(2,4) = 3.9;	map(4,2) = 3.9;
map(2,9) = 2.7;	map(9,2) = 2.7;
map(3,8) = 2.4;	map(8,3) = 2.4;
map(4,5) = 1.7;	map(5,4) = 1.7;
map(5,13) = 2.2;map(13,5) = 2.2;
map(6,7) = 1.7;	map(7,6) = 1.7;
map(7,8) = 2.2;	map(8,7) = 2.2;
map(8,10) = 2.2;	map(10,8) = 2.2;
map(8,11) = 3.2;	map(11,8) = 3.2;
map(9,10) = 1.8;	map(10,9) = 1.8;
map(11,12) = 2.0;	map(12,11) = 2.0;
map(12,13) = 1.7;	map(13,12) = 1.7;

res = map;

% ����ͻ���������Ҫ����map������Ӧ��ֵ
% ��Ҫ�ڴ˴����ĵ�ǰ�ڵ�Ϊ��ǰλ�����Ӧ�Ľڵ�
% Ŀ��ڵ����ڴ˴��趨


% ��ʼ����ǰλ�õ�����ڵ�ĳ�ʼ����
for i = 1:n
    distance(1,i) = map(1,i);
end

% ��ʼ���������
for i = 1:n
    book(1,i) = 0;
end

book(1,current) = 1;    % ����ǰ�ڵ���Ϊ����·��

% Dijkstra�㷨�������
for i = 1:n-1
    min = inf;
    % �ҵ��뵱ǰ�ڵ�����Ľڵ�
    for j = 1:n
        if(book(1,j) == 0 && distance(1,j) < min)
            min = distance(1,j);
            u = j;
        end
    end
    % ���ҵ��Ľڵ���Ϊ������·��
    book(1,u) = 1;
    % �ɳڣ�ͨ�����ҵ����½ڵ�����ɳ������ڵ㵽Դ��ľ���
    for v = 1:n
        if(map(u,v) < inf)
            if(distance(1,v) > distance(1,u)+map(u,v))
                distance(1,v) = distance(1,u)+map(u,v);
            end
        end
    end
end

% ��Դ�㵽���ඨ��Ĵ�Ȩ���·��д��excel
xlswrite('dijkstra.xlsx',distance);
% ��Դ�㵽Ŀ��ڵ�����·�����
distance(1,destination)

x = 1:1:13;
plot(x,distance,'*-');
set(gca,'xTick',[1:1:13]);  %�ı�x����������ʾ
set(gca,'YTick',[0:0.5:10]);    % �ı�y����������ʾ
xlabel('�ڵ㣨��Ӧ��վ�㣩');
ylabel('Դ����̾�');




