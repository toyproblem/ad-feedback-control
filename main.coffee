p = $blab.p #; Import from above

fig2 = figure
    xlabel: "Time (days)"
    ylabel: "Impressions (r, x2)"
    colors: ["red","green"]
    height: 180
    series:
        shadowSize: 0
        lines: lineWidth: 1

fig3 = figure
    xlabel: "Time (days)"
    ylabel: "Price (x1)"
    height: 180
    series:
        shadowSize: 0
        color: "black"
        lines: lineWidth: 1

L = 100 #; Total number of days
x1 = (0 for [0..L]) #;
x2 = (0 for [0..L]) #;
r = (100+100*(l>30) for l in [1..L])#; Target
ki = 1/20 #; Controller integrator gain.

 # Next state values
x1n = (x1, x2, r)-> x1 + (r-x2)*ki #;
x2n = (x1, x2, r)-> p( x1 + (r-x2)*ki ) #;

 # Step state equations
for l in [0...L] #;
    x1[l+1] = x1n(x1[l], x2[l], r[l])
    x2[l+1] = x2n(x1[l], x2[l], r[l])

 # Results
plot [1..L], [r, x2], fig: fig2
plot [1..L], [x1], fig: fig3
