
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/base/base_controller.dart';
import '../../../../app/data/repository/client/client_repository.dart';
import '../../../../app/data/model/client/client_model.dart';
import '../../../routes/app_pages.dart';

class ClientController extends BaseController {
  final ClientRepository _repository;

  ClientController(this._repository);

  final RxList<ClientData> clientList = <ClientData>[].obs;
  final RxInt page = 1.obs;
  final RxBool hasMore = true.obs;
  final ScrollController scrollController = ScrollController();

  // Create Client Form
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    getClients(page.value);
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent && hasMore.value) {
      getClients(page.value + 1);
    }
  }

  void getClients(int pageNum) {
    if (pageNum == 1) {
      clientList.clear();
      page.value = 1;
      hasMore.value = true;
    }

    callDataService(
      _repository.getClients(pageNum),
      onSuccess: (response) {
        if (response.results?.data != null && response.results!.data!.isNotEmpty) {
          clientList.addAll(response.results!.data!);
          page.value = pageNum;
        } else {
          hasMore.value = false;
        }
      },
    );
  }

  void createClient() {
    if (nameController.text.isEmpty || phoneController.text.isEmpty) {
      showErrorMessage("Name and Phone are required");
      return;
    }

    var data = {
      "first_name": nameController.text,
      "phone": phoneController.text,
      "email": emailController.text,
      "address": addressController.text,
      "opening_balance": 0, // Default for now
    };

    callDataService(
      _repository.createClient(data),
      onSuccess: (response) {
        showSuccessMessage("Client Created Successfully");
        Get.back(); // Close form
        getClients(1); // Refresh list
      },
    );
  }
  
  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
