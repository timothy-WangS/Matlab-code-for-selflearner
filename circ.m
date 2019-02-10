function [s, p] = circ(r)
%CIRC 计算圆面积和周长
%参数：输入参数r:圆半径；输出参数s:圆面积，p:周长
s = pi*r*r;
p = 2*pi*r;
end