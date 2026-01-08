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

public class CreationWebContentToSiteSteps {
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
  public void creationWebContent() {
    //driver.get("http://localhost:8080/");
    driver.findElement(By.cssSelector(".lexicon-icon-sites")).click();
    driver.switchTo().frame(0);
    driver.findElement(By.linkText("Site1")).click();
    driver.switchTo().defaultContent();
    driver.findElement(By.id("panel-manage-site_administration_content-link")).click();
    driver.findElement(By.id("_com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet_portlet_com_liferay_journal_web_portlet_JournalPortlet")).click();
    driver.findElement(By.cssSelector(".d-md-block")).click();
    driver.findElement(By.linkText("Basic Web Content")).click();
    driver.findElement(By.id("_com_liferay_journal_web_portlet_JournalPortlet_titleMapAsXML")).click();
    driver.findElement(By.id("_com_liferay_journal_web_portlet_JournalPortlet_titleMapAsXML")).sendKeys("Lorem ipsum web content 1");
    driver.findElement(By.id("_com_liferay_journal_web_portlet_JournalPortlet_friendlyURL")).click();
    driver.findElement(By.id("_com_liferay_journal_web_portlet_JournalPortlet_friendlyURL")).sendKeys("lorem-ipsum-1");
    driver.findElement(By.cssSelector(".dropdown:nth-child(2) > .dropdown-toggle")).click();
    driver.findElement(By.cssSelector("#clay-dropdown-menu-13 li:nth-child(1) > .dropdown-item")).click();
    driver.findElement(By.id("_com_liferay_journal_web_portlet_JournalPortlet_inputPermissionsViewRole")).click();
    {
      WebElement dropdown = driver.findElement(By.id("_com_liferay_journal_web_portlet_JournalPortlet_inputPermissionsViewRole"));
      dropdown.findElement(By.xpath("//option[. = 'Site Members']")).click();
    }
    driver.findElement(By.cssSelector("#\\_com_liferay_journal_web_portlet_JournalPortlet_inputPermissionsViewRole > option:nth-child(2)")).click();
    driver.findElement(By.cssSelector(".btn-primary:nth-child(2)")).click();
  }
}
