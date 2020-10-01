library(magick)
library(bunny)

bg_color <- "#fafafa"
fg_color <- "#3772a6"

shiny_hex <- image_read_svg("https://raw.githubusercontent.com/rstudio/hex-stickers/master/SVG/shiny.svg")

reactor_image <- image_read('script/reactor/reactor_image.png')

hex_image <- reactor_image%>%
  image_composite(shiny_hex%>%image_scale("25%"), gravity = "center", offset = "-0+50")%>%
  image_scale('125%')

reactor_hex <- image_canvas_hex(fill_color = bg_color, border_color = fg_color, border_size = 5) %>%
  image_composite(hex_image, gravity = "center", offset = "-0+80")%>%
  image_scale("20%")%>%
  image_annotate("reactor", 
                 color = '#000000',
                 gravity = "center", 
                 location = "+0-100", 
                 size=55,
                 weight = 400)

reactor_hex %>%
  image_scale("1200x1200") %>%
  image_write("images/hex/reactor.png", density = 600)

reactor_hex %>%
  image_scale("200x200") %>%
  image_write("images/logos/reactor.png", density = 600)

reactor_hex_gh <- reactor_hex %>%
  image_scale("400x400")

gh_logo <- bunny::github %>%
  image_scale("40x40")

bg_color2 <- '#607091'

reactor_ghcard <- image_canvas_ghcard(fill_color = bg_color) %>%
  image_composite(reactor_hex_gh, gravity = "East", offset = "+100+0") %>%
  image_annotate("Test Shiny Reactivity", gravity = "West", location = "+60-50",
                 color=fg_color, size=55, font="Volkhov", weight = 500) %>%
  image_compose(gh_logo, gravity="West", offset = "+60+40") %>%
  image_annotate("yonicd/reactor", gravity="West", 
                 location="+110+45", size=38, font="Ubuntu Mono") %>%
  image_border_ghcard(bg_color)

reactor_ghcard %>%
  image_write("images/cards/reactor.png", density = 600)


