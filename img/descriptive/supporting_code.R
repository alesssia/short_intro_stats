library(ggplot2)
library(patchwork)

font.size <- 22
graphic.settings <- theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3)) +  theme(legend.title = element_blank()) + theme(plot.subtitle=element_text(size=font.size/4*3), plot.title=element_text(size=font.size))


setwd("/Users/visconti/Documents/Teaching/short_intro_stats/img/descriptive")


#altezza
set.seed(42)
df <- read.csv(file = "/Users/visconti/Documents/Resources/twinsUK/BMI_130720.csv")
df <- na.omit(df)
df <- df[sample(1:nrow(df), 100), ]

df <- df[df$Height < 200, ]

avg <- mean(df$Height)
sdev <- sd(df$Height)

p <- ggplot(df, aes(x=Height, y=10)) + geom_point(position = "jitter") + ylim(c(9.4,10.6))
p <- p + geom_segment(aes(x = avg, y = 10.5, xend = avg, yend = 9.5), size=2, colour="darkgreen") + geom_segment(aes(x = avg-3, y = 9.5, xend = 140, yend = 9.5), arrow = arrow(length = unit(0.5, "cm")), size=2, colour="darkmagenta") + geom_segment(aes(x = avg+3, y = 9.5, xend = 190, yend = 9.5), arrow = arrow(length = unit(0.5, "cm")), size=2, colour="darkmagenta") 
p <- p + graphic.settings + theme(legend.position="none", legend.title = element_blank()) + theme(axis.text.y=element_blank()) + xlab("Height (cm)") + ylab("") + scale_y_discrete(breaks=NULL) + 
	theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 

png("descriptive.png", width=500, height=250, bg = "transparent")
print(p)
dev.off()

xmin <- sapply(0:14, function(i) 0+i*3)
xmax <- sapply(0:14, function(i) 3+i*3)

rects <- data.frame(xmin=xmin, xmax=xmax,
					ymin=rep(0, 15), ymax=rep(3, 15),
					boxcol=c(rep("a", 7), "b", rep("c", 7)),
					label=c(5, 18, 20, 22, 24, 25, 25, 26, 26, 26, 27, 27, 28, 29, 30),
					x=sapply(0:14, function(i) 0+i*3+1.5), y=1.5)
	

p <- ggplot(rects, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax, label=label)) + geom_rect(aes(fill = boxcol), alpha = 0.4, color = "black") + scale_fill_manual(values=(c("magenta3", "gray85", "springgreen3"))) + geom_text(aes(x=x, y=y), size=7)+ theme_void()  + theme(legend.position="none", legend.title = element_blank())  

p <- p + geom_segment(aes(x = xmin[8]+1.5, y = -3, xend = xmin[8]+1.5, yend = -0.5), arrow = arrow(length = unit(0.5, "cm")), size=0.7, colour="black") + annotate("text", x = xmin[8]+1.5, y = -4, label = "Median", parse = FALSE, size=7) 

p <- p + geom_segment(aes(x = 0, y = 4, xend = xmax[7], yend = 4), arrow = arrow(length = unit(0.5, "cm"), ends="both"), size=0.5, colour="black") + annotate("text", x = xmin[4]+1.5, y = 5, label = "50% below", parse = FALSE, size=7) + geom_segment(aes(x = xmin[9], y = 4, xend = xmax[15], yend = 4), arrow = arrow(length = unit(0.5, "cm"), ends="both"), size=0.5, colour="black") + annotate("text", x = xmin[12]+1.5, y = 5, label = "50% above", parse = FALSE, size=7)


p <- p +  theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_))

png("median.png", width=800, height=180, bg = "transparent")
print(p)
dev.off()


rects <- data.frame(xmin=xmin, xmax=xmax,
					ymin=rep(0, 15), ymax=rep(3, 15),
					boxcol=c(rep("a", 3), "b", rep("c", 3), "b", rep("d", 3), "b", rep("e", 3)),
					label=c(5, 18, 20, 22, 24, 25, 25, 26, 26, 26, 27, 27, 28, 29, 30),
					x=sapply(0:14, function(i) 0+i*3+1.5), y=1.5)
	

