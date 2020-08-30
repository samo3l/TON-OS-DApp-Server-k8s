# Input values for AWS VPC variables
region="us-east-1"
availability_zones=["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
environment="dev"
vpc_name="tonos-dapp-vpc"
vpc_cidr="10.0.0.0/16"
vpc_private_subnets=["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
vpc_public_subnets=["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

# Input values for AWS EKS variables
cluster_name="tonos-dapp-eks"
instance_type="t2.large"
asg_min_size="2"
asg_max_size="5"
# base 64 encoded public key to login into EKS cluster workers
cluster_public_key="c3NoLXJzYSBBQUFBQjNOemFDMXljMkVBQUFBREFRQUJBQUFCQVFEaDAwd0h4T3dQd1RSTkpVSEtPS1BtV3NHanl2bTlyTzJQa004R2hQNUh1cnI2eVJYZzVpMkRlaWFYUXVZTzdPaUxZQzdHcllCSGlHWWFBeStjUDdXZ2pBUDduNHJoR1hCRi9CTkNSQ3hvVURMU2hlSkcveGl2emxkaThuMWh6WUVGR1YrMkU4Nmc3eHRzNUQzVllrbVlySE16WUFTa3JVcDhYS0MxSnNJeHhaK1ovZXBESkhTSmRUNzg1cnY2N0xPQjJyd1hPQW40RUlwS2hieGxwaitLQW5TT3U1QTIrdmlxL29VLzlndTNyNHlRNEZiWTJ3TDdyRysrQy9TU3hrL09KbDFZR2dJeUZNK055Um1VUW1LcUlObk9VSHg5UkwxcE8wQVlCbmJUN0s3UHAxejJwRUNvRFZyY2EzU1J3UnhVREx5OWplVkdDR0Uwa2xCUWdDV1AK"
cidr_workers_ssh=["0.0.0.0/0"]
