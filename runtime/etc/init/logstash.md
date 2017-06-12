## Logstash Integration

## Configuration

```yaml
logstash:
  enabled: true
  # Name of the kinesis stream logstash is sending the logs to
  # Mandatory - default: 'logging'
  kinesis_stream: "|Ref|logStreamName"
  # Region where the stream is located
  # Optional - default: region of the instance
  kinesis_region: "eu-central-1"
  # Output every event on the host to stdout - use `docker logs logstash` to view
  # Optional - default: false
  debug: true
  # Every log event contains all key/value pairs
  tags:
    origin: "|Ref|AWS::StackName"
    foo: "bar"
  mutates:
    # convert all *_int fields to float
    - 'convert => { "*_int" => "float" }'
    # converts 'level' value to a string
    - 'convert => { "level" => "string" }'
```
