require 'serverspec'

set :backend, :exec

class Docker::Container
  def remove(options={}); end
  alias_method :delete, :remove
end