p <- ggplot(rects, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax, label=label)) + geom_rect(aes(fill = boxcol), alpha = 0.4, color = "black") + scale_fill_manual(values=(c("magenta1", "gray85","magenta4",  "springgreen1", "springgreen4"))) + geom_text(aes(x=x, y=y), size=7)+ theme_void()  + theme(legend.position="none", legend.title = element_blank())  

p <- p + geom_segment(aes(x = xmin[8]+1.5, y = -3, xend = xmin[8]+1.5, yend = -0.5), arrow = arrow(length = unit(0.5, "cm")), size=0.7, colour="black") + annotate("text", x = xmin[8]+1.5, y = -4, label = "Median (Q2)", parse = FALSE, size=7) +
	     geom_segment(aes(x = xmin[4]+1.5, y = -3, xend = xmin[4]+1.5, yend = -0.5), arrow = arrow(length = unit(0.5, "cm")), size=0.7, colour="black") + annotate("text", x = xmin[4]+1.5, y = -4, label = "Q1", parse = FALSE, size=7) +
	     geom_segment(aes(x = xmin[12]+1.5, y = -3, xend = xmin[12]+1.5, yend = -0.5), arrow = arrow(length = unit(0.5, "cm")), size=0.7, colour="black") + annotate("text", x = xmin[12]+1.5, y = -4, label = "Q3", parse = FALSE, size=7) 

p <- p + geom_segment(aes(x = 0, y = 4, xend = xmax[3], yend = 4), arrow = arrow(length = unit(0.5, "cm"), ends="both"), size=0.5, colour="black") + annotate("text", x = xmin[2]+1.5, y = 5, label = "25%", parse = FALSE, size=7) + geom_segment(aes(x = xmin[5], y = 4, xend = xmax[7], yend = 4), arrow = arrow(length = unit(0.5, "cm"), ends="both"), size=0.5, colour="black") + annotate("text", x = xmin[6]+1.5, y = 5, label = "25%", parse = FALSE, size=7) +
	geom_segment(aes(x = xmin[9], y = 4, xend = xmax[11], yend = 4), arrow = arrow(length = unit(0.5, "cm"), ends="both"), size=0.5, colour="black") + annotate("text", x = xmin[10]+1.5, y = 5, label = "25%", parse = FALSE, size=7) + geom_segment(aes(x = xmin[13], y = 4, xend = xmax[15], yend = 4), arrow = arrow(length = unit(0.5, "cm"), ends="both"), size=0.5, colour="black") + annotate("text", x = xmin[14]+1.5, y = 5, label = "25%", parse = FALSE, size=7)


p <- p +  theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_))

png("quartiles.png", width=800, height=180, bg = "transparent")
print(p)
dev.off()


p <- ggplot(rects, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax, label=label)) + geom_rect(aes(fill = boxcol), alpha = 0.4, color = "black") + scale_fill_manual(values=(c("magenta1", "gray85","magenta4",  "springgreen1", "springgreen4"))) + geom_text(aes(x=x, y=y), size=7)+ theme_void()  + theme(legend.position="none", legend.title = element_blank())  

p <- p + geom_segment(aes(x = 0, y = 4, xend = xmax[3], yend = 4), arrow = arrow(length = unit(0.5, "cm"), ends="first"), size=0.5, colour="black") + annotate("text", x = xmin[2]+1.5, y = 5, label = "25%", parse = FALSE, size=7) +
	   geom_segment(aes(x = 0, y = 6, xend = xmax[7], yend = 6), arrow = arrow(length = unit(0.5, "cm"), ends="first"), size=0.5, colour="black") + annotate("text", x = xmin[4]+1.5, y = 7, label = "50%", parse = FALSE, size=7) +
	   geom_segment(aes(x = 0, y = 8, xend = xmax[11], yend = 8), arrow = arrow(length = unit(0.5, "cm"), ends="first"), size=0.5, colour="black") + annotate("text", x = xmax[6], y = 9, label = "75%", parse = FALSE, size=7) 

