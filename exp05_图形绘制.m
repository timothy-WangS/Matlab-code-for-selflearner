%二维曲线绘制
    %基本函数
        %plot(y)
            %y为向量
                y = [1, 0, 1, 0, 1, 0, 1, 0, 1];
                plot(y);  % 纵坐标为y的值；横坐标自动为元素序号(角标+1)，此处为1~9
            %y为矩阵
                figure;  % 开启新绘图窗口，下一次绘图在新窗口
                y = [4, 5, 6; 1, 2, 3; 4, 5, 6];
                plot(y);  % 当y为矩阵，按每一列画出曲线，颜色自动区分
        %plot(x, y)
            %xy为向量
                x = [0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5];  % 在同一个x处有两个y值
                y = [1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0];  % xy元素数量相等
                plot(x, y)  % 先绘制曲线
                axis([0, 6, 0, 1.5])  % 改变横纵坐标标度: 横:0~6; 纵:0~1.5
            %x是向量y是矩阵 (y是向量x是矩阵)
                %x的长度与y的行或列数相等
                %x=y行: x与y的每一列画曲线
                %x=y列: x与y的每一行画曲线
            %xy都是矩阵
                x = 1:4;
                y = [x; 2*x];  % xy列数应相等
                plot(x, y)  % x的每一列对应y的每一列(1,1)(2,2)...(4,4);(1,2)(2,4)...(4,8)
        %plot(x1, y1, x2, y2...)
            x = 0:0.1:2*pi;
            y1 = sin(x);
            y2 = cos(x);
            plot(x, y1, x, y2)  % 在同一个窗口同一坐标轴绘制多条曲线
    %线性图形格式设置
        %线形颜色数据点
            plot(x, y1, 'b:o')  % 蓝色 点线 圆圈
            % b蓝 g绿 r红 c青 m紫 y黄 k黑 w白
            % -实线 :点线 --虚线 -.点画线
            % .实点 o圆圈 x叉 +十字 *星号 s方块 d钻石 v下三角 ^上三角 <左三角 >右三角 p五角星 h六角星
        %坐标轴
            plot(x, y1)
            axis([0, 4*pi, -2, 2])  % 规定横纵坐标范围
            %其他函数指令
                %axis([xmin xmax ymin ymax])设置坐标轴在指定的区间
                %axis auto 默认
                %axis manual 冻结当前坐标轴范围，以后叠加绘图都在当前坐标轴范围内显示
                %axis tight 用户数据范围为坐标轴范围比例：
                %axis equal 等比例坐标轴
                %axis square 以当前坐标轴范围为基础，将坐标轴区域调整为方格形
                %axis normal 自动调整纵横轴比例，使当前坐标轴范围内的图形显示达到最佳效果
        %网格和边框
            grid on;  % 显示网格线; grid off 不显示(默认)
            box off;  % 不显示坐标边框; box on 显示(默认)
	%图形修饰
        %标题标签
            title('a title');  % 图像标题
            xlable('this is x');  % x轴标记，同理还有ylable，zlable
        %图形文本标注
            text(x, y, 'str');  % 在指定坐标点添加文字注释
            gtext('str');  % 在鼠标选择位置添加注释; 'str1', 'str2'...可依次在选择位置添加注释
            %用转义字符串添加箭头或其他符号，自行查询
        %图例设置
            legend('str1', 'str2', 'location', 'best');  % str的顺序与绘图顺序一致; 'best'指图例位置最佳化，还有其他位置
        %图形保持
            plot(x1, y1);
            hold on;  % 在原有窗口y1曲线上增加绘制下一个图形
            plot(x2, y2);  % y2在同一窗口内被绘制 
        %分割绘制
            subplot(2, 2, 1);  % 分割成2x2区域，在第一块区域绘制下一个图形
            plot(x1, y1);  % y1被绘制在4块区域的第一块
            subplot(2, 2, 2);  % 分割方法相同，区域改变
            plot(x2, y2);  % y2在第二块区域
