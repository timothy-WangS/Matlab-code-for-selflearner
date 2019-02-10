%多项式
    %创建
        p = [1, 2, 3, 4];  % 系数向量，按x降幂排列，最右边是常数
        f1 = poly2str(p, 'x');  % 生成好看的字符串 f1 = x^3 + 2 x^2 + 3 x + 4，不被认可的运算式
        f2 = poly2sym(p);  % 生成可用的符号函数 f2 = x^3 + 2*x^2 + 3*x + 4
    %求值
        x1 = 4;
        x2 = [1, 2; 3, 4];
        p = [1, 2, 3, 4];
        y1 = polyval(p, x1);  % 代入求值；若x1为矩阵，则对每个值单独求值
        y2 = polyvalm(p, x2);  % 把x2当做矩阵求值
    %求根
        r = roots(p); % p同上，由系数求根，结果为根植矩阵
        p0 = poly(r);  % 由根求系数分，结果为系数矩阵
    %四则运算
        p1 = [1, 2, 3, 4];
        p2 = [3, 4, 5, 6];
        p = conv(p1, p2);  % 乘法，结果为系数矩阵
        [q, r] = deconv(p1, p2);  %除法，q为商式，r为余式，结果为系数矩阵
        %满足 p1 = conv(p2, q)+r
    %微积分
        p = polyder(p1);  % 求p1（系数矩阵）的导数系数矩阵
        I = polyint(p, k);  % 求p（系数矩阵）的不定积分的系数矩阵；k为常数项，不写默认为0
    %部分分式展开？？？
%数据插值
    %一维插值
        %yi = interp1(X, Y, xi, 'method')
        X = [-3, -1, 0, 1, 3];
        Y = [9, 1, 0, 1, 9];  % XY为已知点横纵坐标向量
        y2 = interp1(X, Y, 2);  % 差值预估在x=2的y的值，x不能超过已知范围(此处x<3)
        y2m = interp1(X, Y, 2, 'spline');  % 用spline方法(三次样条)差值预估在x=2的y的值
        %linear线性，nearest最邻近点，next下一点，previous前一点，spline三次样条，cubic三次多项式，pchip将替换cubic
    %二维插值
        %zi = interp1(X, Y, Z, xi, yi, 'method')
    %三维插值
        %ui = interp1(X, Y, Z, U, xi, yi, zi, 'method')
    %同上推广到n维插值
%数据拟合
    p1 = polyfit(X, Y, 2);  % 用“2”阶多项式拟合XY，p为拟合出的系数矩阵
    [p, s] = polyfit(X, Y, 2);  % s为采样误差结构体，包括R，df，normr
    % 命令行输入cftool
%数据统计
    %矩阵最大最小值
        y = max(X);  % 求矩阵X的最大值，min最小值
        [y, k] = max(X);  % 求最大值，k为该值的角标
        [y, k] = max(A, [], 2);  % A是矩阵，'2'时返回y每一行最大元素构成的列向量，k元素所在列；'1'时与上述相同
        Y = max(A, B);  % AB为同型矩阵，Y为二者对应位置最大值构成的矩阵
    %均值和中值
        y = mean(X);  % 均值
        y = median(X);  % 中值
        y = mean(A, 2);  % '2'时返回y每一行均值构成的列向量；'1'时与上述相同
        y = median(A, 2);  % '2'时返回y每一行中值构成的列向量；'1'时与上述相同
    %排序
        Y = sort(A, 1, 'ascend');  % sort(矩阵, dim, 'method')dim为1按列排序，2按行排序；ascend升序，descend降序
        [Y, I] = sort(A, 1, 'ascend');  % I保留了元素之前在A的位置
    %求和求积累加累乘
        y = sum(X);  % 求和
        y = sum(A, 2);  % '2'求各行和，得列向量；'1'同上，求各列的和，得行向量
        y = prod(X);  % 求积
        y = prod(A, 2);  % '2'求各行积，得列向量；'1'同上，求各列的积，得行向量
        y = cumsum(X);  % 累加
        y = cumsum(A, 2);  % '2'求各行累加，得列向量；'1'同上，求各列的累加，得行向量
        y = cumprod(X);  % 累乘
        y = cumprod(A, 2);  % '2'求各行累乘，得列向量；'1'同上，求各列的累乘，得行向量
    %标准差与相关系数
        d = std(X);
        D = std(A, 0, 2);  % '0''1'标准差公式略有区别；'2'求各行标准差，得列向量；'1'同上，求各列的标准差，得行向量
        R = corrcoef(X, Y);  % 返回相关系数，XY长度相等向量
        R = corrcoef(A);  % A每列相关系数矩阵
%数值计算
    %最(极)值
        x = fminbnd(fun, x1, x2);  % fun为函数的句柄或匿名函数，x1x2为待求范围，x为最小值点
        [x, y] = fminbnd(fun, x1, x2);  % y为最值点的函数值
        %无最大值计算方法，化为-f(x)最小值
        %多元函数在给定初值附近找最小值点
        x = fminsearch(fun, x0);
        [x, y] = fminsearch(fun, x0);
    %函数零点
        x = fzero(fun, x0);  % 在给定初值x0附近找零点
        [x, y] = fzero(fun, x0);
    %数值差分？？？
    %定积分
        q = quad(fun, a, b, tol, trace);  % ab积分上下限；tol绝对误差容限默认10^-6；trace是否展现积分过程，默认0不展现
        q = quadl(fun, a, b, tol, trace);  % 采用自适应Lobatto方法
        %多重积分
        q2 = dblquad(fun, xmin, xmax, ymin, ymax, tol);  % 二重积分
        q3 = dblquad(fun, xmin, xmax, ymin, ymax, zmin, zmax, tol);  % 三重积分
    %常微分方程求解？？？