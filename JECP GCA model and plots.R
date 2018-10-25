# install and load required packages #
install.packages("lme4")
install.packages("ggplot2")

library(ggplot2)
library(lme4)

# GCA task-evoked 'effort' model #
m.TELinear <- lmer(PupilSize ~ (ot1) * Condition + (ot1|Subject:Condition) + 
                       (ot1|Subject), data=ChildStudyGCA, 
                     control=lmerControl(optimizer="bobyqa"), REML=FALSE)
coefs.full <- as.data.frame(coef(summary(m.TELinear)))
coefs.full$p <- format.pval(2*(1-pnorm(abs(coefs.full[,"t value"]))))


# Plot GCA model fit to the data #
data.comp <- data.frame(ChildStudyGCA, GCA_Full=fitted(m.TELinear))
ChildEffortPlot <- ggplot(data.comp, aes(x=Second, y=PupilSize, colour=Condition))
ChildEffortPlot + stat_summary(fun.y=mean, geom="line", linetype="dotted", size=1) + 
  stat_summary(fun.data=mean_se, geom="pointrange", size=0.8) + stat_summary(aes(y=GCA_Full, colour=Condition), 
  fun.y=mean, geom="line", size=0.8) + theme_bw(base_size = 18) + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) + 
  theme(plot.title = element_text(face="bold", vjust=3, hjust = 0.5)) + ggtitle("Effort: Linear model fit") + ylab("Normalised pupil size") + 
  xlab("Time relative to speech onset (in ms)") + scale_x_continuous(breaks=c(0, 5, 10, 15, 20, 25), labels=c(0, 500, 1000, 1500, 2000, 2500)) + 
  theme(axis.line.x = element_line(color="black", size = 0.5), axis.line.y = element_line(color="black", size = 0.5))

ggsave(filename ="Child Study Pupil effort Plot.png", height=9, width=11, dpi=600,units= "in")