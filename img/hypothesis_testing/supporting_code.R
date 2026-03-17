clean()
set.seed(42)

library(ggplot2)
library(gridExtra)

font.size <- 22
graphic.settings <- theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3)) +  theme(legend.title = element_blank()) + theme(plot.subtitle=element_text(size=font.size/4*3), plot.title=element_text(size=font.size))


setwd("/Users/visconti/Documents/Teaching/short_intro_stats/img/hypothesis_testing")

n_i <- 151
mean_i <- 6.6
sd_i <- 10

n_c <- 148
mean_c <- 4
sd_c <- 8.7

p <-  ggplot(data = data.frame(x = c(-25, 40)), aes(x)) + 
	 stat_function(fun = function(x) dnorm(x, mean = mean_i, sd = sd_i), colour="springgreen4", lwd=1) + 
	 stat_function(fun = function(x) dnorm(x, mean = mean_c, sd = sd_c), colour="darkmagenta", lwd=1) + 
	 annotate("text", x = mean_i+9, y = c(dnorm(mean_i, mean=mean_i, sd=sd_i)+ 0.004, dnorm(mean_i, mean=mean_i, sd=sd_i)+ 0.001), label = c("Dexamethasone", "+ standard care"), color="springgreen4", size=7) +
	 annotate("text", x = mean_c, y = dnorm(mean_c, mean=mean_c, sd=sd_c)+ 0.002, label = "Standard care", color="darkmagenta", size=7) +
 	 geom_segment(aes(y = 0, x = mean_i, yend = dnorm(mean_i, mean=mean_i, sd=sd_i), xend = mean_i), color="springgreen4", lwd=1, linetype="dotted") +
 	geom_segment(aes(y = 0, x = mean_c, yend = dnorm(mean_c, mean=mean_c, sd=sd_c), xend = mean_c), color="darkmagenta", lwd=1, linetype="dotted")  +
	geom_segment(aes(x = mean_i, y = -0.001, xend =  mean_i, yend = 0), colour="springgreen4") + 
	annotate("text", x = mean_i, y = -0.002, label = mean_i, parse = FALSE, size=6, colour="springgreen4") +
	geom_segment(aes(x = mean_c, y = -0.002, xend =  mean_c, yend = 0), colour="darkmagenta") +
	annotate("text", x = mean_c, y = -0.003, label = mean_c, parse = FALSE, size=6, colour="darkmagenta") + 
	geom_segment(aes(x = -25, y = 0, xend =  40, yend = 0), colour="black") + theme_void() + theme(legend.position="none", legend.title = element_blank()) + 
	theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 
	
	
png("Day_ventilation_free_distribution_by_treatment.png", width = 500, height = 300, bg = "transparent")
print(p)
dev.off()


p <-  ggplot(data = data.frame(x = c(-25, 40)), aes(x)) + 
	geom_segment(aes(x = mean_i, y = -0.001, xend =  mean_i, yend = 0), colour="springgreen4", lwd=1.5) + 
	annotate("text", x = mean_i, y = -0.0015, label = mean_i, parse = FALSE, size=7, colour="springgreen4") +
	geom_segment(aes(x = mean_c, y = -0.002, xend =  mean_c, yend = 0), colour="darkmagenta", lwd=1.5) +
	annotate("text", x = mean_c, y = -0.0025, label = mean_c, parse = FALSE, size=7, colour="darkmagenta") + 
	geom_segment(aes(x = 2, y = 0, xend = 8, yend = 0), colour="black") + 
	geom_segment(aes(x = mean_c, y = -0.0005, xend = mean_i, yend = -0.0005), color="black", lwd=1, arrow = arrow(length = unit(0.6, "cm"), ends = "both")) + ylim(-0.003, 0.0003) + xlim(2, 8) +
	theme_void() + theme(legend.position="none", legend.title = element_blank()) + 
	theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 

png("Delta_day_ventilation_free.png", width = 480, height = 100, bg = "transparent")
print(p)
dev.off()


