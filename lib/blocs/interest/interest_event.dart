part of 'interest_bloc.dart';

abstract class InterestEvent extends Equatable {
  const InterestEvent();

  @override
  List<Object> get props => [];
}

class SubmitEvent extends InterestEvent {
  final InterestModel interestModel;

  SubmitEvent(this.interestModel);
}

class ScreenStarted extends InterestEvent {}

class StateSelectedEvent extends InterestEvent {
  final EstadosModel estado;

  StateSelectedEvent({this.estado});

  @override
  List<Object> get props => [estado];
}

class CitySelectedEvent extends InterestEvent {}
