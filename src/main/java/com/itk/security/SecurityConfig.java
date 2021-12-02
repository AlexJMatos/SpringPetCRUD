package com.itk.security;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity
@ComponentScan(basePackages = "com.itk")
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// Add users using in memory authentication
		@SuppressWarnings("deprecation")
		UserBuilder users = User.withDefaultPasswordEncoder();

		auth.inMemoryAuthentication()
			.withUser(users.username("alex").password("test123").roles("USER"))
			.withUser(users.username("itk").password("itk").roles("USER"))
			.withUser(users.username("admin").password("admin").roles("ADMIN"));
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/").hasAnyRole("ANONYMOUS", "USER", "ADMIN")
				.antMatchers("/list").hasAnyRole("USER", "ADMIN")
				.antMatchers("/add/**", "/save/**", "/update/**", "/delete/**").hasRole("ADMIN")
				.and().formLogin()
				.loginPage("/loginForm").loginProcessingUrl("/authenticateTheUser").permitAll()
				.and().logout().permitAll()
				.and().exceptionHandling().accessDeniedPage("/access-denied");
	}
}
