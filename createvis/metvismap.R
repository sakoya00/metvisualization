library(ggplot2)
library(maps)
library(ggthemes)
library(dplyr)
library(plotly)
library(viridis)

#setwd("D:/Met Objects")
#latlong2 <- read.csv("latlong.csv")

metmap <- latlong2 %>%
  mutate(caption= paste("Country/Region: ", latlong2$Countries_Regions, 
  "\nNumber of Objects in the Met: ", latlong2$Count, sep=""))%>%
  
  ggplot(aes(x = Longitude, y = Latitude, size = Count, color= Countries_Regions, 
             text= caption)) +
  borders("world", colour = "gray85", fill = "gray80") +
  theme_map()  +
  geom_point(alpha = .3) +
  scale_size(range= c(1,20), trans = "log10")+
  theme(legend.position= "none")+
  scale_color_viridis(option= "C" ,discrete=TRUE, guide=TRUE)

interactive <- ggplotly(metmap, tooltip = "caption")
interactive
