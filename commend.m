    1. 通用操作指令
        cd 设置当前路径
        path 显示当前目录
        addpath 添加工作路径 addpath C:/aaa
        md-----!md C:/aaa
        mkdir-----mkdir('C:/aaa') 创建路径(文件夹)
        dir 列出目录下文件清单
        delete 删除指定文件 delete exp.m
        clf 清除图形窗
        clc 清除命令行
        clear 清除变量空间
        edit 打开m文件编辑器 edit C:/aaa
        exit 
        quit 关闭matlab
        who 显示内存变量
        whos 内存变量大小
        which 列出文件所在位置
        what 列出目录下m文件
        length 变量长度
        hold-----hold on/ hold off
        linspace 生成等间距向量x1到x2产生n个 linspace(x1, x2, n)
        meshgrid
    2.数据显示
        format short, long, short e, long e, long g, rat, hex, +, bank, compact, loose
    3.预定义变量
        ans, eps, Inf/inf, i/j, pi, nan, nargin, nargout, realmax, realmin