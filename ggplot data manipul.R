demo<- read.csv("demographics.csv")
View(demo)
#ggplot(demo, mapping=aes(x=income, y=carpr))+geom_point(size=1)+
 # geom_line(col="red")
ggplot(demo, aes(income,carpr))+geom_point(size=1)+
  geom_line(col="red")


data()
CO2
View(CO2)
CO2 %>% 
  ggplot(aes(conc, uptake, col= Treatment))+
  geom_point(size=3, alpha = 0.5)+
  geom_smooth()
CO2 %>%
  ggplot(aes(conc, uptake, col= Treatment))+
  geom_point(size=3, alpha = 0.5)+
  geom_smooth(method=lm, se=F)+
  facet_wrap(~Type)+labs(title="Concentration of CO2")+
  theme_bw()
#lets make a boxplot for this
CO2%>%
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+geom_point(alpha=0.5, aes(size=conc, colour=Plant))+
  facet_wrap(~Type)+theme_bw()+coord_flip()+
  labs(title="chilled vs Non-chilled")


View(mpg)
mpg %>% #filter(cty<25) %>%
  ggplot(aes(displ, cty))+
  geom_point(aes(colour=drv, size=trans), alpha=0.5)+
  geom_smooth(method=lm)+facet_wrap(~year, nrow=1)+
  labs(x="Engine size", y="MPG in the city", title="Fuel efficiency")+
  theme_bw()
View(airquality) 
hist(airquality$Temp)

View(starwars)
brkVec=seq(0,400, by=40)
brkVec
hist(starwars$height, freq =F, xlab ="Height", ylab= "Density", las=1, 
     col="gray", breaks = brkVec)
dx <- density(starwars$height, na.rm=T)
dx
lines(dx, lwd=2, col="red")
#density plot without histogram
plot(dx, lwd=2, col="red", main= "Density")





data(package = .packages(all.available = TRUE))
install.packages("gapminder")
library(gapminder)
library(tidyverse)
View(gapminder)
gapminder %>%
  filter(continent = c("Africa", "Europe")) %>%
  filter(gdpPercap < 30000) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, col=year))+
  geom_point()+
  facet_wrap(~continent)+
  labs(title= "Life expectancy explained by GDP", x= "GDP per capita", 
       y= "Life expectancy")
