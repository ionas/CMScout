<?php
/* SVN FILE: $Id$ */
/**
 * Base controller class.
 *
 * PHP versions 4 and 5
 *
 * CakePHP(tm) :  Rapid Development Framework (http://www.cakephp.org)
 * Copyright 2005-2008, Cake Software Foundation, Inc. (http://www.cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @filesource
 * @copyright     Copyright 2005-2008, Cake Software Foundation, Inc. (http://www.cakefoundation.org)
 * @link          http://www.cakefoundation.org/projects/info/cakephp CakePHP(tm) Project
 * @package       cake
 * @subpackage    cake.cake.libs.controller
 * @since         CakePHP(tm) v 0.2.9
 * @version       $Revision$
 * @modifiedby    $LastChangedBy$
 * @lastmodified  $Date$
 * @license       http://www.opensource.org/licenses/mit-license.php The MIT License
 */
/**
 * Include files
 */
App::import('Core', array('Component', 'View'));
/**
 * Controller
 *
 * Application controller class for organization of business logic.
 * Provides basic functionality, such as rendering views inside layouts,
 * automatic model availability, redirection, callbacks, and more.
 *
 * @package       cake
 * @subpackage    cake.cake.libs.controller
 * @link          http://book.cakephp.org/view/49/Controllers
 *
 */
