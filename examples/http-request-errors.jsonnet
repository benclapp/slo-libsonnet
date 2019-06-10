local slo = import '../jsonnet/sla-mixin/mixin.libsonnet';

{
  local errors = slo.errors({
    metric: 'promhttp_metric_handler_requests_total',
    warning: 5,  // 5% of total requests
    critical: 10,  // 10% of total requests
    jobSelector: 'job: fooapp',
    namespaceSelector: 'namespace: default',
  }),

  // Output these as example
  recordingrule: errors.recordingrule,
  alerts: [
    errors.alertWarning,
    errors.alertCritical,
  ],

  // gauge: errors.grafana.gauge,
}
