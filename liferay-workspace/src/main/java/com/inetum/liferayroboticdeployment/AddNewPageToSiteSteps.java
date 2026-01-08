package com.inetum.liferayroboticdeployment;

import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.JavascriptExecutor;
import java.util.*;

public class AddNewPageToSiteSteps {
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
  public void addNewpageToSite() {
    driver.findElement(By.cssSelector(".control-menu-nav-item-separator > .control-menu-nav-link")).click();
    driver.findElement(By.cssSelector(".c-mt-3:nth-child(3) .text-truncate")).click();
    driver.findElement(By.cssSelector(".lexicon-icon-product-menu-closed > use")).click();
    driver.findElement(By.id("panel-manage-site_administration_build-link")).click();
    driver.findElement(By.id("_com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet_portlet_com_liferay_layout_admin_web_portlet_GroupPagesPortlet")).click();
    driver.findElement(By.linkText("New")).click();
    driver.findElement(By.cssSelector(".card-body:nth-child(2)")).click();
    driver.switchTo().frame(0);
    driver.findElement(By.id("_com_liferay_layout_admin_web_portlet_GroupPagesPortlet_name")).click();
    driver.findElement(By.id("_com_liferay_layout_admin_web_portlet_GroupPagesPortlet_name")).sendKeys("Page_accueil");
    driver.findElement(By.cssSelector("#\\_com_liferay_layout_admin_web_portlet_GroupPagesPortlet_addButton > .lfr-btn-label")).click();
    driver.switchTo().defaultContent();
    driver.findElement(By.cssSelector(".page-editor__collapse:nth-child(1) .mb-1:nth-child(1) .title")).click();
    driver.findElement(By.cssSelector(".page-editor__collapse:nth-child(1) .mb-1:nth-child(1) .title")).click();
    {
      WebElement element = driver.findElement(By.cssSelector(".page-editor__collapse:nth-child(1) .mb-1:nth-child(1) .title"));
      Actions builder = new Actions(driver);
      builder.doubleClick(element).perform();
    }
    {
      WebElement dragged = driver.findElement(By.cssSelector(".disabled > .align-items-center"));
      WebElement dropped = driver.findElement(By.cssSelector(".page-editor__no-fragments-state__image"));
      Actions builder = new Actions(driver);
      builder.dragAndDrop(dragged, dropped).perform();
    }
    driver.findElement(By.id("fragment-pgqs-link")).click();
    {
      WebElement element = driver.findElement(By.id("fragment-pgqs-link"));
      Actions builder = new Actions(driver);
      builder.doubleClick(element).perform();
    }
    driver.findElement(By.id("fragment-pgqs-link")).click();
    driver.findElement(By.id("fragment-pgqs-link")).click();
    {
      WebElement element = driver.findElement(By.id("fragment-pgqs-link"));
      Actions builder = new Actions(driver);
      builder.doubleClick(element).perform();
    }
    driver.findElement(By.id("_com_liferay_layout_content_page_editor_web_internal_portlet_ContentPageEditorPortlet_FragmentEntryLinkEditable_fragment-pgqs-link")).click();
    driver.findElement(By.id("_com_liferay_layout_content_page_editor_web_internal_portlet_ContentPageEditorPortlet_FragmentEntryLinkEditable_fragment-pgqs-link")).click();
    {
      WebElement element = driver.findElement(By.id("_com_liferay_layout_content_page_editor_web_internal_portlet_ContentPageEditorPortlet_FragmentEntryLinkEditable_fragment-pgqs-link"));
      Actions builder = new Actions(driver);
      builder.doubleClick(element).perform();
    }
    {
      WebElement element = driver.findElement(By.id("_com_liferay_layout_content_page_editor_web_internal_portlet_ContentPageEditorPortlet_FragmentEntryLinkEditable_fragment-pgqs-link"));
      js.executeScript("if(arguments[0].contentEditable === 'true') {arguments[0].innerText = 'BONJOUR'}", element);
    }
    driver.findElement(By.id("content")).click();
    driver.findElement(By.cssSelector(".btn-primary:nth-child(2)")).click();
    driver.findElement(By.cssSelector(".btn-options > .lexicon-icon")).click();
    driver.findElement(By.cssSelector(".breadcrumb")).click();
  }
}
