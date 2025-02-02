clean()
set.seed(42)

library(ggplot2)
library(gridExtra)

set.seed(42)
n <- 5000000
mu=4
sigma2=1.5
df <- data.frame(x=c(1:n), y=rnorm(n, mean=mu, sd=sigma2))
df$t <- df$y-mu # This is traslated to mean=0
df$z <- scale(df$y) #This is the standard normal distr

df <- reshape2::melt(df, id="x")

graphic.settings <- theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3))  +  theme(axis.text.y=element_blank(), axis.ticks.y=element_blank(), axis.title.y=element_blank())


# #Only the N distr in magenta
# png("../normal/n2z_1.png", width=700, height=500)
# print(ggplot(df[df$variable == "y", ], aes(value, colour=variable)) + geom_density(linewidth=2) + graphic.settings + xlim(-8, 12) + ylim(0, 0.4) + scale_color_manual(values=c("magenta", "gray74", "darkgreen")) + theme(legend.position="none"))
# dev.off()
#
#
# # Add the translated dist + the translation lines
# p <- ggplot(df[df$variable != "z", ], aes(value, colour=variable)) + geom_density(linewidth=2) + graphic.settings + xlim(-8, 12) + ylim(0, 0.4) + scale_color_manual(values=c("magenta", "gray74", "darkgreen")) + theme(legend.position="none")
# p <- p + geom_segment(aes(x = mu, y = 0.265, xend = 0, yend = 0.265), arrow = arrow(length = unit(0.5, "cm")), size=1, colour="gray74")
# p
#
# png("../normal/n2z_2.png", width=700, height=500)
# print(p)
# dev.off()
#
# png("../normal/n2z_3.png", width=700, height=500)
# print(ggplot(df[df$variable != "y", ], aes(value, colour=variable)) + geom_density(linewidth=2) + graphic.settings + xlim(-8, 12) + ylim(0, 0.4) + scale_color_manual(values=c("gray74", "darkgreen")) + theme(legend.position="none"))
# dev.off()
#
#
# png("../normal/n2z_4.png", width=700, height=500)
# print(ggplot(df[df$variable != "t", ], aes(value, colour=variable, linetype = variable)) + geom_density(linewidth=2) + graphic.settings + xlim(-8, 12) + ylim(0, 0.4) + scale_color_manual(values=c("magenta", "darkgreen")) + scale_linetype_manual(values=c(2,1)) + theme(legend.position="none"))
# dev.off()


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


font.size <- 22
graphic.settings <- theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3)) +  theme(legend.title = element_blank()) + theme(plot.subtitle=element_text(size=font.size/4*3), plot.title=element_text(size=font.size))


setwd("/Users/visconti/Documents/Teaching/short_intro_stats/img/normal")

load("/Users/visconti/Documents/Research/2015/random/avisconti/birthWeight/data/BirthData.RData")
admin <- read.csv("/Users/visconti/Documents/Research/2015/random/avisconti/birthWeight/data/birth/admin.csv")

df <- merge(df, admin[, c("STUDY_NO", "DATE_BORN")], by.x="IID",  by.y="STUDY_NO", all=FALSE)
df$DATE_BORN <- sapply(df$DATE_BORN, function(d) format(as.Date(d, "%d/%m/%y"), "19%y-%m-%d") )


df <- df[!is.na(df$Bweight), ]

nrow(df)

min(as.Date(df$DATE_BORN))
max(as.Date(df$DATE_BORN))

df$Bweight <- df$Bweight * 1000

df1 <- df

df <- data.frame(Bweight=sample(df1$Bweight, 1000000, replace=TRUE))

bw <- 250
n_obs <- nrow(df)

p <- ggplot(df, aes(x = Bweight)) + geom_histogram(aes(y =..count..), colour = "black", fill = "gray74", binwidth = bw )  + graphic.settings + xlab("Birth weight (g)") + ylab("Counts") + ggtitle("Simulated data", subtitle="Bin size = 250g") + theme(legend.position="none") 


png("Twin_BW_hist.png")
print(p)
dev.off()

p <- ggplot(df, aes(x = Bweight)) + geom_histogram(aes(y =..count..), colour = "black", fill = "gray74", binwidth = bw )  + stat_function(fun = function(x) dnorm(x, mean = mean(df$Bweight), sd = sd(df$Bweight)) * bw * n_obs, colour="black", lwd=1.5) + graphic.settings + xlab("Birth weight (g)") + ylab("Counts") + ggtitle("Simulated data", subtitle="Bin size = 250g") + theme(legend.position="none") 


png("Twin_BW_hist_normale.png")
print(p)
dev.off()

fun = function(x) dnorm(x, mean = mean(df$Bweight), sd = sd(df$Bweight))
dd <- unique(data.frame(x=df$Bweight, y=fun(df$Bweight)*bw*n_obs) )

gety <- function(v) dd$y[which(abs(dd$x - v) == min(abs(dd$x - v)))]


p <- ggplot(df, aes(x = Bweight))  + stat_function(fun = function(x) dnorm(x, mean = mean(df$Bweight), sd = sd(df$Bweight)) * bw * n_obs, colour="black", lwd=1.5) + graphic.settings + xlab("Birth weight(g)") + ylab("Counts") + ggtitle("") + theme(legend.position="none") + geom_segment(aes(x = mean(Bweight), y = 0, xend = mean(Bweight), yend = gety(mean(df$Bweight))), colour="black", linetype="dotted", lwd=1.5)


png("Twin_BW_normale.png")
print(p)
dev.off()

p1 <- p + stat_function(fun = function(x) dnorm(x, mean = mean(df$Bweight), sd = sd(df$Bweight)) * bw * n_obs, colour="black", lwd=1.5, xlim = c(min(df$Bweight), 1500), geom = "area", fill="grey74") + geom_segment(aes(x = 1500, y = 0, xend = 1500, yend = gety(1500)), colour="black", lwd=1.5)

png("Twin_BW_normale_area.png")
print(p1)
dev.off()


p2 <- p + stat_function(fun = function(x) dnorm(x, mean = mean(df$Bweight), sd = sd(df$Bweight)) * bw * n_obs, colour="black", lwd=1.5, xlim = c(min(df$Bweight), 2500), geom = "area", fill="grey74") + geom_segment(aes(x = 2500, y = 0, xend = 2500, yend = gety(2500)), colour="black", lwd=1.5)

png("Twin_BW_normale_area_exercise.png")
print(p2)
dev.off()

# getlimit <- function(p, sd, ann)
# {
# 	l <- mean(df$Bweight) - sd * sd(df$Bweight)
# 	u <- mean(df$Bweight) + sd * sd(df$Bweight)
#
# 	p + geom_segment(aes(x = l, y = 0, xend = l, yend = gety(l)), colour="black", lwd=1) +
# 	geom_segment(aes(x = u, y = 0, xend = u, yend = gety(u)), colour="black", lwd=1)
# }
#
#
# p1 <-  getlimit(p=p, sd=1)
#
#
# png("Twin_BW_normale_1s.png")
# print(p)
# dev.off()

