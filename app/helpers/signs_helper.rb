module SignsHelper

  def show_title(location) #Used in signs#index
      return "Signs for #{@location.name}" unless location.nil?
  
      "Signs" #return default answer

  end
end
