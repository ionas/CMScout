<?php
/* SVN FILE: $Id$ */
/**
 * Short description for file.
 *
 * Long description for file
 *
 * PHP versions 4 and 5
 *
 * CakePHP(tm) Tests <https://trac.cakephp.org/wiki/Developement/TestSuite>
 * Copyright 2005-2008, Cake Software Foundation, Inc.
 *								1785 E. Sahara Avenue, Suite 490-204
 *								Las Vegas, Nevada 89104
 *
 *  Licensed under The Open Group Test Suite License
 *  Redistributions of files must retain the above copyright notice.
 *
 * @filesource
 * @copyright		Copyright 2005-2008, Cake Software Foundation, Inc.
 * @link				https://trac.cakephp.org/wiki/Developement/TestSuite CakePHP(tm) Tests
 * @package			cake.tests
 * @subpackage		cake.tests.cases.libs
 * @since			CakePHP(tm) v 1.2.0.5432
 * @version			$Revision$
 * @modifiedby		$LastChangedBy$
 * @lastmodified	$Date$
 * @license			http://www.opensource.org/licenses/opengroup.php The Open Group Test Suite License
 */
if (class_exists('ErrorHandler')) {
	return;
}
App::import('Core', array('Error', 'Controller'));

if (!defined('CAKEPHP_UNIT_TEST_EXECUTION')) {
	define('CAKEPHP_UNIT_TEST_EXECUTION', 1);
}

if (!class_exists('TestAppController')) {
	class TestAppController extends Controller {
		function beforeFilter() {
			$this->cakeError('error404', array('oops' => 'Nothing to see here'));
		}
	}
}
class TestErrorController extends TestAppController {

	var $uses = array();

	function index() {
		$this->autoRender = false;
		return 'what up';
	}

}
class TestAppErrorController extends TestAppController {
	function apperror($method, $message) {
		return sprintf('Error: %s Message: %s', $method, $message);
	}
}
/**
 * Short description for class.
 *
 * @package    cake.tests
 * @subpackage cake.tests.cases.libs
 */
class ErrorHandlerTest extends CakeTestCase {

	function skip() {
		$this->skipif ((php_sapi_name() == 'cli'), 'ErrorHandlerTest cannot be run from console');
	}

	function testFromBeforeFilter() {
		if (!class_exists('dispatcher')) {
			require CAKE . 'dispatcher.php';
		}
		$Dispatcher =& new Dispatcher();

		restore_error_handler();
		ob_start();
		$controller = $Dispatcher->dispatch('/test_error', array('return'=> 1));
		$expected = ob_get_clean();
		set_error_handler('simpleTestErrorHandler');
		$this->assertPattern("/<h2>Not Found<\/h2>/", $expected);
		$this->assertPattern("/<strong>'\/test_error'<\/strong>/", $expected);
	}

	function testError() {
		//Cannot test Error currently as calling it creates an exit();
		ob_start();
		$ErrorHandler = new ErrorHandler('error404', array('message' => 'Page not found'));
		ob_clean();
		
		ob_start();
		$ErrorHandler->error(array(
				'code' => 404,
				'message' => 'Page not Found',
				'name' => "Couldn't find what you were looking for"
		));
		$result = ob_get_clean();		
		$this->assertPattern("/<h2>Couldn't find what you were looking for<\/h2>/", $result);
		$this->assertPattern('/Page not Found/', $result);		
	}

	function testError404() {
		ob_start();
		$ErrorHandler = new ErrorHandler('error404', array('message' => 'Page not found'));
		$result = ob_get_clean();
		$this->assertPattern('/<h2>Not Found<\/h2>/', $result);
		$this->assertPattern("/<strong>'\/test_error'<\/strong>/", $result);
	}

	function testMissingController() {		
		ob_start();
		$ErrorHandler = new ErrorHandler('missingController', array(
			'className' => 'PostsController'
		));
		$result = ob_get_clean();
		$this->assertPattern('/<h2>Missing Controller<\/h2>/', $result);
		$this->assertPattern('/<em>PostsController<\/em>/', $result);
	}
	
	function testMissingAction() {
		ob_start();
		$ErrorHandler = new ErrorHandler('missingAction', array(
			'className' => 'PostsController',
			'action' => 'index'
		));
		$result = ob_get_clean();
		$this->assertPattern('/<h2>Missing Method in PostsController<\/h2>/', $result);
		$this->assertPattern('/<em>PostsController::<\/em><em>index\(\)<\/em>/', $result);
	}

	function testPrivateAction() {
		ob_start();
		$ErrorHandler = new ErrorHandler('privateAction', array(
			'className' => 'PostsController',
			'action' => '_secretSauce'
		));
		$result = ob_get_clean();
		$this->assertPattern('/<h2>Private Method in PostsController<\/h2>/', $result);
		$this->assertPattern('/<em>PostsController::<\/em><em>_secretSauce\(\)<\/em>/', $result);
	}

