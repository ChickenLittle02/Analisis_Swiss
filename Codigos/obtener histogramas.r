# Instalar ggplot2 si no está instalado
if(!require(ggplot2)) {
  install.packages("ggplot2")
}

# Cargar ggplot2
library(ggplot2)

# Definir el directorio principal
output_dir <- "Histogramas/"  # Cambia esto a tu directorio de salida

# Crear la carpeta principal si no existe
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# Función para guardar las imágenes en la carpeta raíz
guardar_histograma <- function(data, variable, binwidth, title, xlabel, ylabel, file_name) {
  # Crear y guardar el histograma
  ggplot(data, aes_string(x = variable)) +
    geom_histogram(binwidth = binwidth, fill = "skyblue", color = "black") +
    labs(title = title, x = xlabel, y = ylabel) +
    theme_minimal()
  
  ggsave(filename = paste0(output_dir, file_name), width = 8, height = 6)
}

# Crear los histogramas y guardarlos en la carpeta raíz

# Histograma para Fertility
guardar_histograma(
  data = swiss,
  variable = "Fertility",
  binwidth = 5,
  title = "Distribución de la Tasa de Fertilidad",
  xlabel = "Tasa de Fertilidad",
  ylabel = "Frecuencia",
  file_name = "histogram_fertility.png"
)

# Histograma para Agriculture
guardar_histograma(
  data = swiss,
  variable = "Agriculture",
  binwidth = 10,
  title = "Distribución de la Proporción de Trabajadores en Agricultura",
  xlabel = "Proporción de Trabajadores en Agricultura",
  ylabel = "Frecuencia",
  file_name = "histogram_agriculture.png"
)

# Histograma para Examination
guardar_histograma(
  data = swiss,
  variable = "Examination",
  binwidth = 2,
  title = "Distribución de la Proporción de Jóvenes con Educación Secundaria",
  xlabel = "Proporción de Jóvenes con Educación Secundaria",
  ylabel = "Frecuencia",
  file_name = "histogram_examination.png"
)

# Histograma para Education
guardar_histograma(
  data = swiss,
  variable = "Education",
  binwidth = 2,
  title = "Distribución de la Proporción de Población con Educación Secundaria",
  xlabel = "Proporción de Población con Educación Secundaria",
  ylabel = "Frecuencia",
  file_name = "histogram_education.png"
)

# Histograma para Catholic
guardar_histograma(
  data = swiss,
  variable = "Catholic",
  binwidth = 10,
  title = "Distribución de la Proporción de Población Católica",
  xlabel = "Proporción de Población Católica",
  ylabel = "Frecuencia",
  file_name = "histogram_catholic.png"
)

# Histograma para Infant.Mortality
guardar_histograma(
  data = swiss,
  variable = "Infant.Mortality",
  binwidth = 2,
  title = "Distribución de la Tasa de Mortalidad Infantil",
  xlabel = "Tasa de Mortalidad Infantil",
  ylabel = "Frecuencia",
  file_name = "histogram_infant_mortality.png"
)
