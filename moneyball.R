# Loading required packages 
library("ggplot2")

# Loading data
teamstats <- read.csv("baseball.csv")
str(teamstats)

# Creating the scatterplot
teamstats_96_01 <- subset(teamstats, Year < 2002 & Year >= 1996)
scatter_plot = ggplot(data=teamstats_96_01, aes(x=W, y=Team)) + scale_color_manual(values = c("grey", "blue")) + geom_point(aes(color = factor(Playoffs)), pch = 15, size = 2.0)
scatter_plot

# Regression model 1
teamstats$RD <- teamstats$RS - teamstats$RA
W_reg <- lm(W~RD, data=teamstats)
summary(W_reg)


# Regression model 2
RS_reg1 <- lm(RS~OBP+SLG+BA, data=teamstats)
summary(RS_reg1)

# Regression model 3
RS_reg2 <- lm(RS~OBP+SLG, data=teamstats)
summary(RS_reg2)

# Regression model 4
RA_reg <- lm(RA~OOBP+OSLG, data=teamstats)
summary(RA_reg)
