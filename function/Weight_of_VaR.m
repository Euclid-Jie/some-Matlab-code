function [VaR,Expected_shortall] = Weight_of_VaR(Loss,lamda)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
n = size(Loss,1)
%lamda = 0.8; %设定参数lamda
Weight = (lamda.^(0:n-1)*(1-lamda))./(1-lamda^n); %根据公式计算权重
%sum(Weight) %验证权重之和是否为1
Loss_DataFarme = [(1:n)' Loss Weight']; %构建数据框
Loss_DataFarme = sortrows(Loss_DataFarme,2,"descend");
P = .05; %设定置信度
my_sum = 0;
i= 1;
while my_sum < P
    my_sum = my_sum + Loss_DataFarme(i,3);
    i = i + 1;
end
VaR = Loss_DataFarme(i,2);
Expected_shortall = sum(Loss_DataFarme((1:i),2));
% fprintf("The VaR is " + Loss_DataFarme(i,2)) %输出VaR
% clf
% h1 = histogram(Loss_DataFarme(:,2));
% hold on
% h2 = histogram(Loss_DataFarme((1:i),2));
% h2.BinWidth = h1.BinWidth;
% title("The VaR is " + Loss_DataFarme(i,2))
% fprintf("The Expected shortall is " + sum(Loss_DataFarme((1:i),2))) %输出Expected shortfall


