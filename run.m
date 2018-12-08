function run(theta)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
pwm(1)=theta(1)/180*2000+500;
pwm(5)=theta(5)/180*2000+500;
for i=2:6
  if i~=5
    if theta(i)==90
        pwm(i)=1500;
    elseif theta(i)>90
        pwm(i)=floor(1500+((theta(i)-90)/135*1000));
    elseif theta(i)<90
        pwm(i)=floor(1500-((90-theta(i))/135*1000));
    end
  end
end
%测试命令使用，真正使用时执行打开串口和写入数据
yy=strcat('G0={G0#0P',num2str(pwm(1)),'T1000!#1P',num2str(pwm(2)),'T1000!#2P',num2str(pwm(3)),'T1000!#3P',num2str(pwm(4)),'T1000!#4P',num2str(pwm(5)),'T1000!#5P',num2str(pwm(6)), 'T1000!}')
global s
fwrite(s,yy);

end

