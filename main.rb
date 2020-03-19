require 'optparse'
require 'ostruct'
require_relative './lib/kube.rb'

# Build argument settings.

settings = OpenStruct.new
settings.namespaces = ["default"]

# Parse for arguments.

OptionParser.new do |opts|
  opts.on("--namespaces [NAMESPACES]", "Provide Kubernetes namespaces to run the tool against.") do |namespaces|
    settings.namespaces = [namespaces]
  end
end.parse!(ARGV)

namespaces = settings.namespaces

namespaces.each do |n|
  obj = KubernetesObjects.new(n)

  hash = {}

  hash[:pod_names] = obj.pod_names
  hash[:pod_ips] = obj.pod_ips
  hash[:container_names] = obj.container_names
  hash[:container_images] = obj.container_images

  hash.each do |k, v|
    puts k
    puts v
    puts
  end
end
