﻿-- phpMyAdmin SQL Dump
-- version 2.11.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 11, 2009 at 12:58 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `cmscout3`
--

-- --------------------------------------------------------

--
-- Table structure for table `acos`
--

DROP TABLE IF EXISTS `acos`;
CREATE TABLE IF NOT EXISTS `acos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) default NULL,
  `model` varchar(255) default '',
  `foreign_key` int(10) unsigned default NULL,
  `alias` varchar(255) default '',
  `explanation` mediumtext NOT NULL,
  `lft` int(10) default NULL,
  `rght` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=45 ;

--
-- Dumping data for table `acos`
--

INSERT INTO `acos` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `explanation`, `lft`, `rght`) VALUES
(1, NULL, '', NULL, 'Administration panel', '0,Access administrative functions', 1, 20),
(2, 1, '', NULL, 'Page manager', 'Add new page,Access page manager,Edit page,Delete page', 2, 3),
(3, 1, '', NULL, 'Menu manager', '0,Access menu manager,Edit menus', 4, 5),
(4, 1, '', NULL, 'Homepage manager', '0,Access homepage manager,Edit homepage', 6, 7),
(5, 1, '', NULL, 'Plugin manager', 'Install plugin,Access plugin manager,0,Uninstall plugin', 8, 9),
(6, 1, '', NULL, 'Users', 'Add new user,0,Edit users,Delete users', 10, 11),
(7, 1, '', NULL, 'Groups', 'Add new group,0,Edit groups,Delete groups', 12, 13),
(8, NULL, '', NULL, 'Pages', '0,View page(s),Edit page(s)', 21, 42),
(9, NULL, '', NULL, 'Plugins', '0,Access configuration', 43, 46),
(11, 8, 'Page', 1, '', '', 22, 23),
(12, 1, '', NULL, 'User groups', '0,0,Edit user groups', 14, 15),
(13, 1, '', NULL, 'UGP manager', '0,Access UGP manager,Edit permissions', 16, 17),
(14, 1, '', NULL, 'Configuration manager', '0,Access configuration manager,Change configuration options', 18, 19),
(15, NULL, '', NULL, 'Sideboxes', '0,Sidebox visible', 47, 54),
(17, 15, 'Sidebox', 1, '', '', 48, 49),
(21, NULL, '', NULL, 'Notifications', '0,Allowed to subscribe', 55, 58),
(22, 21, 'Notification', 1, '', '', 56, 57),
(23, NULL, '', NULL, 'Contributions', 'Add item,0,Update item,Delete item,0,Published by default', 59, 60),
(29, NULL, '', NULL, 'Comments', 'Post comments,Read comments', 61, 62),
(31, 8, 'Page', 3, '', '', 24, 25),
(32, 8, 'Page', 4, '', '', 26, 27),
(33, 8, 'Page', 5, '', '', 28, 29),
(34, 8, 'Page', 6, '', '', 30, 31),
(35, 8, 'Page', 7, '', '', 32, 33),
(36, 8, 'Page', 8, '', '', 34, 35),
(37, 8, 'Page', 9, '', '', 36, 37),
(38, 8, 'Page', 10, '', '', 38, 39),
(39, 8, 'Page', 11, '', '', 40, 41),
(40, 15, 'Sidebox', 2, '', '', 50, 51),
(41, 9, 'Plugin', 1, '', '', 44, 45),
(42, 15, 'Sidebox', 3, '', '', 52, 53),
(43, NULL, 'Plugin', 1, 'CMScout Forums', 'Post new topic,View forum,Edit own posts,Delete own posts,Reply to topic,Moderator', 63, 64),
(44, 43, 'ForumForum', 1, '', '', 65, 66);

-- --------------------------------------------------------

--
-- Table structure for table `aros`
--

DROP TABLE IF EXISTS `aros`;
CREATE TABLE IF NOT EXISTS `aros` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) default NULL,
  `model` varchar(255) default '',
  `foreign_key` int(10) unsigned default NULL,
  `alias` varchar(255) default '',
  `lft` int(10) default NULL,
  `rght` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `aros`
--

INSERT INTO `aros` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(1, NULL, '', NULL, 'Users', 1, 6),
(2, NULL, '', NULL, 'Groups', 7, 12),
(4, 2, 'Group', 2, '', 8, 9),
(5, 1, 'User', 1, '', 2, 3),
(6, NULL, '', NULL, 'Guest', 13, 14),
(7, 2, 'Group', 1, '', 10, 11),
(8, 1, 'User', 2, '', 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `aros_acos`
--

DROP TABLE IF EXISTS `aros_acos`;
CREATE TABLE IF NOT EXISTS `aros_acos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `aro_id` int(10) unsigned NOT NULL,
  `aco_id` int(10) unsigned NOT NULL,
  `_create` char(2) NOT NULL default '0',
  `_read` char(2) NOT NULL default '0',
  `_update` char(2) NOT NULL default '0',
  `_delete` char(2) NOT NULL default '0',
  `_reply` char(2) NOT NULL default '0',
  `_moderate` char(2) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `aros_acos`
--

