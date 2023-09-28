using GLMakie

function f(x)
    return sin(x) * exp(cos(x))
end

function df(x)
    return (cos(x) - sin(x)^2) * exp(cos(x))
end

x = 1
hlist = [0.1^i for i in 6:-1:0]
errlist = [abs(df(x) - (f(x + h) - f(x - h)) / (2 * h)) for h in hlist]

pic = Figure()
Axis(pic[1, 1], xlabel="h", ylabel="err", xscale=log10, yscale=log10)
scatterlines!(hlist, errlist, color=:red)
save("D:/7.png", pic)
pic