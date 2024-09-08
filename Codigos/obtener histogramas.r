# Crear la carpeta "Histogramas" si no existe
if (!dir.exists("Histogramas")) {
  dir.create("Histogramas")
}

# Cargar el conjunto de datos swiss
data(swiss)

# Crear una lista de nombres de las variables en swiss
variables <- names(swiss)

# Iterar sobre cada variable y generar su histograma con las curvas de densidad
for (var in variables) {
  # Extraer la variable actual
  variable <- swiss[[var]]
  
  # Especificar el archivo de salida para guardar la imagen en la carpeta "Histogramas"
  png(filename = paste0("Histogramas/histograma_", var, ".png"), width = 800, height = 600)
  
  # Crear el histograma
  hist(variable, 
       main = paste("Histograma de", var), 
       xlab = var, 
       ylab = "Frecuencia", 
       col = "lightblue", 
       border = "black", 
       probability = TRUE)
  
  # Generar la secuencia de valores para las curvas de densidad
  x <- seq(min(variable), max(variable), length = 100)
  
  # Curva de densidad normal
  y_normal <- dnorm(x, mean = mean(variable), sd = sd(variable))
  lines(x, y_normal, col = "red", lwd = 2)
  
  # Curva de densidad exponencial
  y_exp <- dexp(x, rate = 1/mean(variable))
  lines(x, y_exp, col = "blue", lwd = 2)
  
  # Curva de densidad uniforme
  y_unif <- dunif(x, min = min(variable), max = max(variable))
  lines(x, y_unif, col = "green", lwd = 2)
  
  # Curva de densidad chi-cuadrado
  df <- 2  # Grados de libertad para la distribución chi-cuadrado
  y_chi <- dchisq(x, df = df)
  lines(x, y_chi, col = "purple", lwd = 2)
  
  # Agregar una leyenda
  legend("topright", legend = c("Normal", "Exponencial", "Uniforme", "Chi-cuadrado"),
         col = c("red", "blue", "green", "purple"), lwd = 2)
  
  # Cerrar el dispositivo gráfico para guardar la imagen
  dev.off()
}
#4. Crear el heatmap
ggplot(data = correlation_melted, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1, 1), 
                       name = "Correlación") +
  theme_minimal() +
  labs(title = "Matriz de Correlación del Dataset Swiss", 
       x = "Variables", 
       y = "Variables") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))