%程序结构
    %顺序结构
        %数据输入
            x = input('输入x');
            x = input('输入x', 's');  % 输入变量保存为str类型
        %数据输出
            disp(x);
            a = 5;
            disp(['a=', num2str(a)]);  % 输出为数字时转化为字符串
    %选择结构
        %if-elseif-else-end
            if a>0
                disp(x);
            elseif a==0
                disp(a);
            else
                disp(a-1);
            end
        %switch-case-otherwise-end
            switch a
                case 0
                    disp(a);
                case 1
                    disp(a+1);
                otherwise
                    disp('err');
            end
        %try-catch
            x = 1; y =4;
            try
                z = x*y;
            catch
                z = x.*y;  % 若try出错，则执行
            end
            disp(z);
            disp(lasterr);  % 如果try出错，错误会保留在lasterr里
	%循环结构
        %for 循环变量=初值:步长:终值 - end
            for i=0:1:10  % 步长为负，则初值大于终值
                disp(i);  % 循环体内不可对循环变量做修改
            end
        %while-end
            while a>2
                disp(a);
                a = a-1;
            end
	%程序控制
        %pause
            pause;  % 按下任意键继续
            pause(6);  % 暂停6秒后继续
        %continue 跳过当次循环剩下语句，进入下一循环
        %break 跳出当前循环
        %return 跳出程序并返回
%m文件
    %脚本文件：没有输入输出参数，执行后变量结果返回工作空间，可直接运行
        %以下是脚本文件，文件名假设为exp.m
        %**********************************************
            clear
            r = 5;
            s = pi*r*r;
            p = 2*pi*r;
            disp(s)
            disp(p)
        %**********************************************
        %以下是调用
        %**********************************************
            exp
        %**********************************************
    %函数文件：以function开头，有输入输出，变量为局部变量不返回工作空间，需要调用
        %以下是函数文件
        %**********************************************
            function [s, p] = circ(r)  % 文件命名应与函数名一致，系统找文件名circ.m
            %CIRC 计算圆面积和周长  % 简单说明
            %参数：输入参数r:圆半径；输出参数s:圆面积，p:周长  % 详细说明
                s = pi*r*r;
                p = 2*pi*r;
            end
        %**********************************************
        %以下是调用
        %**********************************************
            [a, b] = circ(5);  % 返回为多个参数时，若写a = circ(5)则保留第一个返回值
        %**********************************************
        %以下是带子函数的函数文件
        %**********************************************
        function y = key(w)  % 主函数放第一个，函数名为key
            if w==0
                y = type0(w);  % 调用子函数type0
            else
                y = type1(w);
            end
        end
        function y0 = type0(a)  % 子函数，各子函数之间顺序无所谓
            y0 = a+1;
        end
        function y1 = type1(a)
            y1 = a+4;
        end
        %**********************************************
        %函数输入输出参数可以不定
        %nargin：输入参数个数，nargout：输出参数个数
        %varargin：输入参数内容的元胞数组，varargout：输出参数
        %以下是函数文件
        %**********************************************
        function varargout = idk(varargin)
            x = length(varargin);
            varargout{1} = x;
            varargout{2} = x+1;
        end
        %**********************************************
    