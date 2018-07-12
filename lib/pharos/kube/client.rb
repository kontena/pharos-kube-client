require 'openssl'
require 'base64'

module Pharos
  module Kube
    def self.client(server, **options)
      Client.new(Transport.new(server, **options))
    end

    class Client
      # @param config [Phraos::Kube::Config]
      # @return [Pharos::Kube::Client]
      def self.config(config)
        new(Transport.config(config))
      end

      # @param server [String] URL with protocol://host:port - any /path is ignored
      def initialize(transport, namespace: nil)
        @transport = transport
        @namespace = namespace

        @api_clients = {}
      end

      # @raise [Pharos::Kube::Error]
      # @return [Pharos::Kube::API::Version]
      def version
        @transport.get('/version',
          response_class: Pharos::Kube::API::Version,
        )
      end

      # @param api_version [String] "group/version" or "version" (core)
      # @return [APIClient]
      def api(api_version = 'v1')
        @api_clients[api_version] ||= APIClient.new(@transport, api_version)
      end

      # @return [Array<APIClient>]
      def apis(prefetch_resources: false)
        @api_group_list ||= @transport.get('/apis',
          response_class: Pharos::Kube::API::MetaV1::APIGroupList,
        )

        api_versions = ['v1'] + @api_group_list.groups.map{|api_group| api_group.preferredVersion.groupVersion }

        if prefetch_resources
          # api groups that are missing their api_resources
          api_paths = api_versions
            .select{|api_version| !api(api_version).api_resources? }
            .map{|api_version| APIClient.path(api_version) }

          # load into APIClient.api_resources=
          @transport.gets(*api_paths, response_class: Pharos::Kube::API::MetaV1::APIResourceList).each do |api_resource_list|
            api(api_resource_list.groupVersion).api_resources = api_resource_list.resources
          end
        end

        api_versions.map{|api_version| api(api_version) }
      end

      # @param resource [Pharos::Kube::Resource]
      # @param namespace [String, nil] default if resource is missing namespace
      # @raise [Pharos::Kube::Error] unknown resource
      # @return [Pharos::Kube::ResourceClient]
      def client_for_resource(resource, namespace: nil)
        api(resource.apiVersion).client_for_resource(resource, namespace: namespace)
      end

      # @param resource [Pharos::Kube::Resource]
      # @return [Pharos::Kube::Resource]
      def create_resource(resource)
        client_for_resource(resource).create_resource(resource)
      end

      # @param resource [Pharos::Kube::Resource]
      # @return [Pharos::Kube::Resource]
      def get_resource(resource)
        client_for_resource(resource).get_resource(resource)
      end

      # @param resource [Pharos::Kube::Resource]
      # @return [Pharos::Kube::Resource]
      def update_resource(resource)
        client_for_resource(resource).update_resource(resource)
      end

      # @param resource [Pharos::Kube::Resource]
      # @return [Pharos::Kube::Resource]
      def delete_resource(resource)
        client_for_resource(resource).delete_resource(resource)
      end
    end
  end
end
