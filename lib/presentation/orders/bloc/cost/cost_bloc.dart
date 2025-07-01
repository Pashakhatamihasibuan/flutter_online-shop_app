import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onlineshop_app/data/models/responses/cost_respoonse_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cost_event.dart';
part 'cost_state.dart';
part 'cost_bloc.freezed.dart';

class CostBloc extends Bloc<CostEvent, CostState> {
  CostBloc() : super(const CostState.initial()) {
    on<GetCost>((event, emit) async {
      emit(const CostState.loading());
      try {
        // Simulate API call - replace with actual API call
        await Future.delayed(const Duration(seconds: 1));

        // Try to load from assets first (for testing)
        try {
          final response = await rootBundle.loadString('assets/json/cost.json');
          final decodedResponse = jsonDecode(response);
          final costResponse = CostResponseModel.fromMap(decodedResponse);
          emit(CostState.loaded(costResponse));
        } catch (assetError) {
          // If assets not available, create mock data
          final mockResponse = _createMockCostResponse(
            event.origin,
            event.destination,
            event.weight,
            event.courier,
          );
          emit(CostState.loaded(mockResponse));
        }
      } catch (e) {
        emit(CostState.error('Gagal memuat data ongkos kirim: $e'));
      }
    });
  }

  // Create mock data when real API is not available
  CostResponseModel _createMockCostResponse(
    String origin,
    String destination,
    String weight,
    String courier,
  ) {
    final List<Map<String, dynamic>> mockCosts;

    switch (courier.toLowerCase()) {
      case 'jne':
        mockCosts = [
          {
            "service": "REG",
            "description": "Reguler",
            "cost": [
              {"value": 15000, "etd": "2-3", "note": ""}
            ]
          },
          {
            "service": "OKE",
            "description": "Ongkos Kirim Ekonomis",
            "cost": [
              {"value": 12000, "etd": "3-4", "note": ""}
            ]
          },
          {
            "service": "YES",
            "description": "Yakin Esok Sampai",
            "cost": [
              {"value": 25000, "etd": "1-1", "note": ""}
            ]
          }
        ];
        break;
      case 'pos':
        mockCosts = [
          {
            "service": "Paket Kilat Khusus",
            "description": "Paket Kilat Khusus",
            "cost": [
              {"value": 18000, "etd": "2-4", "note": ""}
            ]
          },
          {
            "service": "Express Next Day",
            "description": "Express Next Day",
            "cost": [
              {"value": 30000, "etd": "1-1", "note": ""}
            ]
          }
        ];
        break;
      case 'tiki':
      default:
        mockCosts = [
          {
            "service": "REG",
            "description": "Regular Service",
            "cost": [
              {"value": 16000, "etd": "2-3", "note": ""}
            ]
          },
          {
            "service": "ECO",
            "description": "Economy Service",
            "cost": [
              {"value": 13000, "etd": "3-5", "note": ""}
            ]
          },
          {
            "service": "ONS",
            "description": "Over Night Service",
            "cost": [
              {"value": 28000, "etd": "1-1", "note": ""}
            ]
          }
        ];
        break;
    }

    final mockData = {
      "rajaongkir": {
        "query": {
          "origin": origin,
          "destination": destination,
          "weight": int.tryParse(weight) ?? 1000,
          "courier": courier
        },
        "status": {"code": 200, "description": "OK"},
        "results": [
          {
            "code": courier.toUpperCase(),
            "name": courier.toUpperCase(),
            "costs": mockCosts
          }
        ]
      }
    };

    return CostResponseModel.fromMap(mockData);
  }
}
