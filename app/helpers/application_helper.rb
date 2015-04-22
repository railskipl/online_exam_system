module ApplicationHelper


def pretty_date_time(time)
#      time.strftime("%d/%m/%Y %H:%M %p")
       if !time.nil?
        time.to_s(:long)
       end
  end

end
