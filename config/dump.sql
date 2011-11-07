-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 07-11-2011 a las 03:22:35
-- Versión del servidor: 5.1.36
-- Versión de PHP: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de datos: 'simple_cms_development'
--

--
-- Volcar la base de datos para la tabla 'admin_users'
--

INSERT INTO admin_users (id, first_name, last_name, email, hashed_password, created_at, updated_at, username, salt) VALUES
(1, 'Leonardo', 'Picado', 'leopic@gmail.com', '6fa7b6795889d1c7fddb69a4f8f32db8ab72c3e1', '2011-08-18 14:30:39', '2011-09-17 19:03:26', 'leopicado', '8dccb090ffbe0ab5a39237d70c52a7ecbb11e8da');

--
-- Volcar la base de datos para la tabla 'admin_users_pages'
--

INSERT INTO admin_users_pages (admin_user_id, page_id) VALUES
(1, 2);

--
-- Volcar la base de datos para la tabla 'pages'
--

INSERT INTO pages (id, name, permalink, position, visible, created_at, updated_at, subject_id) VALUES
(1, '111111111111', 'primero', 1, 1, '2011-08-18 13:48:14', '2011-09-16 01:06:13', 12),
(2, 'Segunda Pagina', 'segunda', 2, 0, '2011-08-18 14:02:43', '2011-08-18 14:02:43', 2),
(4, 'pagina nueva', 'nuevaPag', 1, 1, '2011-08-24 00:24:42', '2011-09-16 01:06:37', 10),
(5, 'tercera', 'nullfornow', 4, 1, '2011-09-16 00:44:55', '2011-09-16 01:06:41', 13);

--
-- Volcar la base de datos para la tabla 'schema_migrations'
--

INSERT INTO schema_migrations (version) VALUES
('20110809032823'),
('20110809033044'),
('20110809035246'),
('20110810010449'),
('20110810031826'),
('20110810032019'),
('20110810033707'),
('20110818141654'),
('20110818143925');

--
-- Volcar la base de datos para la tabla 'sections'
--

INSERT INTO sections (id, name, permalink, position, visible, content_type, content, created_at, updated_at, page_id) VALUES
(1, 'Nueva Seccion', 'nv', 1, 0, 'html', '<div class="clearfix">\r\n\r\n	<label for="section_page_id">Page</label>\r\n	<div class="input">\r\n		<select id="section_page_id" name="section[page_id]"><option value="1">1</option>\r\n<option value="2">2</option>\r\n<option value="4" selected="selected">4</option>\r\n<option value="5">5</option></select>\r\n	</div>\r\n</div>\r\n\r\n', '2011-08-18 14:52:31', '2011-09-16 13:50:48', 4),
(2, 'Sexxion', 'sexion', 4, 0, 'meh', 'w00t', '2011-09-12 02:24:32', '2011-09-16 01:13:00', 2),
(3, 'sdsd', 'sdsd', 3, 1, 'html', 'sdag r rew rwer', '2011-09-15 22:16:32', '2011-09-16 01:12:51', 5),
(4, 'nueva seccion', NULL, 3, 1, 'html', '<html>yeah</html>', '2011-09-16 00:54:24', '2011-09-16 00:54:46', 1);

--
-- Volcar la base de datos para la tabla 'section_edits'
--

INSERT INTO section_edits (id, admin_user_id, section_id, summary, created_at, updated_at) VALUES
(1, 1, 1, 'Prueba de Edicion', '2011-08-18 14:54:50', '2011-08-18 14:55:04');

--
-- Volcar la base de datos para la tabla 'subjects'
--

INSERT INTO subjects (id, name, position, visible, created_at, updated_at) VALUES
(2, 'Second Subjecto', 2, 1, '2011-08-14 00:48:36', '2011-08-23 05:17:53'),
(3, 'Good Medicine', 1, 0, '2011-08-14 00:55:44', '2011-09-15 22:26:28'),
(7, 'nuevo sujeto', 3, 1, '2011-08-23 04:55:15', '2011-09-15 22:31:20'),
(10, 'subject[name]222', 5, 0, '2011-08-23 05:40:21', '2011-09-15 22:30:48'),
(12, '111', 4, 1, '2011-09-12 01:23:43', '2011-09-15 22:26:45'),
(13, 'nuevo con check', 6, 1, '2011-09-15 00:00:00', '2011-09-17 19:19:57');
