<?php
 class menuHelper extends AppHelper
 {
 	var $helpers = array('Html');
 	
 	function renderMenu($menuData, $menuId, $hasBoxes, $adminMode)
 	{
		$View =& ClassRegistry::getObject('view');
		$output = '';
		
		if(isset($menuData[$menuId]))
		{
			foreach($menuData[$menuId] as $menuItem)
			{
				if($adminMode)
				{
					$metaData = $menuItem['sidebox'] == 0 ? $this->linkMetadata($menuItem) : $this->boxMetadata($menuItem);
					
					$output .= '<li metadata="'.$metaData.'">';

					$editImage = $this->Html->image('edit.png', array('class' => 'editLink', 'border' => 0));
					$deleteImage = $this->Html->image('remove.png', array('class' => 'removeLink', 'border' => 0));
					$output .= '<span class="hoverAction" style="background-color:#fff;">
							<a href="#">'.$editImage.'</a>
							&nbsp;<a href="#">'.$deleteImage.'</a></span>';				
				}
				else
				{
					$output .= '<li>';
				}
				
				if($menuItem['sidebox'] == 1)
				{
					$output .= $View->element('menu_box', compact('menuItem', 'adminMode'));
				}
				else
				{
					$output .= $View->element('menu_link', compact('menuItem', 'adminMode'));
				}
				

				
				$output .= '</li>';
			}
		}
		
		if($adminMode)
		{
			$output .= $View->element('menu_edit', compact('hasBoxes'));
		}
		
		return $output;
 	}
 	
 	function linkMetadata($link)
 	{
 		if(!isset($link['options']) || $link['options'] == null)
			$link['options'] = array();
			
		$menuLink = array();
		$menuLink['controller'] = $link['controller'];
		$menuLink['action'] = $link['action'];
		$menuLink['admin'] = false;

		if(isset($link['plugin']))
		{
			$menuLink['plugin'] = Inflector::underscore($link['plugin']['name']);
		}
		else
		{
			$menuLink['plugin'] = false;
		}

		$metadata = array();
		$metadata['itemInfo'] = $link;
		$metadata['linkUrl'] = $this->url($menuLink);
		
		if(isset($link['edit_action']) && $link['edit_action'] != '')
		{
			$editLink = $menuLink;
			$editLink['action'] = $link['edit_action'];
			$metadata['editUrl'] = $this->url($editLink);
		}

		$metadata['isbox'] = false;
		
		if(isset($link['id']))
		{
			$metadata['id'] = $link['id'];
		}

		return htmlspecialchars(json_encode($metadata));
 	}
 	
 	function boxMetadata($sidebox)
 	{
 		$metadata = array();
 		
		if(!isset($sidebox['options']) || $sidebox['options'] == null)
			$sidebox['options'] = array(); 		
 		
		$metadata['itemInfo'] = $sidebox;
		$metadata['isbox'] = true;
		
 		if(isset($sidebox['id']))
		{
			$metadata['id'] = $sidebox['id'];
		}
		
 		if(isset($sidebox['edit_action']) && $sidebox['edit_action'] != '')
		{
			$editLink = array();
			$editLink['plugin'] = $link['plugin'];
			$editLink['controller'] = $link['controller'];
			$editLink['action'] = $link['edit_action'];
			$metadata['editUrl'] = $this->Html->url($editLink);
		}		
		
		return htmlspecialchars(json_encode($metadata));
 	}
 }
?>