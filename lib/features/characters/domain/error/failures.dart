import 'package:rick_and_morty_app/core/error/failures.dart';

class DeleteCharacterFailure extends Failure {
  const DeleteCharacterFailure([
    super.message = "Ocurrió un error al eliminar personaje",
  ]);
}

class GetCharactersFailure extends Failure {
  const GetCharactersFailure([
    super.message = "Ocurrió un error al obtener personajes",
  ]);
}

class SaveCharacterFailure extends Failure {
  const SaveCharacterFailure([
    super.message = "Ocurrió un error al guardar personaje",
  ]);
}

class NoCharactersFoundFailure extends Failure {
  const NoCharactersFoundFailure([
    super.message = "No se encontraron personajes",
  ]);
}
