clean()
set.seed(42)

library(ggplot2)
library(gridExtra)

font.size <- 22
graphic.settings <- theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3)) +  theme(legend.title = element_blank()) + theme(plot.subtitle=element_text(size=font.size/4*3), plot.title=element_text(size=font.size))


### Sexual partner in Britain  
sample_n <- function(n, prob=prob){ sample(BMIrange, n, prob=prob, replace=TRUE) } # sample n with replacement from data

setwd("/Users/visconti/Documents/Teaching/short_intro_stats/img/confidence_intervals/")
load("HBSC_BMI.RData")


hbsc14 <- hbsc14[!is.na(hbsc14$m4_anno_nascita), ]
hbsc14$age <- 2014 - hbsc14$m4_anno_nascita

hbsc14 <- hbsc14[hbsc14$age == 11 & hbsc14$m1_genere==2, ]
hbsc14 <- na.omit(hbsc14[, c("id", "BMI")])

#Create a very rough probability of finishing in each BMI bin (size=1)
BMIrange <- unique(floor(hbsc14$BMI))
BMIrange <- BMIrange[order(BMIrange)]
prob <- as.numeric(table(floor(hbsc14$BMI)))/length(hbsc14$BMI)

create.plot <- function(v, title, print.sample.mean=FALSE, max.y=60)
{
	p <- ggplot(as.data.frame(v), aes(x = v)) + geom_histogram(aes(y = ..count..), binwidth = 1, colour= "black", fill = "#66C2A5") + geom_density(aes(y=..count..), fill="#66C2A5", alpha = .6) + geom_vline(xintercept=mean(hbsc14$BMI), colour="magenta", linewidth=1.5, linetype="dashed") + theme(legend.position="none") + xlim(min(BMIrange)-1, max(BMIrange)+1) + ylim(0, max.y)
	p <- p + graphic.settings  
	
	if (print.sample.mean) {
		p <- p + geom_vline(xintercept=mean(v), colour="darkgreen", linewidth=1.5, linetype="dotted")
		p <- p + xlab("") + ylab("")
	} else {
		p <- p + xlab("BMI") + ylab("Counts") + ggtitle(title, subtitle=paste0("n =", length(v), ", HBSC data 2014")) 
	}
	
	p
}



png("Females_11yo_complete_dataset.png", width = 480*1.5, height = 480)
print(create.plot(hbsc14$BMI, "Females, 11 years old"))
dev.off() 


myplots <- vector("list", length = 6)
myplots[[1]] <- create.plot(hbsc14$BMI, "Females, 11 years old", print.sample.mean=TRUE)

set.seed(351246)
for (i in 2:6)
	myplots[[i]] <- create.plot(sample_n(10, prob), "n = 10", print.sample.mean=TRUE, max.y=4)

png("Females_11yo_N10.png", width = 480*2, height = 480)
print(do.call("grid.arrange", c(myplots, ncol=3)))
dev.off()


set.seed(42)
for (i in 2:6)
	myplots[[i]] <- create.plot(sample_n(50, prob), "n = 50", print.sample.mean=TRUE, max.y=11)

png("Females_11yo_N50.png", width = 480*2, height = 480)
print(do.call("grid.arrange", c(myplots, ncol=3)))
dev.off()

set.seed(42)
for (i in 2:6)
	myplots[[i]] <- create.plot(sample_n(100, prob), "n = 100", print.sample.mean=TRUE, max.y=21)


png("Females_11yo_N100.png", width = 480*2, height = 480)
print(do.call("grid.arrange", c(myplots, ncol=3)))
dev.off()

set.seed(42)
for (i in 2:6)
	myplots[[i]] <- create.plot(sample_n(200, prob), "n = 200", print.sample.mean=TRUE, max.y=110)

png("Females_11yo_N200.png", width = 480*2, height = 480)
print(do.call("grid.arrange", c(myplots, ncol=3)))
dev.off()


set.seed(42)
for (i in 2:6)
	myplots[[i]] <- create.plot(sample_n(300, prob), "n = 300", print.sample.mean=TRUE, max.y=110)

png("Females_11yo_N300.png", width = 480*2, height = 480)
print(do.call("grid.arrange", c(myplots, ncol=3)))
dev.off()


myboost <- function(n, n_boost) sapply(1:n_boost, function(i) mean(sample_n(n, prob)))

plot.boostrap <- function(v, title, max.y=630, interval=NULL)
{
	p <- ggplot(as.data.frame(v), aes(x = v)) + geom_histogram(aes(y = ..count..), binwidth = 1, colour= "black", fill = "#66C2A5")  + theme(legend.position="none") + xlim(min.x, max.x) + ylim(0, max.y)
	p <- p + graphic.settings + xlab("") + ylab("") + ggtitle(title) 
	
	if (is.null(interval))
	{
		p <- p + geom_vline(xintercept=mean(hbsc14), colour="magenta", linewidth=0.5, linetype="dashed")
	} else {
		p <- p + geom_vline(xintercept=interval[1], colour="darkmagenta", linewidth=0.5, linetype="dashed") + geom_vline(xintercept=interval[2], colour="darkmagenta", linewidth=0.5, linetype="dashed") 
	}
	
	p
}

