<?PHP
//////////////////////////////////////////////////////////////////////////
// + $Id$
// +------------------------------------------------------------------+ //
// + Cake <https://developers.nextco.com/cake/>                       + //
// + Copyright: (c) 2005, Cake Authors/Developers                     + //
// + Author(s): Michal Tatarynowicz aka Pies <tatarynowicz@gmail.com> + //
// +            Larry E. Masters aka PhpNut <nut@phpnut.com>          + //
// +            Kamil Dzielinski aka Brego <brego.dk@gmail.com>       + //
// +------------------------------------------------------------------+ //
// + Licensed under The MIT License                                   + //
// + Redistributions of files must retain the above copyright notice. + //
// + See: http://www.opensource.org/licenses/mit-license.php          + //
//////////////////////////////////////////////////////////////////////////

/**
  * PostgreSQL layer for DBO.
  * 
  * @filesource 
  * @author Cake Authors/Developers
  * @copyright Copyright (c) 2005, Cake Authors/Developers
  * @link https://developers.nextco.com/cake/wiki/Authors Authors/Developers
  * @package cake
  * @subpackage cake.libs
  * @since Cake v 1.0.0.114
  * @version $Revision$
  * @modifiedby $LastChangedBy$
  * @lastmodified $Date$
  * @license http://www.opensource.org/licenses/mit-license.php The MIT License
  */

/**
  * Include DBO.
  *
  */
uses('dbo');

/**
  * PostgreSQL layer for DBO.
  *
  * @package cake
  * @subpackage cake.libs
  * @since Cake v 1.0.0.114
  *
  */
class DBO_Postgres extends DBO {
	
/**
  * Connects to the database using options in the given configuration array.
  *
  * @param array $config Configuration array for connecting
  */
	function connect ($config) {
		if($config) {
			$this->config = $config;
			$this->_conn = pg_pconnect("host={$config['host']} dbname={$config['database']} user={$config['login']} password={$config['password']}");
		}
		$this->connected = $this->_conn? true: false;

		if($this->connected)
			return true;
		else
			die('Could not connect to DB.');

	}

/**
  * Disconnects from database.
  *
  * @return boolean True if the database could be disconnected, else false
  */
	function disconnect () {
		return pg_close($this->_conn);
	}

/**
  * Executes given SQL statement.
  *
  * @param string $sql SQL statement
  * @return resource Result resource identifier
  */
	function execute ($sql) {
		return pg_query($this->_conn, $sql);
	}

/**
  * Returns a row from given resultset.
  *
  * @param unknown_type $res
  * @return unknown
  */
	function fetchRow ($res) {
		 return pg_fetch_array($res);
	}

/**
  * Returns an array of tables in the database. If there are no tables, an error is raised and the application exits.
  *
  * @return array Array of tablenames in the database
  */
	function tables () {
		$sql = "SELECT a.relname AS name
         FROM pg_class a, pg_user b
         WHERE ( relkind = 'r') and relname !~ '^pg_' AND relname !~ '^sql_'
         AND relname !~ '^xin[vx][0-9]+' AND b.usesysid = a.relowner
         AND NOT (EXISTS (SELECT viewname FROM pg_views WHERE viewname=a.relname));";

		$result = $this->all($sql);

		if (!$result) {
			trigger_error(ERROR_NO_TABLE_LIST, E_USER_ERROR);
			exit;
		}
		else {
			$tables = array();
			foreach ($result as $item) $tables[] = $item['name'];
			return $tables;
		}
	}

/**
  * Returns an array of the fields in given table name.
  *
  * @param string $table_name Name of database table to inspect
  * @return array Fields in table. Keys are name and type
  */
	function fields ($table_name) {
		$sql = "SELECT c.relname, a.attname, t.typname FROM pg_class c, pg_attribute a, pg_type t WHERE c.relname = '{$table_name}' AND a.attnum > 0 AND a.attrelid = c.oid AND a.atttypid = t.oid";
		
		$fields = false;
		foreach ($this->all($sql) as $field) {
			$fields[] = array(
				'name' => $field['attname'],
				'type' => $field['typname']);
		}

		return $fields;
	}

/**
  * Returns a quoted and escaped string of $data for use in an SQL statement.
  *
  * @param string $data String to be prepared for use in an SQL statement
  * @return string Quoted and escaped
  */
	function prepareValue ($data) {
		return "'".pg_escape_string($data)."'";
	}

/**
  * Returns a formatted error message from previous database operation.
  *
  * @return string Error message
  */
	function lastError () {
		return pg_last_error()? pg_last_error(): null;
	}

/**
  * Returns number of affected rows in previous database operation. If no previous operation exists, this returns false.
  *
  * @return int Number of affected rows
  */
	function lastAffected () {
		return $this->_result? pg_affected_rows($this->_result): false;
	}

/**
  * Returns number of rows in previous resultset. If no previous resultset exists, 
  * this returns false.
  *
  * @return int Number of rows
  */
	function lastNumRows () {
		return $this->_result? pg_num_rows($this->_result): false;
	}

/**
  * Returns the ID generated from the previous INSERT operation.
  *
  * @param string $table Name of the database table
  * @param string $field Name of the ID database field. Defaults to "id"
  * @return unknown
  */
	function lastInsertId ($table, $field='id') {
		$sql = "SELECT CURRVAL('{$table}_{$field}_seq') AS max";
		$res = $this->rawQuery($sql);
		$data = $this->fetchRow($res);
		return $data['max'];
	}
}

?>