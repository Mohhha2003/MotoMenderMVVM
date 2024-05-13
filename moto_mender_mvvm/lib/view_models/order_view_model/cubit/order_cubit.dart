import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/models/order_request/order_request.dart';
import 'package:moto_mender_mvvm/repos/orders_repo.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.repo) : super(OrderInitial()) {
    getUserOrders();
  }

  final OrdersRepo repo;

  Future<void> getUserOrders() async {
    emit(OrdersLoading());
    final response =
        await repo.getUserOrders(userId: CacheHelper.currentUser.id!);
    response.fold((errorMessage) => emit(OrdersFailed(message: errorMessage)),
        (orders) {
      emit(OrdersSucces(orders: orders));
    });
  }
}
