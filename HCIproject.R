getwd()
setwd("/Users/ada1024/Downloads")


#structure complexity 
df <- read.csv("ParticipantTrackerSheet5.csv")
colnames(df) <- c("Participant", "Session1","Session2","Session3")
head(df)
dim(df)
attach(df)
#a
session_color <- c("skyblue","red","yellow")

# Transpose the data for plotting
df_transposed <- as.data.frame(t(df[, -1]))
colnames(df_transposed) <- df$Participant

# Create a bar plot with sessions on the x-axis and the same color for all sessions
barplot(as.matrix(df_transposed), beside = TRUE, col = rep(session_color, ncol(df_transposed)),
        names.arg = colnames(df_transposed), main = "Session Scores for Each Participant",
        xlab = "Session", ylab = "Score", border = "black", ylim = c(0, 300))


install.packages("reshape2")
library(reshape2)
#df_melted <- melt(df[1:11,], id.vars = "Participant")
df_melted <- melt(df, id.vars = "Participant")

#sepearate boxplot
df_melted1 <- melt(df[1:11,], id.vars = "Participant")
par(mfrow = c(1, 2))

boxplot(value ~ variable, data = df_melted1, col = c("skyblue"),
        main = "Boxplot of Participant Scores Across Sessions",
        xlab = "Group 1", ylab = "Score")


df_melted2 <- melt(df[12:22,], id.vars = "Participant")
boxplot(value ~ variable, data = df_melted2, col = "pink",
        main = "Boxplot of Participant Scores Across Sessions",
        xlab = "Group 2", ylab = "Score")


library(ggplot2)

# create a data frame
df_melted$group <- c(rep("Lego", 11), rep("AI", 22 - 11))
ggp <- ggplot(df_melted, aes(x=variable, y=value, fill=group)) + 
  geom_boxplot()


# conducting non parametric test 
df_melted1_s1 <- df_melted1[df_melted1$variable == "Session1",]
df_melted2_s1 <- df_melted2[df_melted2$variable == "Session1",]
mean(df_melted1_s1[,"value"])
mean(df_melted2_s1[,"value"])
wilcox.test(df_melted1_s1[,"value"],df_melted2_s1[,"value"])

df_melted1_s2 <- df_melted1[df_melted1$variable == "Session2",]
df_melted2_s2 <- df_melted2[df_melted2$variable == "Session2",]
mean(df_melted1_s2[,"value"])
mean(df_melted2_s2[,"value"])
wilcox.test(df_melted1_s2[,"value"],df_melted2_s2[,"value"])


df_melted1_s3 <- df_melted1[df_melted1$variable == "Session3",]
df_melted2_s3 <- df_melted2[df_melted2$variable == "Session3",]
mean(df_melted1_s3[,"value"])
mean(df_melted2_s3[,"value"])
wilcox.test(df_melted1_s3[,"value"],df_melted2_s3[,"value"])

# comparing the regression model
######Group 1
g1_s1 <- mean(df_melted1_s1$value)
g1_s2 <- mean(df_melted1_s2$value)
g1_s3 <- mean(df_melted1_s3$value)

x <- c("Session1","Session2","Session3")
x <- c(1,2,3)
y <- c(g1_s1,g1_s2,g1_s3)
model1 <- lm(y~x)

#####Group 2 
g2_s1 <- mean(df_melted2_s1$value)
g2_s2 <- mean(df_melted2_s2$value)
g2_s3 <- mean(df_melted2_s3$value)

y2 <- c(g2_s1,g2_s2,g2_s3)
model2 <- lm(y2 ~ x)

summary(model1)
summary(model2)

# Add the regression line

ggp <- ggp + geom_abline(intercept = coef(model1)[1], slope = coef(model1)[2], color="blue",  
                         linetype="dashed", size=1.5)
ggp + geom_abline(intercept = coef(model2)[1], slope = coef(model2)[2], color="red",  
                  linetype="dashed", size=1.5) + labs(x = "Sessions", y = "Structural Complexity")




setwd("/Users/ada1024/Downloads")
q_data <- read.csv("QualitativeData.csv")
head(q_data)


# create a data frame (total)

colnames(q_data) <- c("participant","total_d1", "total_I_d1","total_d2","total_I_d2","total_d3","total_I_d3")
q_data_1 <- q_data[, c("participant","total_d1","total_d2","total_d3")]

data_long <- reshape2::melt(q_data_1, id.vars = "participant")

data_long$group <- c(rep("Lego", 11), rep("AI", 20 - 11))
ggp2 <- ggplot(data_long, aes(x=variable, y=value, fill=group)) + 
  geom_boxplot() +  labs(x = "Sessions", y = "Total Words Used")
ggp2

# "I" 
q_data_2 <- q_data[, c("participant","total_I_d1","total_I_d2","total_I_d3")]

data_long_i <- reshape2::melt(q_data_2, id.vars = "participant")

data_long_i$group <- c(rep("Lego", 11), rep("AI", 20 - 11))
ggp3 <- ggplot(data_long_i, aes(x=variable, y=value, fill=group)) + 
  geom_boxplot() +  labs(x = "Sessions", y = "Total 'I' Used")
ggp3
# comparing the difference
wilcox.test(data_long$value[data_long$group == "Lego"],data_long$value[data_long$group == "AI"])
wilcox.test(data_long_i$value[data_long$group == "Lego"],data_long_i$value[data_long$group == "AI"])
# no difference



############
# survey question
setwd("/Users/ada1024/Downloads")
survey2 <- read.csv("G2_11_30.csv")
head(survey2)
attach(survey2)


###################### survey 1
survey1 <- read.csv("G1_11_30.csv")

#conducting test 
survey1 <- survey1[1:11,]
mean(survey1$aaPre)
mean(survey1[1:10,]$aaPost)
#increased 

par(mfrow = c(1, 2))
boxplot_data <- survey1[, c("aaPre", "aaPost", "cbPre", "cbPost", "iaePre", "iaePost")]

# Creating boxplot with related pairs having the same color
boxplot(boxplot_data, col = c("pink", "pink", "skyblue", "skyblue", "yellow", "yellow"),
        names = c("aaPre", "aaPost", "cbPre", "cbPost", "iaePre", "iaePost"),
        main = "Control Group",
        ylab = "Scores", xlab = "Creativity Metrics")

###################### survey 2
boxplot_data_2 <- survey2[, c("aaPre", "aaPost", "cbPre", "cbPost", "iaePre", "iaePost")]

# Creating boxplot with related pairs having the same color
boxplot(boxplot_data_2, col = c("pink", "pink", "skyblue", "skyblue", "yellow", "yellow"),
        names = c("aaPre", "aaPost", "cbPre", "cbPost", "iaePre", "iaePost"),
        main = "AI Group",
       ylab = "Scores",xlab = "Creativity Metrics")
