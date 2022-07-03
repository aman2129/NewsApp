part of 'internet_bloc.dart';

@immutable
abstract class InternetStates {}

class InternetInitialState extends InternetStates {}

class InternetGainedState extends InternetStates {}

class InternetLostState extends InternetStates {}