enum ProjectStatus {
  em_andamento(label: "Em andamento"),
  finalizando(label: "Finalizando");

  final String label;

  const ProjectStatus({required this.label});
}