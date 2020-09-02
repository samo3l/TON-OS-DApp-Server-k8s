<!-- Copy and paste the converted output. -->


## Description

Repository contains Dockerfiles, Terraform scripts and deployment scripts to set up infrastructure and deploy TON-OS-DApp-Server on it.


## System requirements


<table>
  <tr>
   <td><strong>Configuration</strong>
   </td>
   <td><strong>CPU (cores)</strong>
   </td>
   <td><strong>RAM (GiB)</strong>
   </td>
   <td><strong>Storage (GiB)</strong>
   </td>
   <td><strong>Network (Gbit/s)</strong>
   </td>
  </tr>
  <tr>
   <td>Recommended
   </td>
   <td>24
   </td>
   <td>192
   </td>
   <td>2000
   </td>
   <td>1
   </td>
  </tr>
</table>


**NOTE**: SSD disks are recommended for the storage.


## Prerequisites



1. Kubernetes cluster up (this might be any k8s cluster anywhere)
2. Kubectl installed
3. Helm 3 installed
4. Kubernetes config file in ~/.kube/config


## Quick start



1. Run Dapp server node
```
cd helm
./node_install.sh <kubernetes_namespace>
```


2. Stop Dapp server node
```
cd helm
./node_uninstall <kubernetes_namespace>
```


## Project structure & overview


### Directories  layout

├── build

│   ├── arangodb

│   ├── kafka

│   ├── proxy

│   ├── q-server

│   └── ton-node

├── helm

│   └── charts

│       ├── arangodb

│       ├── kafka

│       ├── q-server

│       ├── statsd

│       └── ton-node

└── terraform-vpc-eks

Build directory contains all the required code and Dockerfiles to build Docker images for TON OS DApp Server which will be used in Helm charts for deployment.

Helm is a package manager for Kubernetes. Helm directory contains all the deploy scripts, configs and variables to deploy TON OS DApp Server on Kubernetes.

Terraform-vpc-eks directory contains Terraform scripts to deploy VPC and EKS (Kubernetes cluster) on AWS. 

**NOTE**: You may use any other tool, cloud or even bare metal server for Kubernetes setup. Helm charts will still work.


### Variables

To customize variables for TON OS DApp Server components, just open helm/charts/_&lt;component_name>_/variables.yaml. 

**NOTE**: Default values also can be found there.

### List of variables

