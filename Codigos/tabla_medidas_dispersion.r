# Cargar el conjunto de datos swiss
data(swiss)

# Función para calcular medidas estadísticas
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
  
  data.frame(
    variable = "",
    media = mean_x,
    mediana = median_x,
    moda = mode_x,
    simetria = skewness_x,
    curtosis = kurtosis_x,
    varianza = var_x,
    desviacion_estandar = sd_x,
    rango = diff(range_x),
    coeficiente_variacion = cv_x
  )
}

# Aplicar la función a cada variable del dataset swiss
resultados <- lapply(names(swiss), function(var_name) {
  stats <- calc_stats(swiss[[var_name]])
  stats$variable <- var_name
  stats
})

# Crear un solo data frame combinando todas las medidas
combined_df <- do.call(rbind, resultados)

# Guardar el data frame combinado como un archivo CSV
write.csv(combined_df, "medidas_combinadas_swiss.csv", row.names = FALSE)
