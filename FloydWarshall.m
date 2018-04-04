% Floyd-Warshall求解带权路多源最短路径
% map:初始图  res：结果图
map = ones(13,13);
res = ones(13,13);
n = 13;     %节点总数

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

%Floyd-Warshall核心算法
for k = 1:n
    for i = 1:n
        for j = 1:n
            if(res(i,j) > res(i,k)+res(k,j))
                res(i,j) = res(i,k)+res(k,j);
            end
        end
    end
end
% 输出原始图
map

% 输出结果图
res

%输出到相应的excel表
xlswrite('map.xlsx',map);
xlswrite('res.xlsx',res);
