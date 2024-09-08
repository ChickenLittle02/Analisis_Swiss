# Cargar el conjunto de datos swiss
data(swiss)

# Calcular medidas estadísticas para cada variable
calc_stats <- function(x) {
  mean_x <- mean(x)
  median_x <- median(x)
  mode_x <- as.numeric(names(sort(table(x), decreasing=TRUE)[1]))
  var_x <- var(x)
  sd_x <- sd(x)
  range_x <- range(x)
  cv_x <- (sd_x / mean_x) * 100
  skewness_x <- mean((x - mean_x)^3) / (sd_x^3)
  kurtosis_x <- mean((x - mean_x)^4) / (sd_x^4)
  
  list(
    central = data.frame(
      Medida = c("Media", "Mediana", "Moda", "Simetría", "Curtosis"),
      Valor = c(mean_x, median_x, mode_x, skewness_x, kurtosis_x)
    ),
    dispersion = data.frame(
      Medida = c("Varianza", "Desviación Estándar", "Rango", "Coeficiente de Variación"),
      Valor = c(var_x, sd_x, diff(range_x), cv_x)
    )
  )
}

# Crear la carpeta Swiss si no existe
if (!dir.exists("Swiss")) {
  dir.create("Swiss")
}

# Aplicar la función a cada variable del dataset swiss
library(ggplot2)
library(gridExtra)

lapply(names(swiss), function(var) {
  # Obtener las medidas para la variable actual
  stats <- calc_stats(swiss[[var]])
  
  # Crear la tabla para medidas de tendencia central, simetría y curtosis
  tabla_central_df <- as.data.frame(t(stats$central))
  colnames(tabla_central_df) <- stats$central$Medida # Asignar nombres de medida como nombres de columna
  tabla_central_df <- tabla_central_df[-1, , drop = FALSE] # Eliminar fila de nombres de medida
  
  # Crear la tabla para medidas de dispersión
  tabla_dispersion_df <- as.data.frame(t(stats$dispersion))
  colnames(tabla_dispersion_df) <- stats$dispersion$Medida # Asignar nombres de medida como nombres de columna
  tabla_dispersion_df <- tabla_dispersion_df[-1, , drop = FALSE] # Eliminar fila de nombres de medida
  
  # Crear y guardar la tabla para medidas de tendencia central, simetría y curtosis
  tabla_central <- tableGrob(tabla_central_df, rows = NULL)
  ggsave(file.path("Swiss", paste0(var, "_central.png")), tabla_central, width = 6, height = 1.5, units = "in")
  
  # Crear y guardar la tabla para medidas de dispersión
  tabla_dispersion <- tableGrob(tabla_dispersion_df, rows = NULL)
  ggsave(file.path("Swiss", paste0(var, "_dispersion.png")), tabla_dispersion, width = 6, height = 1.5, units = "in")
})