p <- ggplot(data = data.frame(x = c(-4, 4)), aes(x)) +
	 stat_function(fun = function(x) dnorm(x, 0, 1.08), colour="black", lwd=1) +
 	 stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 1.08), geom = "area", fill="magenta", alpha=0.6, xlim = c(2.4, 4)) + 
 	 stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 1.08), geom = "area", fill="magenta", alpha=0.6, xlim = c(-2.4, - 4)) +
	 geom_segment(aes(x = 2.4, y = 0.1, xend = 2.4, yend = 0), color="black", lwd=1, arrow = arrow(length = unit(0.5, "cm"))) +
	 geom_segment(aes(x = -2.4, y = 0.1, xend = -2.4, yend = 0), color="black", lwd=1, arrow = arrow(length = unit(0.5, "cm"))) +
 	geom_segment(aes(x = 0, y = -0.01, xend =  0, yend = 0), colour="black") + 
 	annotate("text", x = 0, y = -0.02, label = 0, parse = FALSE, size=6) +
 	geom_segment(aes(x = -2.4, y = -0.01, xend =  -2.4, yend = 0), colour="black") + 
 	annotate("text", x = -2.4, y = -0.02, label = -2.4, parse = FALSE, size=6) +
 	geom_segment(aes(x = 2.4, y = -0.01, xend =  2.4, yend = 0), colour="black") + 
 	annotate("text", x = 2.4, y = -0.02, label = 2.4, parse = FALSE, size=6) +
	geom_segment(aes(x = -4, y = 0, xend =  4, yend = 0), colour="black") + 
	theme_void() + theme(legend.position="none", legend.title = element_blank()) + 
	theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 
	
 
png("Delta_day_ventilation_free_normale_standard.png", bg = "transparent")
print(p)
dev.off() 
 


