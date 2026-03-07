clean()
set.seed(42)

library(ggplot2)
library(gridExtra)

font.size <- 22
graphic.settings <- theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3)) +  theme(legend.title = element_blank()) + theme(plot.subtitle=element_text(size=font.size/4*3), plot.title=element_text(size=font.size))


setwd("/Users/visconti/Documents/Teaching/short_intro_stats/img/confidence_intervals/")

load("HBSC_BMI.RData")

hbsc14 <- hbsc14[!is.na(hbsc14$m4_anno_nascita), ]
hbsc14$age <- 2014 - hbsc14$m4_anno_nascita

hbsc14 <- hbsc14[hbsc14$age == 11 & hbsc14$m1_genere==2, ]
hbsc14 <- na.omit(hbsc14[, c("id", "BMI")])


n.sample <- 290
n.experiments <- 100

mu <- mean(hbsc14$BMI)

# Calculate the population's parameters
mu <- mean(hbsc14$BMI)
sigma <- sd(hbsc14$BMI)

# Calculate the SE 
se <- sigma/sqrt(n.sample)

# Now each pupil is evaluating the confidence interval for their mean
ci <- t(sapply(1:n.experiments, function(i)
{
	sample <- sample(hbsc14$BMI, n.sample)
	mu.sample <- mean(sample)
	lci <- mu.sample - se
	uci <- mu.sample + se
	return(c(lci, uci, mu.sample))
}))

# Formatting
colnames(ci) <- c("lci", "uci", "avg")
ci <- as.data.frame(ci)
ci <- ci[order(ci$avg, decreasing=TRUE), ]

ci$id <- 1:nrow(ci)
ci$include <- apply(ci, 1, function(r) ifelse(r[1] < mu & mu < r[2], 1, 0 ))
pc <- round(sum(ci$include)/nrow(ci)*100, 0)
ci$include <- as.factor(ci$include)


print(table(ci$include))



h <- hist(ci$avg)

p <-  ggplot(ci) +
  	  geom_segment(aes(y=lci, yend=uci, x=id, xend=id, col = include, group=id), linewidth=1) +
	  geom_point(aes(y=avg, x=id, col = include), size=1) +
 	  graphic.settings  + theme(legend.position="none", legend.title = element_blank()) + theme(axis.text.x=element_blank()) +
	  xlab("Samples") + ylab("BMI, 95% CI") + scale_colour_manual(values=c("magenta3", "springgreen3")) +
	  geom_hline(aes(yintercept=mu), colour="black", linetype="dashed", linewidth=1) + 	theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 
	  

png("simulated_BMI_CI.png", width=760, height=400, bg = "transparent")
print(p)
dev.off()


circleFun <- function(center = c(0,0), diameter = 1, npoints = 100){
    r = diameter / 2
    tt <- seq(0, 2*pi, length.out = npoints)
    xx <- center[1] + r * cos(tt)
    yy <- center[2] + r * sin(tt)
    data.frame(x = xx, y = yy)
}

mydnorm  <- function(x, mean, sd) { dnorm(x, mean, sd)*4 }

