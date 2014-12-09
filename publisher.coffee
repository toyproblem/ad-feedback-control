
fig1 = figure
    xlabel: "Price"
    ylabel: "Impressions"
    height: 380
    series:
        shadowSize: 0
        color: "black"
        lines: lineWidth: 1

p = (u) -> #; publisher model
    low = 2
    return 0 if u<low
    mu = 75*log(u/low)
    mu + 2/3*mu*(rand()-0.5)
        
U = linspace 0, 20, 1000 #;
plot U, (p(u) for u in U), fig:fig1

$blab.p = p #; export to use below
