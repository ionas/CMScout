<?php
/* SVN FILE: $Id$ */

/**
 * Short description for file.
 * 
 * Long description for file
 *
 * PHP versions 4 and 5
 *
 * CakePHP :  Rapid Development Framework <http://www.cakephp.org/>
 * Copyright (c) 2005, CakePHP Authors/Developers
 *
 * Author(s): Michal Tatarynowicz aka Pies <tatarynowicz@gmail.com>
 *            Larry E. Masters aka PhpNut <nut@phpnut.com>
 *            Kamil Dzielinski aka Brego <brego.dk@gmail.com>
 *
 *  Licensed under The MIT License
 *  Redistributions of files must retain the above copyright notice.
 *
 * @filesource 
 * @author       CakePHP Authors/Developers
 * @copyright    Copyright (c) 2005, CakePHP Authors/Developers
 * @link         https://trac.cakephp.org/wiki/Authors Authors/Developers
 * @package      cake
 * @subpackage   cake.libs
 * @since        CakePHP v 0.2.9
 * @version      $Revision$
 * @modifiedby   $LastChangedBy$
 * @lastmodified $Date$
 * @license      http://www.opensource.org/licenses/mit-license.php The MIT License
 */

/**
  * Enter description here...
  */
uses('object');

/**
 * View, the V in the MVC triad. 
 *
 * Class holding methods for displaying presentation data.
 *
 * @package    cake
 * @subpackage cake.libs
 * @since      CakePHP v 0.9.1
 */