class Controller extends Object {
/**
 * The name of this controller. Controller names are plural, named after the model they manipulate.
 *
 * @var string
 * @access public
 * @link http://book.cakephp.org/view/52/name
 */
	var $name = null;
/**
 * Stores the current URL, relative to the webroot of the application.
 *
 * @var string
 * @access public
 */
	var $here = null;
/**
 * The webroot of the application. Helpful if your application is placed in a folder under the current domain name.
 *
 * @var string
 * @access public
 */
	var $webroot = null;
/**
 * The name of the currently requested controller action.
 *
 * @var string
 * @access public
 */
	var $action = null;
/**
 * An array containing the class names of models this controller uses.
 *
 * Example: var $uses = array('Product', 'Post', 'Comment');
 *
 * Can be set to array() to use no models.  Can be set to false to 
 * use no models and prevent the merging of $uses with AppController
 *
 * @var mixed A single name as a string or a list of names as an array.
 * @access protected
 * @link http://book.cakephp.org/view/53/components-helpers-and-uses
 */
	var $uses = false;
/**
 * An array containing the names of helpers this controller uses. The array elements should
 * not contain the "Helper" part of the classname.
 *
 * Example: var $helpers = array('Html', 'Javascript', 'Time', 'Ajax');
 *
 * @var mixed A single name as a string or a list of names as an array.
 * @access protected
 * @link http://book.cakephp.org/view/53/components-helpers-and-uses
 */
	var $helpers = array('Html', 'Form');
/**
 * Parameters received in the current request: GET and POST data, information
 * about the request, etc.
 *
 * @var array
 * @access public
 * @link http://book.cakephp.org/view/55/The-Parameters-Attribute-params
 */
	var $params = array();
/**
 * Data POSTed to the controller using the HtmlHelper. Data here is accessible
 * using the $this->data['ModelName']['fieldName'] pattern.
 *
 * @var array
 * @access public
 */
	var $data = array();
/**
 * Holds pagination defaults for controller actions. The keys that can be included
 * in this array are: 'conditions', 'fields', 'order', 'limit', 'page', and 'recursive',
 * similar to the keys in the second parameter of Model::find().
 *
 * Pagination defaults can also be supplied in a model-by-model basis by using
 * the name of the model as a key for a pagination array:
 *
 * var $paginate = array(
 * 		'Post' => array(...),
 * 		'Comment' => array(...)
 * 	);
 *
 * @var array
 * @access public
 * @link http://book.cakephp.org/view/164/Pagination
 */
	var $paginate = array('limit' => 20, 'page' => 1);
/**
 * The name of the views subfolder containing views for this controller.
 *
 * @var string
 * @access public
 */
	var $viewPath = null;
/**
 * The name of the layouts subfolder containing layouts for this controller.
 *
 * @var string
 * @access public
 */
	var $layoutPath = null;
/**
 * Contains variables to be handed to the view.
 *
 * @var array
 * @access public
 */
	var $viewVars = array();
/**
 * Text to be used for the $title_for_layout layout variable (usually
 * placed inside <title> tags.)
 *
 * @var boolean
 * @access public
 * @link http://book.cakephp.org/view/54/Page-related-Attributes-layout-and-pageTitle
 */
	var $pageTitle = false;
/**
 * An array containing the class names of the models this controller uses.
 *
 * @var array Array of model objects.
 * @access public
 */
	var $modelNames = array();
/**
 * Base URL path.
 *
 * @var string
 * @access public
 */
	var $base = null;
/**
 * The name of the layout file to render the view inside of. The name specified
 * is the filename of the layout in /app/views/layouts without the .ctp
 * extension.
 *
 * @var string
 * @access public
 * @link http://book.cakephp.org/view/54/Page-related-Attributes-layout-and-pageTitle
 */
	var $layout = 'default';
/**
 * Set to true to automatically render the view
 * after action logic.
 *
 * @var boolean
 * @access public
 */
	var $autoRender = true;
/**
 * Set to true to automatically render the layout around views.
 *
 * @var boolean
 * @access public
 */
	var $autoLayout = true;
/**
 * Instance of Component used to handle callbacks.
 *
 * @var string
 * @access public
 */
	var $Component = null;
/**
 * Array containing the names of components this controller uses. Component names
 * should not contain the "Component" portion of the classname.
 *
 * Example: var $components = array('Session', 'RequestHandler', 'Acl');
 *
 * @var array
 * @access public
 * @link http://book.cakephp.org/view/53/components-helpers-and-uses
 */
	var $components = array();
/**
 * The name of the View class this controller sends output to.
 *
 * @var string
 * @access public
 */
	var $view = 'View';
/**
 * File extension for view templates. Defaults to Cake's conventional ".ctp".
 *
 * @var string
 * @access public
 */
	var $ext = '.ctp';
/**
 * The output of the requested action.  Contains either a variable
 * returned from the action, or the data of the rendered view;
 * You can use this var in child controllers' afterFilter() callbacks to alter output.
 *
 * @var string
 * @access public
 */
	var $output = null;
/**
 * Automatically set to the name of a plugin.
 *
 * @var string
 * @access public
 */
	var $plugin = null;
/**
 * Used to define methods a controller that will be cached. To cache a
 * single action, the value is set to an array containing keys that match
 * action names and values that denote cache expiration times (in seconds).
 *
 * Example: var $cacheAction = array(
 *		'view/23/' => 21600,
 *		'recalled/' => 86400
 *	);
 *
 * $cacheAction can also be set to a strtotime() compatible string. This
 * marks all the actions in the controller for view caching.
 *
 * @var mixed
 * @access public
 * @link http://book.cakephp.org/view/346/Caching-in-the-Controller
 */
	var $cacheAction = false;
/**
 * Used to create cached instances of models a controller uses.
 * When set to true, all models related to the controller will be cached.
 * This can increase performance in many cases.
 *
 * @var boolean
 * @access public
 */
	var $persistModel = false;
/**
 * Holds all params passed and named.
 *
 * @var mixed
 * @access public
 */
	var $passedArgs = array();
/**
 * Triggers Scaffolding
 *
 * @var mixed
 * @access public
 * @link http://book.cakephp.org/view/105/Scaffolding
 */
	var $scaffold = false;
/**
 * Holds current methods of the controller
 *
 * @var array
 * @access public
 * @link
 */
	var $methods = array();
/**
 * This controller's primary model class name, the Inflector::classify()'ed version of 
 * the controller's $name property.
 *
 * Example: For a controller named 'Comments', the modelClass would be 'Comment'
 *
 * @var string
 * @access public
 */
	var $modelClass = null;
/**
 * This controller's model key name, an underscored version of the controller's $modelClass property.
 *
 * Example: For a controller named 'ArticleComments', the modelKey would be 'article_comment'
 *
 * @var string
 * @access public
 */
	var $modelKey = null;
/**
 * Holds any validation errors produced by the last call of the validateErrors() method/
 *
 * @var array Validation errors, or false if none
 * @access public
 */
	var $validationErrors = null;
/**
 * Constructor.
 *
 */
	function __construct() {
		if ($this->name === null) {
			$r = null;
			if (!preg_match('/(.*)Controller/i', get_class($this), $r)) {
				die (__("Controller::__construct() : Can not get or parse my own class name, exiting."));
			}
			$this->name = $r[1];
		}

		if ($this->viewPath == null) {
			$this->viewPath = Inflector::underscore($this->name);
		}
		$this->modelClass = Inflector::classify($this->name);
		$this->modelKey = Inflector::underscore($this->modelClass);
		$this->Component =& new Component();

		$childMethods = get_class_methods($this);
		$parentMethods = get_class_methods('Controller');

		foreach ($childMethods as $key => $value) {
			$childMethods[$key] = strtolower($value);
		}

		foreach ($parentMethods as $key => $value) {
			$parentMethods[$key] = strtolower($value);
		}
		$this->methods = array_diff($childMethods, $parentMethods);
		parent::__construct();
	}
/**
 * Merge components, helpers, and uses vars from AppController and PluginAppController.
 *
 * @return void
 * @access protected
 */
	function __mergeVars() {
		$pluginName = Inflector::camelize($this->plugin);
		$pluginController = $pluginName . 'AppController';

		if (is_subclass_of($this, 'AppController') || is_subclass_of($this, $pluginController)) {
			$appVars = get_class_vars('AppController');
			$uses = $appVars['uses'];
			$merge = array('components', 'helpers');
			$plugin = null;

			if (!empty($this->plugin)) {
				$plugin = $pluginName . '.';
				if (!is_subclass_of($this, $pluginController)) {
					$pluginController = null;
				}
			} else {
				$pluginController = null;
			}

			if ($uses == $this->uses && !empty($this->uses)) {
				if (!in_array($plugin . $this->modelClass, $this->uses)) {
					array_unshift($this->uses, $plugin . $this->modelClass);
				} elseif ($this->uses[0] !== $plugin . $this->modelClass) {
					$this->uses = array_flip($this->uses);
					unset($this->uses[$plugin . $this->modelClass]);
					$this->uses = array_flip($this->uses);
					array_unshift($this->uses, $plugin . $this->modelClass);
				}
			} elseif ($this->uses !== null || $this->uses !== false) {
				$merge[] = 'uses';
			}

			foreach ($merge as $var) {
				if (!empty($appVars[$var]) && is_array($this->{$var})) {
					if ($var === 'components') {
						$normal = Set::normalize($this->{$var});
						$app = Set::normalize($appVars[$var]);
						if ($app !== $normal) {
							$this->{$var} = Set::merge($app, $normal);
						}
					} else {
						$this->{$var} = Set::merge($this->{$var}, array_diff($appVars[$var], $this->{$var}));
					}
				}
			}
		}

		if ($pluginController && $pluginName != null) {
			$appVars = get_class_vars($pluginController);
			$uses = $appVars['uses'];
			$merge = array('components', 'helpers');

			if ($this->uses !== null || $this->uses !== false) {
				$merge[] = 'uses';
			}

			foreach ($merge as $var) {
				if (isset($appVars[$var]) && !empty($appVars[$var]) && is_array($this->{$var})) {
					if ($var === 'components') {
						$normal = Set::normalize($this->{$var});
						$app = Set::normalize($appVars[$var]);
						if ($app !== $normal) {
							$this->{$var} = Set::merge($app, $normal);
						}
					} else {
						$this->{$var} = Set::merge($this->{$var}, array_diff($appVars[$var], $this->{$var}));
					}
				}
			}
		}
	}
/**
 * Loads Model classes based on the the uses property
 * see Controller::loadModel(); for more info.
 * Loads Components and prepares them for initialization.
 *
 * @return mixed true if models found and instance created, or cakeError if models not found.
 * @access public
 * @see Controller::loadModel()
 * @link http://book.cakephp.org/view/429/constructClasses
 */
	function constructClasses() {
		$this->__mergeVars();
		$this->Component->init($this);

		if ($this->uses !== null || ($this->uses !== array())) {
			if (empty($this->passedArgs) || !isset($this->passedArgs['0'])) {
				$id = false;
			} else {
				$id = $this->passedArgs['0'];
			}

			if ($this->uses === false) {
				$this->loadModel($this->modelClass, $id);
			} elseif ($this->uses) {
				$uses = is_array($this->uses) ? $this->uses : array($this->uses);
				$modelClassName = $uses[0];
				if (strpos($uses[0], '.') !== false) {
					list($plugin, $modelClassName) = explode('.', $uses[0]);
				}
				$this->modelClass = $modelClassName;
				foreach ($uses as $modelClass) {
					$this->loadModel($modelClass);
				}
			}
		}
		return true;
	}
/**
 * Loads and instantiates models required by this controller.
 * If Controller::persistModel; is true, controller will create cached model instances on first request,
 * additional request will used cached models.
 * If the model is non existent, it will throw a missing database table error, as Cake generates
 * dynamic models for the time being.
 *
 * @param string $modelClass Name of model class to load
 * @param mixed $id Initial ID the instanced model class should have
 * @return mixed true when single model found and instance created error returned if models not found.
 * @access public
 */
	function loadModel($modelClass = null, $id = null) {
		if ($modelClass === null) {
			$modelClass = $this->modelClass;
		}
		$cached = false;
		$object = null;
		$plugin = null;
		if ($this->uses === false) {
			if ($this->plugin) {
				$plugin = $this->plugin . '.';
			}
		}

		if (strpos($modelClass, '.') !== false) {
			list($plugin, $modelClass) = explode('.', $modelClass);
			$plugin = $plugin . '.';
		}

		if ($this->persistModel === true) {
			$cached = $this->_persist($modelClass, null, $object);
		}

		if (($cached === false)) {
			$this->modelNames[] = $modelClass;

			if (!PHP5) {
				$this->{$modelClass} =& ClassRegistry::init(array('class' => $plugin . $modelClass, 'alias' => $modelClass, 'id' => $id));
			} else {
				$this->{$modelClass} = ClassRegistry::init(array('class' => $plugin . $modelClass, 'alias' => $modelClass, 'id' => $id));
			}

			if (!$this->{$modelClass}) {
				return $this->cakeError('missingModel', array(array('className' => $modelClass, 'webroot' => '', 'base' => $this->base)));
			}

			if ($this->persistModel === true) {
				$this->_persist($modelClass, true, $this->{$modelClass});
				$registry = ClassRegistry::getInstance();
				$this->_persist($modelClass . 'registry', true, $registry->__objects, 'registry');
			}
		} else {
			$this->_persist($modelClass . 'registry', true, $object, 'registry');
			$this->_persist($modelClass, true, $object);
			$this->modelNames[] = $modelClass;
		}
	}
/**
 * Redirects to given $url, after turning off $this->autoRender.
 * Script execution is halted after the redirect.
 *
 * @param mixed $url A string or array-based URL pointing to another location within the app, or an absolute URL
 * @param integer $status Optional HTTP status code (eg: 404)
 * @param boolean $exit If true, exit() will be called after the redirect
 * @return mixed void if $exit = false. Terminates script if $exit = true
 * @access public
 * @link http://book.cakephp.org/view/425/redirect
 */
	function redirect($url, $status = null, $exit = true) {
		$this->autoRender = false;

		if (is_array($status)) {
			extract($status, EXTR_OVERWRITE);
		}
		$response = $this->Component->beforeRedirect($this, $url, $status, $exit);

		if ($response === false) {
			return;
		}
		if (is_array($response)) {
			foreach ($response as $resp) {
				if (is_array($resp) && isset($resp['url'])) {
					extract($resp, EXTR_OVERWRITE);
				} elseif ($resp !== null) {
					$url = $resp;
				}
			}
		}

		if (function_exists('session_write_close')) {
			session_write_close();
		}

		if (!empty($status)) {
			$codes = array(
				100 => 'Continue',
				101 => 'Switching Protocols',
				200 => 'OK',
				201 => 'Created',
				202 => 'Accepted',
				203 => 'Non-Authoritative Information',
				204 => 'No Content',
				205 => 'Reset Content',
				206 => 'Partial Content',
				300 => 'Multiple Choices',
				301 => 'Moved Permanently',
				302 => 'Found',
				303 => 'See Other',
				304 => 'Not Modified',
				305 => 'Use Proxy',
				307 => 'Temporary Redirect',
				400 => 'Bad Request',
				401 => 'Unauthorized',
				402 => 'Payment Required',
				403 => 'Forbidden',
				404 => 'Not Found',
				405 => 'Method Not Allowed',
				406 => 'Not Acceptable',
				407 => 'Proxy Authentication Required',
				408 => 'Request Time-out',
				409 => 'Conflict',
				410 => 'Gone',
				411 => 'Length Required',
				412 => 'Precondition Failed',
				413 => 'Request Entity Too Large',
				414 => 'Request-URI Too Large',
				415 => 'Unsupported Media Type',
				416 => 'Requested range not satisfiable',
				417 => 'Expectation Failed',
				500 => 'Internal Server Error',
				501 => 'Not Implemented',
				502 => 'Bad Gateway',
				503 => 'Service Unavailable',
				504 => 'Gateway Time-out'
			);
			if (is_string($status)) {
				$codes = array_combine(array_values($codes), array_keys($codes));
			}

			if (isset($codes[$status])) {
				$code = $msg = $codes[$status];
				if (is_numeric($status)) {
					$code = $status;
				}
				if (is_string($status)) {
					$msg = $status;
				}
				$status = "HTTP/1.1 {$code} {$msg}";
			} else {
				$status = null;
			}
		}

		if (!empty($status)) {
			$this->header($status);
		}
		if ($url !== null) {
			$this->header('Location: ' . Router::url($url, true));
		}

		if (!empty($status) && ($status >= 300 && $status < 400)) {
			$this->header($status);
		}

		if ($exit) {
			$this->_stop();
		}
	}
/**
 * Convenience method for header()
 *
 * @param string $status
 * @return void
 * @access public
 */
	function header($status) {
		header($status);
	}
/**
 * Saves a variable for use inside a view template.
 *
 * @param mixed $one A string or an array of data.
 * @param mixed $two Value in case $one is a string (which then works as the key).
 *   Unused if $one is an associative array, otherwise serves as the values to $one's keys.
 * @return void
 * @access public
 * @link http://book.cakephp.org/view/427/set
 */
	function set($one, $two = null) {
		$data = array();

		if (is_array($one)) {
			if (is_array($two)) {
				$data = array_combine($one, $two);
			} else {
				$data = $one;
			}
		} else {
			$data = array($one => $two);
		}

		foreach ($data as $name => $value) {
			if ($name === 'title') {
				$this->pageTitle = $value;
			} else {
				if ($two === null && is_array($one)) {
					$this->viewVars[Inflector::variable($name)] = $value;
				} else {
					$this->viewVars[$name] = $value;
				}
			}
		}
	}
/**
 * Internally redirects one action to another. Examples:
 *
 * setAction('another_action');
 * setAction('action_with_parameters', $parameter1);
 *
 * @param string $action The new action to be redirected to
 * @param mixed  Any other parameters passed to this method will be passed as
 *               parameters to the new action.
 * @return mixed Returns the return value of the called action
 * @access public
 */
	function setAction($action) {
		$this->action = $action;
		$args = func_get_args();
		unset($args[0]);
		return call_user_func_array(array(&$this, $action), $args);
	}
/**
 * Controller callback to tie into Auth component. Only called when AuthComponent::authorize is set to 'controller'.
 *
 * @return bool true if authorized, false otherwise
 * @access public
 * @link http://book.cakephp.org/view/396/authorize
 */
	function isAuthorized() {
		trigger_error(sprintf(__('%s::isAuthorized() is not defined.', true), $this->name), E_USER_WARNING);
		return false;
	}
/**
 * Returns number of errors in a submitted FORM.
 *
 * @return integer Number of errors
 * @access public
 */
	function validate() {
		$args = func_get_args();
		$errors = call_user_func_array(array(&$this, 'validateErrors'), $args);

		if ($errors === false) {
			return 0;
		}
		return count($errors);
	}
/**
 * Validates models passed by parameters. Example:
 *
 * $errors = $this->validateErrors($this->Article, $this->User);
 *
 * @param mixed A list of models as a variable argument
 * @return array Validation errors, or false if none
 * @access public
 */
	function validateErrors() {
		$objects = func_get_args();

		if (!count($objects)) {
			return false;
		}

		$errors = array();
		foreach ($objects as $object) {
			$this->{$object->alias}->set($object->data);
			$errors = array_merge($errors, $this->{$object->alias}->invalidFields());
		}

		return $this->validationErrors = (count($errors) ? $errors : false);
	}
/**
 * Instantiates the correct view class, hands it its data, and uses it to render the view output.
 *
 * @param string $action Action name to render
 * @param string $layout Layout to use
 * @param string $file File to use for rendering
 * @return string Full output string of view contents
 * @access public
 * @link http://book.cakephp.org/view/428/render
 */
	function render($action = null, $layout = null, $file = null) {
		$this->beforeRender();

		$viewClass = $this->view;
		if ($this->view != 'View') {
			if (strpos($viewClass, '.') !== false) {
				list($plugin, $viewClass) = explode('.', $viewClass);
			}
			$viewClass = $viewClass . 'View';
			App::import('View', $this->view);
		}

		$this->Component->beforeRender($this);

		$this->params['models'] = $this->modelNames;

		if (Configure::read() > 2) {
			$this->set('cakeDebug', $this);
		}

		$View =& new $viewClass($this);

		if (!empty($this->modelNames)) {
			$models = array();
			foreach ($this->modelNames as $currentModel) {
				if (isset($this->$currentModel) && is_a($this->$currentModel, 'Model')) {
					$models[] = Inflector::underscore($currentModel);
				}
				if (isset($this->$currentModel) && is_a($this->$currentModel, 'Model') && !empty($this->$currentModel->validationErrors)) {
					$View->validationErrors[Inflector::camelize($currentModel)] =& $this->$currentModel->validationErrors;
				}
			}
			$models = array_diff(ClassRegistry::keys(), $models);
			foreach ($models as $currentModel) {
				if (ClassRegistry::isKeySet($currentModel)) {
					$currentObject =& ClassRegistry::getObject($currentModel);
					if (is_a($currentObject, 'Model') && !empty($currentObject->validationErrors)) {
						$View->validationErrors[Inflector::camelize($currentModel)] =& $currentObject->validationErrors;
					}
				}
			}
		}

		$this->autoRender = false;
		$this->output .= $View->render($action, $layout, $file);

		return $this->output;
	}
/**
 * Returns the referring URL for this request.
 *
 * @param string $default Default URL to use if HTTP_REFERER cannot be read from headers
 * @param boolean $local If true, restrict referring URLs to local server
 * @return string Referring URL
 * @access public
 * @link http://book.cakephp.org/view/430/referer
 */
	function referer($default = null, $local = false) {
		$ref = env('HTTP_REFERER');
		if (!empty($ref) && defined('FULL_BASE_URL')) {
			$base = FULL_BASE_URL . $this->webroot;
			if (strpos($ref, $base) === 0) {
				$return =  substr($ref, strlen($base));
				if ($return[0] != '/') {
					$return = '/'.$return;
				}
				return $return;
			} elseif (!$local) {
				return $ref;
			}
		}

		if ($default != null) {
			return $default;
		}
		return '/';
	}
/**
 * Forces the user's browser not to cache the results of the current request.
 *
 * @return void
 * @access public
 * @link http://book.cakephp.org/view/431/disableCache
 */
	function disableCache() {
		header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
		header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
		header("Cache-Control: no-store, no-cache, must-revalidate");
		header("Cache-Control: post-check=0, pre-check=0", false);
		header("Pragma: no-cache");
	}
/**
 * Shows a message to the user for $pause seconds, then redirects to $url.
 * Uses flash.ctp as the default layout for the message.
 * Does not work if the current debug level is higher than 0.
 *
 * @param string $message Message to display to the user
 * @param mixed $url Relative string or array-based URL to redirect to after the time expires
 * @param integer $pause Time to show the message
 * @return void Renders flash layout
 * @access public
 * @link http://book.cakephp.org/view/426/flash
 */
	function flash($message, $url, $pause = 1) {
		$this->autoRender = false;
		$this->set('url', Router::url($url));
		$this->set('message', $message);
		$this->set('pause', $pause);
		$this->set('page_title', $message);
		$this->render(false, 'flash');
	}
/**
 * Converts POST'ed form data to a model conditions array, suitable for use in a Model::find() call.
 *
 * @param array $data POST'ed data organized by model and field
 * @param mixed $op A string containing an SQL comparison operator, or an array matching operators to fields
 * @param string $bool SQL boolean operator: AND, OR, XOR, etc.
 * @param boolean $exclusive If true, and $op is an array, fields not included in $op will not be included in the returned conditions
 * @return array An array of model conditions
 * @access public
 * @link http://book.cakephp.org/view/432/postConditions
 */
	function postConditions($data = array(), $op = null, $bool = 'AND', $exclusive = false) {
		if (!is_array($data) || empty($data)) {
			if (!empty($this->data)) {
				$data = $this->data;
			} else {
				return null;
			}
		}
		$cond = array();

		if ($op === null) {
			$op = '';
		}

		foreach ($data as $model => $fields) {
			foreach ($fields as $field => $value) {
				$key = $model.'.'.$field;
				$fieldOp = $op;
				if (is_array($op) && array_key_exists($key, $op)) {
					$fieldOp = $op[$key];
				} elseif (is_array($op) && array_key_exists($field, $op)) {
					$fieldOp = $op[$field];
				} elseif (is_array($op)) {
					$fieldOp = false;
				}
				if ($exclusive && $fieldOp === false) {
					continue;
				}
				$fieldOp = strtoupper(trim($fieldOp));
				if ($fieldOp === 'LIKE') {
					$key = $key.' LIKE';
					$value = '%'.$value.'%';
				} elseif ($fieldOp && $fieldOp != '=') {
					$key = $key.' '.$fieldOp;
				}
				$cond[$key] = $value;
			}
		}
		if ($bool != null && strtoupper($bool) != 'AND') {
			$cond = array($bool => $cond);
		}
		return $cond;
	}
/**
 * Handles automatic pagination of model records.
 *
 * @param mixed $object Model to paginate (e.g: model instance, or 'Model', or 'Model.InnerModel')
 * @param mixed $scope Conditions to use while paginating
 * @param array $whitelist List of allowed options for paging
 * @return array Model query results
 * @access public
 * @link http://book.cakephp.org/view/165/Controller-Setup
 */
	function paginate($object = null, $scope = array(), $whitelist = array()) {
		if (is_array($object)) {
			$whitelist = $scope;
			$scope = $object;
			$object = null;
		}
		$assoc = null;

		if (is_string($object)) {
			$assoc = null;

			if (strpos($object, '.') !== false) {
				list($object, $assoc) = explode('.', $object);
			}

			if ($assoc && isset($this->{$object}->{$assoc})) {
				$object =& $this->{$object}->{$assoc};
			} elseif ($assoc && isset($this->{$this->modelClass}) && isset($this->{$this->modelClass}->{$assoc})) {
				$object =& $this->{$this->modelClass}->{$assoc};
			} elseif (isset($this->{$object})) {
				$object =& $this->{$object};
			} elseif (isset($this->{$this->modelClass}) && isset($this->{$this->modelClass}->{$object})) {
				$object =& $this->{$this->modelClass}->{$object};
			}
		} elseif (empty($object) || $object === null) {
			if (isset($this->{$this->modelClass})) {
				$object =& $this->{$this->modelClass};
			} else {
				$className = null;
				$name = $this->uses[0];
				if (strpos($this->uses[0], '.') !== false) {
					list($name, $className) = explode('.', $this->uses[0]);
				}
				if ($className) {
					$object =& $this->{$className};
				} else {
					$object =& $this->{$name};
				}
			}
		}

		if (!is_object($object)) {
			trigger_error(sprintf(__('Controller::paginate() - can\'t find model %1$s in controller %2$sController', true), $object, $this->name), E_USER_WARNING);
			return array();
		}
		$options = array_merge($this->params, $this->params['url'], $this->passedArgs);

		if (isset($this->paginate[$object->alias])) {
			$defaults = $this->paginate[$object->alias];
		} else {
			$defaults = $this->paginate;
		}

		if (isset($options['show'])) {
			$options['limit'] = $options['show'];
		}

		if (isset($options['sort'])) {
			$direction = null;
			if (isset($options['direction'])) {
				$direction = strtolower($options['direction']);
			}
			if ($direction != 'asc' && $direction != 'desc') {
				$direction = 'asc';
			}
			$options['order'] = array($options['sort'] => $direction);
		}

		if (!empty($options['order']) && is_array($options['order'])) {
			$alias = $object->alias ;
			$key = $field = key($options['order']);

			if (strpos($key, '.') !== false) {
				list($alias, $field) = explode('.', $key);
			}
			$value = $options['order'][$key];
			unset($options['order'][$key]);

			if (isset($object->{$alias}) && $object->{$alias}->hasField($field)) {
				$options['order'][$alias . '.' . $field] = $value;
			} elseif ($object->hasField($field)) {
				$options['order'][$alias . '.' . $field] = $value;
			}
		}
		$vars = array('fields', 'order', 'limit', 'page', 'recursive');
		$keys = array_keys($options);
		$count = count($keys);

		for ($i = 0; $i < $count; $i++) {
			if (!in_array($keys[$i], $vars, true)) {
				unset($options[$keys[$i]]);
			}
			if (empty($whitelist) && ($keys[$i] === 'fields' || $keys[$i] === 'recursive')) {
				unset($options[$keys[$i]]);
			} elseif (!empty($whitelist) && !in_array($keys[$i], $whitelist)) {
				unset($options[$keys[$i]]);
			}
		}
		$conditions = $fields = $order = $limit = $page = $recursive = null;

		if (!isset($defaults['conditions'])) {
			$defaults['conditions'] = array();
		}

		$type = 'all';

		if (isset($defaults[0])) {
			$type = $defaults[0];
			unset($defaults[0]);
		}
		$options = array_merge(array('page' => 1, 'limit' => 20), $defaults, $options);
		$options['limit'] = (empty($options['limit']) || !is_numeric($options['limit'])) ? 1 : $options['limit'];
		extract($options);

		if (is_array($scope) && !empty($scope)) {
			$conditions = array_merge($conditions, $scope);
		} elseif (is_string($scope)) {
			$conditions = array($conditions, $scope);
		}
		if ($recursive === null) {
			$recursive = $object->recursive;
		}

		$extra = array_diff_key($defaults, compact(
			'conditions', 'fields', 'order', 'limit', 'page', 'recursive'
		));
		if ($type !== 'all') {
			$extra['type'] = $type;
		}

		if (method_exists($object, 'paginateCount')) {
			$count = $object->paginateCount($conditions, $recursive, $extra);
		} else {
			$parameters = compact('conditions');
			if ($recursive != $object->recursive) {
				$parameters['recursive'] = $recursive;
			}
			$count = $object->find('count', array_merge($parameters, $extra));
		}
		$pageCount = intval(ceil($count / $limit));

		if ($page === 'last' || $page >= $pageCount) {
			$options['page'] = $page = $pageCount;
		} elseif (intval($page) < 1) {
			$options['page'] = $page = 1;
		}
		$page = $options['page'] = (integer)$page;

		if (method_exists($object, 'paginate')) {
			$results = $object->paginate($conditions, $fields, $order, $limit, $page, $recursive, $extra);
		} else {
			$parameters = compact('conditions', 'fields', 'order', 'limit', 'page');
			if ($recursive != $object->recursive) {
				$parameters['recursive'] = $recursive;
			}
			$results = $object->find($type, array_merge($parameters, $extra));
		}
		$paging = array(
			'page'		=> $page,
			'current'	=> count($results),
			'count'		=> $count,
			'prevPage'	=> ($page > 1),
			'nextPage'	=> ($count > ($page * $limit)),
			'pageCount'	=> $pageCount,
			'defaults'	=> array_merge(array('limit' => 20, 'step' => 1), $defaults),
			'options'	=> $options
		);
		$this->params['paging'][$object->alias] = $paging;

		if (!in_array('Paginator', $this->helpers) && !array_key_exists('Paginator', $this->helpers)) {
			$this->helpers[] = 'Paginator';
		}
		return $results;
	}
/**
 * Called before the controller action.
 *
 * @access public
 * @link http://book.cakephp.org/view/60/Callbacks
 */
	function beforeFilter() {
	}
/**
 * Called after the controller action is run, but before the view is rendered.
 *
 * @access public
 * @link http://book.cakephp.org/view/60/Callbacks
 */
	function beforeRender() {
	}
/**
 * Called after the controller action is run and rendered.
 *
 * @access public
 * @link http://book.cakephp.org/view/60/Callbacks
 */
	function afterFilter() {
	}
/**
 * This method should be overridden in child classes.
 *
 * @param string $method name of method called example index, edit, etc.
 * @return boolean Success
 * @access protected
 * @link http://book.cakephp.org/view/60/Callbacks
 */
	function _beforeScaffold($method) {
		return true;
	}
/**
 * This method should be overridden in child classes.
 *
 * @param string $method name of method called either edit or update.
 * @return boolean Success
 * @access protected
 * @link http://book.cakephp.org/view/60/Callbacks
 */
	function _afterScaffoldSave($method) {
		return true;
	}
/**
 * This method should be overridden in child classes.
 *
 * @param string $method name of method called either edit or update.
 * @return boolean Success
 * @access protected
 * @link http://book.cakephp.org/view/60/Callbacks
 */
	function _afterScaffoldSaveError($method) {
		return true;
	}
/**
 * This method should be overridden in child classes.
 * If not it will render a scaffold error.
 * Method MUST return true in child classes
 *
 * @param string $method name of method called example index, edit, etc.
 * @return boolean Success
 * @access protected
 * @link http://book.cakephp.org/view/60/Callbacks
 */
	function _scaffoldError($method) {
		return false;
	}
}
?>
