function [w] = optimize_w(ht,hc,eta,Pt,sigma)
temp1 = abs(hc'*ht)^2;

u1 = hc/norm(hc);

u2_ = ht-u1'*ht*u1;
u2 = u2_/norm(u2_);

x1_ = u1'*ht;
x1 = sqrt(eta*sigma/norm(hc)^2)*x1_/norm(x1_);

x2_ = u2'*ht;
x2 = sqrt(Pt-eta*sigma/norm(hc)^2)*x2_/norm(x2_);

% sqrt(Pt)*temp1>eta*sigma*norm(ht)^2

if Pt*temp1>eta*sigma*norm(ht)^2
    w = sqrt(Pt)*ht/norm(ht);
else
    w = x1*u1+x2*u2;
    if w'*w > Pt
        w = sqrt(Pt)* w/norm(w);
    end
end
% disp([num2str(sqrt(Pt-eta*sigma/norm(hc)^2)),'   ',num2str(w'*w)])
end