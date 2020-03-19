# shipwreck / anchorscope

![anchorscope](https://github.com/shipwreckdev/anchorscope/blob/master/assets/as.png)

Anchorscope is a tool that runs inside a Kubernetes cluster and gathers information about `Pods` running in a set of namespaces.

The tool's purpose is to aggregate data in a way that allows comparing image versions and other `Pod` data running in the cluster to public databases regarding vulnerabilities and other security-related concerns.

## Disclaimer

Anchorscope is in development. It is still early stage and is not meant for production usage.

## Usage

Image builds are always up to date on Docker Hub.

You can deploy Anchorscope using the Kubernetes manifest provided in this repository. This will eventually be converted into a Helm Chart.

`kubectl apply -f as.yaml`

This will create the necessary requirements for running Anchorscope in a given cluster.

Once the tool runs, it will return its output.

## Notes

The tool cannot be run manually from a local machine since it depends on authentication information available from inside a Kubernetes cluster. It references the API in a way that is not possible from outside a cluster.

## Update Path

While the tool's output is useful, it is not practical to access data this way.

* Centralize data in a potential datastore.
* Create an accessible web page via a local webserver that presents data properly.
* Loop in vulnerability information for correlation to cluster resources.
