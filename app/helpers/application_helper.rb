module ApplicationHelper
  def error_messages(records)
    err = "Error! "
    records.errors.each do |attribute, message|
      err = err + " " + message 
    end
    return err
  end

end
