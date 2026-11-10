package com.orders.api.domain;

import java.util.Optional;
import java.util.UUID;

public interface OrderRepository {
    Order save(Order order);
    Optional<Order> findById(UUID id);
    Order update(Order order);
    void deleteById(UUID id);
}