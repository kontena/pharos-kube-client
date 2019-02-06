# frozen_string_literal: true
# THIS FILE WAS AUTO GENERATED FROM THE K8S SWAGGER SPEC

require "k8s/typed_resource"
require "k8s/model/api/storage/v1"
require 'k8s/model/apimachinery/apis/meta/v1/object_meta'
require 'k8s/model/api/storage/v1/volume_attachment_spec'
require 'k8s/model/api/storage/v1/volume_attachment_status'

module K8s::Model::Api::Storage::V1
  class VolumeAttachment < K8s::TypedResource
    # APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
    # @return [K8s::API::Types::String,NilClass]
    attribute :apiVersion, K8s::API::Types::String.optional.default(nil)

    # Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
    # @return [K8s::API::Types::String,NilClass]
    attribute :kind, K8s::API::Types::String.optional.default(nil)

    # Standard object metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
    # @return [K8s::Model::Apimachinery::Apis::Meta::V1::ObjectMeta,NilClass]
    attribute :metadata, K8s::Model::Apimachinery::Apis::Meta::V1::ObjectMeta.optional.default(nil)

    # Specification of the desired attach/detach volume behavior. Populated by the Kubernetes system.
    # @return [K8s::Model::Api::Storage::V1::VolumeAttachmentSpec]
    attribute :spec, K8s::Model::Api::Storage::V1::VolumeAttachmentSpec

    # Status of the VolumeAttachment request. Populated by the entity completing the attach or detach operation, i.e. the external-attacher.
    # @return [K8s::Model::Api::Storage::V1::VolumeAttachmentStatus,NilClass]
    attribute :status, K8s::Model::Api::Storage::V1::VolumeAttachmentStatus.optional.default(nil)

    register_paths [
      '/apis/storage.k8s.io/v1/volumeattachments/{name}',
      '/apis/storage.k8s.io/v1/volumeattachments/{name}/status'
    ]
  end
end