#geom_path will do open circles, geom_polygon will do filled circles
p <- ggplot() + 
		geom_polygon(data=circleFun(center=c(1, 3), diameter = 1.5), aes(x,y), fill="steelblue1", colour="black", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(1, 1), diameter = 0.5), aes(x,y), fill="springgreen4", colour="black", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(2.5, 1.5), diameter = 0.5), aes(x,y), fill="firebrick", colour="black", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(3, 3), diameter = 0.5), aes(x,y), fill="orange", colour="black", alpha=0.6) +
				
		annotate("text", x = 1, y=3, label = "Population", parse = FALSE, size=7) +
		annotate("text", x = 1, y=1, label = "bar(x)[1]", parse = TRUE, size=7) +
		annotate("text", x = 2.5, y=1.5, label = "bar(x)[2]", parse = TRUE, size=7) +
		annotate("text", x = 3, y=3, label = "bar(x)[3]", parse = TRUE, size=7) +
				
		geom_segment(aes(x = 1, y = 2.2, xend = 1, yend = 1.3), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
		geom_segment(aes(x = 1.6, y = 2.45, xend = 2.3, yend = 1.7), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
		geom_segment(aes(x = 1.8, y = 3, xend = 2.7, yend = 3), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") + 
				
		annotate("text", x = 3, y=c(3.6, 3.4), label = c("Samples", "(Size == n)"), parse = TRUE, size=c(7,5)) 
				
p <- p + stat_function(data = data.frame(x = c(0, 11)), aes(x), fun = mydnorm, n = 101, args = list(mean = 5, sd = 1), geom = "area", fill=NA, colour="black", alpha=0.2, xlim=c(2, 8)) +
		geom_segment(aes(x = 5, y = 0, xend = 5, yend = mydnorm(5, mean=5, sd = 1)), colour="black", linetype="dashed") + 
		annotate("text", x = 5, y=-0.2, label = "mu", parse = TRUE, size=8) 

p <- p + geom_point(data=data.frame(x=c(3.5, 4.5, 5.5), y=c(0, 0, 0), col=c("a", "b", "c")), aes(x=x, y=y, colour=col), size=7) + scale_colour_manual(values=c("springgreen4", "firebrick", "orange")) +
	geom_segment(aes(x = 1.2, y = 0.8, xend = 3.5-0.05, yend = 0.07), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
	geom_segment(aes(x = 2.7, y = 1.3, xend = 4.5-0.05, yend = 0.07), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
	geom_segment(aes(x = 3.2, y = 2.8, xend = 5.5-0.05, yend = 0.07), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
		
	annotate("text", x = 3.55, y=-0.2, label = "bar(x)[1]", parse = TRUE, size=7) +
	annotate("text", x = 4.55, y=-0.2, label = "bar(x)[2]", parse = TRUE, size=7) +
	annotate("text", x = 5.55, y=-0.2, label = "bar(x)[3]", parse = TRUE, size=7) 
	
p <- p + annotate("text", x = 6.8, y=mydnorm(5, mean=5, sd = 1), label = "Sampling distribution", parse = FALSE, size=7) +
 	theme_void() + theme(legend.position="none", legend.title = element_blank()) +
	theme(legend.position="none", legend.title = element_blank()) + 
	theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 


png("sampling_distro.png", width=760, height=400, bg = "transparent")
print(p)
dev.off()
				

# Sampling variability
p <- ggplot() + 
		geom_polygon(data=circleFun(center=c(1, 3), diameter = 1.5), aes(x,y), fill="steelblue1", colour="black", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(1, 1), diameter = 0.5), aes(x,y), fill="transparent", colour="transparent", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(2.5, 1.5), diameter = 0.5), aes(x,y), fill="transparent", colour="transparent", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(3, 3), diameter = 0.5), aes(x,y), fill="transparent", colour="transparent", alpha=0.6) +
				
		annotate("text", x = 1, y=3, label = "Population", parse = FALSE, size=7) #+
		# annotate("text", x = 1, y=1, label = "bar(x)[1]", parse = TRUE, size=7) +
# 		annotate("text", x = 2.5, y=1.5, label = "bar(x)[2]", parse = TRUE, size=7) +
# 		annotate("text", x = 3, y=3, label = "bar(x)[3]", parse = TRUE, size=7) +
#
# 		geom_segment(aes(x = 1, y = 2.2, xend = 1, yend = 1.3), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
# 		geom_segment(aes(x = 1.6, y = 2.45, xend = 2.3, yend = 1.7), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
# 		geom_segment(aes(x = 1.8, y = 3, xend = 2.7, yend = 3), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +

p <- p + theme_void() + theme(legend.position="none", legend.title = element_blank()) +
		 theme(legend.position="none", legend.title = element_blank()) + 
		 theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 

png("sampling_variability_1.png", width=760, height=400, bg = "transparent")
print(p)
dev.off()
	
p <- ggplot() + 
		geom_polygon(data=circleFun(center=c(1, 3), diameter = 1.5), aes(x,y), fill="steelblue1", colour="black", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(1, 1), diameter = 0.5), aes(x,y), fill="springgreen4", colour="black", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(2.5, 1.5), diameter = 0.5), aes(x,y), fill="transparent", colour="transparent", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(3, 3), diameter = 0.5), aes(x,y), fill="transparent", colour="transparent", alpha=0.6) +
				
		annotate("text", x = 1, y=3, label = "Population", parse = FALSE, size=7) +
		annotate("text", x = 1, y=1, label = "bar(x)[1]", parse = TRUE, size=7) +
