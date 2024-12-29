clean()
set.seed(42)

library(ggplot2)
library(tidyverse)
library(dplyr)
library(waffle)
library(ggbeeswarm)
library(gghalves)
library(ggrepel)

font.size <- 22
graphic.settings <- theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3)) +  theme(legend.title = element_blank()) + theme(plot.subtitle=element_text(size=font.size/4*3), plot.title=element_text(size=font.size))


setwd("/Users/visconti/Documents/Teaching/biostat_101/slide/img/visualization")
md <- read.csv("/Users/visconti/Documents/Research/2021/random/PRIMM/doc/sdata/PRIMM_glycomics_anonymised_raw_data.csv")


## Qualitative variables

# Absolute frequency

tmp <- table(md$metastatic_stage)
tmp <- as.data.frame(cbind(names(tmp), tmp))
colnames(tmp) <- c("stage", "value")
tmp$value <- as.numeric(tmp$value)

g <- ggplot(tmp, aes(x=stage, y=value)) + geom_bar(stat = "identity", width=0.8, fill="gray74", colour="black") + theme(legend.position="none") + graphic.settings + xlab("Metastatic stage") + ylab("Counts")

png("MStage_barplot_vertical.png")
print(g)
dev.off()

g <- ggplot(tmp, aes(y=stage, x=value)) + geom_bar(stat = "identity", width=0.8, fill="gray74", colour="black") + theme(legend.position="none") + graphic.settings + ylab("Metastatic stage") + xlab("Counts")

png("MStage_barplot_horizontal.png")
print(g)
dev.off()


g <- ggplot(tmp, aes(x=value, y=stage)) + geom_segment( aes(x=1, xend=value, y=stage, yend=stage), color="black", linewidth=1) + geom_point( color="darkmagenta", size=6) + theme(legend.position="none") + graphic.settings + ylab("Metastatic stage") + xlab("Counts")


png("MStage_lollipop_horizontal.png")
print(g)
dev.off()


#Relative frequency
tmp <- table(md$metastatic_stage)
tmp <- as.data.frame(cbind(names(tmp), tmp))
colnames(tmp) <- c("stage", "value")
tmp$value <- as.numeric(tmp$value)

tmp <- tmp %>%
  arrange(desc(stage)) %>%
  mutate(prop = value / sum(tmp$value) *100) %>%
  mutate(ypos = cumsum(prop)- 0.5*prop )

# g <- ggplot(tmp, aes(y=stage, x=prop)) + geom_bar(stat = "identity", width=0.8, fill="gray74", colour="black") + theme(legend.position="none") + graphic.settings + ylab("Metastatic stage") + xlab("Proportion (%)")
#
# png("MStage_barplot_horizontal_relative.png")
# print(g)
# dev.off()


g <- ggplot(tmp, aes(x="", y=prop, fill=stage)) + geom_bar(stat="identity", width=0.9, color="white") + coord_polar("y", start=0) +  theme_void() + geom_text(aes(y = ypos, label = stage), color = "black", size=6) + scale_fill_brewer(palette="Set2") + theme(legend.position="none") 

png("MStage_piechart.png")
print(g)
dev.off()

 
tmp <- table(md$metastatic_stage)
tmp <- as.data.frame(cbind(names(tmp), tmp))
colnames(tmp) <- c("stage", "value")
tmp$value <- as.numeric(tmp$value)

tmp$fraction = tmp$value / sum(tmp$value)
tmp$ymax = cumsum(tmp$fraction)
tmp$ymin = c(0, head(tmp$ymax, n=-1))
tmp$labelPosition <- (tmp$ymax + tmp$ymin) / 2
tmp$label <- paste0(tmp$stage, "\n (", round(tmp$fraction*100, 1), "%)")


g <- ggplot(tmp, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=stage)) + geom_rect() + coord_polar(theta="y") + xlim(c(2, 4)) +  theme_void() + geom_label( x=3.5, aes(y=labelPosition, label=label), size=6) + scale_fill_brewer(palette="Set2") + theme(legend.position="none") 


png("MStage_Donut.png")
print(g)
dev.off()

tmp <- table(md$metastatic_stage)
tmp <- as.data.frame(cbind(names(tmp), tmp))
colnames(tmp) <- c("stage", "value")
tmp$value <- as.numeric(tmp$value)

tmp$proportion <- round(tmp$value / sum(tmp$value) *100, 0)
tmp$proportion[which(tmp$stage == "M1c")] <- tmp$proportion[which(tmp$stage == "M1c")]  + 1

g <- waffle(tmp[, c("stage", "proportion")], rows = 10, colors = c("#66C2A5", "#FC8D62", "#8DA0CB", "#E78AC3", "#A6D854"), legend_pos = "bottom")

png("MStage_waffle.png")
print(g)
dev.off()

stop()

tmp <- table(md$metastatic_stage, md$sex)
colnames(tmp) <- c("Females", "Males")


png("mosaic_plot.png")
print(mosaicplot(tmp, color = c("darkmagenta", "darkgreen"), xlab ="Metastatic stage", ylab = "Sex", main=""))
dev.off()



tmp <- table(md$ICI_therapy)
tmp <- as.data.frame(cbind(names(tmp), tmp))
colnames(tmp) <- c("ICI_therapy", "value")
tmp$value <- as.numeric(tmp$value)

tmp$ICI_therapy = factor(tmp$ICI_therapy, levels=unique(tmp$ICI_therapy[order(tmp$value)]))