set.seed(42)
boost_10  <- myboost(10 , 1000)
boost_50  <- myboost(50 , 1000)
boost_100 <- myboost(100, 1000)
boost_200 <- myboost(200, 1000)
boost_300 <- myboost(300, 1000)
boost_all <- myboost(length(hbsc14$BMI), 1000)

min.x <- min(c(boost_10, boost_50, boost_100, boost_200, boost_300, boost_all)) - 1 
max.x <- max(c(boost_10, boost_50, boost_100, boost_200, boost_300, boost_all)) + 1


png("bootstrapping.png", width = 480*2, height = 480)
print(grid.arrange(plot.boostrap(boost_10, "n = 10", max.y=1000),
			 plot.boostrap(boost_50, "n = 50", max.y=1000),
			 plot.boostrap(boost_100, "n = 100", max.y=1000),
			 plot.boostrap(boost_200, "n = 200", max.y=1000),
			 plot.boostrap(boost_300, "n = 300", max.y=1000),
			 plot.boostrap(boost_all, paste("n =", length(hbsc14$BMI)), max.y=1000), ncol=3))
dev.off()


get.rough.CI <- function(v)
{
    c(round(mean(v), 1), round(quantile(v, 0.025), 1), round(quantile(v,0.975), 1))
}


get.rough.CI(boost_10)
get.rough.CI(boost_50)
get.rough.CI(boost_100)
get.rough.CI(boost_200)
get.rough.CI(boost_300)
get.rough.CI(boost_all)


png("bootstrapping_fence.png", width = 480*2, height = 480)
print(grid.arrange(plot.boostrap(boost_10, "n = 10", max.y=1000, interval=get.rough.CI(boost_10)[-1]),
			 plot.boostrap(boost_50, "n = 50",   max.y=1000, interval=get.rough.CI(boost_50)[-1]),
			 plot.boostrap(boost_100, "n = 100", max.y=1000, interval=get.rough.CI(boost_100)[-1]),
			 plot.boostrap(boost_200, "n = 200", max.y=1000, interval=get.rough.CI(boost_200)[-1]),
			 plot.boostrap(boost_300, "n = 300", max.y=1000, interval=get.rough.CI(boost_300)[-1]),
			 plot.boostrap(boost_all, paste("n =", length(hbsc14$BMI)), max.y=1000, interval=get.rough.CI(boost_all)[-1]), ncol=3))
dev.off()


plot.boostrap.CI <- function(v, title, max.y=1000, interval=NULL)
{
	p <- ggplot(as.data.frame(v), aes(x = v)) + geom_histogram(aes(y = ..count..), binwidth = 1, colour= "black", fill = "#66C2A5", alpha=0.1)  + theme(legend.position="none") + xlim(min.x, max.x) + ylim(0, max.y)
	p <- p + graphic.settings + xlab("") + ylab("") + ggtitle(title) 
	p <- p + geom_vline(xintercept=mean(hbsc14), colour="magenta", linewidth=0.5, linetype="dashed")
	p <- p + geom_vline(xintercept=interval[1], colour="darkmagenta", linewidth=0.5, linetype="dashed") + geom_vline(xintercept=interval[2], colour="darkmagenta", linewidth=0.5, linetype="dashed") 
	p <- p + geom_segment(aes(x = interval[1], y = 100, xend = interval[2], yend = 100), colour="magenta", lwd=1.5) + geom_segment(aes(x = interval[1], y = 50, xend = interval[1], yend = 150), colour="magenta", lwd=1.5) + geom_segment(aes(x = interval[2], y = 50, xend = interval[2], yend = 150), colour="magenta", lwd=1.5)
	
	p
}


png("bootstrapping_CI.png", width = 480*2, height = 480)
print(grid.arrange(plot.boostrap.CI(boost_10, "n = 10", interval=get.rough.CI(boost_10)[-1]),
			 plot.boostrap.CI(boost_50, "n = 50",  interval=get.rough.CI(boost_50)[-1]),
			 plot.boostrap.CI(boost_100, "n = 100", interval=get.rough.CI(boost_100)[-1]),
			 plot.boostrap.CI(boost_200, "n = 200", interval=get.rough.CI(boost_200)[-1]),
			 plot.boostrap.CI(boost_300, "n = 300",  interval=get.rough.CI(boost_300)[-1]),
			 plot.boostrap.CI(boost_all, paste("n =", length(hbsc14$BMI)),  interval=get.rough.CI(boost_all)[-1]), ncol=3))
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
	annotate("text", x = 0, y = -0.0165, label = "Confidence Interval", parse = FALSE, size=6) + theme_void()

png("ME_and_CI.png")
print(p)
dev.off()


