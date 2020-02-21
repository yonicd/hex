library(magick)
library(bunny)

bg_color <- "#ffffff"
fg_color <- "#218a7dff"

sandbox <- image_read("script/slack/sandbox.png")

green <- image_read("script/slack/slack-4.png")%>%
  image_scale("65%")%>%
  image_composite(sandbox%>%image_scale("500%"),
                  gravity = "center")

green_hex <- image_canvas_hex(
  fill_color = bg_color, 
  border_color = fg_color, 
  border_size = 5)%>%
  image_composite(green,gravity = "north",offset = "+0-250") %>%
  image_scale("20%")%>%
  image_annotate("slackreprex", 
                 color = fg_color,
                 gravity = "center", 
                 location = "+0+100", 
                 size=45,
                 weight = 400)

green_hex %>%
  image_scale("1200x1200") %>%
  image_write("images/hex/slackreprex.png", density = 600)

green_hex %>%
  image_scale("200x200") %>%
  image_write("images/logos/slackreprex.png", density = 600)

green_hex_gh <- green_hex %>%
  image_scale("400x400")

gh_logo <- bunny::github %>%
  image_scale("40x40")

shred_ghcard <- image_canvas_ghcard(fill_color = bg_color2) %>%
  image_composite(green_hex_gh, gravity = "East", offset = "+100+0") %>%
  image_annotate("Reprex for Slack ", gravity = "West", location = "+60-30", 
                 style = "italic", color=fg_color, size=65, font="Volkhov", weight = 700) %>%   
  image_compose(gh_logo, gravity="West", offset = "+60+40") %>%
  image_annotate("yonicd/slackreprex", gravity="West", 
                 location="+110+45", size=38, font="Ubuntu Mono") %>%
  image_border_ghcard(bg_color2)

shred_ghcard %>%
  image_write("images/cards/slackreprex_ghcard.png", density = 600)
