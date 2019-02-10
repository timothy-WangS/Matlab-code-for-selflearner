%����ͼ����
    %��ȡ��ʾ�洢
        I = imread('pfm.jpg');  % ��ȡͼƬ�ļ���·��ʹ�þ���·����ǰĿ¼���ļ������Ӻ�׺
        imshow(I);  % ��ʾͼ��
        imwrite(I, 'pfm2.jpg')  % ����ͼ��
    %����ת��
        %���ת����
            [X1, map] = rgb2ind(I, n);  % nΪת������ɫ����ɫ��0~256��mapΪת������ɫ�����
            X2 = rgb2ind(I, map);  % ��Ԥ���趨����ɫ��mapת��
            [X3, map] = rgb2ind(I, tol);  % ����������ת����mapΪ���ɵ���ɫ��tol��0~1
        %����ת���
            I = ind2rgb(X, map);
        %���ת�Ҷ�
            G = rgb2gray(I);  % 0.229*R+0.587*G+0.114*B
        %�Ҷ�ת����
            [X4, map] = gray2ind(G, n);  % nΪ��ɫ���С��Ĭ��Ϊ64
        %����ת�Ҷ�
            G = ind2gray(X4, map);
        %ͼ��ת��ֵ
            %�Ҷ�ת��ֵ
                BW1 = im2bw(G, level);  % level�Ƕ�ֵ����ֵ0~1��Ĭ��0.5
            %����ת��ֵ
                BW2 = im2bw(X4, map, level);
            %���ת��ֵ
                BW3 = im2bw(I, level);
    %ͼ������
        %��������(ͬάͼ���Ӧ���ص�����)
            XA = imadd(X1, X2);  % �ӷ�
            XS = imsubtract(X1, X2);  % ����
            XM = immultiply(X1, X2);  % �˷�
            XD = imdivide(X1, X2);  % ���� 
        %��������
            %����
                R = imresize(I, scale, method);  % scale���ű���(����1�Ŵ�); method��ֵ����nearest,bilinear,bicubic
                [RX, MAP] = imresize(X1, map, scale, method);  % ��������ͼ
            %��ת
                J= imrotate(I, angle, method, bbox);%angle�Ƕ�,��ֵ��ʱ��;method��ֵ����nearest,bilinear,bicubic;bbox��ת����ʾ��ʽ
            %����
                CM = imcrop(I);  % �����ָ����������
                CR = impcop(I, rect);  % ��ָ��������У�Ϊ������(�����)[Xmin, Ymin, width, height]
        %ͼ����ǿ
            %ֱ��ͼ
                imhinst(I, n);  % nΪ�Ҷȼ���Ĭ��256������ͼ��imhinst(X, map)
            %�Ҷȵ�����ǿ
                Adj = imadjust(I);
            %ֱ��ͼ������ǿ
                His = histeq(I);
        %ͼ���˲�
              