p <- p + geom_segment(aes(x = xmin[8]+1.5, y = -3, xend = xmin[8]+1.5, yend = -0.5), arrow = arrow(length = unit(0.5, "cm")), size=0.7, colour="black") + annotate("text", x = xmin[8]+1.5, y = -4, label = "paste(P[50], \"\")", parse = TRUE, size=7) +
	     geom_segment(aes(x = xmin[4]+1.5, y = -3, xend = xmin[4]+1.5, yend = -0.5), arrow = arrow(length = unit(0.5, "cm")), size=0.7, colour="black") + annotate("text", x = xmin[4]+1.5, y = -4, label = "paste(P[25], \"\")", parse = TRUE, size=7) +
	     geom_segment(aes(x = xmin[12]+1.5, y = -3, xend = xmin[12]+1.5, yend = -0.5), arrow = arrow(length = unit(0.5, "cm")), size=0.7, colour="black") + annotate("text", x = xmin[12]+1.5, y = -4, label = "paste(P[75], \"\")", parse = TRUE, size=7) 


 p <- p +  theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_))

 png("percentile.png", width=800, height=250, bg = "transparent")
 print(p)
 dev.off()

p <- ggplot(rects, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax, label=label)) + geom_rect(aes(fill = boxcol), alpha = 0.4, color = "black") + scale_fill_manual(values=(c("magenta1", "gray85","magenta4",  "springgreen1", "springgreen4"))) + geom_text(aes(x=x, y=y), size=7)+ theme_void()  + theme(legend.position="none", legend.title = element_blank())  

p <- p + geom_segment(aes(x = xmin[5], y = 4, xend = xmax[11], yend = 4), arrow = arrow(length = unit(0.5, "cm"), ends="both"), size=0.5, colour="black") + annotate("text", x = xmin[8]+1.5, y = 5, label = "50% of the observations", parse = FALSE, size=7) 

p <- p + geom_segment(aes(x = xmin[8]+1.5, y = -3, xend = xmin[8]+1.5, yend = -0.5), arrow = arrow(length = unit(0.5, "cm")), size=0.7, colour="black") + annotate("text", x = xmin[8]+1.5, y = -4, label = "Median (Q2)", parse = FALSE, size=7) +
	     geom_segment(aes(x = xmin[4]+1.5, y = -3, xend = xmin[4]+1.5, yend = -0.5), arrow = arrow(length = unit(0.5, "cm")), size=0.7, colour="black") + annotate("text", x = xmin[4]+1.5, y = -4, label = "Q1", parse = FALSE, size=7) +
	     geom_segment(aes(x = xmin[12]+1.5, y = -3, xend = xmin[12]+1.5, yend = -0.5), arrow = arrow(length = unit(0.5, "cm")), size=0.7, colour="black") + annotate("text", x = xmin[12]+1.5, y = -4, label = "Q3", parse = FALSE, size=7) 


 p <- p +  theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_))

 png("iqr.png", width=800, height=180, bg = "transparent")
 print(p)
 dev.off()



p <- ggplot(rects, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax, label=label)) + geom_rect(alpha = 0.4, color = "black", fill='springgreen3') + geom_text(aes(x=x, y=y), size=7)+ theme_void()  + theme(legend.position="none", legend.title = element_blank())  

p <- p +  theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_))

png("range.png", width=800, height=50, bg = "transparent")
print(p)
dev.off()



mean <- 0
start <- -10
end <- 10


p <-  ggplot(data = data.frame(x = c(start, end)), aes(x)) +
   stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 1), geom = "area", fill="grey74", alpha=0.4, xlim = c(start, end)) +
   stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 1), colour="black") + 
   
   stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 2), geom = "area", fill="darkgreen", alpha=0.4, xlim = c(start, end)) +
   stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 2), colour="black") +
   
   stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 3), geom = "area", fill="magenta", alpha=0.4, xlim = c(start, end)) +
   stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 3), colour="black") +
   
   geom_segment(aes(x = start, y = 0, xend = end, yend = 0), colour="black") +
	
   geom_segment(aes(x = 0, y = 0, xend = 0, yend = dnorm(0, mean=0, sd = 1)), colour="black", linetype="dashed") +

   scale_y_continuous(breaks = NULL) + theme_void()


p <- p +  theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_))


png("sd.png", width=500, height=250, bg = "transparent")
print(p)
dev.off()

yanchor <- dnorm(50, mean=50, sd = 2)