g <- ggplot(tmp, aes(y=ICI_therapy, x=value)) + geom_bar(stat = "identity", width=0.8, fill="gray74", colour="black") + theme(legend.position="none") + graphic.settings + ylab("ICI Therapy") + xlab("Counts")

png("ICI_therapy_barplot_horizotal.png")
print(g)
dev.off()

## Quantitative variables


p <- ggplot(md, aes(x=age)) + geom_histogram(fill="gray74", binwidth=1, color="black") + graphic.settings + xlab("Age (years)") + ylab("Counts") + ggtitle("Bin size = 1")

png("Age_histogram_bin1.png")
print(p)
dev.off()

p <- ggplot(md, aes(x=age)) + geom_histogram(fill="gray74", binwidth=5, color="black") + graphic.settings + xlab("Age (years)") + ylab("Counts") + ggtitle("Bin size = 5")

png("Age_histogram_bin5.png")
print(p)
dev.off()


md$ORR[md$ORR == 1] <- "Yes"
md$ORR[md$ORR == 0] <- "No"
md$ORR <- as.factor(md$ORR)

p <- ggplot(md, aes(x=age, fill=ORR)) + geom_histogram(binwidth=5, color="black", alpha=0.6, position = 'identity') + scale_fill_manual("Response", values=c("#FC8D62", "#66C2A5")) + theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3)) + theme(plot.subtitle=element_text(size=font.size/4*3), plot.title=element_text(size=font.size)) + xlab("Age (years)") + ylab("Counts") + ggtitle("Bin size = 5") + theme(legend.position="bottom")

png("Age_histogram_bin5_response.png")
print(p)
dev.off()


data <- data.frame(var1=md$age[md$ORR == "Yes"], var2=c(rep(NA, 10), md$age[md$ORR == "No"]))

p <- ggplot(data, aes(x=x) ) +
  geom_histogram( aes(x = var1, y=..count..), binwidth=5, color="black", fill="#66C2A5" ) +
  geom_label( aes(x=100, y=2.5, label="Response: Yes"), color="#66C2A5") +
  geom_histogram( aes(x = var2, y=-..count..), binwidth=5, color="black", fill= "#FC8D62") +
  geom_label( aes(x=100, y=-2.5, label="Response: No"), color="#FC8D62")  +
  ylim(-11, 11) + xlim(20, 110) + graphic.settings + xlab("Age (years)") + ylab("Counts") + ggtitle("Bin size = 5") + theme(legend.position="bottom") 
  
png("Age_histogram_bin5_response_mirror.png")
print(p)
dev.off()
  
  
p <- ggplot(md, aes(x=age)) + geom_histogram(aes(y=..density.., fill=ORR), position = "identity", binwidth=5, color="black", alpha=0.2) + scale_fill_manual("Response", values=c("#FC8D62", "#66C2A5")) + scale_color_manual("Response", values=c("#FC8D62", "#66C2A5")) + theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3)) + theme(plot.subtitle=element_text(size=font.size/4*3), plot.title=element_text(size=font.size)) + xlab("Age (years)") + ylab("Density") + ggtitle("Bin size = 5") + theme(legend.position="bottom") + geom_density(aes(colour=ORR), adjust = 0.6, bw=5, lwd=2)

   
png("Age_histogram_bin5_response_density.png")
print(p)
dev.off()


glycans <- read.csv("/Users/visconti/Documents/Research/2017/random/mfalchi/glycans/data/original_data/Data_release_IgA_TwinsUK_20171222.csv")
glycans$Gender <- ifelse(glycans$Gender == "F", "Female", "Male")

p <- ggplot(glycans, aes(x=Age)) + geom_histogram(aes(y=..density.., fill=Gender), position = "identity", binwidth=5, color="black", alpha=0.2) + scale_fill_manual("Sex", values=c("magenta", "darkgreen")) + scale_color_manual("Sex", values=c("magenta", "darkgreen")) + theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3)) + theme(plot.subtitle=element_text(size=font.size/4*3), plot.title=element_text(size=font.size)) + xlab("Age (years)") + ylab("Density") + ggtitle("Bin size = 5") + theme(legend.position="bottom") + geom_density(aes(colour=Gender), adjust = 0.6, bw=5, lwd=2)

png("Age_histogram_bin5_glycan_age_sex.png")
print(p)
dev.off()


p <- ggplot(md, aes(x=ORR, y=age)) + geom_boxplot(fill="grey84", size=0.8) + graphic.settings + xlab("Response") + ylab("Age (years)") 


png("Boxplot_age_ORR_simple.png")
print(p)
dev.off()

# p <- ggplot(md, aes(x=ORR, y=age)) + geom_boxplot(fill="grey84", outlier.shape = NA, size=0.8) + graphic.settings + xlab("Response") + ylab("Age (years)")  +  geom_beeswarm(size=2, shape=16, colour="grey24", groupOnX=TRUE)
#
#
# png("Boxplot_age_ORR_dots.png")
# print(p)
# dev.off()



p <- ggplot(md, aes(x = ORR, y = age)) +
  geom_half_boxplot(fill="grey84", outlier.shape = NA, size=0.8, nudge = 0.05) + 
  geom_half_dotplot(colour="grey24", method="histodot", dotsize=0.5) +
  geom_half_violin(fill="grey84", side = "r", alpha=0.5, nudge = 0.01) + graphic.settings + xlab("Response") + ylab("Age (years)")
  
png("Boxplot_age_ORR_violin.png")
print(p)
dev.off()  
  
 