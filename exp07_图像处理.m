%数字图像处理
    %读取显示存储
        I = imread('pfm.jpg');  % 读取图片文件，路径使用绝对路径或当前目录下文件名，加后缀
        imshow(I);  % 显示图像
        imwrite(I, 'pfm2.jpg')  % 保存图像
    %类型转换
        %真彩转索引
            [X1, map] = rgb2ind(I, n);  % n为转换后颜色表颜色数0~256，map为转换后颜色表矩阵
            X2 = rgb2ind(I, map);  % 按预先设定的颜色表map转换
            [X3, map] = rgb2ind(I, tol);  % 按均匀量化转换，map为生成的颜色表，tol在0~1
        %索引转真彩
            I = ind2rgb(X, map);
        %真彩转灰度
            G = rgb2gray(I);  % 0.229*R+0.587*G+0.114*B
        %灰度转索引
            [X4, map] = gray2ind(G, n);  % n为颜色表大小，默认为64
        %索引转灰度
            G = ind2gray(X4, map);
        %图像转二值
            %灰度转二值
                BW1 = im2bw(G, level);  % level是二值化阈值0~1，默认0.5
            %索引转二值
                BW2 = im2bw(X4, map, level);
            %真彩转二值
                BW3 = im2bw(I, level);
    %图像运算
        %代数运算(同维图像对应像素点运算)
            XA = imadd(X1, X2);  % 加法
            XS = imsubtract(X1, X2);  % 减法
            XM = immultiply(X1, X2);  % 乘法
            XD = imdivide(X1, X2);  % 除法 
        %几何运算
            %缩放
                R = imresize(I, scale, method);  % scale缩放倍数(大于1放大); method插值方法nearest,bilinear,bicubic
                [RX, MAP] = imresize(X1, map, scale, method);  % 用于索引图
            %旋转
                J= imrotate(I, angle, method, bbox);%angle角度,正值逆时针;method插值方法nearest,bilinear,bicubic;bbox旋转后显示方式
            %剪切
                CM = imcrop(I);  % 用鼠标指定裁切区域
                CR = impcop(I, rect);  % 按指定区域裁切，为行向量(坐标点)[Xmin, Ymin, width, height]
        %图像增强
            %直方图
                imhinst(I, n);  % n为灰度级，默认256，索引图用imhinst(X, map)
            %灰度调整增强
                Adj = imadjust(I);
            %直方图均衡增强
                His = histeq(I);
        %图像滤波
              