# 		annotate("text", x = 2.5, y=1.5, label = "bar(x)[2]", parse = TRUE, size=7) +
# 		annotate("text", x = 3, y=3, label = "bar(x)[3]", parse = TRUE, size=7) +
#
 		geom_segment(aes(x = 1, y = 2.2, xend = 1, yend = 1.3), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") #+
# 		geom_segment(aes(x = 1.6, y = 2.45, xend = 2.3, yend = 1.7), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
# 		geom_segment(aes(x = 1.8, y = 3, xend = 2.7, yend = 3), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +

p <- p + theme_void() + theme(legend.position="none", legend.title = element_blank()) +
		 theme(legend.position="none", legend.title = element_blank()) + 
		 theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 

png("sampling_variability_2.png", width=760, height=400, bg = "transparent")
print(p)
dev.off()	

p <- ggplot() + 
		geom_polygon(data=circleFun(center=c(1, 3), diameter = 1.5), aes(x,y), fill="steelblue1", colour="black", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(1, 1), diameter = 0.5), aes(x,y), fill="transparent", colour="transparent", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(2.5, 1.5), diameter = 0.5), aes(x,y), fill="firebrick", colour="black", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(3, 3), diameter = 0.5), aes(x,y), fill="transparent", colour="transparent", alpha=0.6) +
				
		annotate("text", x = 1, y=3, label = "Population", parse = FALSE, size=7) +
#		annotate("text", x = 1, y=1, label = "bar(x)[1]", parse = TRUE, size=7) +
 		annotate("text", x = 2.5, y=1.5, label = "bar(x)[2]", parse = TRUE, size=7) +
# 		annotate("text", x = 3, y=3, label = "bar(x)[3]", parse = TRUE, size=7) +
#
# 		geom_segment(aes(x = 1, y = 2.2, xend = 1, yend = 1.3), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
 		geom_segment(aes(x = 1.6, y = 2.45, xend = 2.3, yend = 1.7), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") #+
# 		geom_segment(aes(x = 1.8, y = 3, xend = 2.7, yend = 3), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +

p <- p + theme_void() + theme(legend.position="none", legend.title = element_blank()) +
		 theme(legend.position="none", legend.title = element_blank()) + 
		 theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 

png("sampling_variability_3.png", width=760, height=400, bg = "transparent")
print(p)
dev.off()	


p <- ggplot() + 
		geom_polygon(data=circleFun(center=c(1, 3), diameter = 1.5), aes(x,y), fill="steelblue1", colour="black", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(1, 1), diameter = 0.5), aes(x,y), fill="transparent", colour="transparent", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(2.5, 1.5), diameter = 0.5), aes(x,y), fill="transparent", colour="transparent", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(3, 3), diameter = 0.5), aes(x,y), fill="orange", colour="black", alpha=0.6) +
				
		annotate("text", x = 1, y=3, label = "Population", parse = FALSE, size=7) +
#		annotate("text", x = 1, y=1, label = "bar(x)[1]", parse = TRUE, size=7) +
# 		annotate("text", x = 2.5, y=1.5, label = "bar(x)[2]", parse = TRUE, size=7) +
 		annotate("text", x = 3, y=3, label = "bar(x)[3]", parse = TRUE, size=7) +
#
# 		geom_segment(aes(x = 1, y = 2.2, xend = 1, yend = 1.3), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
# 		geom_segment(aes(x = 1.6, y = 2.45, xend = 2.3, yend = 1.7), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") #+
 		geom_segment(aes(x = 1.8, y = 3, xend = 2.7, yend = 3), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") 

p <- p + theme_void() + theme(legend.position="none", legend.title = element_blank()) +
		 theme(legend.position="none", legend.title = element_blank()) + 
		 theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 

png("sampling_variability_4.png", width=760, height=400, bg = "transparent")
print(p)
dev.off()	

		
p <- ggplot() + 
		geom_polygon(data=circleFun(center=c(1, 3), diameter = 1.5), aes(x,y), fill="steelblue1", colour="black", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(1, 1), diameter = 0.5), aes(x,y), fill="springgreen4", colour="black", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(2.5, 1.5), diameter = 0.5), aes(x,y), fill="firebrick", colour="black", alpha=0.6) +
		geom_polygon(data=circleFun(center=c(3, 3), diameter = 0.5), aes(x,y), fill="orange", colour="black", alpha=0.6) +
				
		annotate("text", x = 1, y=3, label = "Population", parse = FALSE, size=7) +
		annotate("text", x = 1, y=1, label = "bar(x)[1]", parse = TRUE, size=7) +
 		annotate("text", x = 2.5, y=1.5, label = "bar(x)[2]", parse = TRUE, size=7) +
 		annotate("text", x = 3, y=3, label = "bar(x)[3]", parse = TRUE, size=7) +

 		geom_segment(aes(x = 1, y = 2.2, xend = 1, yend = 1.3), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
 		geom_segment(aes(x = 1.6, y = 2.45, xend = 2.3, yend = 1.7), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
 		geom_segment(aes(x = 1.8, y = 3, xend = 2.7, yend = 3), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") 

p <- p + theme_void() + theme(legend.position="none", legend.title = element_blank()) +
		 theme(legend.position="none", legend.title = element_blank()) + 
		 theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 

png("sampling_variability_5.png", width=760, height=400, bg = "transparent")
print(p)
dev.off()	


p1 <- ggplot() +
  stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 1), geom = "area", fill="grey74", alpha=0.2, xlim = c(-2, 2)) +
  stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 1), colour="grey70") + ylab("") +
  geom_segment(aes(x = -2, y = 0, xend = 2, yend = 0), colour="magenta", lwd=2) +
  scale_y_continuous(breaks = NULL) + theme_void() 
  