p_symmetrical <-  ggplot(data = data.frame(x = c(40, 60)), aes(x)) +
   stat_function(fun = dnorm, n = 101, args = list(mean = 50, sd = 2), colour="black") +
   
   geom_segment(aes(x = 40, y = 0, xend = 60, yend = 0), colour="black") +
	
   geom_segment(aes(x = 50, y = 0, xend = 50, yend = dnorm(50, mean=50, sd = 2)), colour="black", linetype="dashed") +
   annotate("text", x = 50, y = c(yanchor+0.01, yanchor+0.02, yanchor+0.03), label = c("Mode", "Median", "Mean"), parse = FALSE, size=5) +
   annotate("text", x = 50, y = c(-0.01, -0.02, -0.033), label = c("Symmetric", "distribution", ""), parse = FALSE, size=5) +

   scale_y_continuous(breaks = NULL) + theme_void() +  theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_))

mode_p <- which(max(dlnorm(1:130, meanlog=3.5, sdlog = 0.5)) == dlnorm(1:130, meanlog=3.5, sdlog = 0.5))
p_asymmetrical_positive <-   ggplot(data = data.frame(x = c(2, 130)), aes(x)) +
      stat_function(fun = dlnorm, n = 101, args = list(meanlog = 3.5, sdlog = 0.5), colour="black") +
   
      geom_segment(aes(x = 0, y = 0, xend = 130, yend = 0), colour="black") +
	
      geom_segment(aes(x = 50, y = 0, xend = 50, yend = dlnorm(50, meanlog=3.5, sdlog = 0.5)), colour="black", linetype="dashed") +
      annotate("text", x = 55, y = dlnorm(50, meanlog=3.5, sdlog = 0.5)+0.00095, label = "Mean", parse = FALSE, size=5) +
   
      geom_segment(aes(x = mode_p, y = 0, xend = mode_p, yend = dlnorm(mode_p, meanlog=3.5, sdlog = 0.5)), colour="black",  linetype="dotted") +
      annotate("text", x = mode_p, y = dlnorm(mode_p, meanlog=3.5, sdlog = 0.5)+0.00095, label = "Mode", parse = FALSE, size=5) + 
   
      geom_segment(aes(x = 33, y = 0, xend = 33, yend = dlnorm(33, meanlog=3.5, sdlog = 0.5)), colour="black",  linetype="dotted") +
      annotate("text", x = 41, y = dlnorm(33, meanlog=3.5, sdlog = 0.5)+0.00055, label = "Median", parse = FALSE, size=5) +
   
      annotate("text", x = 50, y = c(-0.001, -0.0025, -0.004), label = c("Asymmetric", "distribution ", "(positive)"), parse = FALSE, size=5) +

      scale_y_continuous(breaks = NULL) + theme_void() +  theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_))


rdlnorm <- function(x, meanlog, sdlog) dlnorm(130-x, meanlog=meanlog, sdlog=sdlog)	  
mode_n <- which(max(rdlnorm(1:130, meanlog=3.5, sdlog = 0.5)) == rdlnorm(1:130, meanlog=3.5, sdlog = 0.5))

p_asymmetrical_negative <-   ggplot(data = data.frame(x = c(2, 130)), aes(x)) +
	     stat_function(fun = rdlnorm, n = 101, args = list(meanlog = 3.5, sdlog = 0.5), colour="black") +
   
	     geom_segment(aes(x = 0, y = 0, xend = 130, yend = 0), colour="black") +
	
	     geom_segment(aes(x = 130-50, y = 0, xend = 130-50, yend = rdlnorm(130-50, meanlog=3.5, sdlog = 0.5)), colour="black", linetype="dashed") +
	     annotate("text", x = 75, y = dlnorm(50, meanlog=3.5, sdlog = 0.5)+0.00095, label = "Mean", parse = FALSE, size=5) +
   
	     geom_segment(aes(x = mode_n, y = 0, xend = mode_n, yend = rdlnorm(mode_n, meanlog=3.5, sdlog = 0.5)), colour="black", linetype="dotted") +
	     annotate("text", x = mode_n, y = rdlnorm(mode_n, meanlog=3.5, sdlog = 0.5)+0.00095, label = "Mode", parse = FALSE, size=5) + 
   
	     geom_segment(aes(x = 130-33, y = 0, xend = 130-33, yend = rdlnorm(130-33, meanlog=3.5, sdlog = 0.5)), colour="black",  linetype="dotted") +
	     annotate("text", x = 130-41, y = dlnorm(33, meanlog=3.5, sdlog = 0.5)+0.00055, label = "Median", parse = FALSE, size=5) +
   
	     annotate("text", x = 130-50, y = c(-0.001, -0.0025, -0.004), label = c("Asymmetric", "distribution", "(negative)"), parse = FALSE, size=5) +

	     scale_y_continuous(breaks = NULL) + theme_void() +  theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_))


