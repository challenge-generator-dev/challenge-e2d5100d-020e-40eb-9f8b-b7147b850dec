package com.orders.api.infrastructure.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

public record OrderRequest(
    @NotBlank(message = "El ID del cliente es obligatorio")
    String customerId,
    @NotEmpty(message = "La orden debe contener al menos un elemento")
    @Valid
    List<OrderItemRequest> items
) {
    public record OrderItemRequest(
        @NotBlank(message = "El ID del producto es obligatorio")
        String productId,
        @NotNull(message = "La cantidad es obligatoria")
        Integer quantity,
        @NotNull(message = "El precio es obligatorio")
        BigDecimal price
    ) {}
}