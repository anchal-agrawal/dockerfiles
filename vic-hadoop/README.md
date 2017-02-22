# vic-hadoop

Docker image for running a single-node Hadoop 2.7.2 instance on [vSphere Integrated Containers](https://github.com/vmware/vic).

## Running

To run the container on VIC,
```
$ sudo docker -H $endpoint run -m 4096M -it anchal/vic-hadoop
```

This sets up the Hadoop config files, formats HDFS, launches Hadoop processes and presents a shell.

## Caveats
* Per [vmware/vic#3624](https://github.com/vmware/vic/issues/3624), pulling a very large image may fail due to a memory issue. The VCH endpoint VM can be deployed with larger memory using the `--endpoint-memory` option, e.g. `--endpoint-memory=4096` to resolve this.
* To ensure there's sufficient memory for the JRE while running Hadoop jobs, the container should be run with a higher memory limit using the `-m` option.
* This image currently works for a single-node Hadoop deployment and not a cluster.
