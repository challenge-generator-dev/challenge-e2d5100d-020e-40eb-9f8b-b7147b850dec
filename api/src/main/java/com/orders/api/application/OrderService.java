package com.orders.api.application;

import com.orders.api.domain.Order;
import com.orders.api.domain.Order.OrderItem;
import com.orders.api.domain.Order.OrderStatus;
import com.orders.api.domain.OrderRepository;
import com.orders.api.infrastructure.dto.OrderRequest;
import com.orders.api.infrastructure.dto.OrderResponse;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public OrderResponse createOrder(OrderRequest request) {
        if (request == null) {
            throw new IllegalArgumentException("La solicitud de orden no puede ser nula");
        }

        Order order = new Order();
        order.setId(UUID.randomUUID());
        order.setCustomerId(request.customerId());
        order.setStatus(OrderStatus.PENDING);
        order.setCreatedAt(LocalDateTime.now());
        order.setUpdatedAt(LocalDateTime.now());

        List<OrderItem> items = request.items().stream()
            .map(itemReq -> {
                OrderItem item = new OrderItem();
                item.setProductId(itemReq.productId());
                item.setQuantity(itemReq.quantity());
                item.setPrice(itemReq.price().doubleValue());
                return item;
            })
            .collect(Collectors.toList());
        order.setItems(items);

        Order savedOrder = orderRepository.save(order);
        return OrderResponse.fromDomain(savedOrder);
    }

    public Optional<OrderResponse> getOrder(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }

        return orderRepository.findById(id)
            .map(OrderResponse::fromDomain);
    }

    public Optional<OrderResponse> updateOrder(UUID id, OrderRequest request) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }
        if (request == null) {
            throw new IllegalArgumentException("La solicitud de orden no puede ser nula");
        }

        Optional<Order> existingOrderOpt = orderRepository.findById(id);
        if (existingOrderOpt.isEmpty()) {
            return Optional.empty();
        }

        Order existingOrder = existingOrderOpt.get();
        existingOrder.setCustomerId(request.customerId());
        existingOrder.setUpdatedAt(LocalDateTime.now());

        List<OrderItem> items = request.items().stream()
            .map(itemReq -> {
                OrderItem item = new OrderItem();
                item.setProductId(itemReq.productId());
                item.setQuantity(itemReq.quantity());
                item.setPrice(itemReq.price().doubleValue());
                return item;
            })
            .collect(Collectors.toList());
        existingOrder.setItems(items);

        Order updatedOrder = orderRepository.update(existingOrder);
        return Optional.of(OrderResponse.fromDomain(updatedOrder));
    }

    public boolean deleteOrder(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }

        Optional<Order> existingOrder = orderRepository.findById(id);
        if (existingOrder.isEmpty()) {
            return false;
        }

        orderRepository.deleteById(id);
        return true;
    }
}