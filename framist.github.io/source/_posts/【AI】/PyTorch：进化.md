---
title: PyTorch：进化
date: 2022-4-28
categories:
  - 计算机科学
  - 机器学习
tags:
  - 机器学习
  - Python
abbrlink: 7919
---

# PyTorch: Evolution

> 转载更改自：https://pytorch.apachecn.org/#/docs/1.7/08

<!-- more -->

## Numpy: Classic

[NumPy 热身](https://pytorch.apachecn.org/#/docs/1.7/08?id=numpy热身)

```python
import numpy as np
import math

# Create random input and output data
x = np.linspace(-math.pi, math.pi, 2000)
y = np.sin(x)

# Randomly initialize weights
a = np.random.randn()
b = np.random.randn()
c = np.random.randn()
d = np.random.randn()

learning_rate = 1e-6
for t in range(2000):
    # Forward pass: compute predicted y
    # y = a + b x + c x^2 + d x^3
    y_pred = a + b * x + c * x ** 2 + d * x ** 3

    # Compute and print loss
    loss = np.square(y_pred - y).sum()
    if t % 100 == 99:
        print(t, loss)

    # Backprop to compute gradients of a, b, c, d with respect to loss
    grad_y_pred = 2.0 * (y_pred - y)
    grad_a = grad_y_pred.sum()
    grad_b = (grad_y_pred * x).sum()
    grad_c = (grad_y_pred * x ** 2).sum()
    grad_d = (grad_y_pred * x ** 3).sum()

    # Update weights
    a -= learning_rate * grad_a
    b -= learning_rate * grad_b
    c -= learning_rate * grad_c
    d -= learning_rate * grad_d

print(f'Result: y = {a} + {b} x + {c} x^2 + {d} x^3')

```



## Torch: Supplant

[PyTorch：张量](https://pytorch.apachecn.org/#/docs/1.7/09?id=pytorch：张量)

```python
import torch
import math

dtype = torch.float
device = torch.device("cpu")
# device = torch.device("cuda:0") # Uncomment this to run on GPU

# Create random input and output data
x = torch.linspace(-math.pi, math.pi, 2000, device=device, dtype=dtype)
y = torch.sin(x)

# Randomly initialize weights
a = torch.randn((), device=device, dtype=dtype)
b = torch.randn((), device=device, dtype=dtype)
c = torch.randn((), device=device, dtype=dtype)
d = torch.randn((), device=device, dtype=dtype)

learning_rate = 1e-6
for t in range(2000):
    # Forward pass: compute predicted y
    y_pred = a + b * x + c * x ** 2 + d * x ** 3

    # Compute and print loss
    loss = (y_pred - y).pow(2).sum().item() # .item() converts a tensor to a Python number
    if t % 100 == 99:
        print(t, loss)

    # Backprop to compute gradients of a, b, c, d with respect to loss
    grad_y_pred = 2.0 * (y_pred - y)
    grad_a = grad_y_pred.sum()
    grad_b = (grad_y_pred * x).sum()
    grad_c = (grad_y_pred * x ** 2).sum()
    grad_d = (grad_y_pred * x ** 3).sum()

    # Update weights using gradient descent
    a -= learning_rate * grad_a
    b -= learning_rate * grad_b
    c -= learning_rate * grad_c
    d -= learning_rate * grad_d

print(f'Result: y = {a.item()} + {b.item()} x + {c.item()} x^2 + {d.item()} x^3')

```



## Torch: AutoGrad

[PyTorch：张量 与 Autograd](https://pytorch.apachecn.org/#/docs/1.7/10?id=pytorch：张量-与-autograd)

```python
import torch
import math

dtype = torch.float
device = torch.device("cpu")
device = torch.device("cuda:0")  # Uncomment this to run on GPU

# 创建张量来保存输入和输出。
# 默认情况下，requires_grad=False，这表示我们不需要这样做
# during the backward pass，计算关于这些张量的梯度。
x = torch.linspace(-math.pi, math.pi, 2000, device=device, dtype=dtype)
y = torch.sin(x)

# 为权重创建随机张量。对于三阶多项式，我们需要
# 4 weights: y = a + b x + c x^2 + d x^3
# 设置 requires_grad=True 表示我们希望使用
# 关于这些张量，during the backward pass
a = torch.randn((), device=device, dtype=dtype, requires_grad=True)
b = torch.randn((), device=device, dtype=dtype, requires_grad=True)
c = torch.randn((), device=device, dtype=dtype, requires_grad=True)
d = torch.randn((), device=device, dtype=dtype, requires_grad=True)

learning_rate = 1e-6
for t in range(2000):
    # Forward pass: 使用张量运算计算预测 y。
    y_pred = a + b * x + c * x ** 2 + d * x ** 3

    # 使用张量运算计算并打印 loss 
    # Now loss is a Tensor of shape (1,)
    # loss.item() gets the scalar value held in the loss.
    loss = (y_pred - y).pow(2).sum()
    if t % 100 == 99:
        print(t, loss.item())
        

    # Use autograd 计算向后传递。这个调用将计算
    # 关于所有张量的损失梯度 with requires_grad=True.
    # After this call a.grad, b.grad. c.grad and d.grad 
    # 将是张量分别相对于 a，b，c，d 的损失梯度
    loss.backward()

    # 使用梯度下降手动更新权重。Wrap in torch.no_grad()
    # 因为权重 requires_grad=True，但我们不需要跟踪它 in autograd.
    with torch.no_grad():
        a -= learning_rate * a.grad
        b -= learning_rate * b.grad
        c -= learning_rate * c.grad
        d -= learning_rate * d.grad

        # 更新权重后手动将 gradients 归零
        a.grad = None
        b.grad = None
        c.grad = None
        d.grad = None

print(f'Result: y = {a.item()} + {b.item()} x + {c.item()} x^2 + {d.item()} x^3')

```



## AutoGrad: Custom

[PyTorch：定义新的 Autograd 函数](https://pytorch.apachecn.org/#/docs/1.7/11?id=pytorch：定义新的-autograd-函数)

这里我们准备一个三阶多项式，通过最小化平方欧几里得距离来训练，并预测函数 `y = sin(x)` 在`-pi`到`pi`上的值。

这里我们不将多项式写为`y = a + bx + cx^2 + dx^3`，而是将多项式写为`y = a + bP_3(c + dx)`，其中`P_3(x) = 1/2 (5x ^ 3 - 3x)`是三次[勒让德多项式](https://en.wikipedia.org/wiki/Legendre_polynomials)。

此实现使用了 PyTorch 张量 (tensor) 运算来实现前向传播，并使用 PyTorch Autograd 来计算梯度。

在此实现中，我们实现了自己的自定义 Autograd 函数来执行`P'_3(x)`。从数学定义上讲，`P'_3(x) = 3/2 (5x ^ 2 - 1)`：

```python
import torch
import math

class LegendrePolynomial3(torch.autograd.Function):
    """
    We can implement our own custom autograd Functions by subclassing
    torch.autograd.Function and implementing the forward and backward passes
    which operate on Tensors.
    """

    @staticmethod
    def forward(ctx, input):
        """
        In the forward pass we receive a Tensor containing the input and return
        a Tensor containing the output. ctx is a context object that can be used
        to stash information for backward computation. You can cache arbitrary
        objects for use in the backward pass using the ctx.save_for_backward method.
        """
        ctx.save_for_backward(input)
        return 0.5 * (5 * input ** 3 - 3 * input)

    @staticmethod
    def backward(ctx, grad_output):
        """
        In the backward pass we receive a Tensor containing the gradient of the loss
        with respect to the output, and we need to compute the gradient of the loss
        with respect to the input.
        """
        input, = ctx.saved_tensors
        return grad_output * 1.5 * (5 * input ** 2 - 1)

dtype = torch.float
device = torch.device("cpu")
# device = torch.device("cuda:0")  # Uncomment this to run on GPU

# Create Tensors to hold input and outputs.
# By default, requires_grad=False, which indicates that we do not need to
# compute gradients with respect to these Tensors during the backward pass.
x = torch.linspace(-math.pi, math.pi, 2000, device=device, dtype=dtype)
y = torch.sin(x)

# 为权重创建随机张量。对于这个例子，我们需要
# 4 个权重：y=a+b*P3（c+d*x），这些权重需要初始化
# 离正确的结果不太远，以确保收敛。
# 设置 requires_grad=True 表示我们希望使用
# 关于这些张量，在 backward pass 时。
a = torch.full((), 0.0, device=device, dtype=dtype, requires_grad=True)
b = torch.full((), -1.0, device=device, dtype=dtype, requires_grad=True)
c = torch.full((), 0.0, device=device, dtype=dtype, requires_grad=True)
d = torch.full((), 0.3, device=device, dtype=dtype, requires_grad=True)

learning_rate = 5e-6
for t in range(2000):
    # To apply our Function, we use Function.apply method. We alias this as 'P3'.
    P3 = LegendrePolynomial3.apply

    # Forward pass: compute predicted y using operations; we compute
    # P3 using our custom autograd operation.
    y_pred = a + b * P3(c + d * x)

    # Compute and print loss
    loss = (y_pred - y).pow(2).sum()
    if t % 100 == 99:
        print(t, loss.item())

    # Use autograd to compute the backward pass.
    loss.backward()

    # 使用梯度下降更新权重
    with torch.no_grad():
        a -= learning_rate * a.grad
        b -= learning_rate * b.grad
        c -= learning_rate * c.grad
        d -= learning_rate * d.grad

        # 更新权重后手动将渐变归零
        a.grad = None
        b.grad = None
        c.grad = None
        d.grad = None

print(f'Result: y = {a.item()} + {b.item()} * P3({c.item()} + {d.item()} x)')

```



## NN: Package

[PYTHORCH: NN](https://pytorch.apachecn.org/#/docs/1.7/12?id=pythorch-nn)

这个实现使用 PyTorch 的`nn`包来构建神经网络。PyTorch Autograd 让我们定义计算图和计算梯度变得容易了，但是原始的 Autograd 对于定义复杂的神经网络来说可能太底层了。这时候`nn`包就能帮上忙。 `nn`包定义了一组模块，你可以把它视作一层神经网络，该神经网络层接受输入，产生输出，并且可能有一些可训练的权重。

```python
import torch
import math

# 创建张量来保存输入和输出。
x = torch.linspace(-math.pi, math.pi, 2000)
y = torch.sin(x)

# 在本例中，输出 y 是（x，x^2，x^3）的线性函数
# 我们可以把它看作一个线性层神经网络。让我们准备一下
# 张量（x，x^2，x^3）。
p = torch.tensor([1, 2, 3])
xx = x.unsqueeze(-1).pow(p)

# In the above code, x.unsqueeze(-1) has shape (2000, 1), and p has shape
# (3,), for this case, broadcasting semantics will apply to obtain a tensor
# of shape (2000, 3)

# Use the nn package to define our model as a sequence of layers. nn.Sequential
# is a Module which contains other Modules, and applies them in sequence to
# produce its output. The Linear Module computes output from input using a
# linear function, and holds internal Tensors for its weight and bias.
# The Flatten layer flatens the output of the linear layer to a 1D tensor,
# to match the shape of `y`.
model = torch.nn.Sequential(
    torch.nn.Linear(3, 1),
    torch.nn.Flatten(0, 1)
)

# nn 包还包含常用的损失函数的定义；在这个
# 在这种情况下，我们将使用均方误差（MSE）作为损失函数。
loss_fn = torch.nn.MSELoss(reduction='sum')

learning_rate = 1e-6
for t in range(2000):

    # 正向传递：通过将 x 传递给模型来计算预测的 y。模块对象
    # 重写__call__运算符，以便可以像调用函数一样调用它们。
    # 这样你就可以把输入数据的张量传递给模块，它就会产生
    # 输出数据的张量。
    y_pred = model(xx)

    # Compute and print loss. We pass Tensors containing the predicted and true
    # values of y, and the loss function returns a Tensor containing the
    # loss.
    loss = loss_fn(y_pred, y)
    if t % 100 == 99:
        print(t, loss.item())

    # Zero the gradients before running the backward pass.
    model.zero_grad()

    # Backward pass: compute gradient of the loss with respect to all the learnable
    # parameters of the model. Internally, the parameters of each Module are stored
    # in Tensors with requires_grad=True, so this call will compute gradients for
    # all learnable parameters in the model.
    loss.backward()

    # 使用梯度下降更新权重。每个参数都是张量，所以
    # 我们可以像以前一样访问它的梯度。
    with torch.no_grad():
        for param in model.parameters():
            param -= learning_rate * param.grad

#你可以访问'model'的第一层，就像访问列表的第一项一样
linear_layer = model[0]

#对于线性层，其参数存储为`weight`&`bias`。
print(f'Result: y = {linear_layer.bias.item()} + {linear_layer.weight[:, 0].item()} x + {linear_layer.weight[:, 1].item()} x^2 + {linear_layer.weight[:, 2].item()} x^3')

```

## nn: optim

[PyTorch：`optim`](https://pytorch.apachecn.org/#/docs/1.7/13?id=pytorch：optim)

与其像以前那样手动更新模型的权重，不如使用`optim`包定义一个优化器，该优化器将为我们更新权重。 `optim`包定义了许多深度学习常用的优化算法，包括 SGD + 动量，RMSProp，Adam 等。

```python
import torch
import math

# 创建张量来保存输入和输出。
x = torch.linspace(-math.pi, math.pi, 2000)
y = torch.sin(x)

# 准备输入张量（x，x^2，x^3）。
p = torch.tensor([1, 2, 3])
xx = x.unsqueeze(-1).pow(p)

# 使用 nn 包定义我们的模型和损失函数。
model = torch.nn.Sequential(
    torch.nn.Linear(3, 1),
    torch.nn.Flatten(0, 1)
)
loss_fn = torch.nn.MSELoss(reduction='sum')

# 使用 optim 包定义一个优化器，该优化器将更新
# 这是我们的模型。这里我们将使用 RMSprop；
# optim 软件包包含许多其他优化算法。
# RMSprop 构造函数的第一个参数告诉
# 优化它应该更新的张量。
learning_rate = 1e-3
optimizer = torch.optim.RMSprop(model.parameters(), lr=learning_rate)
for t in range(2000):
    # Forward pass: compute predicted y by passing x to the model.
    y_pred = model(xx)

    # 计算并打印损失。
    loss = loss_fn(y_pred, y)
    if t % 100 == 99:
        print(t, loss.item())

    # Before the backward pass, use the optimizer object to zero all of the
    # gradients for the variables it will update (which are the learnable
    # weights of the model). This is because by default, gradients are
    # accumulated in buffers( i.e, not overwritten) whenever .backward()
    # is called. Checkout docs of torch.autograd.backward for more details.
    optimizer.zero_grad()

    # 反向传递：计算模型参数的损失梯度
    loss.backward()

    # 在优化器上调用 step 函数会更新其参数
    optimizer.step()

linear_layer = model[0]
print(f'Result: y = {linear_layer.bias.item()} + {linear_layer.weight[:, 0].item()} x + {linear_layer.weight[:, 1].item()} x^2 + {linear_layer.weight[:, 2].item()} x^3')

```



## nn: Custom

[PyTorch：自定义`nn`模块](https://pytorch.apachecn.org/#/docs/1.7/14?id=pytorch：自定义nn模块)



```python
import torch
import math

class Polynomial3(torch.nn.Module):
    def __init__(self):
        """
        在构造函数中，我们实例化四个参数，并将它们指定为成员参数。
        """
        super().__init__()
        self.a = torch.nn.Parameter(torch.randn(()))
        self.b = torch.nn.Parameter(torch.randn(()))
        self.c = torch.nn.Parameter(torch.randn(()))
        self.d = torch.nn.Parameter(torch.randn(()))

    def forward(self, x):
        """
        在正向函数中，我们接受输入数据的张量，并且必须返回
        输出数据的张量。我们可以使用构造函数中定义的模块
        以及张量上的任意算子。
        """
        return self.a + self.b * x + self.c * x ** 2 + self.d * x ** 3

    def string(self):
        """
        就像 Python 中的任何类一样，您也可以在 PyTorch 模块上定义自定义方法
        """
        return f'y = {self.a.item()} + {self.b.item()} x + {self.c.item()} x^2 + {self.d.item()} x^3'

# 创建张量来保存输入和输出。
x = torch.linspace(-math.pi, math.pi, 2000)
y = torch.sin(x)

# 通过实例化上面定义的类来构建我们的模型
model = Polynomial3()

# 构造我们的损失函数和优化器。
# The call to model.parameters() in the SGD constructor 将会包含可学习的参数
# of the nn.Linear module which is members of the model.
criterion = torch.nn.MSELoss(reduction='sum')
optimizer = torch.optim.SGD(model.parameters(), lr=1e-6)
for t in range(2000):
    # 向前传递：通过将 x 传递给模型来计算预测的 y
    y_pred = model(x)

    # Compute and print loss
    loss = criterion(y_pred, y)
    if t % 100 == 99:
        print(t, loss.item())

    # Zero gradients, perform a backward pass, and update the weights.
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()

print(f'Result: {model.string()}')

```



为了展示 PyTorch 动态图的强大功能，我们将实现一个非常奇怪的模型：一个从三到五阶（动态变化）的多项式，在每次正向传递中选择一个 3 到 5 之间的一个随机数，并将这个随机数作为阶数，第四和第五阶共用同一个权重来多次重复计算。

```python
import random
import torch
import math


class DynamicNet(torch.nn.Module):
    def __init__(self):
        """
        In the constructor we instantiate five parameters and assign them as members.
        """
        super().__init__()
        self.a = torch.nn.Parameter(torch.randn(()))
        self.b = torch.nn.Parameter(torch.randn(()))
        self.c = torch.nn.Parameter(torch.randn(()))
        self.d = torch.nn.Parameter(torch.randn(()))
        self.e = torch.nn.Parameter(torch.randn(()))

    def forward(self, x):
        """
        For the forward pass of the model, we randomly choose either 4, 5
        and reuse the e parameter to compute the contribution of these orders.

        Since each forward pass builds a dynamic computation graph, we can use normal
        Python control-flow operators like loops or conditional statements when
        defining the forward pass of the model.

        Here we also see that it is perfectly safe to reuse the same parameter many
        times when defining a computational graph.
        """
        y = self.a + self.b * x + self.c * x ** 2 + self.d * x ** 3
        for exp in range(4, random.randint(4, 6)):
            y = y + self.e * x ** exp
        return y

    def string(self):
        """
        就像 Python 中的任何类一样，您也可以在 PyTorch 模块上定义自定义方法
        """
        return f'y = {self.a.item()} + {self.b.item()} x + {self.c.item()} x^2 + {self.d.item()} x^3 + {self.e.item()} x^4 ? + {self.e.item()} x^5 ?'


# 创建张量来保存输入和输出。
x = torch.linspace(-math.pi, math.pi, 2000)
y = torch.sin(x)

# 通过实例化上面定义的类来构建我们的模型
model = DynamicNet()

# 构造我们的损失函数和优化器。训练这个奇怪的模特
# vanilla stochastic gradient 很难，所以我们使用动量
criterion = torch.nn.MSELoss(reduction='sum')
optimizer = torch.optim.SGD(model.parameters(), lr=1e-8, momentum=0.9)
for t in range(30000):
    # Forward pass: Compute predicted y by passing x to the model
    y_pred = model(x)

    # Compute and print loss
    loss = criterion(y_pred, y)
    if t % 2000 == 1999:
        print(t, loss.item())

    # Zero gradients, perform a backward pass, and update the weights.
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()

print(f'Result: {model.string()}')

```





## [`torch.nn`到底是什么？](https://pytorch.apachecn.org/#/docs/1.7/16)

另一次进化之旅