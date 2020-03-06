package org.rbhk.ecomapp;

import org.rbhk.ecomapp.dao.ProductRepository;
import org.rbhk.ecomapp.models.Product;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class EcomAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(EcomAppApplication.class, args);
	}
	@Bean
	CommandLineRunner start(ProductRepository productRepository){
		return args -> {
			productRepository.save(new Product(null, "hp", 8000));
			productRepository.save(new Product(null, "test", 8000));
			productRepository.save(new Product(null, "s10", 8000));
			productRepository.findAll().forEach(p->{
				System.out.println(p.getName());
			});
		};
	}
}