p <- p_asymmetrical_positive + p_symmetrical  + p_asymmetrical_negative & theme(plot.background = element_rect(fill='transparent'), legend.background = element_rect(fill = 'transparent') )

png("Relationship_between_mean_and_median_under_different_skewness.png", width=900, height=350, bg = "transparent")
print(p)
dev.off()


set.seed(42)
mm <- data.frame(dist="mixture", x=rnorm(1000, rep(c(-1, 1), each = 10) * sqrt(0.8), sqrt(0.1)))

bmode <- table(round(mm$x, 3))
bmode <- as.numeric(names(bmode[(which(bmode == max(bmode)))]))

p_bimodal <-  ggplot(mm, aes(x = x)) + geom_density() +
   
   geom_segment(aes(x = -2, y = 0, xend = 2, yend = 0), colour="black") +
	
   geom_segment(aes(x = bmode, y = 0, xend = bmode, yend = dnorm(sqrt(0.084), mean=sqrt(0.5), sd = sqrt(0.1))), colour="black", linetype="dashed") +
   annotate("text", x = bmode, y = dnorm(sqrt(0.089), mean=sqrt(0.5), sd = sqrt(0.1))+0.015, label = "Mode[1]", parse = TRUE, size=5) +
   geom_segment(aes(x = -bmode, y = 0, xend = -bmode, yend = dnorm(sqrt(0.082), mean=sqrt(0.5), sd = sqrt(0.1))), colour="black", linetype="dashed") +
   annotate("text", x = -bmode, y = dnorm(sqrt(0.09), mean=sqrt(0.5), sd = sqrt(0.1))+0.015, label = "Mode[2]", parse = TRUE, size=5) +

   scale_y_continuous(breaks = NULL) + theme_void() +  theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_))


png("Bimodal.png", width=500, height=250, bg = "transparent")
print(p_bimodal)
dev.off()

mm$d <- rep(rep(c("d1", "d2"), each = 10), 10)

p_bimodal_2d <-  ggplot(mm, aes(x = x)) + geom_density() + geom_density(aes(y = after_stat(density * n/1210), colour=d, fill=d), alpha=0.05, linetype="dashed", linewidth=1.1) + scale_colour_manual(values=c("darkgreen", "magenta")) +  scale_fill_manual(values=c("darkgreen", "magenta")) +
   
   geom_segment(aes(x = -2, y = 0, xend = 2, yend = 0), colour="black") +
	
   geom_segment(aes(x = bmode, y = 0, xend = bmode, yend = dnorm(sqrt(0.084), mean=sqrt(0.5), sd = sqrt(0.1))), colour="black", linetype="dashed") +
   annotate("text", x = bmode, y = dnorm(sqrt(0.089), mean=sqrt(0.5), sd = sqrt(0.1))+0.015, label = "Mode[1]", parse = TRUE, size=5) +
   geom_segment(aes(x = -bmode, y = 0, xend = -bmode, yend = dnorm(sqrt(0.082), mean=sqrt(0.5), sd = sqrt(0.1))), colour="black", linetype="dashed") +
   annotate("text", x = -bmode, y = dnorm(sqrt(0.09), mean=sqrt(0.5), sd = sqrt(0.1))+0.015, label = "Mode[2]", parse = TRUE, size=5) + 

   scale_y_continuous(breaks = NULL) + theme_void() +  theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) +  theme(legend.position="none", legend.title = element_blank())

png("Bimodal_two_distro.png", width=500, height=250, bg = "transparent")
print(p_bimodal_2d)
dev.off()



# Examples of outliers in calculating median and mean
pp <- data.frame(x=c(6, 34, 40, 55, 175, 0, 0), y=c(rep(0, 5), 1, -1))

