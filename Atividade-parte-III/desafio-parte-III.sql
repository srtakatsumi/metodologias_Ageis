CREATE TABLE `clientes` (
    `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    `name` TEXT NOT NULL,
    `last_name` TEXT NOT NULL,
    `CPF` INTEGER NOT NULL,
    `telephone` TEXT NOT NULL,
    `birthday` TEXT NOT NULL,
    `email` TEXT NOT NULL
);

CREATE TABLE `pedidos`(
    `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    `id_cliente` INTEGER NOT NULL,
    `valor_total` REAL NOT NULL,
    `date` INTEGER NOT NULL,
    FOREIGN KEY (`date`) REFERENCES `clientes`(`id`),
    FOREIGN KEY (`id_cliente`) REFERENCES `clientes`(`id`)
);
    
CREATE TABLE `products`(

    `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    `name` TEXT NOT NULL,
    `qtd_estoque` INTEGER NOT NULL,
    `valor_product` REAL NOT NULL,
    FOREIGN KEY (`qtd_estoque`) REFERENCES `pedidos`(`id`)
    );

// criando tabela no cód.
// as crases são utilizadas no json
CREATE TABLE `pedidos_product`(

    `id_pedidos` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    `id_products` INTEGER NOT NULL,
    `id_cliente` INTEGER NOT NULL,
    `value` REAL NOT NULL,
    `qtd_vendidos` INTEGER NOT NULL,
    FOREIGN KEY (`value`) REFERENCES `products`(`valor_product`),
    FOREIGN KEY (`qtd_vendidos`) REFERENCES `products`(`qtd_estoque`),
    FOREIGN KEY (`id_products`) REFERENCES `products`(`id`),
    FOREIGN KEY (`id_cliente`) REFERENCES `clientes`(`id`),
    FOREIGN KEY (`id_pedidos`) REFERENCES `pedidos`(`id`)
);