p2 <-   ggplot(data = data.frame(x = c(-15, 15)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), geom = "area", fill="grey74", alpha=0.2, xlim = c(-10, 10)) + 
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), colour="grey70") + ylab("") +
	geom_segment(aes(x = -10, y = 0, xend = 10, yend = 0), colour="magenta", lwd=2) +
    scale_y_continuous(breaks = NULL) + theme_void() +
	theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 

png("large_small_CI.png", width = 480*2, height = 480)
grid.arrange(p1, p2, ncol=2)
dev.off()

png("unannotated_CI.png", bg = "transparent")
print(p2)
dev.off()

p <-   ggplot(data = data.frame(x = c(-15, 15)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), geom = "area", fill="grey34", alpha=0.2, xlim = c(-10, 10)) + 
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), colour="black") + ylab("") +
	geom_segment(aes(x = -10, y = -0.0025, xend = -10, yend = dnorm(-10, mean=0, sd=4)), colour="black") +
	geom_segment(aes(x = 10, y = -0.0025, xend = 10, yend = dnorm(10, mean=0, sd=4)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	annotate("text", x = -12, y = dnorm(-12, mean=0, sd=4)+0.005, label = "paste(alpha/2, \"\")", parse = TRUE, size=7) +
	annotate("text", x = 12, y = dnorm(12, mean=0, sd=4)+0.005, label = "paste(alpha/2, \"\")", parse = TRUE, size=7) + 
	geom_segment(aes(x = -12, y = dnorm(-12, mean=0, sd=4)+0.0025, xend = -11, yend = 0), arrow = arrow(length = unit(0.2, "cm"))) +
	geom_segment(aes(x = 12, y = dnorm(12, mean=0, sd=4)+0.0025, xend = 11, yend = 0), arrow = arrow(length = unit(0.2, "cm"))) +
	annotate("text", x = 0, y = dnorm(12, mean=0, sd=4)+0.01, label = "paste(1- alpha, \"\")", parse = TRUE, size=7) +
	geom_segment(aes(x = 0, y = 0, xend = 0, yend = dnorm(0, mean=0, sd=4)), colour="grey60", linewidth=1, linetype="dotted") +
	geom_segment(aes(x = 0, y = -0.0025, xend = 0, yend = 0), colour="black") +
	# annotate('text', x = 0, y = -0.005, label = "bar(x)", parse=T, size=5) +
	# annotate('text', x = -10, y = -0.005, label = "bar(x) - z[alpha/2] %*% SE", parse=T, size=5) +
	# annotate('text', x = 10, y = -0.005, label = "bar(x) + z[alpha/2] %*% SE", parse=T, size=5) +
	annotate('text', x = 0, y = -0.005, label = "0", parse=T, size=5) +
	annotate('text', x = -10, y = -0.005, label = "-z", parse=T, size=5) +
	annotate('text', x = 10, y = -0.005, label = "z", parse=T, size=5) +
	geom_segment(aes(x = -10, y = 0, xend = 10, yend = 0), colour="magenta", lwd=2) + theme_void() +
	theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 

png("alpha_level.png", bg = "transparent")
print(p)
dev.off()


p <-   ggplot(data = data.frame(x = c(-15, 15)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), geom = "area", fill="springgreen4", alpha=0.2, xlim = c(-15, 10)) + 
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), colour="black") + ylab("") +
	# geom_segment(aes(x = -10, y = -0.0025, xend = -10, yend = dnorm(-10, mean=0, sd=4)), colour="black") +
	geom_segment(aes(x = 10, y = -0.0025, xend = 10, yend = dnorm(10, mean=0, sd=4)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	# annotate("text", x = -12, y = dnorm(-12, mean=0, sd=4)+0.005, label = "paste(alpha/2, \"\")", parse = TRUE, size=7) +
	annotate("text", x = 12, y = dnorm(12, mean=0, sd=4)+0.005, label = "paste(alpha/2, \"\")", parse = TRUE, size=7) + 
	# geom_segment(aes(x = -12, y = dnorm(-12, mean=0, sd=4)+0.0025, xend = -11, yend = 0), arrow = arrow(length = unit(0.2, "cm"))) +
	geom_segment(aes(x = 12, y = dnorm(12, mean=0, sd=4)+0.0025, xend = 11, yend = 0), arrow = arrow(length = unit(0.2, "cm"))) +
	# annotate("text", x = 0, y = dnorm(12, mean=0, sd=4)+0.01, label = "paste(1- alpha, \"\")", parse = TRUE, size=7) +
	geom_segment(aes(x = 0, y = 0, xend = 0, yend = dnorm(0, mean=0, sd=4)), colour="grey60", linewidth=1, linetype="dotted") +
	geom_segment(aes(x = 0, y = -0.0025, xend = 0, yend = 0), colour="black") +
	# annotate('text', x = 0, y = -0.005, label = "bar(x)", parse=T, size=5) +
	# annotate('text', x = -10, y = -0.005, label = "bar(x) - z[alpha/2] %*% SE", parse=T, size=5) +
	# annotate('text', x = 10, y = -0.005, label = "bar(x) + z[alpha/2] %*% SE", parse=T, size=5) +
	annotate('text', x = 0, y = -0.005, label = "0", parse=T, size=5) +
	# annotate('text', x = -10, y = -0.005, label = "-z", parse=T, size=5) +
	annotate('text', x = 10, y = -0.007, label = "z", parse=T, size=10, colour="springgreen4") +
	# geom_segment(aes(x = -10, y = 0, xend = 10, yend = 0), colour="magenta", lwd=2) +
	theme_void() + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 

png("alpha_level_area.png", bg = "transparent")
print(p)
dev.off()


p <-   ggplot(data = data.frame(x = c(-15, 15)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), geom = "area", fill="grey34", alpha=0.2, xlim = c(-10, 10)) + 
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), colour="black") + ylab("") +
	geom_segment(aes(x = -10, y = -0.0025, xend = -10, yend = dnorm(-10, mean=0, sd=4)), colour="black") +
	geom_segment(aes(x = 10, y = -0.0025, xend = 10, yend = dnorm(10, mean=0, sd=4)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	geom_segment(aes(x = 0, y = 0, xend = 0, yend = dnorm(0, mean=0, sd=4)), colour="grey60", linewidth=1, linetype="dotted") +
	geom_segment(aes(x = 0, y = -0.0025, xend = 0, yend = 0), colour="black") +
	annotate('text', x = 0, y = -0.0045, label = "bar(x)", parse=T, size=5) +
	geom_segment(aes(x = 0, y = -0.007, xend = -10, yend = -0.007), colour="magenta", arrow = arrow(length = unit(0.3, "cm"), ends = "both", type = "open"), lwd=1.2) +
	geom_segment(aes(x = 0, y = -0.007, xend = 10, yend = -0.007), arrow = arrow(length = unit(0.3, "cm"), ends = "both", type = "open"), colour="magenta", lwd=1.2) +
	annotate("text", x = -5, y = -0.01, label = "Margin of Error", parse = FALSE, size=6) +
	annotate("text", x = 5, y = -0.01, label = "Margin of Error", parse = FALSE, size=6) +
	geom_segment(aes(x = -10, y = -0.014, xend = 10, yend = -0.014), colour="darkgreen", arrow = arrow(length = unit(0.3, "cm"), ends = "both", type = "open"), lwd=1.2) +
	annotate("text", x = 0, y = -0.0165, label = "Confidence Interval", parse = FALSE, size=6) + theme_void() +
	theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 
	

png("ME_and_CI.png", bg = "transparent")
print(p)
dev.off()


# Various student's t
for (df in c(1, 5, 30))
{
	p <-   ggplot(data = data.frame(x = c(-6, 6)), aes(x)) +
	    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 1), colour="black", linetype="dashed", lwd=1.2) +
		stat_function(fun = dt, n = 101, args = list(df = df), colour="magenta", lwd=1.2) +
	
		geom_segment(aes(x = 0, y = -0.0025, xend = 0, yend = 0), colour="black") +
		annotate("text", x = 4, y = 0.05, label = paste0("df = ", df), parse = FALSE, size=9) +
		theme_void() + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 


	png(paste0("tdist_df", df, ".png"), width=480, height=400, bg = "transparent")
	print(p)
	dev.off()
	
}

p <- ggplot() + theme_void()

png(paste0("tdist_df_empty.png"), width=480, height=400, bg = "transparent")
print(p)
dev.off()