p <- ggplot(pp, aes(x=x, y=y, label=x)) + geom_point(size=3) + geom_segment(aes(x = 0, y = 0, xend = 180, yend = 0), size=1) +  geom_text(vjust = 2, size=4) 
p <- p +  geom_segment(aes(x = 40, y = -0.3, xend = 40, yend = -0.1), arrow = arrow(length = unit(0.5, "cm")), size=1, colour="darkmagenta") + annotate('text', x = 40, y = -0.35, label = "Median", parse=T, size=5, colour="darkmagenta")
p <- p + ylim(-0.4, 0.4) + graphic.settings + theme(legend.position="none", legend.title = element_blank()) + theme(axis.text.y=element_blank()) + xlab("") + ylab("")  + theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank(), panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank(), axis.ticks.y=element_blank(), panel.border = element_blank()) + scale_x_discrete(breaks=NULL) 

p <- p +  theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_))


png("median_outlier.png", width=500, height=250, bg = "transparent")
print(p)
dev.off()

p <- p +  geom_segment(aes(x = 62, y = -0.3, xend = 62, yend = -0.1), arrow = arrow(length = unit(0.5, "cm")), size=1, colour="darkgreen") + annotate('text', x = 62, y = -0.35, label = "Mean", parse=T, size=5, colour="darkgreen")


png("mean_outlier.png", width=500, height=250, bg = "transparent")
print(p)
dev.off()


## Children surgery
child.1991 <- read.csv("02-5-child-heart-surgery-1991-x.csv") # read data into dataframe 


p <- ggplot(child.1991, aes(x=reorder(Hospital,-Deaths), y=Deaths)) + geom_bar(stat = "identity", fill="gray74", colour="black") 
p <- p + coord_flip() + scale_y_continuous() # breaks every two-count
p <- p + theme(legend.position="none") + labs(y="Children < 1 year who died (N)", x="") + graphic.settings
 

png("Children_death.png")
print(p)
dev.off() 
  
p <- ggplot(child.1991, aes(x=reorder(Hospital,-Deaths), y=Operations)) + geom_bar(stat = "identity", fill="gray74", colour="black") 
p <- p + coord_flip() + scale_y_continuous() # breaks every two-count
p <- p + theme(legend.position="none") + labs(y="Children < 1 year who underwent surgery (N)", x="") + graphic.settings
 

png("Children_surgery.png")
print(p)
dev.off() 


p <- ggplot(child.1991, aes(x=Operations, y=Deaths, label=Hospital)) + geom_point(size=3)  + geom_label_repel(aes(label = Hospital), box.padding   = 0.35, point.padding = 0.5, segment.color = 'grey50') + labs(x="Surgeries  (N)", y = "Deaths (N)", title="Children < 1 year who died, 1991-1995") + graphic.settings + geom_smooth(method="lm", se=FALSE, col="magenta", linetype="dotted", ldw=1.5)

png("Children_death_vs_surgery.png")
print(p)
dev.off() 



p <- ggplot(child.1991, aes(x=Operations, y=Deaths, label=Hospital)) + geom_point(size=3)  + geom_label_repel(aes(label = Hospital), box.padding   = 0.35, point.padding = 0.5, segment.color = 'grey50') + labs(x="Surgeries (N)", y = "Deaths (N)", title="Children < 1 year who died, 1991-1995") + graphic.settings + geom_smooth(method="lm", se=FALSE, col="magenta", linetype="dashed", linewidth=2)

png("Children_death_vs_surgery_regression_line.png")
print(p)
dev.off() 

betas <- summary(lm(Deaths ~ Operations, data=child.1991))$coefficients[, 1]
y <- round(betas[1] + betas[2]*500, 0)
p1 <- p + annotate("text", x = 500, y = y, label = "x", parse = FALSE, size=15, colour="springgreen4")

png("Children_death_vs_surgery_regression_line_interpolate.png")
print(p1)
dev.off() 

#Pool from which to sample height
set.seed(42)

n=24
max.score=7
pool.h <- seq(150, 180, by=0.1)
pool.s <- seq(0, max.score, by=0.1)
names <- randomNames::randomNames(100, return.complete.data=TRUE)
names <- names[names$gender == 0, ]
names <- paste(names$first_name, names$last_name)
names <- data.frame(names=names, length=nchar(names))
names <- names[order(names$length), ]

df <- data.frame(h=sample(pool.h, n, replace=T), s=sample(pool.s, n, replace=T), n=names$names[1:n])
df <- rbind(df, c(211, 23.4, "Giannis Antetokounmpo"), c(188, 25.1, "Damian Lillard"))
df$h <- as.numeric(df$h)
df$s <- as.numeric(df$s)

