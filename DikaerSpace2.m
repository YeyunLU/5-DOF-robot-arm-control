function theta= DikaerSpace2(x,y,z)
%UNTITLED2 此处显示有关此函数的摘要
%  此处显示详细说明

  %空间转换
  z=z-95;
%             th    d       a    alpha
L(1) = Link([ 0     0       11   -pi/2     0]);%定义连杆
L(2) = Link([ 0     0       85     0        0]);
L(3) = Link([ 0     0       75     0         0]);
L(4) = Link([ 0     0      200    pi/2       0]);
L(5) = Link([0     0       0    pi/2      0]);
L(6) = Link([ 0     0       0   pi/2      0]);
bot = SerialLink(L, 'name', 'arm');%连接连杆
theta=[0 -pi/2 0 0 0 0];
T=[1 0 0 x;0 1 0 y;0 0 1 z;0 0 0 1];
i=1;
while i==1
    Tq=bot.fkine(theta);
    e(1:3,1)=transl(T-Tq);
    e(4:6,1)=zeros(3,1);
    J=jacob0(bot,theta);
    pinv(J);
    dq=pinv(J)*e;
    theta=theta+dq';
    if norm(e)<0.001
        break
    end
    
end
theta(5)=pi/2;
theta(6)=pi/2;
theta=round([90 180 90 90 0 0]+rad2deg(theta));



end

