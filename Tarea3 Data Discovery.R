library(readxl)

## Importar CSV con las ventas totales para cada cliente
Sales_Super <- read.csv("supermarket_sales.csv")

Sales_Super

## Examinar el dataset importado 
head(Sales_Super, n=15L) 
tail(Sales_Super, n=15L)

## Realizar un analisis descriptivo del archivo
summary(Sales_Super)

## Realizar un analisis de la estructura de datos del archivo
str(Sales_Super)
class(Sales_Super)

## La función plot es una función genérica para la representación gráfica de objetos en R
## Representar en un diagrama de dispersión  Tax 5% as a function of the Gross Income
plot(Sales_Super$Tax.5.,Sales_Super$gross.income,col = "red", main = "Tax 5% as a function of the Gross Income")

## La función plot es una función genérica para la representación gráfica de objetos en R
## Representar en un diagrama de dispersión  Quantity Vs Cost of Goods Sale
plot(Sales_Super$Quantity,Sales_Super$cogs,col = "green", main = "Quantity Vs Cost of Goods Sale")

## La función plot es una función genérica para la representación gráfica de objetos en R
## Representar en un diagrama de dispersión  Unit Price Vs Gross Income
plot(Sales_Super$Unit.price,Sales_Super$gross.income,col = "blue", main = "Unit Price Vs Gross Income")

## Regresión lineal es un modelo matemático usado para aproximar la relación de dependencia 
## entre una variable dependiente Y, m variables independientes X_{i}}X_i con un término aleatorio
resultado <- lm(Sales_Super$Unit.price ~ Sales_Super$gross.income)

resultado
summary(resultado)
attributes(results)
## Realizar un histograma de los residuos 
hist(resultado$residuals,breaks = 800)

##Análisis de Marca
library(ggplot2)
# Grafico de barras
ggplot(data = Sales_Super, aes(x = Branch)) +
  geom_bar(aes(fill = Branch)) + 
  labs(title = "Análisis de Marca",
       subtitle = "Que marca se compra más?.",
       x = "Marcas",
       y = "Conteo")



#Precio Unitario vs Línea de Producto por Ciudad

ggplot() + geom_point(data = Sales_Super, aes(Product.line, Unit.price, color = City))
