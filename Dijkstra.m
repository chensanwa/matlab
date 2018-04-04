% Dijkstra算法求带权路单源最短路径
map = ones(13,13);  % map:初始图 
% res;                % res：结果图
n = 13;     %节点总数
distance = ones(1,13);      %存放结果最短路径
current = 1;    %当前节点（当前位置）
destination = 13;        %目标节点
book = zeros(1,13);      % 标记数组

% 初始化数据
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

% 若有突发情况，需要更改map矩阵相应的值
% 需要在此处更改当前节点为当前位置相对应的节点
% 目标节点需在此处设定


% 初始化当前位置到其余节点的初始距离
for i = 1:n
    distance(1,i) = map(1,i);
end

% 初始化标记数组
for i = 1:n
    book(1,i) = 0;
end

book(1,current) = 1;    % 将当前节点标记为加入路径

% Dijkstra算法核心语句
for i = 1:n-1
    min = inf;
    % 找到离当前节点最近的节点
    for j = 1:n
        if(book(1,j) == 0 && distance(1,j) < min)
            min = distance(1,j);
            u = j;
        end
    end
    % 将找到的节点标记为加入结果路径
    book(1,u) = 1;
    % 松弛，通过刚找到的新节点进行松弛其他节点到源点的距离
    for v = 1:n
        if(map(u,v) < inf)
            if(distance(1,v) > distance(1,u)+map(u,v))
                distance(1,v) = distance(1,u)+map(u,v);
            end
        end
    end
end

% 将源点到其余定点的带权最短路径写入excel
xlswrite('dijkstra.xlsx',distance);
% 将源点到目标节点的最短路径输出
distance(1,destination)

x = 1:1:13;
plot(x,distance,'*-');
set(gca,'xTick',[1:1:13]);  %改变x轴坐标间隔显示
set(gca,'YTick',[0:0.5:10]);    % 改变y轴坐标间隔显示
xlabel('节点（相应的站点）');
ylabel('源点最短距');




