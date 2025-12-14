class OrderManager {
  // Lista estática para almacenar los pedidos (persiste mientras la app esté abierta)
  // ignore: prefer_final_fields
  static List<Map<String, String>> _pedidos = [
    {'cliente': 'Camilo', 'producto': 'Sofá'},
    {'cliente': 'Dayana', 'producto': 'Comedor'},
    {'cliente': 'Gonzalo', 'producto': 'Cama'},
    {'cliente': 'Duban', 'producto': 'Colchón'},
  ];

  // Getter para obtener la lista de pedidos (devuelve una copia)
  static List<Map<String, String>> get pedidos => [..._pedidos];

  // Método para agregar un nuevo pedido
  static void addPedido(String cliente, String producto) {
    _pedidos.add({'cliente': cliente, 'producto': producto});
  }
}