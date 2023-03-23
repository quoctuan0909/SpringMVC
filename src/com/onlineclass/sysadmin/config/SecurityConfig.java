package com.onlineclass.sysadmin.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	auth.inMemoryAuthentication().withUser("quoctuan").password(passwordEncoder().encode("quoctuan123")).roles("USER");
    	auth.inMemoryAuthentication().withUser("admin").password(passwordEncoder().encode("admin123")).roles("USER", "ADMIN");
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.formLogin().loginPage("/login").usernameParameter("username").passwordParameter("password");
        httpSecurity.formLogin().defaultSuccessUrl("/").failureUrl("/login?error");
        httpSecurity.logout().logoutSuccessUrl("/login?logout");
        httpSecurity.exceptionHandling().accessDeniedPage("/login?accessDenied");
        
        httpSecurity.authorizeRequests().antMatchers("/").permitAll()
        .antMatchers("/**/new").access("hasRole('ADMIN')")
        .antMatchers("/**/edit").access("hasRole('ADMIN')")
        .antMatchers("/**/adminuser").access("hasRole('USER')");
        
        httpSecurity.csrf().disable();
    }
    
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}

