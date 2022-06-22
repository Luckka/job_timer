enum ProjectStatus {
  em_andamento(label: "Em andamento"),
  finalizando(label: "Finalizado");

  final String label;

  const ProjectStatus({required this.label});
}