p <- ggplot(df, aes(x=h, y=s, label=n)) + geom_point(size=3)  + geom_label_repel(aes(label = n), box.padding   = 0.35, point.padding = 0.5, segment.color = 'grey50') + labs(x="Height (cm)", y = "Mean score", title="", subtitle="Simulated dataset") + graphic.settings + geom_smooth(method="lm", se=FALSE, col="magenta", linetype="dotted", ldw=1.5)

png("Basketball.png")
print(p)
dev.off() 

p <- ggplot(df[1:n, ], aes(x=h, y=s, label=n)) + geom_point(size=3)  + geom_label_repel(aes(label = n), box.padding   = 0.35, point.padding = 0.5, segment.color = 'grey50') + labs(x="Height (cm)", y = "Mean score", title="", subtitle="Simulated dataset") + graphic.settings  + geom_smooth(method="lm", se=FALSE, col="magenta", linetype="dotted", ldw=1.5) + xlim(150, 190) + ylim(0, max.score+1)


png("Basketball_noout.png")
print(p)
dev.off()

print(cor(df$h, df$s))
print(cor(df$h[1:n], df$s[1:n]))


emma <- data.frame(year=seq(1999, 2023, 1), n=c(658, 821, 847, 1000, 1148, 1925, 2550, 2787, 2992, 3166, 3487, 4154, 4759, 4971, 4538, 3971, 3690, 3814, 3525, 3481, 3245, 3069, 2876, 2800, 2529))

emma$type <- 0
emma$type[seq(1, 14, 2)] <- 1
# emma$selected[which(emma$year %in% c(2004, 2010, 2015, 2020))] <- "real"

m <- lm(n ~ year, emma[emma$type == 1, ])
intercept <- summary(m)$coefficients[1,1]
slope <- summary(m)$coefficients[2,1]

  
p <- ggplot(emma[emma$type == 1, ], aes(x=year, y=n)) + geom_point(size=3) + labs(x="Year", y = "N", title="Newborns named Emma", subtitle="Source: ISTAT") + graphic.settings  + geom_abline(intercept = intercept, slope = slope, col="magenta", linetype="dotted", linewidth=1.5) + scale_y_continuous(breaks = seq(0, 10000, 2000), limits = c(0, 10000)) + scale_x_continuous(breaks = seq(1999, 2023, 2), limits = c(1999, 2023))


png("emma_hidden.png", width=780, height=400)
print(p)
dev.off()

guessed <- data.frame(year=c(2004, 2010, 2015, 2020), n=c(2004, 2010, 2015, 2020)*slope+intercept, type=2)
emma <- rbind(emma, guessed)
emma$type <- as.factor(emma$type)

p <- ggplot(emma[emma$type %in% c(1,2), ], aes(x=year, y=n, shape=type)) + geom_point(size=3) + labs(x="Year", y = "N", title="Newborns named Emma", subtitle="Source: ISTAT") + graphic.settings  + geom_abline(intercept = intercept, slope = slope, col="magenta", linetype="dotted", linewidth=1.5) + scale_y_continuous(breaks = seq(0, 10000, 2000), limits = c(0, 10000)) + scale_x_continuous(breaks = seq(1999, 2023, 2), limits = c(1999, 2023)) + scale_shape_manual(values = c(16, 23)) + theme(legend.position="none")


png("emma_guess.png", width=780, height=400)
print(p)
dev.off()


p <- ggplot(emma, aes(x=year, y=n, shape=type)) + geom_point(size=3) + labs(x="Year", y = "N", title="Newborns named Emma", subtitle="Source: ISTAT") + graphic.settings  + geom_abline(intercept = intercept, slope = slope, col="magenta", linetype="dotted", linewidth=1.5) + scale_y_continuous(breaks = seq(0, 10000, 2000), limits = c(0, 10000)) + scale_x_continuous(breaks = seq(1999, 2023, 2), limits = c(1999, 2023)) + scale_shape_manual(values = c(21, 16, 23)) + theme(legend.position="none")


png("emma_all.png", width=780, height=400)
print(p)
dev.off()
  


