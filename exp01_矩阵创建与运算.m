%生成矩阵
    %直接法
        a = [1,2;3,4];
        a = [1,2
            3,4];
    %冒号一维矩阵 a = 开始：步长：结束，步长为1可省略
        a = 1:1:10;  % 1,2,...10
        a = 1:10;  %与上一个等价
    %函数生成
        %linspace(开始，结束，元素个数)，等差生成指定元素数的一维矩阵，省略个数则生成100个
            a = linspace(1,9,6);
        %logspace(lg开始，lg结束，元素个数)，对数等比生成指定元素数的一维矩阵，省略个数则生成100个
            a = logspace(1,4,6);  % 10^1~10^4之间，对数等比生成6个元素
        %特殊矩阵
            a = eye(4);  % eye(维数)单位阵
            a = zeros(4);  % zeros(维数)全零阵
            a = ones(4);  % ones(维数)全1阵
            a = magic(4);  % magic(维数)魔方阵，各行列对角线元素和相等
            a = rand(4);  % rand(维数)0~1分布随机阵
            a = randn(4);  % randn(维数)0均值正太分布随机阵
            m = [1,2,3;4,5,6;7,8,9];
            n = [1,2,3,4,5];
            a = diag(n,1);  % diag(行向量，主对角线上方第k条斜线)用行向量生成对角阵
            a = tril(m,1);  %tril(矩阵，主对角线上方第k条斜线)生成矩阵的下三角阵，triu上三角阵
%矩阵的修改
    %部分替换
        a(1,2) = 4;  % (行，列)元素替换
        a(1,:) = [2,2,2];  %(行,:)替换行，为[]删除该行
        a(:,1) = [2,2,2];  %(:,列)替换列，为[]删除该列
    %部分扩展
        %a = [a;bc]  b、c为矩阵，在a的下方添上b，下右方添c，bc列数之和应等于a
        %a = repmat(a,p,q)  把a复制扩展为p*q块
        %指定维数拼接
            %a = cat(1,m,n)  垂直拼接
            %a = cat(2,m,n)  水平拼接
            %a = cat(3,m,n)  三维拼接
                %a(:,:,1) = m ; a(:,:,2) = n
    %结构变换
        a = flipud(a);  %上下翻转，fliplr左右翻转
        a = rot90(a);  %逆时针转90度，rot90(a，k)转90度k倍，k>0逆时针转
    %转置
        a = a';
    %变维
        m = 1; n = 9;
        a = reshape(a,m,n);  %元素个数不变，矩阵变为m*n
%矩阵运算
    %加、减、乘、乘方
    %逆矩阵
        inv(a)
        pinv(a)  % 伪逆矩阵，当a不是方阵，求广义逆矩阵
    %除法
        z = a/b;  % a*inv(b)
        z = a\b;  % inv(a)*b
    %点运算
        %a.*b , a./b , a.\b , a.^b  对应元素的*,/,\,^运算
        %a./b = b.\a
    %行列式
        det(a)
    %秩
        rank(a)
    %迹
        trace(a)
    %伴随
        compan(a)
    %特征值，特征向量
        [v,D] = eig(a);  % 输出v为特征向量，D为特征值对角阵
    %矩阵的分解？？？
%信息获取
    %矩阵的行列数
        d = size(a);  % d = [行数，列数]
    %行列中最大的
        d = length(a);
    %总元素个数
        d = numel(a);
%字符串
    %创建
        str0 = 'hello world';  % 单引号引起
        str1 = 'I''m a student';  % 字符串中单引号写两遍
        str3 = ['I''m' 'a' 'student'];  % 方括号链接多字符串
        str4 = strcat(str0, str1);  % strcat连接字符串函数
        str5 = strvcat(str0, str1);  % strvcat连接产生多行字符串
        str6 = double(str0);  % 取str0的ASCII值，也可用abs函数
        str7 = char(str6);  % 把ASCII转为字符串
    %操作
        %比较
            strcmp(str0, str1);  % 相等为1，不等为0
            strncmp(str0, str1, 3);  % 比较前3个是否相等(n)
            strcmpi(str0, str1);  % 忽略大小写比较(i)
            strncmpi(str0, str1, 3);  % 忽略大小写比较前3个是否相等
        %查找替换
            strfind(str0, str1);  % 在str0找到str1的位置
            strmatch(str1, str0);  % 在str0字符串数组中找到str1开头的行数
            strtok(str0);  % 截取str0第一个分隔符（空格，tab，回车）前的部分
            strrep(str0, str1, str2);  % 在str0中用str2替换str1
        %其他
            upper(str0);  % 转大写，lower转小写
            strjust(str0, 'right');  % 将str0右对齐，left左对齐，center中间对齐
            strtrim(str0);  % 删除str0开头结尾空格
            eval(str0);  % 将str0作为代码执行
    %转换
        %___2___  -->  如num2str，将数字转字符串； dec2hex，将十进制转十六进制
        %abs，double取ASCII码；char把ASCII转字符串
%多维数组
    %创建
        %直接法
            a(:,:,1) = [1,2,3;2,3,4];
            a(:,:,2) = [3,4,5;4,5,6];
        %扩展法
            a = [1,2,3;2,3,4];
            a(:,:,2) = [3,4,5;4,5,6];  % 若不赋值第一页，第一页全为0
        %cat法
            a1 = [1,2,3;2,3,4];
            a2 = [3,4,5;4,5,6];
            a = cat(3,a1,a2);  % 把a1a2按照“3”维连接
        %特殊数组函数
            a = rand(2,2,2);
            a = randn(2,2,2);
            a = ones(2,2,2);
            a = zeros(2,2,2);
    %多维数组操作
        %元素提取
            x = a(1,1,1);  % 全下标法
            x = a(6);  % 单下标法
        %重排
            a = reshape(a,[1,2,4]);  % [行,列,页],按单下标顺序
            a = permute(a,[1,2,4]);  % [列,行,页]，整行、列移动
    %结构数组
        %创建
            %直接法
                stu(1).name = 'xiaoming';
                stu(1).age = 18;
                stu(1).score = [1,2,3,4];
                stu(2).name = 'xiaoqiang';
                stu(2).age = 20;
                stu(2).score = [2,3,4,5];
            %函数法
                stu(3) = struct('name', 'lihua', 'age', 19, 'score', [3,4,5,6]);  % struct(键1，值1，键2，值2......)
        %元素获取
            %"."
                str = stu(1).name;
            %getfield
                str = getfield(stu, {1}, 'name');
                scr = getfield(stu, {1}, 'score', {2});  % (结构体名，结构体角标，键名，键对应的值角标)
            %fieldnames
                x = fieldnames(stu);  % 获取结构体信息
        %结构体元素操作
            %修改
                stu = setfield(stu, {1}, 'age', 17);
                stu = setfield(stu, {2}, 'score', {2}, 9); %结构体名=setfield(结构体名,结构体角标,键名,键对应的值角标,新值)
            %删除
                stu = rmfield(stu, 'age');  % 删除stu中的age
    %元胞数组
        %高级数组，数组内元素可以不同，如数值矩阵，字符串，结构数组，元胞数组等
        %创建方法类同数组，只是用{}引起