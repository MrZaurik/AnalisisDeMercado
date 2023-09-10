library(ggplot2)
library(plotly)

datos <- read.csv('AMZN.csv')
datos$Date <- as.Date(datos$Date)

ggplot(data = datos, aes(x = Date, y = Close)) +
  geom_line() +
  labs(x = "Fecha", y = "Precio de Cierre", title = "Precio de Cierre de Amazon a lo Largo del Tiempo")

ggplot(data = datos, aes(x = Date, y = Volume)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(x = "Fecha", y = "Volumen de Operaciones", title = "Volumen de Operaciones de Amazon por Fecha") +
  scale_y_continuous(labels = scales::comma)  # Utiliza 'comma' para separadores de miles

datos_filtrados <- datos[datos$Date >= as.Date("2023-01-01") & datos$Date <= as.Date("2023-09-01"), ]

datos_candlestick <- datos_filtrados[, c("Date", "Open", "High", "Low", "Close")]
plot_ly(data = datos_candlestick, type = "candlestick", x = ~Date, open = ~Open, high = ~High, low = ~Low, close = ~Close)

ggplot(data = datos, aes(x = Close)) +
  geom_density(fill = "blue", alpha = 0.7) +
  labs(x = "Precio de Cierre", y = "Densidad", title = "Distribución de Precios de Cierre de Amazon")


ggplot(data = datos_filtrados, aes(x = Date)) +
  geom_line(aes(y = High, color = "Máximo"), linetype = "dashed") +
  geom_line(aes(y = Low, color = "Mínimo"), linetype = "dashed") +
  labs(x = "Fecha", y = "Precio", title = "Precios Máximos y Mínimos de Amazon a lo Largo del Tiempo") +
  scale_color_manual(values = c("Máximo" = "red", "Mínimo" = "blue"))

