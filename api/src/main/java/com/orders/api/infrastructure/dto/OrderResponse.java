package com.orders.api.infrastructure.dto;

import com.orders.api.domain.Order;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

public record OrderResponse(
    String id,
    String customerId,
    List<OrderItemResponse> items,
    String status,
    BigDecimal total,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {
    public record OrderItemResponse(
        String productId,
        Integer quantity,
        BigDecimal price,
        BigDecimal subtotal
    ) {}

    public static OrderResponse fromDomain(Order order) {
        if (order == null) {
            return null;
        }
        
        BigDecimal total = order.getItems() != null 
            ? order.getItems().stream()
                .map(item -> BigDecimal.valueOf(item.getPrice()).multiply(BigDecimal.valueOf(item.getQuantity())))
                .reduce(BigDecimal.ZERO, BigDecimal::add)
            : BigDecimal.ZERO;

        List<OrderItemResponse> itemResponses = order.getItems() != null
            ? order.getItems().stream()
                .map(item -> {
                    BigDecimal itemPrice = BigDecimal.valueOf(item.getPrice());
                    BigDecimal itemSubtotal = itemPrice.multiply(BigDecimal.valueOf(item.getQuantity()));
                    return new OrderItemResponse(
                        item.getProductId(),
                        item.getQuantity(),
                        itemPrice,
                        itemSubtotal
                    );
                })
                .collect(Collectors.toList())
            : List.of();

        return new OrderResponse(
            order.getId() != null ? order.getId().toString() : null,
            order.getCustomerId(),
            itemResponses,
            order.getStatus() != null ? order.getStatus().name() : "UNKNOWN",
            total,
            order.getCreatedAt(),
            order.getUpdatedAt()
        );
    }
}