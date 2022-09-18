part of 'slider_cubit.dart';

abstract class SliderState extends Equatable {
  const SliderState();

  @override
  List<Object> get props => [];
}

class SliderInitial extends SliderState {}

class SliderLoaded extends SliderState {
  final List<Slider> slider;

  const SliderLoaded(this.slider);

  @override
  List<Object> get props => [slider];
}

class SliderUnLoaded extends SliderState {
  final String message;

  const SliderUnLoaded(this.message);

  @override
  List<Object> get props => [message];
}

class LoadSlider extends SliderState {}
