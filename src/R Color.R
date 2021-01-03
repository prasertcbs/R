# R Color

barplot(1:10)

colors()
colors()[1:10]

barplot(1:10, col=colors())
barplot(1:10, col=colors()[1:10])
barplot(1:10, col=colors()[101:110])
barplot(1:10, col=c("yellow","tomato2","violet","tan1","darkgreen","aliceblue"))

# color wheel: https://color.adobe.com/create/color-wheel/
barplot(1:10, col=c("#730E20","#F25781","#087F8C","tan1","darkgreen","aliceblue"))

?rainbow # rainbow color palette
barplot(1:10, col=rainbow(10))
barplot(1:10, col=rainbow(10, alpha=.3)) # set alpha level (transparency)

#recycle color
barplot(1:10, col=rainbow(5, alpha=.5)) # 5 colors for 10 values

#built-in palettes
barplot(1:10, col=heat.colors(10))
barplot(1:10, col=terrain.colors(10))
barplot(1:10, col=topo.colors(10))
barplot(1:10, col=cm.colors(10))

barplot(rep(1,10),
        main="Colors",
        col=colors()[11:20],
        names.arg=colors()[11:20], # use color names as labels
        horiz = T,
        las=1,
        cex.names=.8, # axis label font size 80%
        axes = F, # turn off axes
        mgp = c(3, -7, 0) # default is c(3, 1, 0), try (3, -7, 0)
)
