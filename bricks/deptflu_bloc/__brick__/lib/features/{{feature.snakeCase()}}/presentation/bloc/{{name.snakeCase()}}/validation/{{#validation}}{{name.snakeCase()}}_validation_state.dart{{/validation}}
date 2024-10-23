part of '{{name.snakeCase()}}_validation_cubit.dart';

{{#using_equatable}}
class {{name.pascalCase()}}ValidationState extends Equatable {
  final NormalStringInput name; // Change as you need 
  final NormalStringInput address;  // Change as you need
  final bool isFormValid;

  const {{name.pascalCase()}}ValidationState({
    this.name = const NormalStringInput.pure(),
    this.address = const NormalStringInput.pure(),
    this.isFormValid = false,
  });

  @override
  List<Object> get props => [
    isFormValid,
    name, 
    address,
  ];

  {{name.pascalCase()}}ValidationState copyWith({
    bool? isFormValid,
    NormalStringInput? name,
    NormalStringInput? address,
  }) => 
  {{name.pascalCase()}}ValidationState(
    isFormValid: isFormValid ?? this.isFormValid,
    name: name ?? this.name,
    address: address ?? this.address,
  );
}
{{/using_equatable}}

{{#using_freezed}}
@freezed
class {{name.pascalCase()}}ValidationState with _${{name.pascalCase()}}ValidationState {
  const factory {{name.pascalCase()}}ValidationState({
    @Default(NormalStringInput.pure()) NormalStringInput name,    // Change as you need
    @Default(NormalStringInput.pure()) NormalStringInput address, // Change as you need
    @Default(false) bool isFormValid,
  }) = _{{name.pascalCase()}}ValidationState;
}
{{/using_freezed}}