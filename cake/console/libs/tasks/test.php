<?php
/* SVN FILE: $Id$ */
/**
 * The TestTask handles creating and updating test files.
 *
 * Long description for file
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
 * @subpackage    cake.cake.console.libs.tasks
 * @since         CakePHP(tm) v 1.2
 * @version       $Revision$
 * @modifiedby    $LastChangedBy$
 * @lastmodified  $Date$
 * @license       http://www.opensource.org/licenses/mit-license.php The MIT License
 */
/**
 * Task class for creating and updating test files.
 *
 * @package       cake
 * @subpackage    cake.cake.console.libs.tasks
 */
class TestTask extends Shell {
/**
 * Name of plugin
 *
 * @var string
 * @access public
 */
	var $plugin = null;
/**
 * path to TESTS directory
 *
 * @var string
 * @access public
 */
	var $path = TESTS;

/**
 * class types that methods can be generated for
 *
 * @var array
 **/
	var $classTypes =  array('Model', 'Controller', 'Component', 'Behavior', 'Helper');

/**
 * Execution method always used for tasks
 *
 * @access public
 */
	function execute() {
		if (empty($this->args)) {
			$this->__interactive();
		}

		if (count($this->args) == 1) {
			$this->__interactive($this->args[0]);
		}

		if (count($this->args) > 1) {
			$class = Inflector::underscore($this->args[0]);
			if ($this->bake($class, $this->args[1])) {
				$this->out('done');
			}
		}
	}

/**
 * Handles interactive baking
 *
 * @access private
 */
	function __interactive($type = null) {
		$this->hr();
		$this->out(__('Bake Tests', true));
		$this->out(sprintf(__("Path: %s", true), $this->path));
		$this->hr();

		$selection = null;
		if ($type) {
			$type = Inflector::camelize($type);
			if (in_array($type, $this->classTypes)) {
				$selection = array_search($type);
			}
		}
		if (!$selection) {
			$selection = $this->getObjectType();
		}
		/*

			$key = $this->in(__("Enter the class to bake a test for or (q)uit", true), $keys, 'q');

			if ($key != 'q') {
				if (isset($options[--$key])) {
					$class = $options[$key];
				}

				if ($class) {
					$name = $this->in(__("Enter the name for the test or (q)uit", true), null, 'q');
					if ($name !== 'q') {
						$case = null;
						while ($case !== 'q') {
							$case = $this->in(__("Enter a test case or (q)uit", true), null, 'q');
							if ($case !== 'q') {
								$cases[] = $case;
							}
						}
						if ($this->bake($class, $name, $cases)) {
							$this->out(__("Test baked\n", true));
							$type = null;
						}
						$class = null;
					}
				}
			} else {
				$this->_stop();
			}
		}
		*/
	}

/**
 * Interact with the user and get their chosen type. Can exit the script.
 *
 * @return int Index of users chosen object type.
 **/
	function getObjectType() {
		$this->hr();
		$this->out(__("Select an object type:", true));
		$this->hr();

		$keys = array();
		foreach ($this->classTypes as $key => $option) {
			$this->out(++$key . '. ' . $option);
			$keys[] = $key;
		}
		$keys[] = 'q';
		$selection = $this->in(__("Enter the type of object to bake a test for or (q)uit", true), $keys, 'q');
		if ($selection == 'q') {
			$this->_stop();
		}
		return $selection;
	}

/**
 * Writes File
 *
 * @access public
 */
	function bake($class, $name = null, $cases = array()) {
		if (!$name) {
			return false;
		}

		if (!is_array($cases)) {
			$cases = array($cases);
		}

		if (strpos($this->path, $class) === false) {
			$this->filePath = $this->path . 'cases' . DS . Inflector::tableize($class) . DS;
		}

		$class = Inflector::classify($class);
		$name = Inflector::classify($name);

		$import = $name;
		if (isset($this->plugin)) {
			$import = $this->plugin . '.' . $name;
		}
		$extras = $this->__extras($class);
		$out = "App::import('$class', '$import');\n";
		if ($class == 'Model') {
			$class = null;
		}
		$out .= "class Test{$name} extends {$name}{$class} {\n";
		$out .= "{$extras}";
		$out .= "}\n\n";
		$out .= "class {$name}{$class}Test extends CakeTestCase {\n";
		$out .= "\n\tfunction startTest() {";
		$out .= "\n\t\t\$this->{$name} = new Test{$name}();";
		$out .= "\n\t}\n";
		$out .= "\n\tfunction test{$name}Instance() {\n";
		$out .= "\t\t\$this->assertTrue(is_a(\$this->{$name}, '{$name}{$class}'));\n\t}\n";
		foreach ($cases as $case) {
			$case = Inflector::classify($case);
			$out .= "\n\tfunction test{$case}() {\n\n\t}\n";
		}
		$out .= "}\n";

		$this->out("Baking unit test for $name...");
		$this->out($out);
		$ok = $this->in(__('Is this correct?', true), array('y', 'n'), 'y');
		if ($ok == 'n') {
			return false;
		}

		$header = '$Id';
		$content = "<?php \n/* SVN FILE: $header$ */\n/* ". $name ." Test cases generated on: " . date('Y-m-d H:m:s') . " : ". time() . "*/\n{$out}?>";
		return $this->createFile($this->filePath . Inflector::underscore($name) . '.test.php', $content);
	}
/**
 * Handles the extra stuff needed
 *
 * @access private
 */
	function __extras($class) {
		$extras = null;
		switch ($class) {
			case 'Model':
				$extras = "\n\tvar \$cacheSources = false;";
				$extras .= "\n\tvar \$useDbConfig = 'test_suite';\n";
			break;
		}
		return $extras;
	}

/**
 * Get methods declared in the class given.
 * No parent methods will be returned
 *
 * @param string $className Name of class to look at.
 * @return array Array of method names.
 **/
	function getTestableMethods($className) {
		$classMethods = get_class_methods($className);
		$parentMethods = get_class_methods(get_parent_class($className));
		$thisMethods = array_diff($classMethods, $parentMethods);
		$out = array();
		foreach ($thisMethods as $method) {
			if (substr($method, 0, 1) != '_') {
				$out[] = $method;
			}
		}
		return $out;
	}

/**
 * Generate the list of fixtures that will be required to run this test based on
 * loaded models.
 *
 * @param object The object you want to generate fixtures for.
 * @return array Array of fixtures to be included in the test.
 **/
	function generateFixtureList(&$subject) {
		$this->_fixtures = array();
		if (is_a($subject, 'Model')) {
			$this->_processModel($subject);
		} elseif (is_a($subject, 'Controller')) {
			$this->_processController($subject);
		}
		return array_values($this->_fixtures);
	}

/**
 * Process a model recursively and pull out all the
 * model names converting them to fixture names.
 *
 * @return void
 **/
	function _processModel(&$subject) {
		$this->_addFixture($subject->name);
		$associated = $subject->getAssociated();
		foreach ($associated as $alias => $type) {
			$className = $subject->{$alias}->name;
			if (!isset($this->_fixtures[$className])) {
				$this->_processModel($subject->{$alias});
			}
			if ($type == 'hasAndBelongsToMany') {
				$joinModel = Inflector::classify($subject->hasAndBelongsToMany[$alias]['joinTable']);
				if (!isset($this->_fixtures[$joinModel])) {
					$this->_processModel($subject->{$joinModel});
				}
			}
		}
	}

/**
 * Process all the models attached to a controller
 * and generate a fixture list.
 *
 * @return void
 **/
	function _processController(&$subject) {
		$subject->constructClasses();
		$models = array(Inflector::classify($subject->name));
		if (!empty($subject->uses)) {
			$models = $subject->uses;
		}
		foreach ($models as $model) {
			$this->_processModel($subject->{$model});
		}
	}

/**
 * Add classname to the fixture list.
 * Sets the app. or plugin.plugin_name. prefix.
 *
 * @return void
 **/
	function _addFixture($name) {
		$parent = get_parent_class($name);
		$prefix = 'app.';
		if (strtolower($parent) != 'appmodel' && strtolower(substr($parent, -8)) == 'appmodel') {
			$pluginName = substr($parent, 0, strlen($parent) -8);
			$prefix = 'plugin.' . Inflector::underscore($pluginName) . '.';
		}
		$fixture = $prefix . Inflector::underscore($name);
		$this->_fixtures[$name] = $fixture;
	}

/**
 * Create a test for a Model object.
 *
 * @return void
 **/
	function bakeModelTest($className) {
		$fixtureInc = 'app';
		if ($this->plugin) {
			$fixtureInc = 'plugin.'.Inflector::underscore($this->plugin);
		}

		$fixture[] = "'{$fixtureInc}." . Inflector::underscore($className) ."'";

		if (!empty($associations)) {
			$assoc[] = Set::extract($associations, 'belongsTo.{n}.className');
			$assoc[] = Set::extract($associations, 'hasOne.{n}.className');
			$assoc[] = Set::extract($associations, 'hasMany.{n}.className');
			foreach ($assoc as $key => $value) {
				if (is_array($value)) {
					foreach ($value as $class) {
						$fixture[] = "'{$fixtureInc}." . Inflector::underscore($class) ."'";
					}
				}
			}
		}
		$fixture = join(", ", $fixture);

		$import = $className;
		if (isset($this->plugin)) {
			$import = $this->plugin . '.' . $className;
		}

		$out = "App::import('Model', '$import');\n\n";
		$out .= "class {$className}TestCase extends CakeTestCase {\n";
		$out .= "\tvar \${$className} = null;\n";
		$out .= "\tvar \$fixtures = array($fixture);\n\n";
		$out .= "\tfunction startTest() {\n";
		$out .= "\t\t\$this->{$className} =& ClassRegistry::init('{$className}');\n";
		$out .= "\t}\n\n";
		$out .= "\tfunction endTest() {\n";
		$out .= "\t\tunset(\$this->{$className});\n";
		$out .= "\t}\n\n";
		$out .= "\tfunction test{$className}Instance() {\n";
		$out .= "\t\t\$this->assertTrue(is_a(\$this->{$className}, '{$className}'));\n";
		$out .= "\t}\n\n";
		$out .= "}\n";

		$path = MODEL_TESTS;
		if (isset($this->plugin)) {
			$pluginPath = 'plugins' . DS . Inflector::underscore($this->plugin) . DS;
			$path = APP . $pluginPath . 'tests' . DS . 'cases' . DS . 'models' . DS;
		}

		$filename = Inflector::underscore($className).'.test.php';
		$this->out("\nBaking unit test for $className...");

		$header = '$Id';
		$content = "<?php \n/* SVN FILE: $header$ */\n/* ". $className ." Test cases generated on: " . date('Y-m-d H:m:s') . " : ". time() . "*/\n{$out}?>";
		return $this->createFile($path . $filename, $content);
	}

/**
 * Create a test case for a controller.
 *
 * @return void
 **/
	function bakeControllerTest() {
		$import = $className;
		if ($this->plugin) {
			$import = $this->plugin . '.' . $className;
		}
		$out = "App::import('Controller', '$import');\n\n";
		$out .= "class Test{$className} extends {$className}Controller {\n";
		$out .= "\tvar \$autoRender = false;\n}\n\n";
		$out .= "class {$className}ControllerTest extends CakeTestCase {\n";
		$out .= "\tvar \${$className} = null;\n\n";
		$out .= "\tfunction startTest() {\n\t\t\$this->{$className} = new Test{$className}();";
		$out .= "\n\t\t\$this->{$className}->constructClasses();\n\t}\n\n";
		$out .= "\tfunction test{$className}ControllerInstance() {\n";
		$out .= "\t\t\$this->assertTrue(is_a(\$this->{$className}, '{$className}Controller'));\n\t}\n\n";
		$out .= "\tfunction endTest() {\n\t\tunset(\$this->{$className});\n\t}\n}\n";

		$path = CONTROLLER_TESTS;
		if (isset($this->plugin)) {
			$pluginPath = 'plugins' . DS . Inflector::underscore($this->plugin) . DS;
			$path = APP . $pluginPath . 'tests' . DS . 'cases' . DS . 'controllers' . DS;
		}

		$filename = Inflector::underscore($className).'_controller.test.php';
		$this->out("\nBaking unit test for $className...");

		$header = '$Id';
		$content = "<?php \n/* SVN FILE: $header$ */\n/* ". $className ."Controller Test cases generated on: " . date('Y-m-d H:m:s') . " : ". time() . "*/\n{$out}?>";
		return $this->createFile($path . $filename, $content);
	}
}
?>