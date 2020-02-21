library(magick)
library(bunny)

bg_color <- "#ffffff"
bg_color2 <- "#f6f3f9"
fg_color <- "#042a2b"
fgd_color1 <- "#772e25"
fgd_color2 <- "#411815"

sandbox <- image_read("script/slack/sandbox.png")

blue <- image_read("script/slack/slack-1.svg") %>%
  image_scale("10%")

red <- image_read("script/slack/slack-2.svg") %>%
  image_scale("10%")

yellow <- image_read("script/slack/slack-3.svg")

green <- image_read("script/slack/slack-4.svg")%>%
  image_scale("60%")%>%
  image_composite(sandbox%>%image_scale("200%"),
                  gravity = "center")

image_canvas_hex(fill_color = bg_color, 
  border_color = fg_color, 
  border_size = 5)%>%
  image_composite(green,
  gravity = "center") %>%
  image_scale("20%")%>%
  image_annotate("slackreprex", 
                 gravity = "center", 
                 location = "+0+100", 
                 size=30,
                 weight = 400)%>%
  image_write('script/slack/green_hex.png')