<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Default</strong>
   </td>
  </tr>
  <tr>
   <td>ARANGO_NO_AUTH
   </td>
   <td>Disabling arangodb authentication. Need to set to 0 for production
   </td>
   <td>1
   </td>
  </tr>
  <tr>
   <td>VIRTUAL_HOST
   </td>
   <td>External hostname to access arangodb UI
   </td>
   <td>arango.baremetal01.fra02.ibm.cloud
   </td>
  </tr>
  <tr>
   <td>VIRTUAL_PORT
   </td>
   <td>
   </td>
   <td>8529
   </td>
  </tr>
  <tr>
   <td>LETSENCRYPT_HOST
   </td>
   <td>Hostname on which SSL should be issued
   </td>
   <td>arango.baremetal01.fra02.ibm.cloud
   </td>
  </tr>
  <tr>
   <td>LETSENCRYPT_EMAIL
   </td>
   <td>
   </td>
   <td>senegalelastico@gmail.com
   </td>
  </tr>
  <tr>
   <td>ARANGODB_OVERRIDE_DETECTED_TOTAL_MEMORY
   </td>
   <td>
   </td>
   <td>343579738368
   </td>
  </tr>
  <tr>
   <td>ARANGO_ROOT_PASSWORD
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>NETWORK_TYPE
   </td>
   <td>TON Network
   </td>
   <td>net.ton.dev
   </td>
  </tr>
  <tr>
   <td>INSTANCE_NAME
   </td>
   <td>
   </td>
   <td>first
   </td>
  </tr>
  <tr>
   <td>ARANGO_SERVICE_SERVICE_HOST
   </td>
   <td>
   </td>
   <td>arangodb
   </td>
  </tr>
  <tr>
   <td>ARANGO_SERVICE_SERVICE_PORT
   </td>
   <td>
   </td>
   <td>8529
   </td>
  </tr>
  <tr>
   <td>ARANGONI_SERVICE_SERVICE_HOST
   </td>
   <td>
   </td>
   <td>arangodbni
   </td>
  </tr>
  <tr>
   <td>ARANGONI_SERVICE_SERVICE_PORT
   </td>
   <td>
   </td>
   <td>8529
   </td>
  </tr>
  <tr>
   <td>ARANGONI_NO_AUTH
   </td>
   <td>Disabling arangodb authentication. Need to set to 0 for production
   </td>
   <td>1
   </td>
  </tr>
  <tr>
   <td>ARANGONI_VIRTUAL_HOST
   </td>
   <td>External hostname to access arangodb webui
   </td>
   <td>arangoni.baremetal01.fra02.ibm.cloud
   </td>
  </tr>
  <tr>
   <td>ARANGONI_VIRTUAL_PORT
   </td>
   <td>Internal ports
   </td>
   <td>8529
   </td>
  </tr>
  <tr>
   <td>ARANGONI_LETSENCRYPT_HOST
   </td>
   <td>External hostname to access arangodb webui
   </td>
   <td>arangoni.baremetal01.fra02.ibm.cloud
   </td>
  </tr>
  <tr>
   <td>ARANGONI_LETSENCRYPT_EMAIL
   </td>
   <td>
   </td>
   <td>senegalelastico@gmail.com
   </td>
  </tr>
  <tr>
   <td>discovery_type
   </td>
   <td>ELK
   </td>
   <td>single-node
   </td>
  </tr>
  <tr>
   <td>ZOOKEEPER_CLIENT_PORT
   </td>
   <td>
   </td>
   <td>2181
   </td>
  </tr>
  <tr>
   <td>ZOOKEEPER_TICK_TIME
   </td>
   <td>
   </td>
   <td>2000
   </td>
  </tr>
  <tr>
   <td>KAFKA_BROKER_ID
   </td>
   <td>
   </td>
   <td>1
   </td>
  </tr>
  <tr>
   <td>KAFKA_ZOOKEEPER_CONNECT
   </td>
   <td>URL to zookeeper
   </td>
   <td>zookeeper:2181
   </td>
  </tr>
  <tr>
   <td>KAFKA_ADVERTISED_LISTENERS
   </td>
   <td>
   </td>
   <td>PLAINTEXT://kafka:29092,PLAINTEXT_HOST://kafka:9092
   </td>
  </tr>
  <tr>
   <td>KAFKA_LISTENER_SECURITY_PROTOCOL_MAP
   </td>
   <td>
   </td>
   <td>PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT
   </td>
  </tr>
  <tr>
   <td>KAFKA_INTER_BROKER_LISTENER_NAME
   </td>
   <td>
   </td>
   <td>PLAINTEXT
   </td>
  </tr>
  <tr>
   <td>KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR
   </td>
   <td>
   </td>
   <td>1
   </td>
  </tr>
  <tr>
   <td>KAFKA_JMX_PORT
   </td>
   <td>
   </td>
   <td>9581
   </td>
  </tr>
  <tr>
   <td>KAFKA_LOG_RETENTION_HOURS
   </td>
   <td>
   </td>
   <td>4
   </td>
  </tr>
  <tr>
   <td>KAFKA_LOG_ROLL_MS
   </td>
   <td>
   </td>
   <td>600000
   </td>
  </tr>
  <tr>
   <td>KAFKA_LOG_SEGMENT_BYTES
   </td>
   <td>
   </td>
   <td>1073741824
   </td>
  </tr>
  <tr>
   <td>KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS
   </td>
   <td>
   </td>
   <td>300000
   </td>
  </tr>
  <tr>
   <td>KAFKA_CLEANUP_POLICY
   </td>
   <td>
   </td>
   <td>delete
   </td>
  </tr>
  <tr>
   <td>KAFKA_RETENTION_MS
   </td>
   <td>
   </td>
   <td>43200000
   </td>
  </tr>
  <tr>
   <td>KAFKA_MESSAGE_MAX_BYTES
   </td>
   <td>
   </td>
   <td>3001000
   </td>
  </tr>
  <tr>
   <td>KAFKA_RECEIVE_MESSAGE_MAX_BYTES
   </td>
   <td>
   </td>
   <td>3001000
   </td>
  </tr>
  <tr>
   <td>KAFKA_REPLICA_FETCH_MAX_BYTES
   </td>
   <td>
   </td>
   <td>3001000
   </td>
  </tr>
  <tr>
   <td>CONNECT_BOOTSTRAP_SERVERS
   </td>
   <td>
   </td>
   <td>kafka:29092
   </td>
  </tr>
  <tr>
   <td>CONNECT_REST_ADVERTISED_HOST_NAME
   </td>
   <td>
   </td>
   <td>connect
   </td>
  </tr>
  <tr>
   <td>CONNECT_REST_PORT
   </td>
   <td>
   </td>
   <td>8083
   </td>
  </tr>
  <tr>
   <td>CONNECT_GROUP_ID
   </td>
   <td>
   </td>
   <td>compose-connect-group
   </td>
  </tr>
  <tr>
   <td>CONNECT_CONFIG_STORAGE_TOPIC
   </td>
   <td>
   </td>
   <td>docker-connect-configs
   </td>
  </tr>
  <tr>
   <td>CONNECT_CONFIG_STORAGE_REPLICATION_FACTOR
   </td>
   <td>
   </td>
   <td>1
   </td>
  </tr>
  <tr>
   <td>CONNECT_OFFSET_FLUSH_INTERVAL_MS
   </td>
   <td>
   </td>
   <td>10000
   </td>
  </tr>
  <tr>
   <td>CONNECT_OFFSET_STORAGE_TOPIC
   </td>
   <td>
   </td>
   <td>docker-connect-offsets
   </td>
  </tr>
  <tr>
   <td>CONNECT_OFFSET_STORAGE_REPLICATION_FACTOR
   </td>
   <td>
   </td>
   <td>1
   </td>
  </tr>
  <tr>
   <td>CONNECT_STATUS_STORAGE_TOPIC
   </td>
   <td>
   </td>
   <td>docker-connect-status
   </td>
  </tr>
  <tr>
   <td>CONNECT_STATUS_STORAGE_REPLICATION_FACTOR
   </td>
   <td>
   </td>
   <td>1
   </td>
  </tr>
  <tr>
   <td>CONNECT_KEY_CONVERTER
   </td>
   <td>
   </td>
   <td>org.apache.kafka.connect.storage.StringConverter
   </td>
  </tr>
  <tr>
   <td>CONNECT_VALUE_CONVERTER
   </td>
   <td>
   </td>
   <td>io.confluent.connect.avro.AvroConverter
   </td>
  </tr>
  <tr>
   <td>CONNECT_VALUE_CONVERTER_SCHEMA_REGISTRY_URL
   </td>
   <td>
   </td>
   <td>http://schema-registry:8081
   </td>
  </tr>
  <tr>
   <td>CONNECT_INTERNAL_KEY_CONVERTER
   </td>
   <td>
   </td>
   <td>org.apache.kafka.connect.json.JsonConverter
   </td>
  </tr>
  <tr>
   <td>CONNECT_INTERNAL_VALUE_CONVERTER
   </td>
   <td>
   </td>
   <td>org.apache.kafka.connect.json.JsonConverter
   </td>
  </tr>
  <tr>
   <td>CONNECT_ZOOKEEPER_CONNECT
   </td>
   <td>
   </td>
   <td>zookeeper:2181
   </td>
  </tr>
  <tr>
   <td>CLASSPATH
   </td>
   <td>
   </td>
   <td>/usr/share/java/monitoring-interceptors/monitoring-interceptors-5.2.1.jar
   </td>
  </tr>
  <tr>
   <td>CONNECT_PRODUCER_INTERCEPTOR_CLASSES
   </td>
   <td>
   </td>
   <td>io.confluent.monitoring.clients.interceptor.MonitoringProducerInterceptor
   </td>
  </tr>
  <tr>
   <td>CONNECT_CONSUMER_INTERCEPTOR_CLASSES
   </td>
   <td>
   </td>
   <td>io.confluent.monitoring.clients.interceptor.MonitoringConsumerInterceptor
   </td>
  </tr>
  <tr>
   <td>CONNECT_PLUGIN_PATH
   </td>
   <td>
   </td>
   <td>/usr/share/java,/usr/share/confluent-hub-components
   </td>
  </tr>
  <tr>
   <td>CONNECT_LOG4J_LOGGERS
   </td>
   <td>
   </td>
   <td>org.apache.zookeeper=ERROR,org.I0Itec.zkclient=ERROR,org.reflections=ERROR
   </td>
  </tr>
  <tr>
   <td>CONNECT_KAFKA_JMX_PORT
   </td>
   <td>
   </td>
   <td>9584
   </td>
  </tr>
  <tr>
   <td>CONNECT_FETCH_MESSAGE_MAX_BYTES
   </td>
   <td>Important limit! Without it ton-node can’t work
   </td>
   <td>4000000
   </td>
  </tr>
  <tr>
   <td>CONNECT_MAX_REQUEST_SIZE
   </td>
   <td>Important limit! Without it ton-node can’t work
   </td>
   <td>4000000
   </td>
  </tr>
  <tr>
   <td>CONNECT_MAX_PARTITION_FETCH_BYTES
   </td>
   <td>Important limit! Without it ton-node can’t work
   </td>
   <td>4000000
   </td>
  </tr>
  <tr>
   <td>SCHEMA_REGISTRY_HOST_NAME
   </td>
   <td>
   </td>
   <td>schema-registry
   </td>
  </tr>
  <tr>
   <td>SCHEMA_REGISTRY_KAFKASTORE_CONNECTION_URL
   </td>
   <td>
   </td>
   <td>zookeeper:2181
   </td>
  </tr>
  <tr>
   <td>SCHEMA_REGISTRY_JMX_PORT
   </td>
   <td>
   </td>
   <td>9582
   </td>
  </tr>
  <tr>
   <td>ADVERTISED_LISTENER
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>telegram_user_ids
   </td>
   <td>List of TG IDs \
