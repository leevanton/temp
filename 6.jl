using GLMakie

a = 1
b = 3
n = 7
h = (b - a) / n
# solve values with 2 methods
x1 = zeros(n + 1)
x2 = zeros(n + 1)
x1[1] = a
x2[1] = a
for i in 1:n
    x1[i+1] = x1[i] + h
    x2[i+1] = a + i * h
end
# solve accurate values with BigFloat
a_acc = BigFloat(a)
b_acc = BigFloat(b)
h_acc = (b_acc - a_acc) / n
x_acc = [a + i * h_acc for i in 0:n]

x1_err = abs.(x1 - x_acc)
x2_err = abs.(x2 - x_acc)
# plot errors with y-log
pic = Figure()
Axis(pic[1, 1], yscale=log10)
scatterlines!(collect(2:n), x1_err[2:n], color=:red, label="x1_err")
scatterlines!(collect(2:n), x2_err[2:n], color=:green, label="x2_err")
axislegend(position=:lt)
#save("D:/6.png", f)
pic