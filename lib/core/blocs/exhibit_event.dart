part of 'exhibit_bloc.dart';

extension ExhibitBlocX on ExhibitBloc {
  void load() {
    add(const _Load());
  }
}

abstract class ExhibitEvent extends Equatable {
  const ExhibitEvent();

  @override
  List<Object?> get props => [];
}

class _Load extends ExhibitEvent {
  const _Load();
}
