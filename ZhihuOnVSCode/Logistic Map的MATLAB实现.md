## Logistic Map 的 MATLAB 实现

```matlab
u1 = 2.6:0.0001:3.5;
u2 = 3.5:0.000001:4;
u = [u1 u2];
scatter(u,arrayfun(@limL,u),'k','filled','SizeData',1)
alpha(0.1)

function m = limL(u)
m = 0.632;% 其实(0,1)随便啥都行
for i=1:10000+randi(100)
    m=u.*m.*(1-m);
end
end

```

![Image](https://pic4.zhimg.com/80/v2-b1daae293027a4f8dd193bec2c88cd8c.png)