INSERT INTO `aros_acos` (`id`, `aro_id`, `aco_id`, `_create`, `_read`, `_update`, `_delete`, `_reply`, `_moderate`) VALUES
(1, 7, 1, '0', '1', '0', '0', '0', '0'),
(2, 7, 2, '1', '1', '1', '1', '0', '0'),
(3, 7, 3, '0', '1', '1', '0', '0', '0'),
(4, 7, 4, '0', '1', '1', '0', '0', '0'),
(5, 7, 5, '1', '1', '0', '1', '0', '0'),
(6, 7, 6, '1', '1', '1', '1', '0', '0'),
(7, 7, 7, '1', '1', '1', '1', '0', '0'),
(8, 4, 8, '0', '1', '0', '0', '0', '0'),
(9, 6, 8, '0', '1', '0', '0', '0', '0'),
(11, 7, 13, '0', '1', '1', '0', '0', '0'),
(12, 5, 11, '0', '0', '0', '0', '0', '0'),
(13, 7, 8, '0', '1', '0', '0', '0', '0'),
(14, 7, 14, '0', '1', '1', '0', '0', '0'),
(15, 7, 9, '0', '1', '0', '0', '0', '0'),
(17, 4, 22, '0', '1', '0', '0', '0', '0'),
(18, 4, 25, '1', '0', '1', '0', '0', '0'),
(19, 4, 23, '1', '0', '1', '1', '0', '0'),
(20, 4, 21, '0', '1', '0', '0', '0', '0'),
(21, 7, 21, '0', '1', '0', '0', '0', '0'),
(22, 7, 12, '0', '0', '1', '0', '0', '0'),
(23, 4, 43, '1', '1', '1', '1', '1', '0'),
(24, 7, 43, '1', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `cake_sessions`
--

DROP TABLE IF EXISTS `cake_sessions`;
CREATE TABLE IF NOT EXISTS `cake_sessions` (
  `id` varchar(255) NOT NULL default '',
  `data` text,
  `expires` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cake_sessions`
--

INSERT INTO `cake_sessions` (`id`, `data`, `expires`) VALUES
('snj70aap3s97vkc34bi0qcd3m3', 'Config|a:3:{s:9:"userAgent";s:32:"45215b68dae0e19929a880bc9d90e662";s:4:"time";i:1241897575;s:7:"timeout";i:10;}Auth|a:1:{s:4:"User";a:15:{s:2:"id";s:1:"1";s:8:"username";s:5:"admin";s:10:"first_name";s:7:"Walther";s:9:"last_name";s:4:"Lalk";s:13:"email_address";s:21:"waltherlalk@gmail.com";s:6:"active";s:1:"1";s:7:"created";N;s:10:"last_login";N;s:6:"avatar";s:15:"irene-logo0.jpg";s:9:"signature";s:4:"Test";s:14:"public_profile";s:1:"1";s:9:"show_name";s:1:"1";s:10:"show_email";s:1:"0";s:7:"deleted";s:1:"0";s:12:"deleted_date";N;}}Message|a:0:{}', 1241897579);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL auto_increment,
  `text` varchar(500) NOT NULL,
  `created` datetime default NULL,
  `modified` datetime default NULL,
  `user_id` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
CREATE TABLE IF NOT EXISTS `configuration` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `category_name` varchar(300) NOT NULL,
  `input_type` enum('text','textarea','checkbox','number','select','password') NOT NULL,
  `options` varchar(500) NOT NULL,
  `label` varchar(300) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=25 ;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`id`, `name`, `value`, `category_name`, `input_type`, `options`, `label`, `order`) VALUES
(1, 'SiteName', 'CMScout3', 'Core', 'text', '', 'Website name', 1),
(2, 'SiteEmail', 'webmaster@cmscout.co.za', 'Email', 'text', '', 'Website email address', 1),
(3, 'Disabled', '0', 'Core', 'checkbox', '', 'Website disabled', 4),
(4, 'Captcha', '1', 'Core', 'checkbox', '', 'Enable CAPTCHA image', 6),
(5, 'DisableReason', 'This is a reason', 'Core', 'textarea', '', 'Reason for disabled website', 5),
(6, 'AvatarSize', '100', 'Core', 'number', '', 'Longest side of an avatar', 7),
(7, 'SiteTag', 'The easiest CMScout by far', 'Core', 'text', '', 'Website tag', 2),
(11, 'EmailPrefix', '[CMScout3]', 'Email', 'text', '', 'Email Prefix', 2),
(12, 'EnableEmails', '1', 'Email', 'checkbox', '', 'Enable Emails', 3),
(13, 'SMTPHost', 'mail.wtfs.za.net', 'Email', 'text', '', 'SMTP Host/Server', 5),
(14, 'SMTPPort', '25', 'Email', 'number', '', 'SMTP Port', 6),
(15, 'SMTPUsername', 'wlalk@wtfs.za.net', 'Email', 'text', '', 'SMTP Username', 7),
(16, 'SMTPPassword', 'jedirun43', 'Email', 'password', '', 'SMTP Password', 8),
(17, 'AllowRegistration', '1', 'Registration', 'checkbox', '', 'Allow registration', 1),
(18, 'DuplicateEmail', '1', 'Registration', 'checkbox', '', 'Duplicate email', 2),
(19, 'AccountActivation', '1', 'Registration', 'select', 'No activation,User activation,Administrator activation', 'Account Activation', 3),
(20, 'SMTP', '1', 'Email', 'checkbox', '', 'Use SMTP', 4),
(21, 'PageTopics', '20', 'CMScout Forums', 'number', '', 'Number of topics per page', 1),
(22, 'PagePosts', '20', 'CMScout Forums', 'number', '', 'Number of posts per page', 2),
(23, 'InlineReply', '1', 'CMScout Forums', 'checkbox', '', 'Show quick reply box', 3),
(24, 'editorType', '0', 'CMScout Forums', 'select', 'BBCode,Simple,Advanced,None', 'Type of editor', 4);

-- --------------------------------------------------------

--
-- Table structure for table `contributions`
--

DROP TABLE IF EXISTS `contributions`;
CREATE TABLE IF NOT EXISTS `contributions` (
  `id` int(11) NOT NULL auto_increment,
  `plugin_id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `title` varchar(300) NOT NULL,
  `controller` varchar(300) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `contributions`
--


-- --------------------------------------------------------

--
-- Table structure for table `forum_categories`
--

DROP TABLE IF EXISTS `forum_categories`;
CREATE TABLE IF NOT EXISTS `forum_categories` (
  `id` int(11) NOT NULL auto_increment,
  `slug` varchar(300) NOT NULL,
  `title` varchar(400) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `forum_categories`
--

INSERT INTO `forum_categories` (`id`, `slug`, `title`, `order`) VALUES
(1, 'category-1', 'Category 1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `forum_forums`
--

DROP TABLE IF EXISTS `forum_forums`;
CREATE TABLE IF NOT EXISTS `forum_forums` (
  `id` int(11) NOT NULL auto_increment,
  `slug` varchar(300) NOT NULL,
  `title` varchar(400) NOT NULL,
  `description` varchar(512) NOT NULL,
  `order` int(11) NOT NULL,
  `forum_category_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `forum_forums`
--

INSERT INTO `forum_forums` (`id`, `slug`, `title`, `description`, `order`, `forum_category_id`, `parent_id`) VALUES
(1, 'forum-1', 'Forum 1', 'This is forum number 1', 1, 1, 0),
(2, 'forum-2', 'Forum 2', 'Forum 2', 1, 1, 1),
(3, 'forum-3', 'forum-3', '', 1, 1, 2),
(4, 'forum-4', 'forum-4', '', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `forum_posts`
--

DROP TABLE IF EXISTS `forum_posts`;
CREATE TABLE IF NOT EXISTS `forum_posts` (
  `id` int(11) NOT NULL auto_increment,
  `slug` varchar(300) NOT NULL,
  `title` varchar(400) NOT NULL,
  `text` longtext NOT NULL,
  `tags` varchar(255) NOT NULL,
  `forum_thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=522 ;

--
-- Dumping data for table `forum_posts`
--

INSERT INTO `forum_posts` (`id`, `slug`, `title`, `text`, `tags`, `forum_thread_id`, `user_id`, `created`, `modified`) VALUES
(1, 'tt', 'tt', 'tttt', '', 1, 1, '2009-05-01 17:20:26', NULL),
(2, 'asdf', 'asdf', 'asdfasdf', '', 1, 1, '2009-05-02 10:12:08', NULL),
(3, 'asdf', 'asdf', 'asfd', '', 2, 1, '2009-05-02 10:20:35', NULL),
(5, 'tata', 'tata', 'tatata', '', 4, 1, '2009-05-04 11:39:21', '2009-05-04 11:39:21'),
(6, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(8, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(9, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(10, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(11, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(12, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(13, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(14, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(15, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(16, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(17, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(18, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(19, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(20, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18'),
(21, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(22, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(23, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(24, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(25, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(26, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(27, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(28, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(29, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(30, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(31, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(32, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(33, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(34, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(35, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(36, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(37, 're-tete-29', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:33', '2009-05-05 19:59:33'),
(38, 're-tete-30', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:34', '2009-05-05 19:59:34'),
(39, 're-tete-31', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:36', '2009-05-05 19:59:36'),
(40, 're-tete-32', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:37', '2009-05-05 19:59:37'),
(41, 're-tete-33', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:37', '2009-05-05 19:59:37'),
(42, 're-tete-34', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:39', '2009-05-05 19:59:39'),
(43, 're-tete-35', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:40', '2009-05-05 19:59:40'),
(44, 're-tete-36', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:41', '2009-05-05 19:59:41'),
(45, 're-tete-37', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:41', '2009-05-05 19:59:41'),
(46, 're-tete-38', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:42', '2009-05-05 19:59:42'),
(47, 're-tete-39', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:43', '2009-05-05 19:59:43'),
(48, 're-tete-40', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:44', '2009-05-05 19:59:44'),
(49, 're-tete-41', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:45', '2009-05-05 19:59:45'),
(50, 're-tete-42', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:46', '2009-05-05 19:59:46'),
(51, 're-tete-43', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:47', '2009-05-05 19:59:47'),
(52, 're-tete-44', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:49', '2009-05-05 19:59:49'),
(53, 're-tete-45', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:50', '2009-05-05 19:59:50'),
(54, 're-tete-46', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:50', '2009-05-05 19:59:50'),
(55, 're-tete-47', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:51', '2009-05-05 19:59:51'),
(56, 're-tete-48', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:52', '2009-05-05 19:59:52'),
(57, 're-tete-49', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:52', '2009-05-05 19:59:52'),
(58, 're-tete-50', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:53', '2009-05-05 19:59:53'),
(59, 're-tete-51', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:53', '2009-05-05 19:59:53'),
(60, 're-tete-52', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:54', '2009-05-05 19:59:54'),
(61, 're-tete-53', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:54', '2009-05-05 19:59:54'),
(62, 're-tete-54', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:55', '2009-05-05 19:59:55'),
(63, 're-tete-55', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:55', '2009-05-05 19:59:55'),
(64, 're-tete-56', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:55', '2009-05-05 19:59:55'),
(65, 're-tete-57', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:56', '2009-05-05 19:59:56'),
(66, 're-tete-58', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:56', '2009-05-05 19:59:56'),
(67, 're-tete-59', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:57', '2009-05-05 19:59:57'),
(68, 're-tete-60', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:57', '2009-05-05 19:59:57'),
(69, 're-tete-61', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:57', '2009-05-05 19:59:57'),
(70, 're-tete-62', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:58', '2009-05-05 19:59:58'),
(71, 're-tete-63', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 20:00:08', '2009-05-05 20:00:08'),
(72, 're-tete-64', 'Re: tete', '[quote=admin]tututut[/quote][quote=admin]tututut[/quote][quote=admin]tututut[/quote]', '', 5, 1, '2009-05-08 11:06:13', '2009-05-08 11:06:13'),
(73, 're-tete-65', 'Re: tete', '', '', 5, 1, '2009-05-08 11:06:53', '2009-05-08 11:06:53'),
(74, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(75, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(76, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(77, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(78, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(79, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(80, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(81, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(82, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(83, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(84, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(85, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(86, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(87, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18'),
(88, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(89, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(90, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(91, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(92, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(93, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(94, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(95, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(96, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(97, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(98, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(99, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(100, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(101, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(102, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(103, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(104, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(105, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(106, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(107, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(108, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(109, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(110, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(111, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(112, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(113, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(114, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(115, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(116, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(117, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18'),
(118, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(119, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(120, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(121, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(122, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(123, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(124, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(125, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(126, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(127, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(128, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(129, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(130, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(131, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(132, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(133, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(134, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(135, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(136, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(137, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(138, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(139, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(140, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(141, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(142, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(143, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(144, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(145, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(146, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(147, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18'),
(148, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(149, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(150, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(151, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(152, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(153, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(154, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(155, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(156, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(157, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(158, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(159, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(160, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(161, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(162, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(163, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(164, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(165, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(166, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(167, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(168, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(169, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(170, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(171, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(172, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(173, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(174, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(175, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(176, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(177, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18'),
(178, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(179, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(180, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(181, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(182, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(183, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(184, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(185, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(186, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(187, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(188, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(189, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(190, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(191, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(192, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(193, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(194, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(195, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(196, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(197, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(198, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(199, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(200, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(201, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(202, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(203, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(204, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(205, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(206, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(207, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18'),
(208, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(209, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(210, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(211, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(212, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(213, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(214, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(215, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(216, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(217, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(218, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(219, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(220, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(221, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(222, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(223, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(224, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(225, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(226, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(227, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(228, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(229, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(230, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(231, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(232, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(233, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(234, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(235, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(236, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(237, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18'),
(238, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(239, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(240, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(241, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(242, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(243, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(244, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(245, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(246, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(247, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(248, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(249, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(250, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(251, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(252, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(253, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(254, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(255, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(256, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(257, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(258, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(259, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(260, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(261, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(262, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(263, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(264, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(265, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(266, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(267, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18'),
(268, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(269, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(270, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(271, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(272, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(273, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(274, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(275, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(276, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(277, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(278, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(279, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(280, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(281, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(282, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(283, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(284, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(285, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(286, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(287, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(288, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(289, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(290, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(291, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(292, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(293, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(294, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(295, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(296, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(297, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18'),
(298, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(299, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(300, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(301, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(302, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(303, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(304, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(305, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(306, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(307, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(308, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(309, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(310, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(311, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(312, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(313, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(314, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(315, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(316, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(317, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(318, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(319, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(320, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(321, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(322, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(323, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(324, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(325, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(326, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(327, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18'),
(328, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(329, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(330, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(331, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(332, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(333, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(334, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(335, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(336, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(337, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(338, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(339, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(340, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(341, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(342, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(343, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(344, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(345, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(346, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(347, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(348, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(349, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(350, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(351, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(352, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(353, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(354, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(355, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(356, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(357, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18'),
(358, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(359, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(360, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(361, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(362, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(363, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(364, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(365, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(366, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(367, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(368, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(369, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(370, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(371, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(372, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(373, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(374, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(375, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(376, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(377, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(378, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(379, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(380, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(381, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(382, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(383, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(384, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(385, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(386, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(387, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18'),
(388, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(389, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(390, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(391, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(392, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(393, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(394, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(395, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(396, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(397, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(398, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(399, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(400, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(401, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(402, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(403, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(404, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(405, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(406, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(407, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(408, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(409, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(410, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(411, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(412, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(413, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(414, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(415, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(416, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(417, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18'),
(418, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(419, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(420, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(421, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(422, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(423, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(424, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(425, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(426, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(427, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(428, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(429, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(430, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(431, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(432, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(433, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(434, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(435, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(436, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(437, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(438, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(439, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(440, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(441, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(442, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(443, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(444, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(445, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(446, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(447, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18');
INSERT INTO `forum_posts` (`id`, `slug`, `title`, `text`, `tags`, `forum_thread_id`, `user_id`, `created`, `modified`) VALUES
(448, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(449, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(450, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(451, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(452, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(453, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(454, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(455, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(456, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(457, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(458, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(459, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(460, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(461, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(462, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(463, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(464, 'tete', 'tete', 'tetetete', 'Tete', 5, 1, '2009-05-04 11:40:48', '2009-05-04 11:40:48'),
(465, 're-tete', 'Re: tete', '[quote=admin]tetetete[/quote]\r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 17:30:23', '2009-05-04 17:30:23'),
(466, 're-tete-1', 'Re: tete', '[quote]\r\n<h4>admin wrote:</h4>\r\ntetetete\r\n[/quote]Â Â \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img]', '', 5, 1, '2009-05-04 19:51:15', '2009-05-04 19:51:15'),
(467, 're-tete-2', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:23', '2009-05-05 19:54:23'),
(468, 're-tete-3', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:54:45', '2009-05-05 19:54:45'),
(469, 're-tete-4', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:57', '2009-05-05 19:55:57'),
(470, 're-tete-5', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:55:59', '2009-05-05 19:55:59'),
(471, 're-tete-6', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:56:19', '2009-05-05 19:56:19'),
(472, 're-tete-7', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:21', '2009-05-05 19:58:21'),
(473, 're-tete-8', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:29', '2009-05-05 19:58:29'),
(474, 're-tete-9', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:36', '2009-05-05 19:58:36'),
(475, 're-tete-10', 'Re: tete', 'tutut', '', 5, 1, '2009-05-05 19:58:48', '2009-05-05 19:58:48'),
(476, 're-tete-11', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:11', '2009-05-05 19:59:11'),
(477, 're-tete-12', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:18', '2009-05-05 19:59:18'),
(478, 're-tete-13', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:19', '2009-05-05 19:59:19'),
(479, 're-tete-14', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:20', '2009-05-05 19:59:20'),
(480, 're-tete-15', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(481, 're-tete-16', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:21', '2009-05-05 19:59:21'),
(482, 're-tete-17', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:23', '2009-05-05 19:59:23'),
(483, 're-tete-18', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(484, 're-tete-19', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:24', '2009-05-05 19:59:24'),
(485, 're-tete-20', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:25', '2009-05-05 19:59:25'),
(486, 're-tete-21', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:26', '2009-05-05 19:59:26'),
(487, 're-tete-22', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:27', '2009-05-05 19:59:27'),
(488, 're-tete-23', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:28', '2009-05-05 19:59:28'),
(489, 're-tete-24', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(490, 're-tete-25', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:29', '2009-05-05 19:59:29'),
(491, 're-tete-26', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:30', '2009-05-05 19:59:30'),
(492, 're-tete-27', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:31', '2009-05-05 19:59:31'),
(493, 're-tete-28', 'Re: tete', 'tututut', '', 5, 1, '2009-05-05 19:59:32', '2009-05-05 19:59:32'),
(494, 're-tete-66', 'Re: tete', '[quote=admin] \r\nBlablbalba\r\n[img]http://www.popphoto.com/var/ezflow_site/storage/images/features/do-men-and-women-take-different-photos/200606-1-eng-US/Do-Men-and-Women-Take-Different-Photos_top_image_popup.jpg[/img][/quote]', '', 5, 1, '2009-05-08 13:55:37', '2009-05-08 13:55:37'),
(495, 're-tete-67', 'Re: tete', 'Another post', '', 5, 2, '2009-05-08 14:10:46', '2009-05-08 14:10:46'),
(496, 're-tete-68', 'Re: tete', 'sdfgdsfg', '', 5, 2, '2009-05-08 16:21:25', '2009-05-08 16:21:25'),
(497, 're-tete-69', 'Re: tete', 'sdfgdsfg', '', 5, 2, '2009-05-08 16:22:19', '2009-05-08 16:22:19'),
(498, 're-tete-70', 'Re: tete', 'sdfgdsfg', '', 5, 2, '2009-05-08 16:22:40', '2009-05-08 16:22:40'),
(499, 're-tete-71', 'Re: tete', 'sdfgdsfg', '', 5, 2, '2009-05-08 16:23:05', '2009-05-08 16:23:05'),
(500, 're-tete-72', 'Re: tete', 'sdgdf', '', 5, 2, '2009-05-08 16:23:52', '2009-05-08 16:23:52'),
(501, 're-tete-73', 'Re: tete', 'sdgdf', '', 5, 2, '2009-05-08 16:24:21', '2009-05-08 16:24:21'),
(502, 're-tete-74', 'Re: tete', 'sdgdf', '', 5, 2, '2009-05-08 16:24:51', '2009-05-08 16:24:51'),
(503, 're-tete-75', 'Re: tete', 'sdgdf', '', 5, 2, '2009-05-08 16:26:02', '2009-05-08 16:26:02'),
(504, 're-tete-76', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:28:48', '2009-05-09 12:28:48'),
(505, 're-tete-77', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:30:11', '2009-05-09 12:30:11'),
(506, 're-tete-78', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:31:02', '2009-05-09 12:31:02'),
(507, 're-tete-79', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:31:51', '2009-05-09 12:31:51'),
(508, 're-tete-80', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:32:04', '2009-05-09 12:32:04'),
(509, 're-tete-81', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:34:11', '2009-05-09 12:34:11'),
(510, 're-tete-82', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:35:51', '2009-05-09 12:35:51'),
(511, 're-tete-83', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:37:22', '2009-05-09 12:37:22'),
(512, 're-tete-84', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:37:36', '2009-05-09 12:37:36'),
(513, 're-tete-85', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:41:44', '2009-05-09 12:41:44'),
(514, 're-tete-86', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:42:36', '2009-05-09 12:42:36'),
(515, 're-tete-87', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:46:13', '2009-05-09 12:46:13'),
(516, 're-tete-88', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:51:39', '2009-05-09 12:51:39'),
(517, 're-tete-89', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:53:54', '2009-05-09 12:53:54'),
(518, 're-tete-90', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:55:08', '2009-05-09 12:55:08'),
(519, 're-tete-91', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:56:00', '2009-05-09 12:56:00'),
(520, 're-tete-92', 'Re: tete', 'Bingbob', '', 5, 1, '2009-05-09 12:57:29', '2009-05-09 12:57:29'),
(521, 're-tete-93', 'Re: tete', 'Reply reply reply', '', 5, 2, '2009-05-09 12:58:47', '2009-05-09 12:58:47');

-- --------------------------------------------------------

--
-- Table structure for table `forum_posts_tags`
--

DROP TABLE IF EXISTS `forum_posts_tags`;
CREATE TABLE IF NOT EXISTS `forum_posts_tags` (
  `id` int(11) NOT NULL auto_increment,
  `forum_post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `forum_posts_tags`
--

INSERT INTO `forum_posts_tags` (`id`, `forum_post_id`, `tag_id`) VALUES
(1, 4, 95),
(2, 6, 96),
(3, 7, 97);

-- --------------------------------------------------------

--
-- Table structure for table `forum_subscribers`
--

DROP TABLE IF EXISTS `forum_subscribers`;
CREATE TABLE IF NOT EXISTS `forum_subscribers` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `forum_thread_id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `forum_subscribers`
--

INSERT INTO `forum_subscribers` (`id`, `user_id`, `forum_thread_id`, `active`) VALUES
(1, 2, 5, 1),
(2, 1, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `forum_threads`
--

DROP TABLE IF EXISTS `forum_threads`;
CREATE TABLE IF NOT EXISTS `forum_threads` (
  `id` int(11) NOT NULL auto_increment,
  `slug` varchar(300) NOT NULL,
  `title` varchar(400) NOT NULL,
  `description` varchar(512) NOT NULL,
  `views` int(11) NOT NULL,
  `forum_forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `forum_threads`
--

INSERT INTO `forum_threads` (`id`, `slug`, `title`, `description`, `views`, `forum_forum_id`, `user_id`) VALUES
(1, 'tt', 'tt', 'tt', 0, 1, 1),
(2, 'df', 'asdf', 'sdf', 12, 1, 1),
(4, 'tata', 'tata', 'tata', 0, 1, 1),
(5, 'tete', 'tete', 'tete', 123, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `forum_unread_posts`
--

DROP TABLE IF EXISTS `forum_unread_posts`;
CREATE TABLE IF NOT EXISTS `forum_unread_posts` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `forum_thread_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `forum_unread_posts`
--


-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(400) NOT NULL,
  `protected` char(1) NOT NULL default '0',
  `members_protected` char(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `title`, `protected`, `members_protected`) VALUES
(1, 'Administrators', '1', ''),
(2, 'All users', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
CREATE TABLE IF NOT EXISTS `groups_users` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `groups_users`
--

INSERT INTO `groups_users` (`id`, `group_id`, `user_id`) VALUES
(1, 1, 1),
(3, 2, 1),
(4, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `homepages`
--

DROP TABLE IF EXISTS `homepages`;
CREATE TABLE IF NOT EXISTS `homepages` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(300) NOT NULL,
  `options` varchar(300) NOT NULL,
  `column` char(1) NOT NULL,
  `order` int(11) NOT NULL,
  `menu_link_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `homepages`
--

INSERT INTO `homepages` (`id`, `name`, `options`, `column`, `order`, `menu_link_id`) VALUES
(1, 'Static Page', 'what-needs-to-be-done', '0', 1, 2),
(2, 'Tags', 'cloud', '1', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL auto_increment,
  `menu_link_id` int(11) NOT NULL,
  `sidebox_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `option` varchar(255) NOT NULL,
  `menu_id` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_link_id`, `sidebox_id`, `name`, `option`, `menu_id`, `order`) VALUES
(1, 1, 0, 'Home Page', '', 'menu1', 1),
(2, 2, 0, 'History', 'history', 'menu1', 2),
(3, 8, 0, 'Tags', '', 'menu1', 3),
(4, 9, 0, 'CMScout Forums', '', 'menu1', 4),
(5, 4, 0, 'Logout', '', 'menu2', 1),
(6, 0, 1, 'Login box', 'loginBox', 'menu3', 1),
(7, 0, 2, 'Tag Cloud', 'tagCloud', 'menu3', 2),
(8, 0, 3, 'Latest Posts', 'latest_posts', 'menu3', 3),
(9, 5, 0, 'User control panel', '', 'menu3', 4);

-- --------------------------------------------------------

--
-- Table structure for table `menu_links`
--

DROP TABLE IF EXISTS `menu_links`;
CREATE TABLE IF NOT EXISTS `menu_links` (
  `id` int(11) NOT NULL auto_increment,
  `plugin_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `controller` varchar(300) NOT NULL,
  `action` varchar(300) NOT NULL,
  `menu_action` varchar(255) NOT NULL,
  `frontpage` tinyint(1) NOT NULL,
  `frontpage_action` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `menu_links`
--

INSERT INTO `menu_links` (`id`, `plugin_id`, `title`, `controller`, `action`, `menu_action`, `frontpage`, `frontpage_action`) VALUES
(1, 0, 'Home Page', 'homepages', '', '', 0, ''),
(2, 0, 'Static Page', 'pages', '', 'homepage', 1, 'homepage'),
(3, 0, 'Login', 'users', 'login', '', 0, ''),
(4, 0, 'Logout', 'users', 'logout', '', 0, ''),
(5, 0, 'User control panel', 'users', '', '', 0, ''),
(8, 0, 'Tags', 'tags', '', '', 1, 'homepage'),
(9, 1, '', 'forums', 'index', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL auto_increment,
  `plugin_id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `type` varchar(300) NOT NULL,
  `title` varchar(300) NOT NULL,
  `subject` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `plugin_id`, `name`, `type`, `title`, `subject`) VALUES
(1, 0, 'new_user', 'email', 'New User', 'A new user has just registered'),
(2, 0, 'registration_info', 'email', 'Registration information', 'Your registration'),
(3, 0, 'user_status', 'email', 'User Status', 'Your account status has been changed'),
(4, 1, 'thread_reply', 'email', '', 'Reply notification');

-- --------------------------------------------------------

--
-- Table structure for table `notifications_users`
--

DROP TABLE IF EXISTS `notifications_users`;
CREATE TABLE IF NOT EXISTS `notifications_users` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `active` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `notifications_users`
--


-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL auto_increment,
  `slug` varchar(300) NOT NULL,
  `title` varchar(400) NOT NULL,
  `text` longtext NOT NULL,
  `tags` mediumtext NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `deleted_date` datetime default NULL,
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=12 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `slug`, `title`, `text`, `tags`, `deleted`, `deleted_date`, `created`, `modified`) VALUES
(1, 'what-needs-to-be-done', 'What needs to be done', '<h2>What needs to be done:</h2>\r\n<ul>\r\n<li>UCP                       \r\n<ul>\r\n<li><span style="color: #339966;">Avatar upload and resize</span></li>\r\n<li><span style="color: #ff6600;">Public profile should look similar to CMScout2</span></li>\r\n<li><span style="color: #339966;">Notifications page should be done (Automagic generated depending on installed plugins).</span></li>\r\n<li><span style="color: #339966;">Contribute something page should be done (Automagic generated depending on installed plugins).</span></li>\r\n</ul>\r\n</li>\r\n<li>Themes                      \r\n<ul>\r\n<li><span style="color: #ff6600;">Installation of themes - Two kinds: Preupload and install or upload zip file and install</span></li>\r\n<li><span style="color: #ff0000;">Uninstall of themes</span></li>\r\n<li><span style="color: #339966;">Setting of site theme</span></li>\r\n</ul>\r\n</li>\r\n<li>Plugins                      \r\n<ul>\r\n<li><span style="color: #ff6600;">Installation of plugins- Two kinds: Preupload and install or upload zip file and install</span></li>\r\n<li><span style="color: #ff0000;">Uninstall of plugins</span></li>\r\n<li><span style="color: #339966;">System for plugins to add notification events</span></li>\r\n<li><span style="color: #339966;">System for plugins to add things to the contribution page</span></li>\r\n<li><span style="color: #339966;">System for plugins to add menu items and side boxes</span></li>\r\n</ul>\r\n</li>\r\n<li>Other                   \r\n<ul>\r\n<li><span style="color: #ff0000;">Language packs</span></li>\r\n<li><span style="color: #339966;">Trash can area for pages</span></li>\r\n<li><span style="color: #ff0000;">Check search</span></li>\r\n</ul>\r\n</li>\r\n</ul>\r\n<h2>"Core" plugins:</h2>\r\n<ul>\r\n<li>Forums</li>\r\n<li>Articles</li>\r\n<li>Photo albums</li>\r\n<li>Private messages</li>\r\n<li>Calendar</li>\r\n<li>Downloads</li>\r\n</ul>\r\n<h2>"Scouting" plugins:</h2>\r\n<ul>\r\n<li>Progress record managment</li>\r\n<li></li>\r\n</ul>', 'Plugins, Install, System, Themes, Upload, Page', 0, NULL, '2009-03-20 16:21:09', '2009-04-25 18:21:31'),
(3, 'how-to-join', 'How to join', '<p>Scouts is the largest youth movement in the world, and you can join it as long as you are older then 7!</p>\r\n<h2>Young people</h2>\r\n<p>As a young person you can join one of 2 sections of the troop, depending on your age.</p>\r\n<p><strong><a href="../../../../irenesite/index.php?page=subsite&amp;site=4">Cubs</a> </strong>is for very young people (9th Irene only accepts boys) between the age of 7 and 10&frac12;.</p>\r\n<p><strong><a href="../../../../irenesite/index.php?page=subsite&amp;site=1">Scouts</a></strong> is for not-quite-so young people (9th Irene only accepts boys) between the age of 10&frac12; and 17</p>\r\n<p>If your son is interested in joining one of these two sections just send an email to general <strong>-at-</strong> 9thirene.co.za and give us the following information:</p>\r\n<ul>\r\n<li>Your name</li>\r\n<li>Your sons name</li>\r\n<li>Your sons birthdate and age</li>\r\n<li>A contact number</li>\r\n<li>Suburb you currently reside in</li>\r\n<li>If you wish to be contacted by email or phone.</li>\r\n</ul>\r\n<p>Once we have this information we will contact you and give you all the information that you need to know in order for your son to join Scouts or Cubs. Please do contact us before you show up at a meeting as we do have waiting lists.</p>\r\n<h2>Adult helpers</h2>\r\n<p><img style="margin: 10px; float: right;" src="../../../../irenesite/getphoto.php?pic=94&amp;maxsizex=160&amp;maxsizey=120" border="0" alt="" />We are always on the lookout for new helpers, in uniform and out of uniform (Don'' worry too much about that, in uniform only means that you have been invested as a Scouter and you have been on the relevent courses). If you are interested in helping out at either Cubs or Scouts, just email us at general <strong>-at-</strong> 9thirene.co.za and tell us your name and why you are interested in helping out and what types of activities do you wish to help out with. Please note that due to legislation and Scouting Association rules you will be required to fill out a adult volunteer application form.</p>', 'People, Join', 0, NULL, '2009-04-12 18:37:05', '2009-04-13 20:09:41'),
(4, 'history', 'History', '<h2>History of South African Scouts<br /></h2>\r\n<p>The South Africa Scout Association (SASA) has had a rather interesting history, mainly due to apartheid. There were originally 4 different Scout Associations in South Africa (All governed by the same Chief Scout). These 4 were: The Boy Scouts Association, The African Boy Scouts Association, The Coloured Boy Scouts Association and The Indian Boy Scouts Association. The reason for this division was largely due to the political situation in South Africa at that time.</p>\r\n<p>On 2 July 1977 the four parallel associations were replace by a single association : the "Boy Scouts of South Africa". This was one of the first associations in South Africa that accepted boys of all races and creeds into it''s membership ranks.</p>\r\n<p>In 1995 the "Boy Scouts of South Africa" were replaced with the "South African Scout Association", and it began accepting Girls into it''s ranks.</p>\r\n<p>Ex-President Nelson Mandela is the SASA''s official Patron.</p>\r\n<h2>History of 9th Irene</h2>\r\n<p>9th Irene Troop can trace it''s roots back to 1921 (Although we are rather certain that we did exist before then). Our current scarf was registered with the SASA in about 1950 and we have been in our scout hall since 1958. We have a proud history of many springboks, and of quickly rising in the ranks at Kontiki (The annual endurance raft "race" at Murry Park in Springs, South Africa).<br /> <br /> In 1999 we were placed 97th out of 100 teams at Kontiki, in 2000 we rose to somewhere in the 50''s, in 2001 we were somewhere in the 20''s, and in 2002 we won Kontiki! Since then we have consistently been in the top 10 teams at Kontiki.</p>', 'South, Africa, Scouts, Association, Scout, Kontiki, History, Ranks, Associations, African, Sasa, Somewhere, Teams, Irene, South Africa, Scouts Association', 0, NULL, '2009-04-12 18:38:18', '2009-04-13 20:09:50'),
(5, 'welcome-to-irene-scout-troop', 'Welcome to Irene Scout Troop', '<h2>Welcome to the 9th Irene Scout Troop pages</h2>\r\n<p>The Irene Scout troop is what is known as an Air Scout troop and has approximately 15 boys ranging in age from&nbsp;10 &frac12;to 18. The Scout troop is run by 4 uniformed and fully qualified adult&nbsp;volunteers. As an Air Scout troop we try to orientate our programme toward aircraft and other aeronautical activities. The Scout programme focuses on teamwork, leadership skills, interpersonal relationship skills and the concept of &ldquo;good citizenship&rdquo;. The troop is split into teams called patrols, with each patrol having between five and eight boys and being lead by a patrol leader. Unlike Cubs, where the six is heavily monitored by the adult leaders, the Scout patrol is a largely autonomous unit. Patrols regularly go on camps and hikes with minimum adult supervision, this is a core component of the Scout programme as it teaches the boys how to organise events, how to structure their time and how to cope without &ldquo;mommy or daddy&rdquo; being around to help.</p>\r\n<p>The group takes part in various competitions throughout the year. The biggest of these in the annual Kontiki competition help at Murray Park in Springs. Kontiki pits troops from around Gauteng against each other over a 3 day period. The main focus of the Kontiki competition is the raft that is built. Each troop has 24 hours to build a raft that can sustain and carry 5 to 10 senior Scouts on the water for 24 hours. The&nbsp;Scouts on the raft are not allowed to touch dry land for the 24 hours and must be totally self-sufficient. While the raft crew build the raft and sail on the water with it, there are numerous other small competitions happening for the ground crew. These include a competition for the best campsite, a cooking competition, a dress-up competition and other similar events. 9th Irene has been one of the top teams in the last 5 years of Kontiki and we won the overall competition in 2002.</p>\r\n<p>&nbsp;</p>\r\n<p>If you want more information or have any questions or comments take a look at our <a href="../../../../irenesite/index.php?page=10&amp;type=static&amp;menuid=62">Contact Us</a> page for contact details.</p>', 'Troop, Scout, Irene, Scout Troop', 0, NULL, '2009-04-12 18:39:22', '2009-04-13 20:10:00'),
(6, 'court-of-honour', 'Court of Honour', '<div>\r\n<h2>Court of Honour</h2>\r\n<p>Our current CoH consists of:</p>\r\n<ul>\r\n<li>Kevin (Patrol leader)</li>\r\n<li>JJ (Patrol Leader)</li>\r\n<li>Camillo (Patrol Leader)</li>\r\n<li>Rici (Troop Leader)</li>\r\n<li>Gabriel (Troop Leader)</li>\r\n</ul>\r\n<h2>Court of Honour FAQ<br /></h2>\r\n<h3>What is the Court of Honour?</h3>\r\n<p>It is the brain that guides the whole Troop. The CoH decides on responsibilities, leadership, how a Troop is run and various other aspects of the Troop. The CoH members are pledged to secrecy, and may not devulge desisions made during a CoH meeting without there being a majority vote. The COH GUARDS THE HONOUR OF THE TROOP (the good name and standards set).</p>\r\n<h3>Who are the members?</h3>\r\n<p>The Troop Leaders, all Patrol Leaders and the Troop Scouter. Assistant Patrol Leaders and Assistant Troop Scouters may join the meeting by invitation. The Troop Scouter is there to advise, make suggestions and guide. The Troop Leader or most senior Patrol Leader is normally the CoH Chairman. There must be a scribe to record minutes and decisions. The Group Scouter and any Commissioners may never<br />attends unless by special invitation. Only the Troop Leaders and Patrol Leaders have voting rights, however the Troop Scouter may veto an unwise decision.</p>\r\n<h3>What does the Court of Honour do?</h3>\r\n<p>Quite simply it plans the activities of the Troop - meetings, camps, hikes, service projects, entertainment, parents evenings, special projects, discipline, points system, Troop funds, Scout advancement, Troop uniform, etc. Jobs are delegated out with report-backs on progress. The Troop Scouter can also use the CoH to train his Patrol Leaders in a training session.</p>\r\n<h3>How do you Participate?</h3>\r\n<p>By bringing up points for discussion raised by your patrol, expressing your opinion fully on matters raised, full participation in any job of work to be done, making suggestions for the good of the Troop.</p>\r\n<h3>When does it meet?</h3>\r\n<p>Once a month in the Irene CoH room. A short CoH should be held after every Troop Meeting to discuss the meeting - what was good ... bad ... or improvements--and to arrange duties for the next Troop meeting.<strong><br /></strong></p>\r\n</div>', 'Troop, Patrol, Leader, Leaders, Meeting, Honour, Scouter, Court, Projects, Points, Raised, Special, Assistant, Members, Invitation, Suggestions, Patrol Leaders, Patrol Leader, Troop Scouter, Troop Leader', 0, NULL, '2009-04-12 18:39:45', '2009-04-13 20:10:09'),
(7, 'troop-information', 'Troop information', '<p align="center">This page provides all the information that the other pages don''t supply. Stuff like standard kit lists, consent forms, health forms, etc.</p>\r\n<h2>1. Full Scout Uniform</h2>\r\n<p>&nbsp;9th Irene Air Scouts has a proud history of having one of the best uniforms in the Scouting family. Our uniform is as follows:</p>\r\n<ul>\r\n<li>Sky blue shirt (available from Scout Shop) with correct badges. </li>\r\n<li>Navy blue shorts with belt loops (available from Scout Shop). Patrol Leaders and above wear long Navy blue chinos (Woolworths sells nice ones)</li>\r\n<li>Long black socks (available from Scout Shop)</li>\r\n<li>Black school shoes (Scouts are allowed to wear brown ones if they are in Primary School)</li>\r\n<li>Navy blue Scout belt (available from Scout Shop)</li>\r\n<li>Black beret with standard Scout badge (available from Scout Shop). Patrol Leaders receive a large Scout badge for their beret.</li>\r\n<li>Standard Irene scarf with black woggle (available from Scout Shop). Scouts who have been on PLTU wear the Lexden woggle.</li>\r\n</ul>\r\n<h2>2. Standard kit list</h2>\r\n<p>This is a recommend kit list for camps (The person organising the camp or hike will give you the real kit list):</p>\r\n<ul>\r\n<li>Complete Scout Uniform </li>\r\n<li>Groundsheet </li>\r\n<li>Sleeping Bag </li>\r\n<li>PJ''s </li>\r\n<li>Spare underwear </li>\r\n<li>Clothes to wear at camp </li>\r\n<li>Spare socks </li>\r\n<li>Something warm </li>\r\n<li>Tackies or Sandals (If a hike then Tackies or Hiking Boots, preferably Hiking Boots) </li>\r\n<li>Swimming Costume </li>\r\n<li>Towel </li>\r\n<li>Toilet Bag (Soap, comb, toothbrush, toothpaste, face cloth) </li>\r\n<li>Raincoat or Dry Mac </li>\r\n<li>Draw string mess bag (Two plates, mug, knife, fork, spoon, teaspoon) </li>\r\n<li>Dish cloth </li>\r\n<li>Notebook and pen/pencil </li>\r\n<li>Torch and spare batteries </li>\r\n<li>Any medication </li>\r\n</ul>\r\n<p>Additional equipment that might be useful</p>\r\n<ul>\r\n<li>Repair bag containing needles, cotton, buttons and safety pins </li>\r\n<li>Pocket first aid kit </li>\r\n<li>Waterproof matches </li>\r\n<li>Thin wire </li>\r\n<li>Scout Knife </li>\r\n<li>Compass </li>\r\n<li>Water Bottle </li>\r\n<li>Musical instrument if you play one </li>\r\n<li>Camera and films </li>\r\n</ul>\r\n<p>Suggested camp equipment (Up to camp organiser to decide):</p>\r\n<ul>\r\n<li>Sleeping Tent </li>\r\n<li>Storage tent if possible </li>\r\n<li>Screening for toilets </li>\r\n<li>Spade </li>\r\n<li>Lamps with repair kits and spares </li>\r\n<li>Hand Axe </li>\r\n<li>Felling axe if required </li>\r\n<li>Bow saw </li>\r\n<li>First Aid Box </li>\r\n<li>Flag with pole </li>\r\n<li>Matches, candles, washing soap, steel wool </li>\r\n<li>Bog roll </li>\r\n<li>Table top or trestle table </li>\r\n<li>Two wash bowels and bucket </li>\r\n<li>Large Dixie or urn for boiling water </li>\r\n<li>Two medium cooking pots (billies) </li>\r\n<li>Two small cooking pots (billies) </li>\r\n<li>Frying pan </li>\r\n<li>Plastic container with lid </li>\r\n<li>Grid </li>\r\n<li>Cooking utensils </li>\r\n<li>Salt and pepper </li>\r\n<li>Dish cloths </li>\r\n<li>Broom </li>\r\n<li>Games box </li>\r\n<li>Ropes and spars for gadgets </li>\r\n<li>String for marking kitchen area, etc. </li>\r\n<li>Any other equipment needed </li>\r\n</ul>\r\n<h2>3. Consent form and Health Certificate</h2>\r\n<p>Download it <a href="../../../../irenesite/index.php?page=downloads&amp;id=10&amp;action=down&amp;catid=4">here</a></p>\r\n<h2>4. Badge book</h2>\r\n<p>Download it <a href="../../../../irenesite/index.php?page=downloads&amp;id=4&amp;action=down&amp;catid=3">here</a></p>\r\n<h2>5. Scout Promise</h2>\r\n<p>On my honour I promise that<br />I will do my best:<br />To do my duty to God,<br />and my Country;<br />To help other people at all times;<br />To obey the Scout Law</p>\r\n<h2>6. Scout Law</h2>\r\n<ol>\r\n<li>A Scout''s honour is to be trusted </li>\r\n<li>A Scout is loyal </li>\r\n<li>A Scout''s duty is to be useful and to help others. </li>\r\n<li>A Scout is a friend to all and a brother to every other Scout </li>\r\n<li>A Scout is courteous </li>\r\n<li>A Scout is a friend to animals </li>\r\n<li>A Scout obeys orders </li>\r\n<li>A Scout smiles and whistles under all difficulties </li>\r\n<li>A Scout is thrifty </li>\r\n<li>A Scout is clean in thought, word and deed </li>\r\n</ol>', 'Forms, Troop, Uniform, Kit List', 0, NULL, '2009-04-12 18:40:19', '2009-04-13 20:10:19'),
(8, 'games-we-play', 'Games we play', '<p><span style="font-size: medium; color: #ff0000;">Please note: This page was written by Scouts and contains vast exaggerations</span><span style="font-size: medium; color: #ff0000;">.</span></p>\r\n<p>This page explains how to do stuff that we do. This includes things like how to play British Bulldogs, Poisonous Staves etc.</p>\r\n<h2>1. British Bulldogs&trade;</h2>\r\n<p align="left">To play British bulldogs you need:</p>\r\n<ol>\r\n<li>A large field</li>\r\n<li>2 or 3 people willing to be "On"</li>\r\n<li>The rest of the people standing at one side of the field</li>\r\n<li>An Ambulance or Paramedics standing by in case anybody decides to be clever and jump headfirst into a wall or similar hard object such as a 9th Irene Scouts head.</li>\r\n</ol>\r\n<p>Once you have all the ingredients ready then the people who are "on" call out somebody''s name. That person then has to run to the other side of the field. To get someone to be "on" you have to catch the person and lift him up so that nothing of his body is touching the ground. He is allowed to struggle. If the person gets to the other side then it is a condition called "Open Gates" where everybody runs to the other side of the field, the people who are on can still try to catch people. The game goes on like this until there are about 5 people left who are not "on" these people can form a "rescue party" if one of then is caught while trying to cross. They run up and help the person to reach the other side of the field. The last person not on wins.</p>\r\n<p>&nbsp;</p>\r\n<h2>2. Poisonous Staves&trade;</h2>\r\n<p>To play poisonous staves you need:</p>\r\n<ol>\r\n<li>A large open space depending on number of people</li>\r\n<li>A chair</li>\r\n<li>Two staves</li>\r\n<li>A minimum of 5 people, there is no maximum</li>\r\n<li>An Ambulance or Paramedics standing by in case someone''s arm gets ripped off or similar accident, although none of us have ever been hurt to badly (The doctors have always been able to attach the arm with minimum blood loss) it still doesn''t hurt to be on the careful side.</li>\r\n</ol>\r\n<p>Balance the two staves on top of the chair. Then everybody forms a circle around the staves and grabs each others arms in a monkey grip. As soon as the last two people join you start pulling and pushing. To get somebody out you must get that person to knock a stave so that it lands on the floor. Or you could break a link in which case the two people whose link is broken are out. To win you have to be the only person not out.</p>\r\n<p>&nbsp;</p>\r\n<h2>3. Crab Soccer&trade;</h2>\r\n<p>To play Crab Soccer you need:</p>\r\n<ol>\r\n<li>A large open space depending on number of people (Preferably with a smooth surface or on a stone less field)</li>\r\n<li>One or Two Soccer Ball''s or Basket Ball''s</li>\r\n<li>Two chairs to act as goals</li>\r\n</ol>\r\n<p>You split the people up in equal teams using the "Shortest to Tallest Method" (see FAQ question 27). Then you find someway to differentiate between the two teams. Then every body gets sits down and then you use your hands to move your self around and play like ordinary soccer except that the goals are the chairs and you are slightly lower to the ground.</p>\r\n<p>&nbsp;</p>\r\n<h2>4. Pre-historic rugby&trade;</h2>\r\n<p>What you need:</p>\r\n<ol>\r\n<li>A large field</li>\r\n<li>A brick, or if you want to be on the safe side you could use a brick sized piece of foam but that''s boring</li>\r\n<li>A place in which you can score</li>\r\n<li>An Ambulance or Paramedics standing by in case anybody decides to be clever and tries to header the "ball" or try and drop kick it.</li>\r\n</ol>\r\n<p>You split the people up in teams again using the "Shortest to Tallest method". Don''t let the word "Rugby" confuse you as there are only two rules in the real version of Pre-historic Rugby: 1. Get the ball to the other side and 2. Don''t let the other team get the ball to your side. Of course if you want to be boring you could add more rules to make it "safer".</p>\r\n<p>&nbsp;</p>\r\n<h2>5. The Great Shoe Hunt&trade;</h2>\r\n<p align="left">What you need:</p>\r\n<ol>\r\n<li>\r\n<p align="left">A hall or similar aparatus</p>\r\n</li>\r\n<li>\r\n<p align="left">Everybody''s shoes in the middle of the hall (Make sure that they have taken them off first)</p>\r\n</li>\r\n<li>\r\n<p align="left">A way of turning the lights off (It is best to use a light switch, but shooting out the lights also works provided you have spare light bulbs standing by)</p>\r\n</li>\r\n<li>\r\n<p align="left">This game does not require medical supervision but it is still recommend to have somebody trained in first aid standing by in case somebody decides it is fun to clobber someone over the head with his steal tipped shoes.</p>\r\n</li>\r\n</ol>\r\n<p align="left">There are two variations of this:</p>\r\n<p align="left">1.Put everybody''s shoes in the middle of the hall. Tell everybody to go outside. Then you hide the shoes but make sure to leave about half of them in them middle. Don''t hide the shoes close to their partners, it is best to leave the partner in the middle and hide the other one. Then you switch off the lights and let everybody in to look for their shoes. After 5 minutes you switch the lights back on and what ever shoes they are left with is the shoes that they have to use for the rest of the meeting or until you decide that they can change.</p>\r\n<p align="left">2. Almost the same as variation 1 except instead of hiding the shoes you just shuffle about then you give the people 30 seconds or so the find them. The lights must still be off.</p>\r\n<p>&nbsp;</p>\r\n<h2>6. Flic-Flac Flow&trade;</h2>\r\n<p align="left">What you need:</p>\r\n<ol>\r\n<li>\r\n<p align="left">A heavy duty ground sheet</p>\r\n</li>\r\n<li>\r\n<p align="left">A bunch of guys</p>\r\n</li>\r\n<li>\r\n<p align="left">A big open space with lots of vertical space</p>\r\n</li>\r\n<li>\r\n<p align="left">Spatula (To be used to pry anyone who is not caught off the ground)</p>\r\n</li>\r\n<li>\r\n<p align="left">Bicycle Pump (To re-inflate anybody who did not make the ground sheet)</p>\r\n</li>\r\n</ol>\r\n<p align="left">Everybody picks up the ground sheet and makes sure that they have a good grip. The strongest guys must hold on to the corners. Then a light person climbs on to the ground sheet and lies down (on their back or stomach but stomach is more fun). Then the leading person shouts "Tighten" and everybody tightens the groundsheet. Then the leader shouts "Alert" and everybody gets ready. Now comes the tricky bit. The leader shouts "1" and you flick the ground sheet, then he shouts "2" and you flick it harder and then he shouts "3" and you really flick it and see how high you can get the person to go. Remember not to let the ground sheet slacken when the person is coming down otherwise you will need to use the spatula and bicycle pump.</p>\r\n<p>&nbsp;</p>\r\n<h2>7. BlitzBaal&trade;</h2>\r\n<p align="left">This is the hottest game which we play. To play you will need</p>\r\n<ol>\r\n<li>\r\n<p align="left">A Tennis ball or similarly shaped not that square object.</p>\r\n</li>\r\n<li>\r\n<p align="left">A lot of petrol or other not so fire retardant liquid.</p>\r\n</li>\r\n<li>\r\n<p align="left">Medical crews standing by.</p>\r\n</li>\r\n<li>\r\n<p align="left">Fire trucks standing by.</p>\r\n</li>\r\n</ol>\r\n<p align="left">First you need to soak the not so square object (i.e. Tennis ball) into your completely fire safe liquid (i.e. Petrol or Mentholated Sprits (Meths), i reckon that meths work the best.) This will take about a week. Then on the night of the meeting you tell everyone that you are going to play hand tennis. Next is to find a hard object like a wall or a 9th Irene scout to play hand tennis with. This game is exactly like hand tennis except you first light the non-square shaped object. I said earlier that meths works the best, the reason for this is that it lasts long and it makes a really nice swoshing sound when it flies, it also makes a really nice sploch sound when thrown against a scout. No injuries have been observed.</p>', 'Games, Troop', 0, NULL, '2009-04-12 18:41:07', '2009-04-13 20:10:35'),
(9, 'faq', 'FAQ', '<div>In line with the Irene troop policy to boldly go where no man has gone before, Irene troop now offers the 9th Irene FAQ to answer any Frequently Asked Questions that you may have about our troop or any other anomaly of nature</div>\r\n<h2><strong>0. Why do we have a FAQ for a Scout Group? </strong></h2>\r\n<p>9th Irene Scout group have a tradition of first''s on the internet, from attending the first JOTI stations back in 1994 (and unofficially in 1993), to having the first Injuries page on the Internet, the first Troop Home page in the district, and now, the first FAQ.</p>\r\n<p>Although many would argue that there is no need for a FAQ, we couldn''t be the first troop to have one without one!</p>\r\n<h2><strong>1. Who are 9th Irene Air Scouts? </strong></h2>\r\n<p>9th Irene Air Scouts is the oldest (we think) Scout troop in the district. The group currently consists of about 15 Scouts, and 38 Cubs. Cubs is for Boys ages 7 to 10, with Scouts for the older Boys, ranging from 11 to 17.</p>\r\n<p>Irene Air Scouts form part of South Western District, in the Tswane Region of the Gauteng Province.</p>\r\n<p>For more information on South African Scouting in general, please visit the <a href="http://www.scouting.org.za/">ScoutWeb South Africa</a>. This page contains all the information you may need regarding South African Scouting, and it actually exists!</p>\r\n<h2>1. How do join 9th Irene?</h2>\r\n<p>Email <strong>general [at] 9thirene.co.za</strong> with your name and age and we will get back to you ASAP to let you know if you can join cubs or scouts and when you can come along and join us. Please do not "just rock up" as we do have waiting lists and we need to know in advance if we should plan a newcomers info session.</p>\r\n<h2><strong>2. Where do they meet?</strong></h2>\r\n<p>9th Irene Scouts and Cubs normally meet at the Irene Scout hall. The hall is the highest point in Irene, and was previously a reservoir. For more information why not send us an email?</p>\r\n<h2><strong>3. How do you get to the Scout Hall? </strong></h2>\r\n<p>This is not dictated by the troop, but normally, scouts get there by car, bicycle, or on foot. The hall is also within walking distance of the Railway Station, and within flying distance of numerous major Airports. Unfortunately, despite being Air Scouts, Landing facilities are limited, especially if you intend taking off again.</p>\r\n<p>Irene only has about 10 streets, so if you drive around for more than a minute, you are either no longer in Irene, or you have missed the Scout hall.</p>\r\n<p>Alternatively, switch off your car radio, wind down the window and open your ears.</p>\r\n<h2><strong>5. When should I go there? </strong></h2>\r\n<p>You are welcome to go there any time that you wish. But the hall is normally locked for security reasons, so we would suggest that you visit at the following times:</p>\r\n<p>Cubs meet on Fridays from 15h00 until 17h00</p>\r\n<p>Scouts meet on Fridays from 19h00 until 21h30</p>\r\n<p>Meetings are only held during public school terms, unless there is sufficient demand at other times.</p>\r\n<h2><strong>7. What are Air Scouts?</strong></h2>\r\n<p>We ask ourselves that question every day.</p>\r\n<h2><strong>12. What are the lyrics of the 9th Irene Anthem?</strong></h2>\r\n<p>Here is the full lyrics to the 9th Irene Anthem:</p>\r\n<p>When we drink Nesquik<br /> We blame it on the bunny<br /> But mommy says the bunny''s dead<br /> And we don''t think it''s funny</p>\r\n<p>When we drink Castle<br />We stand upon the table<br />And tell Charles Glass to kiss his ?bum?<br />Cause we drink Black Label</p>\r\n<p>When we eat Koo Beans<br />We smile with anticipation<br />Cause Koo Beans gives us super gas<br />Which gives us inspiration</p>\r\n<p>When we go to Kontiki<br />By the lake with pollution<br />We do thing that are very bad<br />And break the constitution</p>\r\n<h2><strong>19. How big is Irene Troop?</strong></h2>\r\n<p>About 15 boys between 11 and 18 Years of ageingness</p>\r\n<h2><strong>31. Are there Girls in Irene Troop?</strong></h2>\r\n<p><strong>NO,</strong> and there will never be as long as us men are around (Just joking, but the CoH doesn''t want girls). We do have a very active ranger crew next door which you are welcome to join.</p>\r\n<h2><strong>50. What does Irene Troop do?</strong></h2>\r\n<p>We do Scouts!</p>\r\n<h2><strong>81. Why is the Sky blue?</strong></h2>\r\n<p>Well, there''s a short answer and a long one.</p>\r\n<p><strong>Short Answer:</strong><br /> That''s the way that it was made.</p>\r\n<p><strong>Long Answer:</strong></p>\r\n<p>Blue has the shortest wavelength. That means that it can penetrate the furthest into the atmosphere. That is also why water appears blue (Except Murry Park Puddle water which is more of a glowing green). Which means that when we look up we see blue because all the other wavelengths have been absorbed and reflected all over the place. (Or something like that)</p>\r\n<h2><strong>131. Who is the troop that keeps everybody awake until 5am at Kontiki?</strong></h2>\r\n<p>Us of course!</p>\r\n<h2><strong>212. How does the "Shortest to Tallest Method" work?</strong></h2>\r\n<p>This is the method we use to split us into equal teams. The person organising the game shouts out "shortest to tallest" and hold his hands in a very special way (With one pointing diagonally at the sky, the other at ground) With the highest hand indicating where the tallest people stand. Everybody then stands in a line in there height order. Depending on how many teams you want this next section will differ.</p>\r\n<p>You then decide on a two word (3 word for 3 teams, 4 word for 4 teams, etc.) saying. We normally use "Castle Lager". Then you start at the tallest side and the first person will shout "CASTLE" the second "LAGER" the third "CASTLE" and so on until everybody has had a turn. then all the "Castle''s" will go to one side and the "Lager''s" to the other side. There you go the "Shortest to Tallest Method"</p>\r\n<h2><strong>343. How do I know if the website has been updated?</strong></h2>\r\n<p>Come and have a look.</p>\r\n<h2>555.  How many air scout troops are there in South Africa?</h2>\r\n<p>About 7 that I know of. 1 in the Cape, 1 in Durban, 4 in Johannesburg and then us.</p>', 'Irene, Scouts, Troop, First, Scout, Hall, Cubs, South, Tallest, Join, Meet, Normally, Blue, Shortest, Castle, Teams, Everybody, Information, District, Page, Drink, Group, Need, Lager, Word, Boys, Method, Girls, Person, Means, Water, Stand, Short, Welcome, Africa, Email, General, Scouting, Think, African, Line, Highest, Lyrics, Anthem, Fridays, Times, Distance, Internet, Bunny, Irene Troop, Scout Hall', 0, NULL, '2009-04-12 18:41:44', '2009-04-13 20:10:59'),
(10, 'copied-notice-and-warning', 'Copied notice and warning', '<h2>Warning</h2>\r\n<div>Portions of this web site have been created by senior scouts and may contain material that could be considered to be harmful or offending those who are harmed or offended by the material. If you happen to be harmed or offended by the material please do not read it, alternatively you could <a href="http://www.9thirene.co.za/index.php?page=24&amp;type=static">join the group</a> and be educated in the ways of the Irene.<br /></div>\r\n<h2>Copied Notice</h2>\r\n<p style="text-align: left;">This site contains intellectual, intelligent and otherwise ''special'' information and may not be reproduced in any means including electronically, electrically, digitally, analoguly, cross-dimensionly or any other method, without written consent from the 9th Irene Air Scout Group, and a donation to the 9th Irene Pizza Fund. Also please note that all items carrying the &trade; sign as well as those items that are not are trademarks of 9th Irene. The words dodgy, quality, itykwal, suspect, dubious, scandalous, beaver, wombat, badger, and many other words of the common and uncommon english and non-english languages of this dimension and other similar and asimilar dimensions and not-quite-dimensions as well as non-dimensions are also trademarks of 9th Irene and misusing them could result in a penalty of a extra large margarita with extra ham and 20 litres of coke, deliverable to the Irene Scout Hall at the next scout meeting.</p>', 'Material, Irene, Group, Offended, Harmed', 0, NULL, '2009-04-13 19:48:28', '2009-04-13 20:11:08'),
(11, 'advancements', 'Advancements', '<p>South African Scouts have numerous advancement awards to strive for during their time as a Scout, culminating in the Springbok Top Award (Equivalent of the UK Queen Scout, or the BSA Eagle Scout)</p>\r\n<div><strong>Advancement Badges</strong></div>\r\n<ul>\r\n<li><strong>Troop Membership</strong> - This "badge" entitles you to become a fully fledged member of the World Wide Brotherhood (and Sisterhood) of Scouts.</li>\r\n<li><strong>Pathfinder </strong>&ndash; This is the first real advancement badge, it focuses on basic Scouting training, including such things as: "The six basic knots", basic first aid, and introduces Scouts to camping </li>\r\n<li><strong>Adventurer </strong>&ndash; This advancement badge continues on with the training of the Pathfinder badge, introducing the scout to basic pioneering (lashings, etc) and more advanced first aid. The scout is also required to assist in the planning of a Patrol Hike.</li>\r\n<li><strong>First Class</strong> &ndash; It is said that a boy is only a true scout after he has achieved this badge. The First Class focuses on teaching the Scout basic training techniques. Scouts are required to teach the six basic knots, pioneering and first aid to younger Scouts. They also need to plan and run a Patrol Camp, and a Patrol Hike.</li>\r\n<li><strong>Air/Sea/Land Explorer</strong> &ndash; This badge is split into 3 different badges for the 3 different types of Scout Troops. This badge teaches the Scout to take control of situations, and places the Scout in positions where they need to plan and run large scale activities. The requirements are the same between the 3 different kinds, except for the 6 required interest badges. All 3 badges require the First Aid badge, and then 2 other compulsory badges which differ between the 3 types.</li>\r\n<li><strong>Springbok (Top Award)</strong> &ndash; This badge is the top scouting award in Scout Africa. It concentrates on teaching the Scout how to give back to his community, requiring him/her to do at least 40 hours of community service. The scout is also required to run a 30km+ hike in unfamiliar territory.</li>\r\n</ul>\r\n<p><a href="http://www.9thirene.co.za/index.php?page=advancements&amp;scheme=6">View </a>a detailed list of requirements for each advancement badge</p>', 'Scout, Advancement, Scouts', 0, NULL, '2009-04-13 19:49:48', '2009-04-13 20:11:20');

-- --------------------------------------------------------

--
-- Table structure for table `pages_tags`
--

DROP TABLE IF EXISTS `pages_tags`;
CREATE TABLE IF NOT EXISTS `pages_tags` (
  `id` int(11) NOT NULL auto_increment,
  `page_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=136 ;

--
-- Dumping data for table `pages_tags`
--

INSERT INTO `pages_tags` (`id`, `page_id`, `tag_id`) VALUES
(23, 3, 7),
(24, 3, 8),
(25, 4, 9),
(26, 4, 10),
(27, 4, 11),
(28, 4, 12),
(29, 4, 13),
(30, 4, 14),
(31, 4, 15),
(32, 4, 16),
(33, 4, 17),
(34, 4, 18),
(35, 4, 19),
(36, 4, 20),
(37, 4, 21),
(38, 4, 22),
(39, 4, 23),
(40, 4, 24),
(41, 5, 25),
(42, 5, 13),
(43, 5, 22),
(44, 5, 26),
(45, 6, 25),
(46, 6, 27),
(47, 6, 28),
(48, 6, 29),
(49, 6, 30),
(50, 6, 31),
(51, 6, 32),
(52, 6, 33),
(53, 6, 34),
(54, 6, 35),
(55, 6, 36),
(56, 6, 37),
(57, 6, 38),
(58, 6, 39),
(59, 6, 40),
(60, 6, 41),
(61, 6, 42),
(62, 6, 43),
(63, 6, 44),
(64, 6, 45),
(65, 7, 46),
(66, 7, 25),
(67, 7, 47),
(68, 7, 48),
(69, 8, 49),
(70, 8, 25),
(71, 9, 22),
(72, 9, 11),
(73, 9, 25),
(74, 9, 50),
(75, 9, 13),
(76, 9, 51),
(77, 9, 52),
(78, 9, 9),
(79, 9, 53),
(80, 9, 8),
(81, 9, 54),
(82, 9, 55),
(83, 9, 56),
(84, 9, 57),
(85, 9, 58),
(86, 9, 21),
(87, 9, 59),
(88, 9, 60),
(89, 9, 61),
(90, 9, 6),
(91, 9, 62),
(92, 9, 63),
(93, 9, 64),
(94, 9, 65),
(95, 9, 66),
(96, 9, 67),
(97, 9, 68),
(98, 9, 69),
(99, 9, 70),
(100, 9, 71),
(101, 9, 72),
(102, 9, 73),
(103, 9, 74),
(104, 9, 75),
(105, 9, 10),
(106, 9, 76),
(107, 9, 77),
(108, 9, 78),
(109, 9, 79),
(110, 9, 18),
(111, 9, 80),
(112, 9, 81),
(113, 9, 82),
(114, 9, 83),
(115, 9, 84),
(116, 9, 85),
(117, 9, 86),
(118, 9, 87),
(119, 9, 88),
(120, 9, 89),
(121, 9, 90),
(122, 10, 91),
(123, 10, 22),
(124, 10, 63),
(125, 10, 92),
(126, 10, 93),
(127, 11, 13),
(128, 11, 94),
(129, 11, 11),
(130, 1, 1),
(131, 1, 2),
(132, 1, 3),
(133, 1, 4),
(134, 1, 5),
(135, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
CREATE TABLE IF NOT EXISTS `plugins` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(300) NOT NULL,
  `version` varchar(10) NOT NULL,
  `directory` varchar(300) NOT NULL,
  `plugin_type` varchar(255) NOT NULL,
  `show_ucp` tinyint(4) NOT NULL,
  `tag_models` text NOT NULL,
  `main_model` varchar(255) NOT NULL,
  `profile_extend` tinyint(4) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `title`, `version`, `directory`, `plugin_type`, `show_ucp`, `tag_models`, `main_model`, `profile_extend`) VALUES
(1, 'CMScout Forums', '0.1', 'forums', 'forum', 0, 'ForumPost', 'ForumForum', 1);

-- --------------------------------------------------------

--
-- Table structure for table `search_index`
--

DROP TABLE IF EXISTS `search_index`;
CREATE TABLE IF NOT EXISTS `search_index` (
  `id` int(11) NOT NULL auto_increment,
  `association_key` int(11) NOT NULL,
  `model` varchar(128) collate utf8_unicode_ci NOT NULL,
  `plugin_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `data` longtext collate utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `association_key` (`association_key`,`model`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `search_index`
--

INSERT INTO `search_index` (`id`, `association_key`, `model`, `plugin_name`, `data`, `created`, `modified`) VALUES
(2, 1, 'Page', '0', ' What needs to be done Plugins, Install, System, Themes, Upload, Page What needs to be done:\r\n\r\nUCP \r\n\r\nAvatar upload and resize\r\nPublic profile should look similar to CMScout2\r\nNotifications page should be done (Automagic generated depending on installed plugins).\r\nContribute something page should be done (Automagic generated depending on installed plugins).\r\n\r\n\r\nThemes \r\n\r\nInstallation of themes - Two kinds: Preupload and install or upload zip file and install\r\nUninstall of themes\r\nSetting of site theme\r\n\r\n\r\nPlugins \r\n\r\nInstallation of plugins- Two kinds: Preupload and install or upload zip file and install\r\nUninstall of plugins\r\nSystem for plugins to add notification events\r\nSystem for plugins to add things to the contribution page\r\nSystem for plugins to add menu items and side boxes\r\n\r\n\r\nOther \r\n\r\nLanguage packs\r\nTrash can area for pages\r\nCheck search\r\n\r\n\r\n\r\n"Core" plugins:\r\n\r\nForums\r\nArticles\r\nPhoto albums\r\nPrivate messages\r\nCalendar\r\nDownloads\r\n\r\n"Scouting" plugins:\r\n\r\nProgress record managment\r\n\r\n', '2009-04-06 16:32:11', '2009-04-25 18:21:31'),
(3, 2, 'Page', '0', ' Test Delete Delete it! test-delete', '2009-04-12 10:58:35', '2009-04-12 10:58:35'),
(4, 4, 'Page', '', ' History South, Africa, Scouts, Association, Scout, Kontiki, History, Ranks, Associations, African, Sasa, Somewhere, Teams, Irene, South Africa, Scouts Association History of South African Scouts\r\nThe South Africa Scout Association (SASA) has had a rather interesting history, mainly due to apartheid. There were originally 4 different Scout Associations in South Africa (All governed by the same Chief Scout). These 4 were: The Boy Scouts Association, The African Boy Scouts Association, The Coloured Boy Scouts Association and The Indian Boy Scouts Association. The reason for this division was largely due to the political situation in South Africa at that time.\r\nOn 2 July 1977 the four parallel associations were replace by a single association : the "Boy Scouts of South Africa". This was one of the first associations in South Africa that accepted boys of all races and creeds into it''s membership ranks.\r\nIn 1995 the "Boy Scouts of South Africa" were replaced with the "South African Scout Association", and it began accepting Girls into it''s ranks.\r\nEx-President Nelson Mandela is the SASA''s official Patron.\r\nHistory of 9th Irene\r\n9th Irene Troop can trace it''s roots back to 1921 (Although we are rather certain that we did exist before then). Our current scarf was registered with the SASA in about 1950 and we have been in our scout hall since 1958. We have a proud history of many springboks, and of quickly rising in the ranks at Kontiki (The annual endurance raft "race" at Murry Park in Springs, South Africa). In 1999 we were placed 97th out of 100 teams at Kontiki, in 2000 we rose to somewhere in the 50''s, in 2001 we were somewhere in the 20''s, and in 2002 we won Kontiki! Since then we have consistently been in the top 10 teams at Kontiki.', '2009-04-12 18:38:18', '2009-04-13 20:09:50'),
(5, 5, 'Page', '', ' Welcome to Irene Scout Troop Troop, Scout, Irene, Scout Troop Welcome to the 9th Irene Scout Troop pages\r\nThe Irene Scout troop is what is known as an Air Scout troop and has approximately 15 boys ranging in age from 10 1/2 to 18. The Scout troop is run by 4 uniformed and fully qualified adult volunteers. As an Air Scout troop we try to orientate our programme toward aircraft and other aeronautical activities. The Scout programme focuses on teamwork, leadership skills, interpersonal relationship skills and the concept of "good citizenship". The troop is split into teams called patrols, with each patrol having between five and eight boys and being lead by a patrol leader. Unlike Cubs, where the six is heavily monitored by the adult leaders, the Scout patrol is a largely autonomous unit. Patrols regularly go on camps and hikes with minimum adult supervision, this is a core component of the Scout programme as it teaches the boys how to organise events, how to structure their time and how to cope without "mommy or daddy" being around to help.\r\nThe group takes part in various competitions throughout the year. The biggest of these in the annual Kontiki competition help at Murray Park in Springs. Kontiki pits troops from around Gauteng against each other over a 3 day period. The main focus of the Kontiki competition is the raft that is built. Each troop has 24 hours to build a raft that can sustain and carry 5 to 10 senior Scouts on the water for 24 hours. The Scouts on the raft are not allowed to touch dry land for the 24 hours and must be totally self-sufficient. While the raft crew build the raft and sail on the water with it, there are numerous other small competitions happening for the ground crew. These include a competition for the best campsite, a cooking competition, a dress-up competition and other similar events. 9th Irene has been one of the top teams in the last 5 years of Kontiki and we won the overall competition in 2002.\r\n \r\nIf you want more information or have any questions or comments take a look at our Contact Us page for contact details.', '2009-04-12 18:39:22', '2009-04-13 20:10:00'),
(6, 6, 'Page', '', ' Court of Honour Troop, Patrol, Leader, Leaders, Meeting, Honour, Scouter, Court, Projects, Points, Raised, Special, Assistant, Members, Invitation, Suggestions, Patrol Leaders, Patrol Leader, Troop Scouter, Troop Leader \r\nCourt of Honour\r\nOur current CoH consists of:\r\n\r\nKevin (Patrol leader)\r\nJJ (Patrol Leader)\r\nCamillo (Patrol Leader)\r\nRici (Troop Leader)\r\nGabriel (Troop Leader)\r\n\r\nCourt of Honour FAQ\r\nWhat is the Court of Honour?\r\nIt is the brain that guides the whole Troop. The CoH decides on responsibilities, leadership, how a Troop is run and various other aspects of the Troop. The CoH members are pledged to secrecy, and may not devulge desisions made during a CoH meeting without there being a majority vote. The COH GUARDS THE HONOUR OF THE TROOP (the good name and standards set).\r\nWho are the members?\r\nThe Troop Leaders, all Patrol Leaders and the Troop Scouter. Assistant Patrol Leaders and Assistant Troop Scouters may join the meeting by invitation. The Troop Scouter is there to advise, make suggestions and guide. The Troop Leader or most senior Patrol Leader is normally the CoH Chairman. There must be a scribe to record minutes and decisions. The Group Scouter and any Commissioners may neverattends unless by special invitation. Only the Troop Leaders and Patrol Leaders have voting rights, however the Troop Scouter may veto an unwise decision.\r\nWhat does the Court of Honour do?\r\nQuite simply it plans the activities of the Troop - meetings, camps, hikes, service projects, entertainment, parents evenings, special projects, discipline, points system, Troop funds, Scout advancement, Troop uniform, etc. Jobs are delegated out with report-backs on progress. The Troop Scouter can also use the CoH to train his Patrol Leaders in a training session.\r\nHow do you Participate?\r\nBy bringing up points for discussion raised by your patrol, expressing your opinion fully on matters raised, full participation in any job of work to be done, making suggestions for the good of the Troop.\r\nWhen does it meet?\r\nOnce a month in the Irene CoH room. A short CoH should be held after every Troop Meeting to discuss the meeting - what was good ... bad ... or improvements--and to arrange duties for the next Troop meeting.\r\n', '2009-04-12 18:39:45', '2009-04-13 20:10:09'),
(7, 7, 'Page', '', ' Troop information Forms, Troop, Uniform, Kit List This page provides all the information that the other pages don''t supply. Stuff like standard kit lists, consent forms, health forms, etc.\r\n1. Full Scout Uniform\r\n 9th Irene Air Scouts has a proud history of having one of the best uniforms in the Scouting family. Our uniform is as follows:\r\n\r\nSky blue shirt (available from Scout Shop) with correct badges. \r\nNavy blue shorts with belt loops (available from Scout Shop). Patrol Leaders and above wear long Navy blue chinos (Woolworths sells nice ones)\r\nLong black socks (available from Scout Shop)\r\nBlack school shoes (Scouts are allowed to wear brown ones if they are in Primary School)\r\nNavy blue Scout belt (available from Scout Shop)\r\nBlack beret with standard Scout badge (available from Scout Shop). Patrol Leaders receive a large Scout badge for their beret.\r\nStandard Irene scarf with black woggle (available from Scout Shop). Scouts who have been on PLTU wear the Lexden woggle.\r\n\r\n2. Standard kit list\r\nThis is a recommend kit list for camps (The person organising the camp or hike will give you the real kit list):\r\n\r\nComplete Scout Uniform \r\nGroundsheet \r\nSleeping Bag \r\nPJ''s \r\nSpare underwear \r\nClothes to wear at camp \r\nSpare socks \r\nSomething warm \r\nTackies or Sandals (If a hike then Tackies or Hiking Boots, preferably Hiking Boots) \r\nSwimming Costume \r\nTowel \r\nToilet Bag (Soap, comb, toothbrush, toothpaste, face cloth) \r\nRaincoat or Dry Mac \r\nDraw string mess bag (Two plates, mug, knife, fork, spoon, teaspoon) \r\nDish cloth \r\nNotebook and pen/pencil \r\nTorch and spare batteries \r\nAny medication \r\n\r\nAdditional equipment that might be useful\r\n\r\nRepair bag containing needles, cotton, buttons and safety pins \r\nPocket first aid kit \r\nWaterproof matches \r\nThin wire \r\nScout Knife \r\nCompass \r\nWater Bottle \r\nMusical instrument if you play one \r\nCamera and films \r\n\r\nSuggested camp equipment (Up to camp organiser to decide):\r\n\r\nSleeping Tent \r\nStorage tent if possible \r\nScreening for toilets \r\nSpade \r\nLamps with repair kits and spares \r\nHand Axe \r\nFelling axe if required \r\nBow saw \r\nFirst Aid Box \r\nFlag with pole \r\nMatches, candles, washing soap, steel wool \r\nBog roll \r\nTable top or trestle table \r\nTwo wash bowels and bucket \r\nLarge Dixie or urn for boiling water \r\nTwo medium cooking pots (billies) \r\nTwo small cooking pots (billies) \r\nFrying pan \r\nPlastic container with lid \r\nGrid \r\nCooking utensils \r\nSalt and pepper \r\nDish cloths \r\nBroom \r\nGames box \r\nRopes and spars for gadgets \r\nString for marking kitchen area, etc. \r\nAny other equipment needed \r\n\r\n3. Consent form and Health Certificate\r\nDownload it here\r\n4. Badge book\r\nDownload it here\r\n5. Scout Promise\r\nOn my honour I promise thatI will do my best:To do my duty to God,and my Country;To help other people at all times;To obey the Scout Law\r\n6. Scout Law\r\n\r\nA Scout''s honour is to be trusted \r\nA Scout is loyal \r\nA Scout''s duty is to be useful and to help others. \r\nA Scout is a friend to all and a brother to every other Scout \r\nA Scout is courteous \r\nA Scout is a friend to animals \r\nA Scout obeys orders \r\nA Scout smiles and whistles under all difficulties \r\nA Scout is thrifty \r\nA Scout is clean in thought, word and deed \r\n', '2009-04-12 18:40:19', '2009-04-13 20:10:19'),
(8, 8, 'Page', '', ' Games we play Games, Troop Please note: This page was written by Scouts and contains vast exaggerations.\r\nThis page explains how to do stuff that we do. This includes things like how to play British Bulldogs, Poisonous Staves etc.\r\n1. British BulldogsTM\r\nTo play British bulldogs you need:\r\n\r\nA large field\r\n2 or 3 people willing to be "On"\r\nThe rest of the people standing at one side of the field\r\nAn Ambulance or Paramedics standing by in case anybody decides to be clever and jump headfirst into a wall or similar hard object such as a 9th Irene Scouts head.\r\n\r\nOnce you have all the ingredients ready then the people who are "on" call out somebody''s name. That person then has to run to the other side of the field. To get someone to be "on" you have to catch the person and lift him up so that nothing of his body is touching the ground. He is allowed to struggle. If the person gets to the other side then it is a condition called "Open Gates" where everybody runs to the other side of the field, the people who are on can still try to catch people. The game goes on like this until there are about 5 people left who are not "on" these people can form a "rescue party" if one of then is caught while trying to cross. They run up and help the person to reach the other side of the field. The last person not on wins.\r\n \r\n2. Poisonous StavesTM\r\nTo play poisonous staves you need:\r\n\r\nA large open space depending on number of people\r\nA chair\r\nTwo staves\r\nA minimum of 5 people, there is no maximum\r\nAn Ambulance or Paramedics standing by in case someone''s arm gets ripped off or similar accident, although none of us have ever been hurt to badly (The doctors have always been able to attach the arm with minimum blood loss) it still doesn''t hurt to be on the careful side.\r\n\r\nBalance the two staves on top of the chair. Then everybody forms a circle around the staves and grabs each others arms in a monkey grip. As soon as the last two people join you start pulling and pushing. To get somebody out you must get that person to knock a stave so that it lands on the floor. Or you could break a link in which case the two people whose link is broken are out. To win you have to be the only person not out.\r\n \r\n3. Crab SoccerTM\r\nTo play Crab Soccer you need:\r\n\r\nA large open space depending on number of people (Preferably with a smooth surface or on a stone less field)\r\nOne or Two Soccer Ball''s or Basket Ball''s\r\nTwo chairs to act as goals\r\n\r\nYou split the people up in equal teams using the "Shortest to Tallest Method" (see FAQ question 27). Then you find someway to differentiate between the two teams. Then every body gets sits down and then you use your hands to move your self around and play like ordinary soccer except that the goals are the chairs and you are slightly lower to the ground.\r\n \r\n4. Pre-historic rugbyTM\r\nWhat you need:\r\n\r\nA large field\r\nA brick, or if you want to be on the safe side you could use a brick sized piece of foam but that''s boring\r\nA place in which you can score\r\nAn Ambulance or Paramedics standing by in case anybody decides to be clever and tries to header the "ball" or try and drop kick it.\r\n\r\nYou split the people up in teams again using the "Shortest to Tallest method". Don''t let the word "Rugby" confuse you as there are only two rules in the real version of Pre-historic Rugby: 1. Get the ball to the other side and 2. Don''t let the other team get the ball to your side. Of course if you want to be boring you could add more rules to make it "safer".\r\n \r\n5. The Great Shoe HuntTM\r\nWhat you need:\r\n\r\n\r\nA hall or similar aparatus\r\n\r\n\r\nEverybody''s shoes in the middle of the hall (Make sure that they have taken them off first)\r\n\r\n\r\nA way of turning the lights off (It is best to use a light switch, but shooting out the lights also works provided you have spare light bulbs standing by)\r\n\r\n\r\nThis game does not require medical supervision but it is still recommend to have somebody trained in first aid standing by in case somebody decides it is fun to clobber someone over the head with his steal tipped shoes.\r\n\r\n\r\nThere are two variations of this:\r\n1.Put everybody''s shoes in the middle of the hall. Tell everybody to go outside. Then you hide the shoes but make sure to leave about half of them in them middle. Don''t hide the shoes close to their partners, it is best to leave the partner in the middle and hide the other one. Then you switch off the lights and let everybody in to look for their shoes. After 5 minutes you switch the lights back on and what ever shoes they are left with is the shoes that they have to use for the rest of the meeting or until you decide that they can change.\r\n2. Almost the same as variation 1 except instead of hiding the shoes you just shuffle about then you give the people 30 seconds or so the find them. The lights must still be off.\r\n \r\n6. Flic-Flac FlowTM\r\nWhat you need:\r\n\r\n\r\nA heavy duty ground sheet\r\n\r\n\r\nA bunch of guys\r\n\r\n\r\nA big open space with lots of vertical space\r\n\r\n\r\nSpatula (To be used to pry anyone who is not caught off the ground)\r\n\r\n\r\nBicycle Pump (To re-inflate anybody who did not make the ground sheet)\r\n\r\n\r\nEverybody picks up the ground sheet and makes sure that they have a good grip. The strongest guys must hold on to the corners. Then a light person climbs on to the ground sheet and lies down (on their back or stomach but stomach is more fun). Then the leading person shouts "Tighten" and everybody tightens the groundsheet. Then the leader shouts "Alert" and everybody gets ready. Now comes the tricky bit. The leader shouts "1" and you flick the ground sheet, then he shouts "2" and you flick it harder and then he shouts "3" and you really flick it and see how high you can get the person to go. Remember not to let the ground sheet slacken when the person is coming down otherwise you will need to use the spatula and bicycle pump.\r\n \r\n7. BlitzBaalTM\r\nThis is the hottest game which we play. To play you will need\r\n\r\n\r\nA Tennis ball or similarly shaped not that square object.\r\n\r\n\r\nA lot of petrol or other not so fire retardant liquid.\r\n\r\n\r\nMedical crews standing by.\r\n\r\n\r\nFire trucks standing by.\r\n\r\n\r\nFirst you need to soak the not so square object (i.e. Tennis ball) into your completely fire safe liquid (i.e. Petrol or Mentholated Sprits (Meths), i reckon that meths work the best.) This will take about a week. Then on the night of the meeting you tell everyone that you are going to play hand tennis. Next is to find a hard object like a wall or a 9th Irene scout to play hand tennis with. This game is exactly like hand tennis except you first light the non-square shaped object. I said earlier that meths works the best, the reason for this is that it lasts long and it makes a really nice swoshing sound when it flies, it also makes a really nice sploch sound when thrown against a scout. No injuries have been observed.', '2009-04-12 18:41:07', '2009-04-13 20:10:35'),
(9, 9, 'Page', '', ' FAQ Irene, Scouts, Troop, First, Scout, Hall, Cubs, South, Tallest, Join, Meet, Normally, Blue, Shortest, Castle, Teams, Everybody, Information, District, Page, Drink, Group, Need, Lager, Word, Boys, Method, Girls, Person, Means, Water, Stand, Short, Welcome, Africa, Email, General, Scouting, Think, African, Line, Highest, Lyrics, Anthem, Fridays, Times, Distance, Internet, Bunny, Irene Troop, Scout Hall In line with the Irene troop policy to boldly go where no man has gone before, Irene troop now offers the 9th Irene FAQ to answer any Frequently Asked Questions that you may have about our troop or any other anomaly of nature\r\n0. Why do we have a FAQ for a Scout Group? \r\n9th Irene Scout group have a tradition of first''s on the internet, from attending the first JOTI stations back in 1994 (and unofficially in 1993), to having the first Injuries page on the Internet, the first Troop Home page in the district, and now, the first FAQ.\r\nAlthough many would argue that there is no need for a FAQ, we couldn''t be the first troop to have one without one!\r\n1. Who are 9th Irene Air Scouts? \r\n9th Irene Air Scouts is the oldest (we think) Scout troop in the district. The group currently consists of about 15 Scouts, and 38 Cubs. Cubs is for Boys ages 7 to 10, with Scouts for the older Boys, ranging from 11 to 17.\r\nIrene Air Scouts form part of South Western District, in the Tswane Region of the Gauteng Province.\r\nFor more information on South African Scouting in general, please visit the ScoutWeb South Africa. This page contains all the information you may need regarding South African Scouting, and it actually exists!\r\n1. How do join 9th Irene?\r\nEmail general [at] 9thirene.co.za with your name and age and we will get back to you ASAP to let you know if you can join cubs or scouts and when you can come along and join us. Please do not "just rock up" as we do have waiting lists and we need to know in advance if we should plan a newcomers info session.\r\n2. Where do they meet?\r\n9th Irene Scouts and Cubs normally meet at the Irene Scout hall. The hall is the highest point in Irene, and was previously a reservoir. For more information why not send us an email?\r\n3. How do you get to the Scout Hall? \r\nThis is not dictated by the troop, but normally, scouts get there by car, bicycle, or on foot. The hall is also within walking distance of the Railway Station, and within flying distance of numerous major Airports. Unfortunately, despite being Air Scouts, Landing facilities are limited, especially if you intend taking off again.\r\nIrene only has about 10 streets, so if you drive around for more than a minute, you are either no longer in Irene, or you have missed the Scout hall.\r\nAlternatively, switch off your car radio, wind down the window and open your ears.\r\n5. When should I go there? \r\nYou are welcome to go there any time that you wish. But the hall is normally locked for security reasons, so we would suggest that you visit at the following times:\r\nCubs meet on Fridays from 15h00 until 17h00\r\nScouts meet on Fridays from 19h00 until 21h30\r\nMeetings are only held during public school terms, unless there is sufficient demand at other times.\r\n7. What are Air Scouts?\r\nWe ask ourselves that question every day.\r\n12. What are the lyrics of the 9th Irene Anthem?\r\nHere is the full lyrics to the 9th Irene Anthem:\r\nWhen we drink Nesquik We blame it on the bunny But mommy says the bunny''s dead And we don''t think it''s funny\r\nWhen we drink CastleWe stand upon the tableAnd tell Charles Glass to kiss his ?bum?Cause we drink Black Label\r\nWhen we eat Koo BeansWe smile with anticipationCause Koo Beans gives us super gasWhich gives us inspiration\r\nWhen we go to KontikiBy the lake with pollutionWe do thing that are very badAnd break the constitution\r\n19. How big is Irene Troop?\r\nAbout 15 boys between 11 and 18 Years of ageingness\r\n31. Are there Girls in Irene Troop?\r\nNO, and there will never be as long as us men are around (Just joking, but the CoH doesn''t want girls). We do have a very active ranger crew next door which you are welcome to join.\r\n50. What does Irene Troop do?\r\nWe do Scouts!\r\n81. Why is the Sky blue?\r\nWell, there''s a short answer and a long one.\r\nShort Answer: That''s the way that it was made.\r\nLong Answer:\r\nBlue has the shortest wavelength. That means that it can penetrate the furthest into the atmosphere. That is also why water appears blue (Except Murry Park Puddle water which is more of a glowing green). Which means that when we look up we see blue because all the other wavelengths have been absorbed and reflected all over the place. (Or something like that)\r\n131. Who is the troop that keeps everybody awake until 5am at Kontiki?\r\nUs of course!\r\n212. How does the "Shortest to Tallest Method" work?\r\nThis is the method we use to split us into equal teams. The person organising the game shouts out "shortest to tallest" and hold his hands in a very special way (With one pointing diagonally at the sky, the other at ground) With the highest hand indicating where the tallest people stand. Everybody then stands in a line in there height order. Depending on how many teams you want this next section will differ.\r\nYou then decide on a two word (3 word for 3 teams, 4 word for 4 teams, etc.) saying. We normally use "Castle Lager". Then you start at the tallest side and the first person will shout "CASTLE" the second "LAGER" the third "CASTLE" and so on until everybody has had a turn. then all the "Castle''s" will go to one side and the "Lager''s" to the other side. There you go the "Shortest to Tallest Method"\r\n343. How do I know if the website has been updated?\r\nCome and have a look.\r\n555. How many air scout troops are there in South Africa?\r\nAbout 7 that I know of. 1 in the Cape, 1 in Durban, 4 in Johannesburg and then us.', '2009-04-12 18:41:44', '2009-04-13 20:10:59'),
(10, 10, 'Page', '', ' Copied notice and warning Material, Irene, Group, Offended, Harmed Warning\r\nPortions of this web site have been created by senior scouts and may contain material that could be considered to be harmful or offending those who are harmed or offended by the material. If you happen to be harmed or offended by the material please do not read it, alternatively you could join the group and be educated in the ways of the Irene.\r\nCopied Notice\r\nThis site contains intellectual, intelligent and otherwise ''special'' information and may not be reproduced in any means including electronically, electrically, digitally, analoguly, cross-dimensionly or any other method, without written consent from the 9th Irene Air Scout Group, and a donation to the 9th Irene Pizza Fund. Also please note that all items carrying the TM sign as well as those items that are not are trademarks of 9th Irene. The words dodgy, quality, itykwal, suspect, dubious, scandalous, beaver, wombat, badger, and many other words of the common and uncommon english and non-english languages of this dimension and other similar and asimilar dimensions and not-quite-dimensions as well as non-dimensions are also trademarks of 9th Irene and misusing them could result in a penalty of a extra large margarita with extra ham and 20 litres of coke, deliverable to the Irene Scout Hall at the next scout meeting.', '2009-04-13 19:48:28', '2009-04-13 20:11:08'),
(11, 11, 'Page', '', ' Advancements Scout, Advancement, Scouts South African Scouts have numerous advancement awards to strive for during their time as a Scout, culminating in the Springbok Top Award (Equivalent of the UK Queen Scout, or the BSA Eagle Scout)\r\nAdvancement Badges\r\n\r\nTroop Membership - This "badge" entitles you to become a fully fledged member of the World Wide Brotherhood (and Sisterhood) of Scouts.\r\nPathfinder - This is the first real advancement badge, it focuses on basic Scouting training, including such things as: "The six basic knots", basic first aid, and introduces Scouts to camping \r\nAdventurer - This advancement badge continues on with the training of the Pathfinder badge, introducing the scout to basic pioneering (lashings, etc) and more advanced first aid. The scout is also required to assist in the planning of a Patrol Hike.\r\nFirst Class - It is said that a boy is only a true scout after he has achieved this badge. The First Class focuses on teaching the Scout basic training techniques. Scouts are required to teach the six basic knots, pioneering and first aid to younger Scouts. They also need to plan and run a Patrol Camp, and a Patrol Hike.\r\nAir/Sea/Land Explorer - This badge is split into 3 different badges for the 3 different types of Scout Troops. This badge teaches the Scout to take control of situations, and places the Scout in positions where they need to plan and run large scale activities. The requirements are the same between the 3 different kinds, except for the 6 required interest badges. All 3 badges require the First Aid badge, and then 2 other compulsory badges which differ between the 3 types.\r\nSpringbok (Top Award) - This badge is the top scouting award in Scout Africa. It concentrates on teaching the Scout how to give back to his community, requiring him/her to do at least 40 hours of community service. The scout is also required to run a 30km+ hike in unfamiliar territory.\r\n\r\nView a detailed list of requirements for each advancement badge', '2009-04-13 19:49:48', '2009-04-13 20:11:21'),
(12, 3, 'Page', '', ' How to join People, Join Scouts is the largest youth movement in the world, and you can join it as long as you are older then 7!\r\nYoung people\r\nAs a young person you can join one of 2 sections of the troop, depending on your age.\r\nCubs is for very young people (9th Irene only accepts boys) between the age of 7 and 10 1/2 .\r\nScouts is for not-quite-so young people (9th Irene only accepts boys) between the age of 10 1/2 and 17\r\nIf your son is interested in joining one of these two sections just send an email to general -at- 9thirene.co.za and give us the following information:\r\n\r\nYour name\r\nYour sons name\r\nYour sons birthdate and age\r\nA contact number\r\nSuburb you currently reside in\r\nIf you wish to be contacted by email or phone.\r\n\r\nOnce we have this information we will contact you and give you all the information that you need to know in order for your son to join Scouts or Cubs. Please do contact us before you show up at a meeting as we do have waiting lists.\r\nAdult helpers\r\nWe are always on the lookout for new helpers, in uniform and out of uniform (Don'' worry too much about that, in uniform only means that you have been invested as a Scouter and you have been on the relevent courses). If you are interested in helping out at either Cubs or Scouts, just email us at general -at- 9thirene.co.za and tell us your name and why you are interested in helping out and what types of activities do you wish to help out with. Please note that due to legislation and Scouting Association rules you will be required to fill out a adult volunteer application form.', '2009-04-13 19:52:48', '2009-04-13 20:09:41');

-- --------------------------------------------------------

--
-- Table structure for table `sideboxes`
--

DROP TABLE IF EXISTS `sideboxes`;
CREATE TABLE IF NOT EXISTS `sideboxes` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(300) NOT NULL,
  `element` varchar(300) NOT NULL,
  `model` varchar(255) NOT NULL,
  `plugin_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sideboxes`
--

INSERT INTO `sideboxes` (`id`, `title`, `element`, `model`, `plugin_id`) VALUES
(1, 'Login', 'loginBox', '', 0),
(2, 'Tag Cloud', 'tagCloud', 'Tag', 0),
(3, 'Latest Posts', 'latest_posts', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL auto_increment,
  `tag` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=98 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag`, `slug`) VALUES
(1, 'Plugins', 'plugins'),
(2, 'Install', 'install'),
(3, 'System', 'system'),
(4, 'Themes', 'themes'),
(5, 'Upload', 'upload'),
(6, 'Page', 'page'),
(7, 'People', 'people'),
(8, 'Join', 'join'),
(9, 'South', 'south'),
(10, 'Africa', 'africa'),
(11, 'Scouts', 'scouts'),
(12, 'Association', 'association'),
(13, 'Scout', 'scout-1'),
(14, 'Kontiki', 'kontiki'),
(15, 'History', 'history'),
(16, 'Ranks', 'ranks'),
(17, 'Associations', 'associations'),
(18, 'African', 'african'),
(19, 'Sasa', 'sasa'),
(20, 'Somewhere', 'somewhere'),
(21, 'Teams', 'teams'),
(22, 'Irene', 'irene'),
(23, 'South Africa', 'south-africa'),
(24, 'Scouts Association', 'scouts-association'),
(25, 'Troop', 'troop'),
(26, 'Scout Troop', 'scout-troop'),
(27, 'Patrol', 'patrol'),
(28, 'Leader', 'leader'),
(29, 'Leaders', 'leaders'),
(30, 'Meeting', 'meeting'),
(31, 'Honour', 'honour'),
(32, 'Scouter', 'scouter'),
(33, 'Court', 'court'),
(34, 'Projects', 'projects'),
(35, 'Points', 'points'),
(36, 'Raised', 'raised'),
(37, 'Special', 'special'),
(38, 'Assistant', 'assistant'),
(39, 'Members', 'members'),
(40, 'Invitation', 'invitation'),
(41, 'Suggestions', 'suggestions'),
(42, 'Patrol Leaders', 'patrol-leaders'),
(43, 'Patrol Leader', 'patrol-leader-1'),
(44, 'Troop Scouter', 'troop-scouter'),
(45, 'Troop Leader', 'troop-leader'),
(46, 'Forms', 'forms'),
(47, 'Uniform', 'uniform'),
(48, 'Kit List', 'kit-list'),
(49, 'Games', 'games'),
(50, 'First', 'first'),
(51, 'Hall', 'hall'),
(52, 'Cubs', 'cubs'),
(53, 'Tallest', 'tallest'),
(54, 'Meet', 'meet-1'),
(55, 'Normally', 'normally'),
(56, 'Blue', 'blue'),
(57, 'Shortest', 'shortest'),
(58, 'Castle', 'castle'),
(59, 'Everybody', 'everybody'),
(60, 'Information', 'information'),
(61, 'District', 'district'),
(62, 'Drink', 'drink'),
(63, 'Group', 'group'),
(64, 'Need', 'need'),
(65, 'Lager', 'lager'),
(66, 'Word', 'word'),
(67, 'Boys', 'boys'),
(68, 'Method', 'method'),
(69, 'Girls', 'girls'),
(70, 'Person', 'person'),
(71, 'Means', 'means'),
(72, 'Water', 'water'),
(73, 'Stand', 'stand'),
(74, 'Short', 'short-1'),
(75, 'Welcome', 'welcome'),
(76, 'Email', 'email'),
(77, 'General', 'general'),
(78, 'Scouting', 'scouting'),
(79, 'Think', 'think'),
(80, 'Line', 'line'),
(81, 'Highest', 'highest'),
(82, 'Lyrics', 'lyrics'),
(83, 'Anthem', 'anthem'),
(84, 'Fridays', 'fridays'),
(85, 'Times', 'times'),
(86, 'Distance', 'distance'),
(87, 'Internet', 'internet'),
(88, 'Bunny', 'bunny'),
(89, 'Irene Troop', 'irene-troop'),
(90, 'Scout Hall', 'scout-hall'),
(91, 'Material', 'material'),
(92, 'Offended', 'offended'),
(93, 'Harmed', 'harmed'),
(94, 'Advancement', 'advancement'),
(95, '3 Test', '3-test'),
(96, 'Tete', 'tete'),
(97, 'Quote', 'quote');

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
CREATE TABLE IF NOT EXISTS `themes` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(300) NOT NULL,
  `directory` varchar(300) NOT NULL,
  `site_theme` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=2 ;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `title`, `directory`, `site_theme`) VALUES
(1, 'Default CMScout 3 theme', 'default', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(300) NOT NULL,
  `last_name` varchar(300) NOT NULL,
  `email_address` varchar(350) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `created` datetime default NULL,
  `last_login` datetime default NULL,
  `avatar` varchar(255) default NULL,
  `signature` text NOT NULL,
  `public_profile` tinyint(1) NOT NULL default '1',
  `show_name` tinyint(1) NOT NULL default '1',
  `show_email` tinyint(1) NOT NULL default '0',
  `deleted` tinyint(4) NOT NULL,
  `deleted_date` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `email_address`, `active`, `created`, `last_login`, `avatar`, `signature`, `public_profile`, `show_name`, `show_email`, `deleted`, `deleted_date`) VALUES
(1, 'admin', '37b8ad3a5ce0997733c35d207fd258ad619a65c1', 'Walther', 'Lalk', 'waltherlalk@gmail.com', 1, NULL, NULL, 'irene-logo0.jpg', 'Test', 1, 1, 0, 0, NULL),
(2, 'dakota', '275bb0e016871289409a68c35c800990d749b88b', '', '', 'dakota@9thirene.co.za', 1, '2009-05-08 14:09:27', NULL, NULL, '', 1, 1, 0, 0, NULL);
