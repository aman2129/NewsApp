part of 'internet_bloc.dart';

@immutable
abstract class InternetEvents {}

class InternetLostEvent extends InternetEvents {}

class InternetGainedEvent extends InternetEvents {}