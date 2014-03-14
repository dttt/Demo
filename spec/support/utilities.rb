def full_title(page_title)
	base_title = "Demo app"
	base_title.empty? ? base_title : "#{base_title} | #{page_title}"
end