package com.orders.api.infrastructure;

import com.orders.api.domain.Order;
import com.orders.api.domain.OrderRepository;
import com.orders.api.domain.Order.OrderItem;
import com.orders.api.domain.Order.OrderStatus;
import org.springframework.stereotype.Repository;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedClient;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;
import software.amazon.awssdk.enhanced.dynamodb.Key;
import software.amazon.awssdk.enhanced.dynamodb.TableSchema;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbPartitionKey;
import software.amazon.awssdk.services.dynamodb.model.DynamoDbException;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public class OrderDynamoDBRepository implements OrderRepository {

    private final DynamoDbTable<OrderEntity> orderTable;

    public OrderDynamoDBRepository(DynamoDbEnhancedClient dynamoDbEnhancedClient) {
        this.orderTable = dynamoDbEnhancedClient.table("Orders", TableSchema.fromBean(OrderEntity.class));
    }

    @Override
    public Order save(Order order) {
        OrderEntity entity = toEntity(order);
        orderTable.putItem(entity);
        return toDomain(entity);
    }

    @Override
    public Optional<Order> findById(UUID id) {
        try {
            OrderEntity entity = orderTable.getItem(Key.builder().partitionValue(id.toString()).build());
            return Optional.ofNullable(entity).map(this::toDomain);
        } catch (DynamoDbException e) {
            throw new OrderPersistenceException("Error retrieving order from DynamoDB", e);
        }
    }

    @Override
    public Order update(Order order) {
        OrderEntity entity = toEntity(order);
        orderTable.updateItem(entity);
        return toDomain(entity);
    }

    @Override
    public void deleteById(UUID id) {
        orderTable.deleteItem(Key.builder().partitionValue(id.toString()).build());
    }

    private OrderEntity toEntity(Order order) {
        OrderEntity entity = new OrderEntity();
        entity.setId(order.getId().toString());
        entity.setCustomerId(order.getCustomerId());
        entity.setItems(order.getItems());
        entity.setStatus(order.getStatus().name());
        entity.setCreatedAt(order.getCreatedAt());
        entity.setUpdatedAt(order.getUpdatedAt());
        return entity;
    }

    private Order toDomain(OrderEntity entity) {
        return Order.builder()
                .id(UUID.fromString(entity.getId()))
                .customerId(entity.getCustomerId())
                .items(entity.getItems())
                .status(OrderStatus.valueOf(entity.getStatus()))
                .createdAt(entity.getCreatedAt())
                .updatedAt(entity.getUpdatedAt())
                .build();
    }

    @DynamoDbBean
    public static class OrderEntity {
        private String id;
        private String customerId;
        private List<OrderItem> items;
        private String status;
        private LocalDateTime createdAt;
        private LocalDateTime updatedAt;

        @DynamoDbPartitionKey
        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getCustomerId() {
            return customerId;
        }

        public void setCustomerId(String customerId) {
            this.customerId = customerId;
        }

        public List<OrderItem> getItems() {
            return items;
        }

        public void setItems(List<OrderItem> items) {
            this.items = items;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public LocalDateTime getCreatedAt() {
            return createdAt;
        }

        public void setCreatedAt(LocalDateTime createdAt) {
            this.createdAt = createdAt;
        }

        public LocalDateTime getUpdatedAt() {
            return updatedAt;
        }

        public void setUpdatedAt(LocalDateTime updatedAt) {
            this.updatedAt = updatedAt;
        }
    }

    public static class OrderPersistenceException extends RuntimeException {
        public OrderPersistenceException(String message, Throwable cause) {
            super(message, cause);
        }
    }
}