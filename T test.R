install.packages("patchwork")
library(gapminder)
my_ttest<- gapminder%>%
  filter(continent=="Africa")%>%
  select(lifeExp)%>%
  t.test(mu=50)
attributes(my_ttest)
my_ttest
#p-value is less than five percent hence wwe reject the null hypothesis 
#H0: mean of life expectancy is equal to 50
#H1: mean of life expectancy is not equal to 50

#two sided t test for difference of means

gapminder%>%
  filter(continent==c("Africa", "Europe"))%>%
  ggplot(aes(x=lifeExp, fill=continent))+
  geom_density(alpha = 0.5)

#two sided t test
my_ttest2<- gapminder %>% 
  filter(continent %in% c("Africa", "Europe"))%>%
  t.test(lifeExp~continent, data= ., alternative="two.sided")
my_ttest2
#p-value is less than five percent hence we reject the null hypothesis
#H0: difference of means equal to zero

#one sided t test
View(gapminder)
gapminder%>%
  filter(country%in% c("Ireland", "Switzerland"))%>%
  t.test(lifeExp~country, data= ., alternative="less", 
         conf.level=0.95)
#we cannot reject null hypothesis i.e. life exp of finland and ireland is equal
  gapminder%>%
    filter(country%in% c("Ireland", "Switzerland"))%>%
    ggplot(aes(lifeExp, fill= country))+
    geom_density(bw=2, adjust=1, alpha=0.5)+ xlim(50,100)
