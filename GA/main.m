% �������˵���Ŵ��㷨 %
% �����к��������ֵ %
% f(x)=x+10*sin(5x)+7*cos(4x) x��[0,10] %
% �� x ��ֵ��һ��10λ�Ķ�ֵ��ʽ��ʾΪ��ֵ���⣬һ��10λ�Ķ�ֵ���ṩ�ķֱ�����ÿΪ (10-0)/(2^10-1)��0.01 
% �������� [0,10] ��ɢ��Ϊ��ֵ�� [0,1023], x=0+10*b/1023, ���� b �� [0,1023] �е�һ����ֵ���� %
% %
%--------------------------------------------------------------------------------------------------------------%
%--------------------------------------------------------------------------------------------------------------


% 2.0 ������
%�Ŵ��㷨������
%Name:genmain05.m
%Ҫ�󾫶Ȳ�����0.01��
clear
clc
popsize=20;                         %Ⱥ���С
chromlength=10;                     %�ַ�������(���峤��)
pc=0.6;                                %������ʣ�ֻ���������С��pcʱ���Ż��������
pm=0.001;                           %�������
generation=0;                    %��ǰ��������
maxInteration=2000;              %����������


pop=initpop(popsize,chromlength);               %���������ʼȺ��
while generation < maxInteration                                                        %20Ϊ�Ŵ�����
        [objvalue]=calobjvalue(pop);                  %����Ŀ�꺯��
        fitvalue=calfitvalue(objvalue);                 %����Ⱥ����ÿ���������Ӧ��

        [newpop]=selection(pop,fitvalue);                 %����
        [newpop1]=crossover(newpop,pc);               %����
        [newpop2]=mutation(newpop1,pm);               %����
        
        [objvalue]=calobjvalue(newpop2);                 %����Ŀ�꺯��
        fitvalue=calfitvalue(objvalue);                       %����Ⱥ����ÿ���������Ӧ��
        
        [bestindividual,bestfit]=best(newpop2,fitvalue);     %���Ⱥ������Ӧֵ���ĸ��弰����Ӧֵ
        y(generation+1)=bestfit;                                                              %���ص� y ������Ӧ��ֵ�����Ǻ���ֵ
        x(generation+1)=decodechrom(bestindividual,1,chromlength)*10/1023;      %���Ա��������ʮ����
        pop=newpop2;
        generation = generation + 1;
        bestfitness(generation)= bestfit;
end

figure
fplot('x.^2',[0,10])
%fplot('x+10*sin(5*x)+7*cos(4*x)',[0 10])
hold on
plot(x,y,'r*')                                          
hold on

[z ,index]=max(y);             %�������ֵ����λ��
x5=x(index)                     %�������ֵ��Ӧ��xֵ
ymax=z

figure
plot(bestfitness)