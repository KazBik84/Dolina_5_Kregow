module ApplicationHelper

	def title_function(title = '')
		if title.empty?
			return "Dolina Pięciu Kręgów"
		else
			return "Dolina Pięciu Kręgów | #{title}"
		end
	end
end