class View extends Object
{
/**
 * Name of the controller.
 *
 * @var string Name of controller
 * @access public
 */
   var $name = null;

/**
 * Stores the current URL (for links etc.)
 *
 * @var string Current URL
 */
   var $here = null;

/**
 * Enter description here...
 *
 * @var unknown_type
 * @access public
 */
   var $parent = null;

/**
 * Action to be performed.
 *
 * @var string Name of action
 * @access public
 */
   var $action = null;

/**
 * An array of names of models the particular controller wants to use.
 *
 * @var mixed A single name as a string or a list of names as an array.
 * @access protected
 */
   var $uses = false;

/**
 * An array of names of built-in helpers to include.
 *
 * @var mixed A single name as a string or a list of names as an array.
 * @access protected
 */
   var $helpers = array('html');

/**
 * Path to View.
 *
 * @var string Path to View
 */
   var $viewPath;

/**
 * Variables for the view
 *
 * @var array
 * @access private
 */
   var $_viewVars = array();

/**
 * Title HTML element of this View.
 *
 * @var boolean
 * @access private
 */
   var $pageTitle = false;

/**
 * An array of model objects.
 *
 * @var array Array of model objects.
 * @access public
 */
   var $models = array();

/**
 * Path parts for creating links in views.
 *
 * @var string Base URL
 * @access public
 */
   var $base = null;

/**
 * Name of layout to use with this View.
 *
 * @var string
 * @access public
 */
   var $layout = 'default';

/**
 * Turns on or off Cake's conventional mode of rendering views. On by default.
 *
 * @var boolean
 * @access public
 */
   var $autoRender = true;

/**
 * Turns on or off Cake's conventional mode of finding layout files. On by default.
 *
 * @var boolean
 * @access public
 */
   var $autoLayout = true;

/**
 * Array of parameter data
 *
 * @var array Parameter data
 */
   var $params;
/**
 * Enter description here...
 *
 * @var boolean
 */
   var $hasRendered = null;

/**
 * Enter description here...
 *
 * @var boolean
 */
   var $modelsLoaded = false;

/**
 * Constructor
 *
 * @return View
 */
   function View(){
   }

/**
 * Returns a view instance (singleton)
 *
 * @return object
 */
   function getInstance()
   {
      static $instance;
      if (!isset($instance))
      {
         $instance[0] =& new View();
      }
      return $instance[0];
   }


/**
 * Renders view for given action and layout. If $file is given, that is used 
 * for a view filename (e.g. customFunkyView.thtml).
 *
 * @param string $action Name of action to render for
 * @param string $layout 
 * @param string $file Custom filename for view
 */
   function render($action=null, $layout=null, $file=null)
   {

      if ($this->modelsLoaded!==true)
      {
         foreach ($this->models as $modelName => $model)
         {
            $this->$modelName = $model;
         }
      }
      // What is reason for these being the same?
      if (isset($this->hasRendered) && $this->hasRendered)
      {
         return true;
      }
      else
      {
         $this->hasRendered = false;
      }

      $this->autoRender = false;

      if (!$action)
      {
         $action = $this->action;
      }
      if ($layout)
      {
         $this->setLayout($layout);
      }

      $viewFileName = $file? $file: $this->_getViewFileName($action);

      if (!is_file($viewFileName))
      {
         if (strtolower(get_class($this)) == 'template')
         {
            return array('action' => $action, 'layout' => $layout, 'viewFn' => $viewFileName);
         }

         // check to see if the missing view is due to a custom missingAction
         if (strpos($action, 'missingAction') !== false)
         {
            $errorAction = 'missingAction';
         }
         else
         {
            $errorAction = 'missingView';
         }

         // check for controller-level view handler
         foreach(array($this->name, 'errors') as $viewDir)
         {
            $missingViewFileName = VIEWS.$viewDir.DS.Inflector::underscore($errorAction).'.thtml';
            $missingViewExists = is_file($missingViewFileName);
            if ($missingViewExists)
            {
               break;
            }
         }

         if (strpos($action, 'missingView') === false)
         {
            $controller = $this;
            $controller->missingView = $viewFileName;
            $controller->action      = $action;
            call_user_func_array(array(&$controller, 'missingView'), empty($params['pass'])? null: $params['pass']);
            $isFatal = isset($this->isFatal) ? $this->isFatal : false;
            if (!$isFatal)
            {
               $viewFileName = $missingViewFileName;
            }
         }
         else
         {
            $missingViewExists = false;
         }

         if (!$missingViewExists || $isFatal)
         {
            // app/view/errors/missing_view.thtml view is missing!
            if (DEBUG)
            {
               trigger_error(sprintf(ERROR_NO_VIEW, $action, $viewFileName), E_USER_ERROR);
            }
            else
            {
               $this->error('404', 'Not found', sprintf(ERROR_404, '', "missing view \"{$action}\""));
            }

            die();
         }
      }

      if ($viewFileName && !$this->hasRendered)
      {
         $out = $this->_render($viewFileName, $this->_viewVars, 0);
         if ($out !== false)
         {
            if ($this->layout && $this->autoLayout)
            {
               $out = $this->renderLayout($out);
            }

            print $out;
            $this->hasRendered = true;
         }
         else
         {
            $out = $this->_render($viewFileName, $this->_viewVars, false);
            trigger_error(sprintf(ERROR_IN_VIEW, $viewFileName, $out), E_USER_ERROR);
         }

         return true;
      }
   }

/**
 * Renders a piece of PHP with provided parameters and returns HTML, XML, or any other string.
 *
 * This realizes the concept of Elements, (or "partial layouts")
 * and the $params array is used to send data to be used in the 
 * Element.
 *
 * @param string $name Name of template file in the /app/views/elements/ folder
 * @param array $params Array of data to be made available to the for rendered view (i.e. the Element)
 * @return string Rendered output
 */
   function renderElement($name, $params=array())
   {
      $fn = ELEMENTS.$name.'.thtml';

      if (!file_exists($fn))
      {
         return "(Error rendering {$name})";
      }
      return $this->_render($fn, array_merge($this->_viewVars, $params));
   }

/**
 * Renders a layout. Returns output from _render(). Returns false on error.
 *
 * @param string $content_for_layout Content to render in a view, wrapped by the surrounding layout.
 * @return string Rendered output, or false on error
 */
   function renderLayout($content_for_layout)
   {
      $layout_fn = $this->_getLayoutFileName();

      $data_for_layout = array_merge($this->_viewVars, array(
      'title_for_layout'=>$this->pageTitle !== false? $this->pageTitle: Inflector::humanize($this->viewPath),
      'content_for_layout'=>$content_for_layout));

      if (is_file($layout_fn))
      {
         $out = $this->_render($layout_fn, $data_for_layout);

         if ($out === false)
         {
            $out = $this->_render($layout_fn, $data_for_layout, false);
            trigger_error(sprintf(ERROR_IN_LAYOUT, $layout_fn, $out), E_USER_ERROR);
            return false;
         }
         else
         {
            return $out;
         }
      }
      else
      {
         trigger_error(sprintf(ERROR_NO_LAYOUT, $this->layout, $layout_fn), E_USER_ERROR);
         return false;
      }
   }

/**
 * Set layout to be used when rendering.
 *
 * @param string $layout
 */
   function setLayout($layout)
   {
      $this->layout = $layout;
   }

/**
 * Displays an error page to the user. Uses layouts/error.html to render the page.
 *
 * @param int $code Error code (for instance: 404)
 * @param string $name Name of the error (for instance: Not Found)
 * @param string $message Error message as a web page
 */
   function error ($code, $name, $message)
   {
      header ("HTTP/1.0 {$code} {$name}");
      print ($this->_render(VIEWS.'layouts/error.thtml', array('code'=>$code,'name'=>$name,'message'=>$message)));
   }


/**
 * Renders the Missing Controller web page.
 *
 */
   function missingController()
   {
      //We are simulating action call below, this is not a filename!
      $this->render('../errors/missingController');
   }

/**
 * Renders the Missing Action web page.
 *
 */
   function missingAction()
   {
      //We are simulating action call below, this is not a filename!
      $this->render('../errors/missingAction');
   }

/**
 * Renders the Missing View web page.
 *
 */
   function missingView()
   {
      //We are simulating action call below, this is not a filename!
      $this->render('../errors/missingView');
   }


/**************************************************************************
   * Private methods.
   *************************************************************************/


/**
 * Returns filename of given action's template file (.thtml) as a string. CamelCased action names will be under_scored! This means that you can have LongActionNames that refer to long_action_names.thtml views.
 *
 * @param string $action Controller action to find template filename for
 * @return string Template filename
 * @access private
 */
   function _getViewFileName($action)
   {
      $action = Inflector::underscore($action);
      $viewFileName = VIEWS.$this->viewPath.DS."{$action}.thtml";
      $viewPath = explode(DS, $viewFileName);

      $i = array_search('..', $viewPath);

      unset($viewPath[$i-1]);
      unset($viewPath[$i]);

      return '/'.implode('/', $viewPath);
   }

/**
 * Returns layout filename for this template as a string.
 *
 * @return string Filename for layout file (.thtml).
 * @access private
 */
   function _getLayoutFileName()
   {
		if(file_exists(VIEWS."layouts".DS."{$this->layout}.thtml")){
	   return VIEWS."layouts".DS."{$this->layout}.thtml";
		}
		elseif(file_exists(LIBS.'controllers'.DS.'templates'.DS.'scaffolds'.DS."{$this->layout}.thtml")){
		   return LIBS.'controllers'.DS.'templates'.DS.'scaffolds'.DS."{$this->layout}.thtml";
		}
		else{//Let allows setting path to other layouts??
		 return;
		}
	}
   

/**
 * Renders and returns output for given view filename with its 
 * array of data.
 *
 * @param string $___viewFn Filename of the view
 * @param array $___data_for_view Data to include in rendered view
 * @param boolean $___play_safe If set to false, the include() of the $__viewFn is done without suppressing output of errors
 * @return string Rendered output
 * @access private
 */
   function _render($___viewFn, $___data_for_view, $___play_safe = true)
   {
   /**
    * Fetching helpers
    */
      if ($this->helpers !== false)
      {
         foreach ($this->helpers as $helper)
         {
            $helperFn = LIBS.'helpers'.DS.Inflector::underscore($helper).'.php';
            $helperCn = ucfirst($helper).'Helper';
            if (is_file($helperFn))
            {
               require_once $helperFn;
               if(class_exists($helperCn)===true);
               {
                  ${$helper}                       = new $helperCn;
                  ${$helper}->base                 = $this->base;
                  ${$helper}->here                 = $this->here;
                  ${$helper}->params               = $this->params;
                  ${$helper}->action               = $this->action;
                  ${$helper}->data                 = $this->data;
                  if(!empty($this->validationErrors))
                  {
                     ${$helper}->validationErrors = $this->validationErrors;
                  }
               }
            }
         }
      }

      extract($___data_for_view, EXTR_SKIP); # load all view variables
   /**
    * Local template variables.
    */
      $BASE       = $this->base;
      $params     = &$this->params;
      $page_title = $this->pageTitle;

   /**
    * Start caching output (eval outputs directly so we need to cache).
    */
      ob_start();

   /**
    * Include the template.
    */
      $___play_safe? @include($___viewFn): include($___viewFn);

      $out = ob_get_clean();

      return $out;
   }

}

?>