package org.rbhk.supplierservice;

import org.rbhk.supplierservice.dao.SupplierRepository;
import org.rbhk.supplierservice.model.Supplier;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;

import java.util.stream.Stream;

@SpringBootApplication
public class SupplierServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(SupplierServiceApplication.class, args);
    }
    @Bean
    CommandLineRunner start(SupplierRepository supplierRepository, RepositoryRestConfiguration repositoryRestConfiguration){
        return args -> {
            repositoryRestConfiguration.exposeIdsFor(Supplier.class);
            Stream.of("IBM", "HP", "SAMSUNG").forEach(name ->{
                supplierRepository.save(new Supplier(null, name, name + "@gmail.com"));
            });
        };
    }

}
