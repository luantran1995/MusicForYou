package nashtech.luantran.musicstore.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;


@Configuration
@EnableWebSecurity
@ComponentScan(basePackages= {"com.luantran.nashtech.musicstore.service"})
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
		@Autowired
		@Qualifier("userDetailsService")
	    private UserDetailsService userDetailsService;

	    @Autowired
	    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
	        auth.userDetailsService(userDetailsService);
	    }
	    @Bean
	    @Override
	    public AuthenticationManager authenticationManagerBean() throws Exception {
	        return super.authenticationManagerBean();
	    }
//	    @Bean(name="bCryptPasswordEncoder")
//	    public PasswordEncoder getPasswordEncoder() {
//	        return new BCryptPasswordEncoder();
//	    }
	    @Override
	    protected void configure(HttpSecurity http) throws Exception {
//	    	http
		    	 http.csrf().disable()
	        .authorizeRequests()
            .antMatchers("/**").permitAll()
//            .antMatchers("/").hasRole("MEMBER")
            .antMatchers("/admin/**").hasRole("ADMIN")
            .and()
        .formLogin()
        .loginPage("/login")
        .usernameParameter("email")
        .passwordParameter("password")
        .defaultSuccessUrl("/")
        .failureUrl("/login?error")
        
	    .and()
	    .logout()
	    .logoutUrl("/logout")   
	    .logoutSuccessUrl("/login") 
	    .and()
	    .exceptionHandling().accessDeniedPage("/403");;
	

}
	   

}
