# Example of parsing json out of a field and modifying the metric with it.
# this is great to use in conjunction with the value parser.
#
# Example Input:
# json value="{\"label\": \"hero\", \"count\": 14}" 1465839830100400201
#
# Example Output:
# json,label=hero count=14i 1465839830100400201

load("json", "encode", "decode", "indent")

def apply(metric):
    j = decode(metric.fields.get('value'))
    metric.fields.pop('value')
    metric.tags["label"] = j.get("label")
    metric.fields["count"] = j.get("count")
    return metric
