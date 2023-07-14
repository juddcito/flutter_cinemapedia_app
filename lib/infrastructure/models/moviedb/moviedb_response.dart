
class SactiDbResponse {
    final dynamic search;
    final int pageIndex;
    final int pageSize;
    final int total;
    final List<Register> registers;
    final int totalPages;
    final bool hasPreviusPage;
    final bool hasNextPage;

    SactiDbResponse({
        this.search,
        required this.pageIndex,
        required this.pageSize,
        required this.total,
        required this.registers,
        required this.totalPages,
        required this.hasPreviusPage,
        required this.hasNextPage,
    });

    factory SactiDbResponse.fromJson(Map<String, dynamic> json) => SactiDbResponse(
        search: json["search"],
        pageIndex: json["pageIndex"],
        pageSize: json["pageSize"],
        total: json["total"],
        registers: List<Register>.from(json["registers"].map((x) => Register.fromJson(x))),
        totalPages: json["totalPages"],
        hasPreviusPage: json["hasPreviusPage"],
        hasNextPage: json["hasNextPage"],
    );

    Map<String, dynamic> toJson() => {
        "search": search,
        "pageIndex": pageIndex,
        "pageSize": pageSize,
        "total": total,
        "registers": List<dynamic>.from(registers.map((x) => x.toJson())),
        "totalPages": totalPages,
        "hasPreviusPage": hasPreviusPage,
        "hasNextPage": hasNextPage,
    };
}

class Register {
    final int id;
    final String nombre;
    final int precio;
    final int marcaId;
    final String marca;
    final int categoriaId;
    final String categoria;

    Register({
        required this.id,
        required this.nombre,
        required this.precio,
        required this.marcaId,
        required this.marca,
        required this.categoriaId,
        required this.categoria,
    });

    factory Register.fromJson(Map<String, dynamic> json) => Register(
        id: json["id"],
        nombre: json["nombre"],
        precio: json["precio"],
        marcaId: json["marcaId"],
        marca: json["marca"],
        categoriaId: json["categoriaId"],
        categoria: json["categoria"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "precio": precio,
        "marcaId": marcaId,
        "marca": marca,
        "categoriaId": categoriaId,
        "categoria": categoria,
    };
}
