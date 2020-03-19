require 'kubeclient'

class KubernetesObjects
  attr_reader :namespace

  def initialize(namespace)
    @kube_client = Kubeclient::Client.new(
      "https://kubernetes.default.svc/api/",
      "v1",
      auth_options: self.auth_options,
      ssl_options: self.ssl_options,
      as: :parsed_symbolized
    )
    @namespace = namespace
  end

  def pods
    @pods ||= @kube_client.get_pods(namespace: "#{@namespace}")[:items]
  end

  def pod_names
    pods.map { |p| p[:metadata][:name] }
  end

  def pod_ips
    pods.map { |p| p[:status][:podIP] }
  end

  def containers
    pods.map { |p| p[:spec][:containers] }
  end

  def container_names
    containers.map { |c| c.map { |cont| cont[:name] } }
  end

  def container_images
    containers.map { |c| c.map { |cont| cont[:image] } }
  end

  def auth_options
    {bearer_token_file: "/var/run/secrets/kubernetes.io/serviceaccount/token"}
  end

  def ssl_options
    {ca_file: "/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"}
  end
end
