module ExceptionWrapper
  def self.extended(base)
    base.instance_eval do
      class << base
        methods = self.instance_methods(false).reject{ |method| method.match(/^alias/) }
        methods.each do |method|
          alias_method = "alias_#{method}"
          alias_method(alias_method, method)
          define_method(method) do |*args|
            begin
              method(alias_method).call(*args)
            rescue Stripe::CardError => error
              raise
            rescue => error
              GithubIssues.create(error, self, method, args[0])
            end
          end
        end
      end
    end
  end
end