#
#
# set.seed(42)
# n <- 5000000
# mu=4
# sigma2=1.5
# df <- data.frame(x=c(1:n), y=rnorm(n, mean=mu, sd=sigma2))
# df$t <- df$y-mu # This is traslated to mean=0
# df$z <- scale(df$y) #This is the standard normal distr
#
# df <- reshape2::melt(df, id="x")
#
# graphic.settings <- theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3))  +  theme(axis.text.y=element_blank(), axis.ticks.y=element_blank(), axis.title.y=element_blank())
#
#
# #Only the N distr in magenta
# png("../estimation/n2z_1.png", width=700, height=500)
# print(ggplot(df[df$variable == "y", ], aes(value, colour=variable)) + geom_density(linewidth=2) + graphic.settings + xlim(-8, 12) + ylim(0, 0.4) + scale_color_manual(values=c("magenta", "gray74", "darkgreen")) + theme(legend.position="none"))
# dev.off()
#
#
# # Add the translated dist + the translation lines
# p <- ggplot(df[df$variable != "z", ], aes(value, colour=variable)) + geom_density(linewidth=2) + graphic.settings + xlim(-8, 12) + ylim(0, 0.4) + scale_color_manual(values=c("magenta", "gray74", "darkgreen")) + theme(legend.position="none")
# p <- p + geom_segment(aes(x = mu, y = 0.265, xend = 0, yend = 0.265), arrow = arrow(length = unit(0.5, "cm")), size=1, colour="gray74")
# p
#
# png("../estimation/n2z_2.png", width=700, height=500)
# print(p)
# dev.off()
#
# png("../estimation/n2z_3.png", width=700, height=500)
# print(ggplot(df[df$variable != "y", ], aes(value, colour=variable)) + geom_density(linewidth=2) + graphic.settings + xlim(-8, 12) + ylim(0, 0.4) + scale_color_manual(values=c("gray74", "darkgreen")) + theme(legend.position="none"))
# dev.off()
#
#
# png("../estimation/n2z_4.png", width=700, height=500)
# print(ggplot(df[df$variable != "t", ], aes(value, colour=variable, linetype = variable)) + geom_density(linewidth=2) + graphic.settings + xlim(-8, 12) + ylim(0, 0.4) + scale_color_manual(values=c("magenta", "darkgreen")) + scale_linetype_manual(values=c(2,1)) + theme(legend.position="none"))
# dev.off()
#
#
# # set.seed(42)
# #
# # n <- 5000
# # dt <- data.frame(x=c(1:n),y=rnorm(n))
# # dens <- density(dt$y)
# # df <- data.frame(x=dens$x, y=dens$y)
# # probs <- c(0.25, 0.5, 0.75)
# # quantiles <- quantile(dt$y, prob=probs)
# # df$Quantile <- factor(findInterval(df$x,quantiles))
# # levels(df$Quantile) <- c("Q1", "Q2", "Q3", "Q4")
# #
# # cols <- c("magenta", "green", "blue", "orange")
# # names(cols) <- levels(df$Quantile)
# #
# # p <- ggplot(df, aes(x,y)) + geom_line() + geom_ribbon(aes(ymin=0, ymax=y, fill=Quantile), alpha = .5)
# # p <- p + scale_x_continuous(breaks=quantiles) +  scale_fill_manual(values = cols)
# # p <- p + graphic.settings + theme(legend.position="bottom")
# #
# # png("../descriptive/quantile.png", width=500, height=250)
# # print(p)
# # dev.off()
# #
# #
# # set.seed(42)
# #
# # n <- 250900
# # df <- rbind(data.frame(n=1:n, x=round(rnorm(n, mean = 0, sd = 10), 1), y=10, sd="s10"),
# # 			data.frame(n=1:n, x=round(rnorm(n, mean = 0, sd = 20), 1), y=10, sd="s20"),
# # 			data.frame(n=1:n, x=round(rnorm(n, mean = 0, sd = 30), 1), y=10, sd="s30"))
# # names(cols) <- levels(df$sd)
# #
# #
# # p <- ggplot(df, aes(x, fill = sd, colour = sd)) + geom_density(alpha = .2) + scale_fill_manual(values = cols)
# # p <- p + geom_segment(aes(x = 0, y = -0.0025, xend = 0, yend = 0.0425), size=0.5, colour="black")
# # p <- p + graphic.settings + theme(legend.position="none")
# #
# #
# # png("../descriptive/sd.png", width=500, height=250)
# # print(p)
# # dev.off()
# #
# #
