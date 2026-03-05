clean()
set.seed(42)

library(ggplot2)


font.size <- 22
graphic.settings <- theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3)) +  theme(legend.title = element_blank()) + theme(plot.subtitle=element_text(size=font.size/4*3), plot.title=element_text(size=font.size))

setwd("/Users/visconti/Documents/Teaching/short_intro_stats/img/data")

# Variability

head_circ <- c(43, rep(44,3), rep(45, 4), rep(46, 5), rep(47,3), rep(48,2))
head_circ <- data.frame(p=1:length(head_circ), hc=head_circ)

p <- ggplot(head_circ, aes(x=hc)) + geom_histogram(bins=10, fill="darkgreen", binwidth=1, color="black", alpha=0.4) + graphic.settings + xlab("Head circumference (cm)") + ylab("Frequency") + scale_x_continuous(breaks=min(head_circ$hc):max(head_circ$hc))


png("head_circiference_doll.png", width=480, height=250)
print(p)
dev.off()


head_circ <- c(41, rep(42, 2), rep(43,3), rep(44,3), rep(45, 5), rep(46, 6), rep(47,4), rep(48,4), rep(49,3), rep(50,2), 51, 52)
head_circ <- data.frame(p=1:length(head_circ), hc=head_circ)

p <- ggplot(head_circ, aes(x=hc)) + geom_histogram(bins=10, fill="darkgreen", binwidth=1, color="black", alpha=0.4) + graphic.settings + xlab("Head circumference (cm)") + ylab("Frequency") + scale_x_continuous(breaks=min(head_circ$hc):max(head_circ$hc))

png("head_circiference_children.png", width=480, height=250)
print(p)
dev.off()

head_circ_2 <- c(33, rep(34, 2), rep(35, 3), rep(36, 5), rep(37, 7), rep(38, 6), rep(39, 4), rep(40, 3), rep(41, 2), 42, 43)+6
head_circ <- rbind(data.frame(head_circ, study="A"), data.frame(p=1:length(head_circ_2), hc=head_circ_2, study="B"))

p <- ggplot(head_circ, aes(x=hc, fill=study)) + geom_histogram(binwidth=1, color="black", alpha=0.4, position = 'identity') + scale_fill_manual("Study", values=c("darkgreen", "magenta")) + graphic.settings + xlab("Head circumference (cm)") + ylab("Frequency") + scale_x_continuous(breaks=min(head_circ$hc):max(head_circ$hc)) + theme(legend.position="none")

png("head_circiference_children_groups.png", width=480, height=250)
print(p)
dev.off()