class Article <ApplicationRecord
	
	validates:title,presence:true , length:{minium:6,maximum:25}
	validates:description,presence:true,length:{minium:25,maximum:2000}

end