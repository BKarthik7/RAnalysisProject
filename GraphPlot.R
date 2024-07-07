# Load necessary libraries
library(ggplot2)
library(reshape2)
library(dplyr)
library(readr)
library(fmsb)

# Load the data
data <- read_csv("student_chatgpt_usage.csv")

# Boxplots
head(data)

# Boxplot of Age by Role
ggplot(data, aes(x=Role, y=Age)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title="Boxplot of Age by Role", x="Role", y="Age")


# Scatter plot of Age vs. Perceived Impact
ggplot(data, aes(x=Age, y=factor(PerceivedImpact, levels=c('Low', 'Moderate', 'High')))) +
  geom_jitter(width = 0.2, colour = "green") +
  theme_minimal() +
  labs(title="Scatter Plot of Age vs. Perceived Impact", x="Age", y="Perceived Impact")

# Scatter plot of Age vs. Automation Efficiency
ggplot(data, aes(x=Age, y=factor(AutomationEfficiency, levels=c('Low', 'Moderate', 'High')))) +
  geom_jitter(width = 0.2, colour = "blue" ) +
  theme_minimal() +
  labs(title="Scatter Plot of Age vs. Automation Efficiency", x="Age", y="Automation Efficiency")

# Histogram of Age
ggplot(data, aes(x=Age)) +
  geom_histogram(binwidth=5, fill="blue", color="black", alpha=0.7) +
  theme_minimal() +
  labs(title="Histogram of Age", x="Age", y="Frequency")

# Histogram of Perceived Impact
ggplot(data, aes(x=factor(PerceivedImpact, levels=c('Low', 'Moderate', 'High')))) +
  geom_bar(fill="green", color="black", alpha=0.7) +
  theme_minimal() +
  labs(title="Histogram of Perceived Impact", x="Perceived Impact", y="Frequency")

# Bar graph of Role
ggplot(data, aes(x=Role)) +
  geom_bar(fill="purple", color="black", alpha=0.7) +
  theme_minimal() +
  labs(title="Bar Graph of Role", x="Role", y="Count")

# Bar graph of Gender
ggplot(data, aes(x=Gender)) +
  geom_bar(fill="orange", color="black", alpha=0.7) +
  theme_minimal() +
  labs(title="Bar Graph of Gender", x="Gender", y="Count")

filename <- "student_usage_rates.csv"
df <- read_csv(filename)

# Plot 1: Bar Plot
bar_plot <- ggplot(df, aes(x = UsageRate)) +
  geom_histogram(bins = 20, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Usage Rates",
       x = "Usage Rate",
       y = "Count") +
  theme_minimal()

print(bar_plot)

# Plot 2: Scatter Plot
scatter_plot <- ggplot(df, aes(x = StudentID, y = UsageRate)) +
  geom_point(color = "green", alpha = 0.7) +
  labs(title = "Student Usage Rates",
       x = "Student ID",
       y = "Usage Rate") +
  theme_minimal()+
  xlim(0, 1000)+
  ylim(1, 4)

print(scatter_plot)

# Plot 3: Classification Plot
classification_plot <- ggplot(df, aes(x = StudentID, y = UsageRate, color = UsageRate)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "Student Usage Rates Classified",
       x = "Student ID",
       y = "Usage Rate",
       color = "Usage Rate") +
  scale_color_gradient(low = "blue", high = "red") +
  theme_minimal()+
  xlim(0, 1000)+
  ylim(1, 4)

print(classification_plot)


