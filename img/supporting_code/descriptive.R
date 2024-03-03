library(ggplot2)
library(patchwork)

font.size <- 20
graphic.settings <- theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3))  +  theme(axis.line.x=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank(), axis.title.y=element_blank(), axis.title.x=element_blank())

set.seed(42)

n <- 2500
df <- data.frame(n=1:n, x=round(rnorm(n, mean = 0, sd = 10), 1), y=10)

p <- ggplot(df, aes(x=x, y=y)) + geom_point(position = "jitter") + ylim(c(9.4,10.6))
p <- p + geom_segment(aes(x = 0, y = 10.5, xend = 0, yend = 9.5), size=2, colour="darkgreen") + geom_segment(aes(x = -5, y = 9.5, xend = -25, yend = 9.5), arrow = arrow(length = unit(0.5, "cm")), size=2, colour="darkmagenta") + geom_segment(aes(x = 5, y = 9.5, xend = 25, yend = 9.5), arrow = arrow(length = unit(0.5, "cm")), size=2, colour="darkmagenta") 
p <- p + graphic.settings + theme(legend.position="none", legend.title = element_blank())

png("../descriptive/descriptive.png", width=500, height=250)
print(p)
dev.off()





set.seed(42)
n <- 5000000
mu=4
sigma2=1.5
df <- data.frame(x=c(1:n), y=rnorm(n, mean=mu, sd=sigma2))
df$t <- df$y-mu # This is traslated to mean=0
df$z <- scale(df$y) #This is the standard normal distr

df <- reshape2::melt(df, id="x")

graphic.settings <- theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3))  +  theme(axis.text.y=element_blank(), axis.ticks.y=element_blank(), axis.title.y=element_blank())


#Only the N distr in magenta
png("../estimation/n2z_1.png", width=700, height=500)
print(ggplot(df[df$variable == "y", ], aes(value, colour=variable)) + geom_density(linewidth=2) + graphic.settings + xlim(-8, 12) + ylim(0, 0.4) + scale_color_manual(values=c("magenta", "gray74", "darkgreen")) + theme(legend.position="none"))
dev.off()


# Add the translated dist + the translation lines
p <- ggplot(df[df$variable != "z", ], aes(value, colour=variable)) + geom_density(linewidth=2) + graphic.settings + xlim(-8, 12) + ylim(0, 0.4) + scale_color_manual(values=c("magenta", "gray74", "darkgreen")) + theme(legend.position="none")
p <- p + geom_segment(aes(x = mu, y = 0.265, xend = 0, yend = 0.265), arrow = arrow(length = unit(0.5, "cm")), size=1, colour="gray74")
p

png("../estimation/n2z_2.png", width=700, height=500)
print(p)
dev.off()

png("../estimation/n2z_3.png", width=700, height=500)
print(ggplot(df[df$variable != "y", ], aes(value, colour=variable)) + geom_density(linewidth=2) + graphic.settings + xlim(-8, 12) + ylim(0, 0.4) + scale_color_manual(values=c("gray74", "darkgreen")) + theme(legend.position="none"))
dev.off()


png("../estimation/n2z_4.png", width=700, height=500)
print(ggplot(df[df$variable != "t", ], aes(value, colour=variable, linetype = variable)) + geom_density(linewidth=2) + graphic.settings + xlim(-8, 12) + ylim(0, 0.4) + scale_color_manual(values=c("magenta", "darkgreen")) + scale_linetype_manual(values=c(2,1)) + theme(legend.position="none"))
dev.off()


# set.seed(42)
#
# n <- 5000
# dt <- data.frame(x=c(1:n),y=rnorm(n))
# dens <- density(dt$y)
# df <- data.frame(x=dens$x, y=dens$y)
# probs <- c(0.25, 0.5, 0.75)
# quantiles <- quantile(dt$y, prob=probs)
# df$Quantile <- factor(findInterval(df$x,quantiles))
# levels(df$Quantile) <- c("Q1", "Q2", "Q3", "Q4")
#
# cols <- c("magenta", "green", "blue", "orange")
# names(cols) <- levels(df$Quantile)
#
# p <- ggplot(df, aes(x,y)) + geom_line() + geom_ribbon(aes(ymin=0, ymax=y, fill=Quantile), alpha = .5)
# p <- p + scale_x_continuous(breaks=quantiles) +  scale_fill_manual(values = cols)
# p <- p + graphic.settings + theme(legend.position="bottom")
#
# png("../descriptive/quantile.png", width=500, height=250)
# print(p)
# dev.off()
#
#
# set.seed(42)
#
# n <- 250900
# df <- rbind(data.frame(n=1:n, x=round(rnorm(n, mean = 0, sd = 10), 1), y=10, sd="s10"),
# 			data.frame(n=1:n, x=round(rnorm(n, mean = 0, sd = 20), 1), y=10, sd="s20"),
# 			data.frame(n=1:n, x=round(rnorm(n, mean = 0, sd = 30), 1), y=10, sd="s30"))
# names(cols) <- levels(df$sd)
#
#
# p <- ggplot(df, aes(x, fill = sd, colour = sd)) + geom_density(alpha = .2) + scale_fill_manual(values = cols)
# p <- p + geom_segment(aes(x = 0, y = -0.0025, xend = 0, yend = 0.0425), size=0.5, colour="black")
# p <- p + graphic.settings + theme(legend.position="none")
#
#
# png("../descriptive/sd.png", width=500, height=250)
# print(p)
# dev.off()
#
#
