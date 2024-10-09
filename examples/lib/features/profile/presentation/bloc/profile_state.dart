part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileStateInit extends ProfileState {}

class EuyState extends Equatable {
  final BaseStatus status;
  final int page;
  final int limit;
  final bool isLoadMore;
  final List<dynamic> data;
  final int? statusCode;
  final String? message;
  final AppFailure? failure;

  const EuyState({
    this.status = BaseStatus.init,
    this.page = 1,
    this.limit = 10,
    this.isLoadMore = false,
    this.data = const [],
    this.statusCode,
    this.message,
    this.failure,
  });

  @override
  List<Object> get props => [
        status,
        page,
        limit,
        isLoadMore,
        data,
        [
          statusCode,
          message,
          failure,
        ],
      ];

  EuyState copyWith({
    BaseStatus? status,
    int? page,
    int? limit,
    bool? isLoadMore,
    List<dynamic>? data,
    int? statusCode,
    String? message,
    AppFailure? failure,
  }) =>
      EuyState(
        status: status ?? this.status,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        isLoadMore: isLoadMore ?? this.isLoadMore,
        data: data ?? this.data,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        failure: failure ?? this.failure,
      );
}
