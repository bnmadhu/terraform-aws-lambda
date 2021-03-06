# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "function_name" {
  description = "A unique name for your Lambda Function."
}

variable "handler" {
  description = "The function entrypoint in your code."
}

variable "runtime" {
  description = "The runtime environment for the Lambda function you are uploading."
}


# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "description" {
  description = "Description of what your Lambda Function does."
  default     = ""
}

variable "environment" {
  description = "Environment (e.g. env variables) configuration for the Lambda function enable you to dynamically pass settings to your function code and libraries"
  default     = null
  type = object({
    variables = map(string)
  })
}

variable "event" {
  description = "Event source configuration which triggers the Lambda function. Supported events: cloudwatch-scheduled-event, dynamodb, s3, sns"
  default     = {}
  type        = map(string)
}

variable "filename" {
  description = "The path to the function's deployment package within the local filesystem. If defined, The s3_-prefixed options cannot be used."
  default     = ""
}

variable "kms_key_arn" {
  description = "Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables. If this configuration is not provided when environment variables are in use, AWS Lambda uses a default service key. If this configuration is provided when environment variables are not in use, the AWS Lambda API does not save this configuration and Terraform will show a perpetual difference of adding the key. To fix the perpetual difference, remove this configuration."
  default     = ""
}

variable "layers" {
  description = "List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function."
  default     = []
  type        = list(string)
}

variable "log_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. Defaults to 14."
  default     = 14
}

variable "logfilter_destination_arn" {
  description = "The ARN of the destination to deliver matching log events to. Kinesis stream or Lambda function ARN."
  default     = ""
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128."
  default     = 128
}

variable "publish" {
  description = "Whether to publish creation/change as new Lambda Function Version. Defaults to false."
  default     = false
}

variable "reserved_concurrent_executions" {
  description = "The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1."
  default     = "-1"
}

variable "s3_bucket" {
  description = "The S3 bucket location containing the function's deployment package. Conflicts with filename. This bucket must reside in the same AWS region where you are creating the Lambda function."
  default     = ""
}

variable "s3_key" {
  description = " The S3 key of an object containing the function's deployment package. Conflicts with filename."
  default     = ""
}

variable "s3_object_version" {
  description = "The object version containing the function's deployment package. Conflicts with filename."
  default     = ""
}

variable "source_code_hash" {
  description = "Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key. The usual way to set this is filebase64sha256('file.zip') where 'file.zip' is the local filename of the lambda function source archive."
  default     = ""
}

variable "ssm" {
  description = "List of AWS Systems Manager Parameter Store parameter names. The IAM role of this Lambda function will be enhanced with read permissions for those parameters. Parameters must start with a forward slash and can be encrypted with the default KMS key."
  default     = null
  type = object({
    parameter_names = list(string)
  })
}

variable "ssm_parameter_names" {
  description = "DEPRECATED: use `ssm` object instead. This variable will be removed in version 6 of this module. (List of AWS Systems Manager Parameter Store parameters this Lambda will have access to. In order to decrypt secure parameters, a kms_key_arn needs to be provided as well.)"
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the Lambda function and all resources supporting tags."
  default     = {}
  type        = map(string)
}

variable "timeout" {
  description = "The amount of time your Lambda Function has to run in seconds. Defaults to 3."
  default     = 3
}

variable "vpc_config" {
  description = "Provide this to allow your function to access your VPC (if both 'subnet_ids' and 'security_group_ids' are empty then vpc_config is considered to be empty or unset, see https://docs.aws.amazon.com/lambda/latest/dg/vpc.html for details)."
  default     = null
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })
}