p <-   ggplot(data = data.frame(x = c(-15, 15)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), geom = "area", fill="grey34", alpha=0.2, xlim = c(-10, 10)) + 
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), colour="black") + ylab("") +
	geom_segment(aes(x = -10, y = -0.0025, xend = -10, yend = dnorm(-10, mean=0, sd=4)), colour="black") +
	geom_segment(aes(x = 10, y = -0.0025, xend = 10, yend = dnorm(10, mean=0, sd=4)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	annotate("text", x = -12, y = dnorm(-12, mean=0, sd=4)+0.0055, label = "Rejection region",  size=5) +
	annotate("text", x = 12, y = dnorm(12, mean=0, sd=4)+0.0055, label = "Rejection region",  size=5) + 
	geom_segment(aes(x = -12, y = dnorm(-12, mean=0, sd=4)+0.0025, xend = -11, yend = 0), arrow = arrow(length = unit(0.2, "cm"))) +
	geom_segment(aes(x = 12, y = dnorm(12, mean=0, sd=4)+0.0025, xend = 11, yend = 0), arrow = arrow(length = unit(0.2, "cm"))) +
	annotate("text", x = 0, y = dnorm(12, mean=0, sd=4)+0.01, label = "Acceptance region",  size=5) +
	geom_segment(aes(x = 0, y = 0, xend = 0, yend = dnorm(0, mean=0, sd=4)), colour="grey60", linewidth=1, linetype="dotted") +
	geom_segment(aes(x = 0, y = -0.0025, xend = 0, yend = 0), colour="black") +
	annotate('text', x = 0, y = -0.005, label = "bar(x)", parse=T, size=5) +
	annotate('text', x = -10, y = -0.005, label = "bar(x) - z[alpha/2] %*% SE", parse=T, size=5) +
	annotate('text', x = 10, y = -0.005, label = "bar(x) + z[alpha/2] %*% SE", parse=T, size=5) +
	geom_segment(aes(x = -10, y = 0, xend = 10, yend = 0), colour="magenta", lwd=2) + theme_void() + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 

png("rifiuto_non_rifiuto.png", bg = "transparent")
print(p)
dev.off()


mean_i <- 100
sd <- 15

cohens_d <- function(mean_c, delta, d)
{
	ggplot(data = data.frame(x = c(40, 160)), aes(x)) + 
		 stat_function(fun = function(x) dnorm(x, mean = mean_i, sd = sd), colour="darkmagenta", geom = "area", fill="darkmagenta", alpha=0.6, lwd=1) + 
		 stat_function(fun = function(x) dnorm(x, mean = mean_c, sd = sd), colour="springgreen4", geom = "area", fill="springgreen4", alpha=0.6, lwd=1) + 
	 
		 # annotate("text", x = mean_i-1.5, y = dnorm(mean_i, mean=mean_i, sd=sd)+ 0.0015, label="P[1]", parse=TRUE, color="darkmagenta", size=7) +
	# 	 annotate("text", x = mean_c+1.5, y = dnorm(mean_c, mean=mean_c, sd=sd)+ 0.0015, label = "P[2]", parse=TRUE,  color="springgreen4", size=7) +
	 
	 	 geom_segment(aes(y = 0, x = mean_i, yend = dnorm(mean_i, mean=mean_i, sd=sd), xend = mean_i), color="white", lwd=0.5, linetype="dotted") +
	 	geom_segment(aes(y = 0, x = mean_c, yend = dnorm(mean_c, mean=mean_c, sd=sd), xend = mean_c), color="white", lwd=0.5, linetype="dotted") + 
		 geom_segment(aes(y = dnorm(mean_i, mean=mean_i, sd=sd), x = mean_i, yend = dnorm(mean_i, mean=mean_i, sd=sd)+0.003, xend = mean_i), color="black", lwd=0.5, linetype="dotted") +
		geom_segment(aes(y = dnorm(mean_c, mean=mean_c, sd=sd), x = mean_c, yend = dnorm(mean_c, mean=mean_c, sd=sd)+0.003, xend = mean_c), color="black", lwd=0.5, linetype="dotted") +
	
		geom_segment(aes(y = dnorm(mean_c, mean=mean_c, sd=sd)+0.003, x = mean_c, yend = dnorm(mean_c, mean=mean_c, sd=sd)+0.003, xend = mean_i), color="black", lwd=0.5, arrow = arrow(length = unit(0.1, "cm"), ends="both")) +
	
		annotate("text", x = mean_i+1.5, y = dnorm(mean_c, mean=mean_c, sd=sd)+0.005, label=paste0("mu[1] - mu[2] == ", delta), parse=TRUE, color="black", size=5) +
		annotate("text", x = 150, y = 0.004, label="s == 15", parse=TRUE, color="black", size=5) +
		annotate("text", x = 60, y = dnorm(mean_c, mean=mean_c, sd=sd)+0.004, label=paste0("Cohen's d = ", d), parse=FALSE, color="black", size=5) +
		theme_void()  + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 
}

	
png("Small_cohen_d.png",  width = 700, height = 300, bg = "transparent")
print(cohens_d(mean_i + 3, 3, 0.2))
dev.off()

png("Medium_cohen_d.png",  width = 700, height = 300, bg = "transparent")
print(cohens_d(mean_i + 7.5, 7.5, 0.5))
dev.off()
	
png("Large_cohen_d.png",  width = 700, height = 300, bg = "transparent")
print(cohens_d(mean_i + 12, 12, 0.8))
dev.off()



p <-   ggplot(data = data.frame(x = c(-15, 15)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), geom = "area", fill="grey74", alpha=0.2, xlim = c(-10, 10)) +
	stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), geom = "area", fill="magenta", alpha=1, xlim = c(-15, -10)) + 
	stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), geom = "area", fill="magenta", alpha=1, xlim = c(10, 15)) + 
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), colour="black") + ylab("") +
	geom_segment(aes(x = -10, y = -0.0025, xend = -10, yend = dnorm(-10, mean=0, sd=4)), colour="black") +
	geom_segment(aes(x = 10, y = -0.0025, xend = 10, yend = dnorm(10, mean=0, sd=4)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	# annotate("text", x = -12, y = dnorm(-12, mean=0, sd=4)+0.005, label = "paste(mu[1] - mu[2], \"\")", parse = TRUE, size=7) +
	# annotate("text", x = 12, y = dnorm(12, mean=0, sd=4)+0.005, label = "paste(mu[2] - mu[1], \"\")", parse = TRUE, size=7) +
	geom_segment(aes(x = -12, y = dnorm(-12, mean=0, sd=4)+0.01, xend = -11, yend = 0.0025), arrow = arrow(length = unit(0.2, "cm"))) +
	geom_segment(aes(x = 12, y = dnorm(12, mean=0, sd=4)+0.01, xend = 11, yend = 0.0025), arrow = arrow(length = unit(0.2, "cm"))) +
	# annotate("text", x = 0, y = dnorm(12, mean=0, sd=4)+0.01, label = "paste(1- alpha, \"\")", parse = TRUE, size=7) +
	# geom_segment(aes(x = 0, y = 0, xend = 0, yend = dnorm(0, mean=0, sd=4)), colour="grey60", linewidth=1, linetype="dotted") +
	# geom_segment(aes(x = 0, y = -0.0025, xend = 0, yend = 0), colour="black") +
	# annotate('text', x = 0, y = -0.005, label = "bar(x)", parse=T, size=5) +
	annotate('text', x = -10, y = -0.005, label = "-t", parse=T, size=7) +
	annotate('text', x = 10, y = -0.005, label = "t", parse=T, size=7) +
	# geom_segment(aes(x = -10, y = 0, xend = 10, yend = 0), colour="magenta", lwd=2) +
	theme_void() + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 
	
	
png("Two-tailed_test.png", bg = "transparent")
print(p)
dev.off()

p <-   ggplot(data = data.frame(x = c(-15, 15)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), geom = "area", fill="grey54", alpha=0.2, xlim = c(-15, 10)) +
	# stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), geom = "area", fill="magenta", alpha=1, xlim = c(-15, -10)) + 
	stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), geom = "area", fill="magenta", alpha=1, xlim = c(10, 15)) + 
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), colour="black") + ylab("") +
	# geom_segment(aes(x = -10, y = -0.0025, xend = -10, yend = dnorm(-10, mean=0, sd=4)), colour="black") +
	geom_segment(aes(x = 10, y = -0.0025, xend = 10, yend = dnorm(10, mean=0, sd=4)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	# annotate("text", x = -12, y = dnorm(-12, mean=0, sd=4)+0.005, label = "paste(mu[1] - mu[2], \"\")", parse = TRUE, size=7) +
	# annotate("text", x = 12, y = dnorm(12, mean=0, sd=4)+0.005, label = "paste(mu[2] - mu[1], \"\")", parse = TRUE, size=7) +
	geom_segment(aes(x = -12, y = dnorm(-6, mean=0, sd=4)+0.01, xend = -7, yend = dnorm(-12, mean=0, sd=4)+0.01), arrow = arrow(length = unit(0.2, "cm"))) +
	geom_segment(aes(x = 12, y = dnorm(12, mean=0, sd=4)+0.01, xend = 11, yend = 0.0025), arrow = arrow(length = unit(0.2, "cm"))) +
	# annotate("text", x = 0, y = dnorm(12, mean=0, sd=4)+0.01, label = "paste(1- alpha, \"\")", parse = TRUE, size=7) +
	# geom_segment(aes(x = 0, y = 0, xend = 0, yend = dnorm(0, mean=0, sd=4)), colour="grey60", linewidth=1, linetype="dotted") +
	# geom_segment(aes(x = 0, y = -0.0025, xend = 0, yend = 0), colour="black") +
	# annotate('text', x = 0, y = -0.005, label = "bar(x)", parse=T, size=5) +
	# annotate('text', x = -10, y = -0.005, label = "-z", parse=T, size=5) +
	annotate('text', x = 10, y = -0.005, label = "t", parse=T, size=7) +
	# geom_segment(aes(x = -10, y = 0, xend = 10, yend = 0), colour="magenta", lwd=2) +
	theme_void() + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 

png("One-tailed_test_right.png", bg = "transparent")
print(p)
dev.off()


p <-   ggplot(data = data.frame(x = c(-15, 15)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), geom = "area", fill="grey54", alpha=0.2, xlim = c(-10, 15)) +
	stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), geom = "area", fill="magenta", alpha=1, xlim = c(-15, -10)) + 
	# stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), geom = "area", fill="magenta", alpha=1, xlim = c(10, 15)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 4), colour="black") + ylab("") +
	geom_segment(aes(x = -10, y = -0.0025, xend = -10, yend = dnorm(-10, mean=0, sd=4)), colour="black") +
	# geom_segment(aes(x = 10, y = -0.0025, xend = 10, yend = dnorm(10, mean=0, sd=4)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	# annotate("text", x = -12, y = dnorm(-12, mean=0, sd=4)+0.005, label = "paste(mu[1] - mu[2], \"\")", parse = TRUE, size=7) +
	# annotate("text", x = 12, y = dnorm(12, mean=0, sd=4)+0.005, label = "paste(mu[2] - mu[1], \"\")", parse = TRUE, size=7) +
	geom_segment(aes(x = 12, y = dnorm(6, mean=0, sd=4)+0.01, xend = 7, yend = dnorm(12, mean=0, sd=4)+0.01), arrow = arrow(length = unit(0.2, "cm"))) +
	geom_segment(aes(x = -12, y = dnorm(-12, mean=0, sd=4)+0.01, xend = -11, yend = 0.0025), arrow = arrow(length = unit(0.2, "cm"))) +
	# annotate("text", x = 0, y = dnorm(12, mean=0, sd=4)+0.01, label = "paste(1- alpha, \"\")", parse = TRUE, size=7) +
	# geom_segment(aes(x = 0, y = 0, xend = 0, yend = dnorm(0, mean=0, sd=4)), colour="grey60", linewidth=1, linetype="dotted") +
	# geom_segment(aes(x = 0, y = -0.0025, xend = 0, yend = 0), colour="black") +
	# annotate('text', x = 0, y = -0.005, label = "bar(x)", parse=T, size=5) +
	annotate('text', x = -10, y = -0.005, label = "-t", parse=T, size=7) +
	# annotate('text', x = 10, y = -0.005, label = "z", parse=T, size=5) +
	# geom_segment(aes(x = -10, y = 0, xend = 10, yend = 0), colour="magenta", lwd=2) +
	theme_void() + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 

