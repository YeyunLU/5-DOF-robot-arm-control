 function theta= DikaerSpace1(x,y,z)

%UNTITLED2 此处显示有关此函数的摘要
%  此处显示详细说明
  %空间转换

l1=85;
l2=75;
l3=200;
a=0.5;
theta=zeros(1,6);
x=x-11;
z=z-95;
%theta(5:6)的计算
theta(5)=pi/2;
theta(6)=pi/2;
%theta(1)的计算 
if (x*y)==0
    theta(1)=pi/2;
elseif (x*y)<0
    theta(1)=pi+atan(y/x);
elseif (x*y)>0
    theta(1)=atan(y/x); 
   
end

% %theta(2:4)的分类讨论情况
alpha=atan(z/sqrt(x.^2+y.^2));
d1=sqrt(x.^2+y.^2+z.^2);
% if alpha>=0
if d1==l1+l2+l3
         theta(2)=alpha;
         theta(3)=pi;
         theta(4)=pi; 
elseif d1>l1+l2+l3
   theta=[0 0 0 0 pi/2 pi/2];
elseif d1<l1+l2+l3
        if d1>l2+l3-l1
            JD_max=acos((l1.^2+d1.^2-(l2+l3).^2)/(2*l1*d1));
        else
            JD_max=pi;
        end
        if d1>abs(l1+l2-l3)
            JD_min=acos(((l1+l2).^2+d1.^2-l3.^2)/(2*(l1+l2)*d1));
        elseif l1+l2+d2>l3
               JD_min=pi;
            else
               JD_min=0;
        end
        
        
        %JD_min的讨论
%         gamma1=((l1.^2+d1.^2-(l3-l2)^2)/(2*l1*d1));
%         beta1=54;
%         d2_min=l2.^2+l3.^2-2*l2*l3*cos(beta1);
%         gamma2=acos((l1.^2+d1.^2-d2_min)/(2*l1*d1));
        if alpha>=0
            JDD_min=max(gamma1,JD_min);    
        else
            JDD_min=max(gamma1,max(-alpha,JD_min));
        end

%          %JD_max的讨论
%         beta2=42;
%         m=l1.^2+l2.^2-2*l1*l2*cos(beta2);
%         gamma3=acos((l1.^2+m-l2.^2)/(2*l1*sqrt(m)));
%         gamma4=acos((d1.^2+m-l3.^2)/(2*d1*sqrt(m)));
%         gamma_max=gamma3+gamma4;
%         JDD_max=min(gamma_max,JD_max);
        
        %theta(2:4)的确定
        theta(2)=(JD_max+JDD_min)*a+alpha;
  end   
        d2=sqrt(l1.^2+d1.^2-2*l1*d1*cos(theta(2)-alpha));
        theta(3)=acos((d2.^2+l2.^2-l3.^2)/(2*l2*d2))+acos((d2.^2+l1.^2-d1.^2)/(2*l1*d2));
        theta(4)=acos((l2.^2+l3.^2-d2.^2)/(2*l2*l3)); 
    
% end
% theta=rad2deg(theta)
% if theta(2)<=90
%     theta(3)=theta(2)+theta(3)-180
% else theta(3)=theta(2)-theta(3)+180
%     
%     if theta(3)<=90
%         theta(3)=theta(2)+theta(3)-180
%     else theta(3)=theta(2)-theta(3)+180
%     end
% end

d2=sqrt(l1.^2+d1.^2-2*l1*d1*cos(theta(2)-alpha));
          beta1=acos((l1.^2+d2.^2-d1.^2)/(2*l1*d2));
        beta2=acos((l2.^2+d2.^2-l3.^2)/(2*l2*d2));
        theta(3)=beta1+beta2+theta(2)-pi;
        beta3=2*pi-beta1-beta2-theta(2);
        beta4=acos((l2.^2 +l3.^2-d2.^2)/(2*l2*l3));
        theta(4)=beta4-beta3;

 
theta=rad2deg(theta);


 end