Check @getmyid_bot
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>telegram_bot_token
   </td>
   <td>TG Bot token \
Check @BotFather
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>grafana_username
   </td>
   <td>Grafana UI user
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>grafana_password
   </td>
   <td>Grafana UI password
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>auth
   </td>
   <td>Boolean \
If true basic auth will be configured for each endpoint
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>username
   </td>
   <td>Proxy auth user
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>password
   </td>
   <td>Proxy auth password
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>version
   </td>
   <td>Q-server git branch to build
   </td>
   <td>master
   </td>
  </tr>
  <tr>
   <td>VIRTUAL_HOST
   </td>
   <td>
   </td>
   <td>q-server
   </td>
  </tr>
  <tr>
   <td>VIRTUAL_PORT
   </td>
   <td>
   </td>
   <td>4000
   </td>
  </tr>
  <tr>
   <td>Q_DATABASE_SERVER
   </td>
   <td>
   </td>
   <td>arangodb:8529
   </td>
  </tr>
  <tr>
   <td>Q_SLOW_DATABASE_SERVER
   </td>
   <td>
   </td>
   <td>arangodbni:8529
   </td>
  </tr>
  <tr>
   <td>Q_REQUESTS_MODE
   </td>
   <td>
   </td>
   <td>kafka
   </td>
  </tr>
  <tr>
   <td>Q_REQUESTS_SERVER
   </td>
   <td>
   </td>
   <td>kafka:9092
   </td>
  </tr>
  <tr>
   <td>Q_REQUESTS_TOPIC
   </td>
   <td>
   </td>
   <td>requests
   </td>
  </tr>
  <tr>
   <td>Q_DATABASE_MAX_SOCKETS
   </td>
   <td>
   </td>
   <td>100
   </td>
  </tr>
  <tr>
   <td>Q_SLOW_DATABASE_MAX_SOCKETS
   </td>
   <td>
   </td>
   <td>20
   </td>
  </tr>
  <tr>
   <td>IMAGE
   </td>
   <td>Statsd docker image repo
   </td>
   <td>prom/statsd-exporter:v0.12.2
   </td>
  </tr>
  <tr>
   <td>ARGS
   </td>
   <td>
   </td>
   <td>--statsd.mapping-config=/statsd-mappings/statsd-mapping.yaml
   </td>
  </tr>
  <tr>
   <td>UDP_PORT
   </td>
   <td>
   </td>
   <td>9125
   </td>
  </tr>
  <tr>
   <td>TCP_PORT
   </td>
   <td>
   </td>
   <td>9102
   </td>
  </tr>
  <tr>
   <td>IntIP
   </td>
   <td>
   </td>
   <td>30303
   </td>
  </tr>
  <tr>
   <td>version
   </td>
   <td>DApp node git branch
   </td>
   <td>master
   </td>
  </tr>
  <tr>
   <td>ADNL_PORT
   </td>
   <td>
   </td>
   <td>30303
   </td>
  </tr>
  <tr>
   <td>VALIDATOR_NAME
   </td>
   <td>
   </td>
   <td>my_validator
   </td>
  </tr>
  <tr>
   <td>NETWORK_TYPE
   </td>
   <td>
   </td>
   <td>net.ton.dev
   </td>
  </tr>
  <tr>
   <td>CONFIGS_PATH
   </td>
   <td>
   </td>
   <td>/ton-node/configs
   </td>
  </tr>
  <tr>
   <td>STATSD_DOMAIN
   </td>
   <td>
   </td>
   <td>statsd:
   </td>
  </tr>
  <tr>
   <td>STATSD_PORT
   </td>
   <td>
   </td>
   <td>9125
   </td>
  </tr>
  <tr>
   <td>MEM_LIMIT
   </td>
   <td>
   </td>
   <td>32G
   </td>
  </tr>
  <tr>
   <td>STAKE
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>MSIG_ENABLE
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>SDK_URL
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>protocol
   </td>
   <td>Web.root protocol
   </td>
   <td>http
   </td>
  </tr>
