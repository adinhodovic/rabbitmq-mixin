{
  prometheusRules+:: {
    groups+: [
      {
        name: 'rabbitmq.rules',
        rules: [
          {
            record: 'rabbitmq_queue_info',
            expr: |||
              rabbitmq_detailed_queue_consumers * on(instance) group_left(rabbitmq_cluster, rabbitmq_node) rabbitmq_identity_info
            ||| % $._config,
          },
        ],
      },
    ],
  },
}
