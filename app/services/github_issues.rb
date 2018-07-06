class GithubIssues
  def initialize(error, class_name, method_name, data)
    @error = error
    @class_name = class_name
    @method_name = method_name
    @data = data
  end
  def self.create(error, class_name, method_name, data)
    Rails.logger.debug("\e[31mERROR: #{error.message} || #{class_name} || #{method_name} || #{data.inspect.to_yaml}\e[0m")
    PartyFoul::RacklessExceptionHandler.handle(error, class: @class_name, method: @method_name, params: data.inspect) if Rails.env.production? and return
    raise unless Rails.env.production? and return
  end
end
