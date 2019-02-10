%符号对象创建
    %sym函数
        p = sin(pi/3);
        P = sym(p, 'r');  % 用数值p创建符号常量P；'d'浮点数'f'有理分式的浮点数'e'有理数和误差'r'有理数
    %syms函数
        syms a b c d;  % 声明符号变量
        f = a8*b^2 + c/d;  % 创建符号函数
    %自由符号变量
        %默认x，没有则找与x距离最小，同距ASCII大优先，大写字母在所有小写字母之后
        symvar(f);  % 列出f中所有符号变量
        symvar(f, 3);  % 按顺序列出f中3个符号变量
    %符号运算
        %除加减乘除外
        % '转置 ； ==相等 ； ~=不等 
        % sin, cos, tan; asin, acos, atan 三角反三角
        % sinh, cosh, tanh; asinh, acosh, atanh 双曲反双曲
        % conj复数共轭；real复数实部；imag复数虚部；abs复数模；angle复数幅角
        % diag矩阵对角；triu矩阵上三角；tril矩阵下三角；inv逆矩阵；det行列式；rank秩；poly特征多项式；
        % |----expm矩阵指数函数；eig矩阵特征值和特征向量；svd奇异值分解；
    %符号对象识别与精度转换
        class(f);  % 返回f的类型
        isa(f, 'double');  % 判断f是否为double型，是返回1
        whos;  % 给出所有内存变量属性" whos f "仅给出f的属性
        digits;  % 显示当前用于计算的精度
        digits(16);  % 将计算精度改为16位，降低精度有时可以加快程序运算速度或减少空间占用
        a16 = vpa(sqrt(2));  % vpa括起的运算使sqrt(2)运算按照规定的精度执行
        a8 = vpa(sqrt(2), 8);  % 在vpa内控制精度，离开这一步精度恢复
%符号多项式函数运算
    %符号表达形式与相互转化
        %多项式展开整理
            g = expand(f);  % 展开
            h = collect(g);  % 整理(默认按x整理)
            h1 = collect(f, x);  % 按x整理（降幂排列等）
            preety(h1);  % 把表达式化为一般书写形式（如省略*等）
        %因式分解展开质因数
            f = factor(h);  % 因式分解
            factor(12);  % 对12分解质因数
            g1 = horner(f);  % 将f转为嵌套形式（秦九韶算法）
        %多项式代换与数值代入
            fW = subexpr(f, 'W');  % 自动找f中出现最多的因式，代换为W，从而将表达式化为fW
            f = a+b*x;
            f1 = subs(f, cos(d));  % 把f中的自由变量用cos(d)代换，cos(d)可以为常数
            f2 = subs(f1, cos(d), cos(c));  % 把f1中的cos(d)用cos(c)代换
    %符号多项式向量形式与计算
        syms a b c;
        n = [a, b, c];
        roots(n);  % 求符号多项式ax^2+bx+c的根
        n = [1, 2, 3];
        roots(n);  % 求符号多项式带入a=1, b=2, c=3的根
    %反函数与复合函数
        fi = finverse(f, x);  % 对f中的变量x求反函数
        syms x y z t;
        f = x^-t;
        g = sin(y);
        h1 = compose(f, g);  % 求f(g(x)),默认用g(z)代换f中的x，得sin(y)^-t
        h2 = compose(f, g, t);  % 求f(g(t)),得sin(t)^-t
        h3 = compose(f, g, x, z);  % 求f(g(z)),用g(z)代换f中的x
        h4 = compose(f, g, t, z);  % 求f(g(z)),用g(z)代换f中的t
%符号微积分
    %函数的极限和级数运算
        % 常量a，b
        %极限
            limit(f, x, a);  % 求f(x), x->a
            limit(f, a);  % 默认变量->a
            limit(f);  % 默认变量->0
            limit(f, x, a, 'right');  % 求f(x), x->a+, 'left' x->a-
        %基本级数运算
            %求和
                symsum(s, x, a, b);  % 计算表达式s变量x从a到b的级数和，或symsum(s, x, [a b])或symsum(s, x, [a;b])
                symsum(s, a, b);  % 计算s默认变量从a到b的级数和
                symsum(s);  % 计算s默认变量从0到n-1的级数和
            %一维泰勒展开
                taylor(f, x, a);  % f在x=a处展开为五阶泰勒级数
                taylor(f, x);  % f在x=0处展开为五阶泰勒级数
                taylor(f);  % f在默认变量=0处展开为五阶泰勒级数
    %符号微分
        %单变量求导（单变量偏导）
            n = 5;  % 常量n
            fn = diff(f, x, n);  % f对x的n阶导
            f1 = diff(f, x);  % f对x的1阶导
            diff(f, n);  % f对默认变量的n阶导
            diff(f);  % 默认变量1阶导
        %多元偏导
            fxy = diff(f, x, y);  % 先求x偏导，再求y偏导
            fxyz = diff(f, x, y, z);  % 先求x偏导，再求y偏导,再求z偏导
        %隐函数求导
            % 没有专门公式，根据dy/dx = -(Fx/Fy)
            DF_dx = -diff(f, x)/diff(f, y);
        %雅可比行列式
            % F = [f1, f2...], v = [x, y, z...]
            jacobian(F, v);  % 结果为[f1对x偏导，f2对x偏导...][f1对y偏导,f2对y偏导...][...]...
        %离散数据差分？？？
    %符号积分
        %积分命令
            int(f, x, a, b);  % 函数f变量x在ab区间定积分
            int(f, a, b);  % 函数f默认变量在ab区间定积分
            int(f, x);  % 函数f变量x不定积分
            int(f);  % 函数f默认变量不定积分
        %符号积分变换？？？
            % 傅里叶，拉普拉斯，Z变换
%符号方程求解
    %符号代数方程
        %一元方程
            eqn1 = a*x==b;
            S = solve(eqn1);  % 返回eqn符号解
        %多元方程组
            eqn21 = x-y==a;
            eqn22 = 2*x+y==b;
            [Sx, Sy] = solve(eqn21, eqn22, x, y);  % [Svar1,...SvarN]=solve(eqn1,...eqnM, var1,...varN),MN不一定相等
            [Sxn, Syn] = solve(eqn21, eqn22, x, y, 'ReturnCondition', true);  % 加上参数ReturnCondition可返回通解及解的条件
            % 其他参数(参数加上true生效)
                % IgnoreProperty，忽略变量定义时一些假设
                % IgnoreAnalyticConstraints，忽略分析限制；
                % MaxDegree，大于3解显性解；
                % PrincipleValue，仅主值
                % Real，仅实数解
        %非线性fsolve
            X = fsolve(fun, X0, optimset(option));  % fun函数.m文件名；X0求根初值；option选项如('Display','off')不显示中间结果等
    %符号常微分方程求解？？？
    %一维偏微分方程求解？？？