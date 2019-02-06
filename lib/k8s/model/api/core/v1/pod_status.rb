# frozen_string_literal: true
# THIS FILE WAS AUTO GENERATED FROM THE K8S SWAGGER SPEC

require "k8s/typed_resource"
require "k8s/model/api/core/v1"
require 'k8s/model/api/core/v1/pod_condition'
require 'k8s/model/api/core/v1/container_status'
require 'k8s/model/apimachinery/apis/meta/v1/time'

module K8s::Model::Api::Core::V1
  class PodStatus < K8s::TypedResource
    # Current service state of pod. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions
    # @return [K8s::API::Types::Array.of(K8s::Model::Api::Core::V1::PodCondition),NilClass]
    attribute :conditions, K8s::API::Types::Array.of(K8s::Model::Api::Core::V1::PodCondition).optional.default(nil)

    # The list has one entry per container in the manifest. Each entry is currently the output of `docker inspect`. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-and-container-status
    # @return [K8s::API::Types::Array.of(K8s::Model::Api::Core::V1::ContainerStatus),NilClass]
    attribute :containerStatuses, K8s::API::Types::Array.of(K8s::Model::Api::Core::V1::ContainerStatus).optional.default(nil)

    # IP address of the host to which the pod is assigned. Empty if not yet scheduled.
    # @return [K8s::API::Types::String,NilClass]
    attribute :hostIP, K8s::API::Types::String.optional.default(nil)

    # The list has one entry per init container in the manifest. The most recent successful init container will have ready = true, the most recently started container will have startTime set. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-and-container-status
    # @return [K8s::API::Types::Array.of(K8s::Model::Api::Core::V1::ContainerStatus),NilClass]
    attribute :initContainerStatuses, K8s::API::Types::Array.of(K8s::Model::Api::Core::V1::ContainerStatus).optional.default(nil)

    # A human readable message indicating details about why the pod is in this condition.
    # @return [K8s::API::Types::String,NilClass]
    attribute :message, K8s::API::Types::String.optional.default(nil)

    # nominatedNodeName is set only when this pod preempts other pods on the node, but it cannot be scheduled right away as preemption victims receive their graceful termination periods. This field does not guarantee that the pod will be scheduled on this node. Scheduler may decide to place the pod elsewhere if other nodes become available sooner. Scheduler may also decide to give the resources on this node to a higher priority pod that is created after preemption. As a result, this field may be different than PodSpec.nodeName when the pod is scheduled.
    # @return [K8s::API::Types::String,NilClass]
    attribute :nominatedNodeName, K8s::API::Types::String.optional.default(nil)

    # The phase of a Pod is a simple, high-level summary of where the Pod is in its lifecycle. The conditions array, the reason and message fields, and the individual container status arrays contain more detail about the pod's status. There are five possible phase values:

    # Pending: The pod has been accepted by the Kubernetes system, but one or more of the container images has not been created. This includes time before being scheduled as well as time spent downloading images over the network, which could take a while. Running: The pod has been bound to a node, and all of the containers have been created. At least one container is still running, or is in the process of starting or restarting. Succeeded: All containers in the pod have terminated in success, and will not be restarted. Failed: All containers in the pod have terminated, and at least one container has terminated in failure. The container either exited with non-zero status or was terminated by the system. Unknown: For some reason the state of the pod could not be obtained, typically due to an error in communicating with the host of the pod.

    # More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-phase
    # @return [K8s::API::Types::String,NilClass]
    attribute :phase, K8s::API::Types::String.optional.default(nil)

    # IP address allocated to the pod. Routable at least within the cluster. Empty if not yet allocated.
    # @return [K8s::API::Types::String,NilClass]
    attribute :podIP, K8s::API::Types::String.optional.default(nil)

    # The Quality of Service (QOS) classification assigned to the pod based on resource requirements See PodQOSClass type for available QOS classes More info: https://git.k8s.io/community/contributors/design-proposals/node/resource-qos.md
    # @return [K8s::API::Types::String,NilClass]
    attribute :qosClass, K8s::API::Types::String.optional.default(nil)

    # A brief CamelCase message indicating details about why the pod is in this state. e.g. 'Evicted'
    # @return [K8s::API::Types::String,NilClass]
    attribute :reason, K8s::API::Types::String.optional.default(nil)

    # RFC 3339 date and time at which the object was acknowledged by the Kubelet. This is before the Kubelet pulled the container image(s) for the pod.
    # @return [K8s::Model::Apimachinery::Apis::Meta::V1::Time,NilClass]
    attribute :startTime, K8s::Model::Apimachinery::Apis::Meta::V1::Time.optional.default(nil)

    register_paths [
      
    ]
  end
end
