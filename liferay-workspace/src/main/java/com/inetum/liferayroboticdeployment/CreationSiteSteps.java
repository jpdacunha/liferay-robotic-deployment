package com.inetum.liferayroboticdeployment;

import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.JavascriptExecutor;
import java.util.*;

public class CreationSiteSteps {
  private WebDriver driver;
  private Map<String, Object> vars;
  JavascriptExecutor js;

  @Before
  public void setUp() {
    driver = new FirefoxDriver();
    js = (JavascriptExecutor) driver;
    vars = new HashMap<String, Object>();
  }
  @After
  public void tearDown() {
    driver.quit();
  }
  @Test
  public void creationSite() {

    driver.get("http://localhost:8080/");
    driver.findElement(By.cssSelector(".control-menu-nav-item-separator > .control-menu-nav-link")).click();
    driver.findElement(By.cssSelector("#\\_com_liferay_product_navigation_applications_menu_web_internal_portlet_ProductNavigationApplicationsMenuPortlet_tab_2 > .nav-link")).click();
    driver.findElement(By.cssSelector(".tab-pane:nth-child(3) .col-md:nth-child(3) .c-mt-2:nth-child(1) span")).click();
    driver.findElement(By.linkText("New")).click();
    driver.findElement(By.cssSelector(".file-card > .card-body")).click();
    driver.switchTo().frame(0);
    driver.findElement(By.id("_com_liferay_site_admin_web_portlet_SiteAdminPortlet_name")).click();
    driver.findElement(By.id("_com_liferay_site_admin_web_portlet_SiteAdminPortlet_name")).sendKeys("Site1");
    driver.findElement(By.cssSelector("#\\_com_liferay_site_admin_web_portlet_SiteAdminPortlet_oyfu > .lfr-btn-label")).click();
    driver.switchTo().defaultContent();
  }
}
