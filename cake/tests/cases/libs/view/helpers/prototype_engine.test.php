<?php
/**
 * PrototypeEngine TestCase
 *
 *
 *
 * PHP versions 4 and 5
 *
 * CakePHP :  Rapid Development Framework <http://www.cakephp.org/>
 * Copyright 2006-2008, Cake Software Foundation, Inc.
 *								1785 E. Sahara Avenue, Suite 490-204
 *								Las Vegas, Nevada 89104
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @filesource
 * @copyright       Copyright 2006-2008, Cake Software Foundation, Inc.
 * @link            http://www.cakefoundation.org/projects/info/cakephp CakePHP Project
 * @package         cake.tests
 * @subpackage      cake.tests.cases.views.helpers
 * @license         http://www.opensource.org/licenses/mit-license.php The MIT License
 */
App::import('Helper', array('Html', 'Js', 'PrototypeEngine'));

class PrototypeEngineHelperTestCase extends CakeTestCase {
/**
 * startTest
 *
 * @return void
 **/
	function startTest() {
		$this->Proto =& new PrototypeEngineHelper();
	}
/**
 * end test
 *
 * @return void
 **/
	function endTest() {
		unset($this->Proto);
	}
/**
 * test selector method
 *
 * @return void
 **/
	function testSelector() {
		$result = $this->Proto->get('#content');
		$this->assertEqual($result, $this->Proto);
		$this->assertEqual($this->Proto->selection, '$("content")');
		
		$result = $this->Proto->get('a .remove');
		$this->assertEqual($result, $this->Proto);
		$this->assertEqual($this->Proto->selection, '$$("a .remove")');
		
		$result = $this->Proto->get('document');
		$this->assertEqual($result, $this->Proto);
		$this->assertEqual($this->Proto->selection, "$(document)");
		
		$result = $this->Proto->get('window');
		$this->assertEqual($result, $this->Proto);
		$this->assertEqual($this->Proto->selection, "$(window)");
		
		$result = $this->Proto->get('ul');
		$this->assertEqual($result, $this->Proto);
		$this->assertEqual($this->Proto->selection, '$$("ul")');
		
		$result = $this->Proto->get('#some_long-id.class');
		$this->assertEqual($result, $this->Proto);
		$this->assertEqual($this->Proto->selection, '$$("#some_long-id.class")');
	}
/**
 * test event binding
 *
 * @return void
 **/
	function testEvent() {
		$result = $this->Proto->get('#myLink')->event('click', 'doClick', array('wrap' => false));
		$expected = '$("myLink").observe("click", doClick);';
		$this->assertEqual($result, $expected);

		$result = $this->Proto->get('#myLink')->event('click', 'Element.hide(this);', array('stop' => false));
		$expected = '$("myLink").observe("click", function (event) {Element.hide(this);});';
		$this->assertEqual($result, $expected);

		$result = $this->Proto->get('#myLink')->event('click', 'Element.hide(this);');
		$expected = "\$(\"myLink\").observe(\"click\", function (event) {event.stop();\nElement.hide(this);});";
		$this->assertEqual($result, $expected);
	}
/**
 * test dom ready event creation
 *
 * @return void
 **/
	function testDomReady() {
		$result = $this->Proto->domReady('foo.name = "bar";');
		$expected = 'document.observe("dom:loaded", function (event) {foo.name = "bar";});';
		$this->assertEqual($result, $expected);
	}
/**
 * test Each method
 *
 * @return void
 **/
	function testEach() {
		$result = $this->Proto->get('#foo li')->each('item.hide();');
		$expected = '$$("#foo li").each(function (item, index) {item.hide();});';
		$this->assertEqual($result, $expected);
	}
/**
 * test Effect generation
 *
 * @return void
 **/
	function testEffect() {
		$result = $this->Proto->get('#foo')->effect('show');
		$expected = '$("foo").show();';
		$this->assertEqual($result, $expected);

		$result = $this->Proto->effect('hide');
		$expected = '$("foo").hide();';
		$this->assertEqual($result, $expected);

		$result = $this->Proto->effect('fadeIn');
		$expected = '$("foo").appear();';
		$this->assertEqual($result, $expected);
		
		$result = $this->Proto->effect('fadeIn', array('speed' => 'fast'));
		$expected = '$("foo").appear({duration:0.50000000000});';
		$this->assertEqual($result, $expected);
		
		$result = $this->Proto->effect('fadeIn', array('speed' => 'slow'));
		$expected = '$("foo").appear({duration:2});';
		$this->assertEqual($result, $expected);

		$result = $this->Proto->effect('fadeOut');
		$expected = '$("foo").fade();';
		$this->assertEqual($result, $expected);
		
		$result = $this->Proto->effect('fadeOut', array('speed' => 'fast'));
		$expected = '$("foo").fade({duration:0.50000000000});';
		$this->assertEqual($result, $expected);
		
		$result = $this->Proto->effect('fadeOut', array('speed' => 'slow'));
		$expected = '$("foo").fade({duration:2});';
		$this->assertEqual($result, $expected);

		$result = $this->Proto->effect('slideIn');
		$expected = 'Effect.slideDown($("foo"));';
		$this->assertEqual($result, $expected);

		$result = $this->Proto->effect('slideOut');
		$expected = 'Effect.slideUp($("foo"));';
		$this->assertEqual($result, $expected);

		$result = $this->Proto->effect('slideOut', array('speed' => 'fast'));
		$expected = 'Effect.slideUp($("foo"), {duration:0.50000000000});';
		$this->assertEqual($result, $expected);

		$result = $this->Proto->effect('slideOut', array('speed' => 'slow'));
		$expected = 'Effect.slideUp($("foo"), {duration:2});';
		$this->assertEqual($result, $expected);
	}
/**
 * Test Request Generation
 *
 * @return void
 **/
	function testRequest() {
		$result = $this->Proto->request(array('controller' => 'posts', 'action' => 'view', 1));
		$expected = 'var jsRequest = new Ajax("/posts/view/1");';
		$this->assertEqual($result, $expected);
		
		$result = $this->Proto->request('/posts/view/1', array('update' => 'content'));
		$expected = 'var jsRequest = new Ajax.Updater("/posts/view/1", {update:"content"});';
		$this->assertEqual($result, $expected);

/*		$result = $this->Proto->request('/people/edit/1', array(
			'method' => 'post',
			'complete' => 'doSuccess',
			'error' => 'handleError',
			'type' => 'json',
			'data' => array('name' => 'jim', 'height' => '185cm')
		));
		$expected = 'var jsRequest = new Request.JSON({method:"post", onComplete:doSuccess, onFailure:handleError, url:"/people/edit/1"}).send({"name":"jim","height":"185cm"});';
		$this->assertEqual($result, $expected);

		$result = $this->Proto->request('/people/edit/1', array(
			'method' => 'post',
			'complete' => 'doSuccess',
			'update' => '#update-zone'
		));
		$expected = 'var jsRequest = new Request.HTML({method:"post", onComplete:doSuccess, update:"update-zone", url:"/people/edit/1"}).send();';
		$this->assertEqual($result, $expected);
		
		$result = $this->Proto->request('/people/edit/1', array(
			'method' => 'post',
			'complete' => 'doSuccess',
			'update' => 'update-zone'
		));
		$expected = 'var jsRequest = new Request.HTML({method:"post", onComplete:doSuccess, update:"update-zone", url:"/people/edit/1"}).send();';
		$this->assertEqual($result, $expected);
		*/
	}
/**
 * test sortable list generation
 *
 * @return void
 **/
	function testSortable() {

	}
}
?>