%二维特殊图形绘制
    %柱状图
        bar(x, y, width, '参数');  % x横坐标向量，m个元素; y为向量时，每个x画一竖条共m条，矩阵mxn时，每个x画n条;
                                   % width宽度默认0.8，超过1各条会重叠;
                                   % 参数有grouped分组式，stacked堆栈式; 默认grouped
                                   % bar垂直柱状图,barh水平柱状图,bar3三维柱状图,barh3水平三维柱状图(三维多一个参数detached, 且为默认)
    %饼形图
        pie(x, explode, 'lable');  % x为向量显示每个元素占总和百分比, 为矩阵显示每个元素占所有总和百分比
                                   % explode向量与x同长度，为1表示该元素被分离突出显示，默认全0不分离
                                   % pie3绘制三维饼图
    %直方图
        hist(y, n);  % y为向量，把横坐标分为n段绘制
        hist(y, x);  % x为向量，用于指定每段中间值, 若取N = hist(y, x), N为每段元素个数
    %离散数据图
        stairs(x, y, 'b-o');  % 阶梯图，参数同plot
        stem(x, y, 'fill');  % 火柴杆图，参数fill是填充火柴杆，或定义线形
        candle(HI, LO, CL, OP);  % 蜡烛图:HI为最高价格向量,LO为最低价格向量,CL为收盘价格向量,OP为开盘价格向量
    %向量图
        compass(u, v, 'b-o');  % 罗盘图横坐标u纵坐标v
        compass(Z, 'b-o');  % 罗盘图复向量Z
        feather(u, v, 'b-o');  % 羽毛图横坐标u纵坐标v
        feather(Z, 'b-o');  % 羽毛图复向量Z
        quiver(x, y, u, v);  % 以(x, y)为起点(u, v)为终点向量场图
    %极坐标图
        % polar(theta, rho, 'b-o');  % 极角theta, 半径rho
        theta = -pi:0.01:pi;
        rho = sin(theta);
        polar(theta, rho, 'b')
    %对数坐标图
        semilogx(x1, y1, 'b-o');  % 把x轴对数刻度表示, semilogy是y轴对数刻度表示，loglog是两个坐标都用对数表示
    %双纵坐标
        plotyy(x1, y1, x2, y2, 'fun1', 'fun2');  % fun规定了两条条线的绘制方式，如plot,semilogx,semilogy,loglog,stem等
    %函数绘图
        f = 'sin(2*x)';
        ezplot(f, [0, 2*pi]);  % 绘制f并规定横坐标范围，也有[xmin, xmax, ymin, ymax]
        x = '2*cos(t)';
        y = '4*sin(t)';
        ezplot(x, y);  % 绘制x(t),y(t)在[0, 2*pi]图像, 也可以在最后用[tmin, tmax]规定t的范围
%三维曲线曲面绘制
    %三维曲线
        x = 0:0.1:2*pi;
        y = sin(x); z = cos(x);
        plot3(x, y, z, 'b-*');
    %三维曲面
        %三维网格
            x = -5:0.1:5;  % 规定了x轴采样点，也规定了x轴范围
            y = -4:0.1:4;  % 规定了y轴采样点，也规定了y轴范围
            [X, Y] = meshgrid(x, y);  % 得到了xoy面网格点
            Z = X.^2+Y.^2;
            mesh(X, Y, Z, C)  % XY是meshgrid得到的网格点，Z是网格顶点，c是用色矩阵可省略
        %三维表面图
            x = -5:0.1:5;  
            y = -4:0.1:4;
            [X, Y] = meshgrid(x, y);
            Z = X.^2+Y.^2;  % 以上部分同上
            surf(X, Y, Z, C)  % 与上一个类似
        %特殊三维图形
            contour3(X, Y, Z, n);  % 等高线图，n为等高线条数，可省略，依照z自动确定
            waterfall(X, Y, Z);  % 瀑布图
        %绘制动画图形……？？？
