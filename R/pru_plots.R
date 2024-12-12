# to create a chart theme, the function does not expect parameters so you can leave the 
# parentheses in function() blank
## to apply use source("pru_plots.R") at the top of the script
# can add to ggplot as pru_plots() without adding parameters, and it will run

#' Plots for the PRU ggplot theme
#'
#' @return
#' @export
#'
#' @examples
#' 
#' # Define custom colors
library(showtext)

custom_colors <- list(
  background = "#ffffff", #  white
  text = "#211e1f", # dark gray for text
  gridlines = "#7f7f7f" # light gray for gridlines
)

# Color palettes for  data
plot_palettes <- list(
  "dis6" = c("#710f11", "#acdede", "#f8981d", "#ffcc05", "#fae399", "#ffffff"), # Example color set 1
  "dis4" = c("#acdede", "#0e7874", "#f8981d", "#ffcc05"), # Color set 2 from RColorBrewer
  "dis5" = c("#710f11", "#be6327", "#f6871f", "#febf0f", "#fae399")  # Custom colors
)

#..........................import fonts..........................
font_add_google(name = "Montserrat", family = "montserrat")
font_add_google(name = "Hind", family = "hind")

#................enable {showtext} for rendering.................
showtext_auto()

# Define custom fonts
custom_fonts <- list(
  base_font = "montserrat", # default font for text
  title_font = "hind", # font for titles
  axis_font = "hind" # font for axis labels
)

# Function to apply discrete color palette
pru_palette <- function(palette_name = "dis6") {
  if (!palette_name %in% names(plot_palettes)) {
    stop("Invalid palette name. Please choose from: ", paste(names(plot_palettes), collapse = ", "))
  }
  scale_color_manual(values = plot_palettes[[palette_name]])
}

# Define the custom theme function
pru_theme <- function(base_size = 12) {
  theme_minimal(base_size = base_size) +
    theme(
      # Background and grid
      panel.background = element_rect(fill = custom_colors$background, 
                                      color = custom_colors$background),
      plot.background = element_rect(fill = custom_colors$background, 
                                     color = custom_colors$background),
      # panel.grid.major = element_line(color = custom_colors$gridlines, 
      #                                 size = 0.3),
      # panel.grid.minor = element_line(color = custom_colors$gridlines, 
      #                                 size = 0.1),
      
      # Text elements
      text = element_text(family = custom_fonts$base_font, 
                          color = custom_colors$text),
      plot.title = element_text(family = custom_fonts$title_font, 
                                face = "bold", size = base_size * 1.5, 
                                color = custom_colors$text),
      axis.title = element_text(family = custom_fonts$axis_font, 
                                size = base_size, color = custom_colors$text),
      axis.text = element_text(family = custom_fonts$axis_font, 
                               size = base_size * 0.8, color = custom_colors$text),
      
      # Legend
      legend.background = element_rect(fill = custom_colors$background),
      legend.title = element_text(family = custom_fonts$base_font, 
                                  color = custom_colors$text),
      legend.text = element_text(family = custom_fonts$base_font, 
                                 color = custom_colors$text),
      
      # Other elements
      plot.margin = margin(10, 10, 10, 10)
    )
}