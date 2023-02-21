import 'package:get_x_mvvm/data/responses/Status.dart';

class ApiResponses<T>{
  Status? status;
  T? data;
  String? message;

  ApiResponses.loading() : status = Status.LOADING;
  ApiResponses.completed(this.data) : status = Status.COMPLETED;
  ApiResponses.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return ' .::API RESPONSE::. {status: $status, data: $data, message: $message}';
  }
}