	function testMissingTable() {
		ob_start();
		$ErrorHandler = new ErrorHandler('missingTable', array(
			'className' => 'Article',
			'table' => 'articles'
		));
		$result = ob_get_clean();
		$this->assertPattern('/<h2>Missing Database Table<\/h2>/', $result);
		$this->assertPattern('/table <em>articles<\/em> for model <em>Article<\/em>/', $result);
	}

	function testMissingDatabase() {
		ob_start();
		$ErrorHandler = new ErrorHandler('missingDatabase', array());
		$result = ob_get_clean();
		$this->assertPattern('/<h2>Missing Database Connection<\/h2>/', $result);
		$this->assertPattern('/Confirm you have created the file/', $result);
	}

	function testMissingView() {
		restore_error_handler();
		ob_start();
		$ErrorHandler = new ErrorHandler('missingView', array(
			'className' => 'Pages',
			'action' => 'display',
			'file' => 'pages/about.ctp',
			'base' => ''
		));
		$expected = ob_get_clean();
		set_error_handler('simpleTestErrorHandler');
		$this->assertPattern("/PagesController::/", $expected);
		$this->assertPattern("/pages\/about.ctp/", $expected);

	}

	function testMissingLayout() {
		restore_error_handler();
		ob_start();
		$ErrorHandler = new ErrorHandler('missingLayout', array(
			'layout' => 'my_layout',
			'file' => 'layouts/my_layout.ctp',
			'base' => ''
		));
		$expected = ob_get_clean();
		set_error_handler('simpleTestErrorHandler');
		$this->assertPattern("/Missing Layout/", $expected);
		$this->assertPattern("/layouts\/my_layout.ctp/", $expected);

	}

	function testMissingConnection() {
		ob_start();
		$ErrorHandler = new ErrorHandler('missingConnection', array(
			'className' => 'Article'
		));
		$result = ob_get_clean();
		$this->assertPattern('/<h2>Missing Database Connection<\/h2>/', $result);
		$this->assertPattern('/Article requires a database connection/', $result);
	}

	function testMissingHelperFile() {
		ob_start();
		$ErrorHandler = new ErrorHandler('missingHelperFile', array(
			'helper' => 'MyCustom',
			'file' => 'my_custom.php'
		));
		$result = ob_get_clean();
		$this->assertPattern('/<h2>Missing Helper File<\/h2>/', $result);
		$this->assertPattern('/Create the class below in file:/', $result);
		$this->assertPattern('/\/my_custom.php/', $result);
	}

	function testMissingHelperClass() {
		ob_start();
		$ErrorHandler = new ErrorHandler('missingHelperClass', array(
			'helper' => 'MyCustom',
			'file' => 'my_custom.php'
		));
		$result = ob_get_clean();
		$this->assertPattern('/<h2>Missing Helper Class<\/h2>/', $result);
		$this->assertPattern('/The helper class <em>MyCustomHelper<\/em> can not be found or does not exist./', $result);
		$this->assertPattern('/\/my_custom.php/', $result);		
	}

	function testMissingComponentFile() {
		ob_start();
		$ErrorHandler = new ErrorHandler('missingComponentFile', array(
			'className' => 'PostsController',
			'component' => 'Sidebox',
			'file' => 'sidebox.php'
		));
		$result = ob_get_clean();
		$this->assertPattern('/<h2>Missing Component File<\/h2>/', $result);
		$this->assertPattern('/Create the class <em>SideboxComponent<\/em> in file:/', $result);
		$this->assertPattern('/\/sidebox.php/', $result);
	}

	function testMissingComponentClass() {
		ob_start();
		$ErrorHandler = new ErrorHandler('missingComponentClass', array(
			'className' => 'PostsController',
			'component' => 'Sidebox',
			'file' => 'sidebox.php'
		));
		$result = ob_get_clean();
		$this->assertPattern('/<h2>Missing Component Class<\/h2>/', $result);
		$this->assertPattern('/Create the class <em>SideboxComponent<\/em> in file:/', $result);
		$this->assertPattern('/\/sidebox.php/', $result);
	}

	function testMissingModel() {
		ob_start();
		$ErrorHandler = new ErrorHandler('missingModel', array(
			'className' => 'Article',
			'file' => 'article.php'
		));
		$result = ob_get_clean();
		$this->assertPattern('/<h2>Missing Model<\/h2>/', $result);
		$this->assertPattern('/<em>Article<\/em> could not be found./', $result);
		$this->assertPattern('/\/article.php/', $result);
	}
}
?>