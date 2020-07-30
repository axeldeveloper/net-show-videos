class View < ApplicationRecord
  
  #belongs_to :video, counter_cache: :total
  belongs_to :video, :class_name => "Video"
  
end
