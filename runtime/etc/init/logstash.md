## Logstash Integration

## Configuration

```yaml
logstash:
  enabled: true
  kinesis_stream: "|Ref|logStreamName"
  # Every log event contains all key/value pairs
  tags:
    origin: "|Ref|AWS::StackName"
    foo: "bar"
  mutates:
    # convert all *_int to numbers
    - 'convert => { "*_int" => "number" }'
    # converts 'level' value to a string
    - 'convert => { "level" => "string" }'
```
