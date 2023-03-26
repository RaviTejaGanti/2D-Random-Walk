
library(ggplot2)
library(gganimate)
n <- 250
df2 <- as.data.frame(matrix(NA,n,5))
colnames(df2) <- c("Step", "result.x","result.y", "position.x","position.y")
df2$Step[1] <- 0
df2$result.x[1] <- 0
df2$position.x[1] <- 0
df2$result.y[1] <- 0
df2$position.y[1] <- 0
i <- 2
for (i in 2:n){
  result.x <- sample(1:6,1,replace = TRUE)
  if (result.x<=4){
    Step = 1
  } else {
    Step = -1
  }
  df2$result.x <- Step
  df2$position.x[i] <- df2$position.x[i-1] + Step
  result.y <- sample(1:6,1,replace=TRUE)
  if (result.y<=4){
    Step = 1
  } else {
    Step = -1
  }
  df2$result.y <- Step
  df2$position.y[i] <- df2$position.y[i-1] + Step
  df2$Step[i] <- i-1
}
positions <- data.frame(df2$position.x,df2$position.y)
colnames(positions) <- c("X","Y")

random_2d <- ggplot(positions, aes(x = X, y = Y),type=b,pch=19) + geom_path()+ theme_minimal()
random_2d

