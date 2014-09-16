object @press_clipping

attributes :url, :title, :teaser, :content

node(:permalink, &:to_param)
node(:pdf_url) { |press| press.pdf.url }
node(:cover_url) { |press| press.cover.url }
