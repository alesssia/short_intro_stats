clean()
set.seed(42)

library(ggplot2)

font.size <- 22
graphic.settings <- theme_bw(base_size = font.size) + theme(axis.ticks = element_line(size = 0.3)) +  theme(legend.title = element_blank()) + theme(plot.subtitle=element_text(size=font.size/4*3), plot.title=element_text(size=font.size))


setwd("/Users/visconti/Documents/Teaching/short_intro_stats/img/sampling")

# Draws an ellipse given the half-lengths of the axes, the angle of orientation, and the centre
# Slightly modified from: https://ms.mcmaster.ca/peter/s4c03/s4c03_0506/classnotes/DrawingEllipsesinR.pdf

ellipseFun <- function (hlaxa = 1, hlaxb = 1, theta = 0, xc = 0, yc = 0, npoints = 100)
{
	a <- seq(0, 2 * pi, length = npoints + 1)
	x <- hlaxa * cos(a)
	y <- hlaxb * sin(a)
	alpha <- angle(x, y)
	rad <- sqrt(x^2 + y^2)
	xp <- rad * cos(alpha + theta) + xc
	yp <- rad * sin(alpha + theta) + yc
	data.frame(x=xp, y=yp)
}

# Same source, could be semplified
angle <- function (x, y)
{
	angle2 <- function(xy) 
	{
		x <- xy[1]
		y <- xy[2]
		if (x > 0) 
		{
			atan(y/x)
		} else {
			if (x < 0 & y != 0) 
			{
				atan(y/x) + sign(y) * pi
			}
			else 
			{
				if (x < 0 & y == 0) 
				{
					pi
				}
				else 
				{
					if (y != 0) 
					{
						(sign(y) * pi)/2
					}
					else 
					{
						NA
					}
				}
			}
		}
	}
	apply(cbind(x, y), 1, angle2)
}


p <- ggplot() + 
		geom_polygon(data=ellipseFun(hlaxa = 7, hlaxb = 2, theta = 0, xc = 3, yc = -1, npoints = 1000), aes(x,y), fill="magenta", colour="black", alpha=0.6) +
		geom_polygon(data=ellipseFun(hlaxa = 8, hlaxb = 4.1, theta = 0, xc = 0, yc = 0, npoints = 1000), aes(x,y), fill="springgreen4", colour="black", alpha=0.6) +
		geom_polygon(data=ellipseFun(hlaxa = 1, hlaxb = 0.7, theta = 10, xc = 0, yc = -1, npoints = 1000), aes(x,y), fill="white", colour="black", alpha=0.6) 	
		
p <- p + 		
		annotate("text", x = 8, y=4, label = "Population", parse = FALSE, size=7) +
		annotate("text", x = 9, y=-3.3, label = "Sampling", parse = FALSE, size=7) +
		annotate("text", x = 9, y=-3.75, label = "Frame", parse = FALSE, size=7) +
		annotate("text", x = 9.4, y=1, label = "Ineligible", parse = FALSE, size=7) +
 		annotate("text", x = 3.3, y=-0.1, label = "Nonresponse", parse = FALSE, size=7) +
		
		geom_segment(aes(x = 7.5, y = 3.7, xend = 5.5, yend = 3), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
		geom_segment(aes(x = 9, y = -3.2, xend = 9, yend = -2.1), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
		geom_segment(aes(x = 10, y = 0.7, xend = 9, yend = -1), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") +
		geom_segment(aes(x = 2, y = -0.3, xend = 0, yend = -1), arrow = arrow(length = unit(0.5, "cm"), ends="last"), colour="black") 
				
p <- p + theme_void() + theme(legend.position="none", legend.title = element_blank()) +
	theme(legend.position="none", legend.title = element_blank()) +
	theme(panel.background = element_rect(fill = "transparent", colour = NA_character_), plot.background = element_rect(fill = "transparent", colour = NA_character_))


png("sampling_schema.png", width=760, height=400, bg = "transparent")
print(p)
dev.off()
			