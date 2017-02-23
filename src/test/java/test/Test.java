package test;

import org.junit.internal.runners.JUnit4ClassRunner;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;

@RunWith(JUnit4ClassRunner.class)
@Configuration("classpath:config/**/*.xml")
public class Test {
	
	
	@Autowired
	AuthenticationProvider  provider;
	
	@org.junit.Test
	public void test() {
		
	}

}