</table>



## Kubernetes Platform setup

In case you don’t have Kubernetes installed the following instructions will describe how to spin up AWS VPC + EKS using Terraform.


### Prerequisites



1. Terraform installed


### Variables

Variables are described in the variables.tf file. But input values for those variables are in the terraform.tfvars file, so use it to override.


### Running terraform



1. Export credentials variables
```
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
export AWS_DEFAULT_REGION="us-west-2"
```
2. Navigate to project dir
```
cd terraform-vpc-eks-helm
```


3. Init providers
```
terraform init
```


4. Plan and see resources will be created
```
terraform plan
```


5. Create them
```
terraform apply
```


6. Destroy resources
```
terraform destroy
```

### Bare metal Kubernetes installation

1. Navigate to ansible-baremetal-k8s
2. Run ansible-playbook command (see readme in ansible dir)

## Logging 

Graylog stable helm chart is included in node_install script and will be installed automatically.

How to use - [https://github.com/helm/charts/tree/master/stable/graylog](https://github.com/helm/charts/tree/master/stable/graylog)


## Monitoring

Grafana stable helm chart is included in node_install script and will be installed automatically.

How to use  - [https://github.com/helm/charts/tree/master/stable/grafana](https://github.com/helm/charts/tree/master/stable/grafana)

## Maintainers

Telegram:

* @renatSK
* @sostrovskyi

Github:

* @ddzsh
* @samostrovskyi

Forum.freeton.org:
* @Gofman
* @sostrovskyi

Gmail:
* senegalelastico@gmail.com
* renatskitsan@gmail.com


FreeTON wallet address: 0:06c812287e994efba0640753a4f4bb5ef43e3caba6254cb0ae820ad7663ef815

Feel free to donate some crystals if you like this :)

## To do


1. Data persistence volumes for Kubernetes
2. Notifications for monitoring and logging alerts
