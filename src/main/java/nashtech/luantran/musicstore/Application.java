package nashtech.luantran.musicstore;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import nashtech.luantran.musicstore.config.JpaConfig;
import nashtech.luantran.musicstore.config.WebConfig;
import nashtech.luantran.musicstore.config.WebSecurityConfig;

public class Application extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] { JpaConfig.class ,WebSecurityConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] { WebConfig.class  };
	}

	
	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
	
}