png("One-tailed_test_left.png", bg = "transparent")
print(p)
dev.off()


library(patchwork)

sd <- 5
mean <- 0
start <- -15
end <- 15
shift <- 12
 
p_null <-   ggplot(data = data.frame(x = c(start, end)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), xlim = c(-8, 8)) +
	stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), geom = "area", fill="magenta4", alpha=0.6, xlim = c(start, -8)) + 
	stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), geom = "area", fill="magenta4", alpha=0.6, xlim = c(8, end)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), colour="black") + ylab("") +
	geom_segment(aes(x = -8, y = -0.0025, xend = -8, yend = dnorm(-8, mean=0, sd = sd)), colour="black") +
	geom_segment(aes(x = 8, y = -0.0025, xend = 8, yend = dnorm(8, mean=0, sd = sd)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	annotate("text", x = -12, y = dnorm(-12, mean=0, sd = sd)+0.012, label = "paste(alpha/2, \"\")", parse = TRUE, size=5) +
	annotate("text", x = 12, y = dnorm(12, mean=0, sd = sd)+0.012, label = "paste(alpha/2, \"\")", parse = TRUE, size=5) +
	geom_segment(aes(x = -12, y = dnorm(-12, mean=0, sd = sd)+0.01, xend = -11, yend = dnorm(-11, mean=0, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	geom_segment(aes(x = 12, y = dnorm(12, mean=0, sd = sd)+0.01, xend = 11, yend = dnorm(11, mean=0, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	annotate('text', x = 0, y = dnorm(0, mean=0, sd = sd)+0.0025, label = "Distribution under the null hypothesis", parse=F, size=5) +
	geom_segment(aes(x = start, y = 0, xend = end+shift, yend = 0), colour="black") + xlim(-15, 15+shift) +
	theme_void() + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 


p <-   ggplot(data = data.frame(x = c(start+shift, end+shift)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = 0 + shift, sd = sd), xlim = c(start, 8)) +
	stat_function(fun = dnorm, n = 101, args = list(mean = 0 + shift, sd = sd), geom = "area", fill="darkolivegreen4", alpha=0.6, xlim = c(8, end+shift)) + 
    stat_function(fun = dnorm, n = 101, args = list(mean = 0 + shift, sd = sd), colour="black") + ylab("") +
	geom_segment(aes(x = 8, y = -0.0025, xend = 8, yend = dnorm(8, mean=0+shift, sd = sd)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	annotate("text", x = -12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.012, label = "paste(beta, \"\")", parse = TRUE, size=5) +
	annotate("text", x = 12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.015, label = "paste(1 - beta, \"\")", parse = TRUE, size=5) +
	annotate("text", x = 12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.012, label = "paste((Potenza), \"\")", parse = TRUE, size=5) +
	geom_segment(aes(x = -12+shift, y = dnorm(-12+shift, mean=0+shift, sd = sd)+0.01, xend = -11+shift, yend = dnorm(-11+shift, mean=0+shift, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	geom_segment(aes(x = 12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.01, xend = 11+shift, yend = dnorm(11+shift, mean=0+shift, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	annotate('text', x = 0+shift, y = dnorm(0+shift, mean=0+shift, sd = sd)+0.0025, label = "Distribution under the alternative hypothesis", parse=F, size=5) +
	geom_segment(aes(x = -15, y = 0, xend = 15+shift, yend = 0), colour="black")  +
	theme_void() + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 


p1 <- p_null/p & theme(plot.background = element_rect(fill='transparent'), legend.background = element_rect(fill = 'transparent') )


png("power.png", width = 480, height = 480+480/100*20, bg = "transparent")
print(p1)
dev.off()


p_null <-   ggplot(data = data.frame(x = c(start, end)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), xlim = c(-5, 5)) +
	stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), geom = "area", fill="magenta4", alpha=0.6, xlim = c(start, -5)) + 
	stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), geom = "area", fill="magenta4", alpha=0.6, xlim = c(5, end)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), colour="black") + ylab("") +
	geom_segment(aes(x = -5, y = -0.0025, xend = -5, yend = dnorm(-5, mean=0, sd = sd)), colour="black") +
	geom_segment(aes(x = 5, y = -0.0025, xend = 5, yend = dnorm(5, mean=0, sd = sd)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	annotate("text", x = -12, y = dnorm(-12, mean=0, sd = sd)+0.012, label = "paste(alpha/2, \"\")", parse = TRUE, size=5) +
	annotate("text", x = 12, y = dnorm(12, mean=0, sd = sd)+0.012, label = "paste(alpha/2, \"\")", parse = TRUE, size=5) +
	geom_segment(aes(x = -12, y = dnorm(-12, mean=0, sd = sd)+0.01, xend = -11, yend = dnorm(-11, mean=0, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	geom_segment(aes(x = 12, y = dnorm(12, mean=0, sd = sd)+0.01, xend = 11, yend = dnorm(11, mean=0, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	annotate('text', x = 0, y = dnorm(0, mean=0, sd = sd)+0.0025, label = "Distribution under the null hypothesis", parse=F, size=5) +
	geom_segment(aes(x = start, y = 0, xend = end+shift, yend = 0), colour="black") + xlim(-15, 15+shift) +
	theme_void() + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 


p <-   ggplot(data = data.frame(x = c(start+shift, end+shift)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = 0 + shift, sd = sd), xlim = c(start, 5)) +
	stat_function(fun = dnorm, n = 101, args = list(mean = 0 + shift, sd = sd), geom = "area", fill="darkolivegreen4", alpha=0.6, xlim = c(5, end+shift)) + 
    stat_function(fun = dnorm, n = 101, args = list(mean = 0 + shift, sd = sd), colour="black") + ylab("") +
	geom_segment(aes(x = 5, y = -0.0025, xend = 5, yend = dnorm(5, mean=0+shift, sd = sd)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	annotate("text", x = -12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.012, label = "paste(beta, \"\")", parse = TRUE, size=5) +
	annotate("text", x = 12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.015, label = "paste(1 - beta, \"\")", parse = TRUE, size=5) +
	annotate("text", x = 12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.012, label = "paste((Potenza), \"\")", parse = TRUE, size=5) +
	geom_segment(aes(x = -12+shift, y = dnorm(-12+shift, mean=0+shift, sd = sd)+0.01, xend = -11+shift, yend = dnorm(-11+shift, mean=0+shift, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	geom_segment(aes(x = 12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.01, xend = 11+shift, yend = dnorm(11+shift, mean=0+shift, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	annotate('text', x = 0+shift, y = dnorm(0+shift, mean=0+shift, sd = sd)+0.0025, label = "Distribution under the alternative hypothesis", parse=F, size=5) +
	geom_segment(aes(x = -15, y = 0, xend = 15+shift, yend = 0), colour="black")  +
	theme_void()  + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 


p2 <- p_null/p & theme(plot.background = element_rect(fill='transparent'), legend.background = element_rect(fill = 'transparent') )

png("power_larger_alpha.png", width = 480, height = 480+480/100*20, bg = "transparent")
print(p2)
dev.off()


shift <- 16
 
p_null <-   ggplot(data = data.frame(x = c(start, end)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), xlim = c(-8, 8)) +
	stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), geom = "area", fill="magenta4", alpha=0.6, xlim = c(start, -8)) + 
	stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), geom = "area", fill="magenta4", alpha=0.6, xlim = c(8, end)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), colour="black") + ylab("") +
	geom_segment(aes(x = -8, y = -0.0025, xend = -8, yend = dnorm(-8, mean=0, sd = sd)), colour="black") +
	geom_segment(aes(x = 8, y = -0.0025, xend = 8, yend = dnorm(8, mean=0, sd = sd)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	annotate("text", x = -12, y = dnorm(-12, mean=0, sd = sd)+0.012, label = "paste(alpha/2, \"\")", parse = TRUE, size=5) +
	annotate("text", x = 12, y = dnorm(12, mean=0, sd = sd)+0.012, label = "paste(alpha/2, \"\")", parse = TRUE, size=5) +
	geom_segment(aes(x = -12, y = dnorm(-12, mean=0, sd = sd)+0.01, xend = -11, yend = dnorm(-11, mean=0, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	geom_segment(aes(x = 12, y = dnorm(12, mean=0, sd = sd)+0.01, xend = 11, yend = dnorm(11, mean=0, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	annotate('text', x = 0, y = dnorm(0, mean=0, sd = sd)+0.0025, label = "Distribution under the null hypothesis", parse=F, size=5) +
	geom_segment(aes(x = start, y = 0, xend = end+shift, yend = 0), colour="black") + xlim(-15, 15+shift) +
	theme_void() + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 


p <-   ggplot(data = data.frame(x = c(start+shift, end+shift)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = 0 + shift, sd = sd), xlim = c(start, 8)) +
	stat_function(fun = dnorm, n = 101, args = list(mean = 0 + shift, sd = sd), geom = "area", fill="darkolivegreen4", alpha=0.6, xlim = c(8, end+shift)) + 
    stat_function(fun = dnorm, n = 101, args = list(mean = 0 + shift, sd = sd), colour="black") + ylab("") +
	geom_segment(aes(x = 8, y = -0.0025, xend = 8, yend = dnorm(8, mean=0+shift, sd = sd)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	annotate("text", x = -12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.012, label = "paste(beta, \"\")", parse = TRUE, size=5) +
	annotate("text", x = 12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.015, label = "paste(1 - beta, \"\")", parse = TRUE, size=5) +
	annotate("text", x = 12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.012, label = "paste((Potenza), \"\")", parse = TRUE, size=5) +
	geom_segment(aes(x = -12+shift, y = dnorm(-12+shift, mean=0+shift, sd = sd)+0.01, xend = -11+shift, yend = dnorm(-11+shift, mean=0+shift, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	geom_segment(aes(x = 12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.01, xend = 11+shift, yend = dnorm(11+shift, mean=0+shift, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	annotate('text', x = 0+shift, y = dnorm(0+shift, mean=0+shift, sd = sd)+0.0025, label = "Distribution under the alternative hypothesis", parse=F, size=5) +
	geom_segment(aes(x = -15, y = 0, xend = 15+shift, yend = 0), colour="black")  +
	theme_void()  + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 


p3 <- p_null/p & theme(plot.background = element_rect(fill='transparent'), legend.background = element_rect(fill = 'transparent') )


png("power_larger_effect.png", width = 480, height = 480+480/100*20, bg = "transparent")
print(p3)
dev.off()


sd <- 3
shift <- 12
 
p_null <-   ggplot(data = data.frame(x = c(start, end)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), xlim = c(-8, 8)) +
	stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), geom = "area", fill="magenta4", alpha=0.6, xlim = c(start, -8)) + 
	stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), geom = "area", fill="magenta4", alpha=0.6, xlim = c(8, end)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = mean, sd = sd), colour="black") + ylab("") +
	geom_segment(aes(x = -8, y = -0.0025, xend = -8, yend = dnorm(-8, mean=0, sd = sd)), colour="black") +
	geom_segment(aes(x = 8, y = -0.0025, xend = 8, yend = dnorm(8, mean=0, sd = sd)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	annotate("text", x = -12, y = dnorm(-12, mean=0, sd = sd)+0.012, label = "paste(alpha/2, \"\")", parse = TRUE, size=5) +
	annotate("text", x = 12, y = dnorm(12, mean=0, sd = sd)+0.012, label = "paste(alpha/2, \"\")", parse = TRUE, size=5) +
	geom_segment(aes(x = -12, y = dnorm(-12, mean=0, sd = sd)+0.01, xend = -11, yend = dnorm(-11, mean=0, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	geom_segment(aes(x = 12, y = dnorm(12, mean=0, sd = sd)+0.01, xend = 11, yend = dnorm(11, mean=0, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	annotate('text', x = 0, y = dnorm(0, mean=0, sd = sd)+0.0025, label = "Distribution under the null hypothesis", parse=F, size=5) +
	geom_segment(aes(x = start, y = 0, xend = end+shift, yend = 0), colour="black") + xlim(-15, 15+shift) +
	theme_void() + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 


p <-   ggplot(data = data.frame(x = c(start+shift, end+shift)), aes(x)) +
    stat_function(fun = dnorm, n = 101, args = list(mean = 0 + shift, sd = sd), xlim = c(start, 8)) +
	stat_function(fun = dnorm, n = 101, args = list(mean = 0 + shift, sd = sd), geom = "area", fill="darkolivegreen4", alpha=0.6, xlim = c(8, end+shift)) + 
    stat_function(fun = dnorm, n = 101, args = list(mean = 0 + shift, sd = sd), colour="black") + ylab("") +
	geom_segment(aes(x = 8, y = -0.0025, xend = 8, yend = dnorm(8, mean=0+shift, sd = sd)), colour="black") +
    scale_y_continuous(breaks = NULL) +
	annotate("text", x = -12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.012, label = "paste(beta, \"\")", parse = TRUE, size=5) +
	annotate("text", x = 12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.02, label = "paste(1 - beta, \"\")", parse = TRUE, size=5) +
	annotate("text", x = 12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.012, label = "paste((Potenza), \"\")", parse = TRUE, size=5) +
	geom_segment(aes(x = -12+shift, y = dnorm(-12+shift, mean=0+shift, sd = sd)+0.01, xend = -11+shift, yend = dnorm(-11+shift, mean=0+shift, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	geom_segment(aes(x = 12+shift, y = dnorm(12+shift, mean=0+shift, sd = sd)+0.01, xend = 11+shift, yend = dnorm(11+shift, mean=0+shift, sd = sd)), arrow = arrow(length = unit(0.2, "cm"))) +
	annotate('text', x = 0+shift, y = dnorm(0+shift, mean=0+shift, sd = sd)+0.0025, label = "Distribution under the alternative hypothesis", parse=F, size=5) +
	geom_segment(aes(x = -15, y = 0, xend = 15+shift, yend = 0), colour="black")  +
	theme_void() + theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_)) 


p4 <- p_null/p  & theme(plot.background = element_rect(fill='transparent'), legend.background = element_rect(fill = 'transparent') )


png("power_smaller_sigma.png", width = 480, height = 480+480/100*20, bg = "transparent")
print(p4)
dev.off()

