-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 25, 2021 at 11:21 PM
-- Server version: 8.0.22-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resources`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `bookmark_id` int UNSIGNED NOT NULL,
  `bookmark_name` varchar(100) NOT NULL,
  `bookmark_order` int UNSIGNED NOT NULL,
  `bookmark_column` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`bookmark_id`, `bookmark_name`, `bookmark_order`, `bookmark_column`) VALUES
(11, 'Social Network', 1, 1),
(17, 'Google', 1, 2),
(18, 'DOCS', 2, 3),
(19, 'Problem Solving', 1, 4),
(20, 'Tutorials', 1, 1),
(21, 'Arabic Channels', 3, 3),
(22, 'English Channels', 2, 2),
(23, 'CSS Preprocessors', 2, 4),
(24, 'CSS Frameworks', 3, 1),
(25, 'CSS Hover', 2, 2),
(26, 'CSS Animation', 4, 3),
(27, 'CSS Loaders', 3, 4),
(37, 'CSS Misc', 4, 1),
(38, 'JS Frameworks', 4, 2),
(39, 'JS Libraries', 4, 3),
(40, 'JS Animations', 4, 4),
(41, 'JS Particles', 6, 1),
(42, 'JS Carousels', 5, 2),
(43, 'JS Hover', 5, 3),
(44, 'JS Scroll', 5, 4),
(45, 'JS Misc', 8, 1),
(46, 'JS Sliders', 6, 2),
(47, 'Code Kits', 6, 3),
(48, 'Web Templates', 6, 4),
(49, 'Colors', 12, 1),
(50, 'UI Kits', 7, 2),
(51, 'Images', 7, 3),
(52, 'Illustrations', 7, 4),
(53, 'Icons', 14, 1),
(54, 'Font Icons', 8, 2),
(55, 'Fonts', 8, 3),
(56, 'Visual Feed', 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `link_id` int UNSIGNED NOT NULL,
  `bookmark_id` int UNSIGNED NOT NULL,
  `link_name` varchar(100) NOT NULL,
  `link_href` varchar(255) NOT NULL,
  `link_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`link_id`, `bookmark_id`, `link_name`, `link_href`, `link_image`) VALUES
(25, 11, 'Facebook', 'https://www.facebook.com/', 'facebook.ico'),
(26, 11, 'Twitter', 'https://twitter.com/', 'twitter.ico'),
(27, 11, 'Discord', 'https://discord.com/', 'discord.ico'),
(28, 11, 'Github', 'https://github.com/', 'github-project.png'),
(29, 11, 'LinkedIn', 'https://www.linkedin.com/', 'linkedin.ico'),
(30, 11, 'Stackoverflow', 'https://stackoverflow.com/', 'stackoverflow.ico'),
(31, 17, 'Google Account', 'https://myaccount.google.com/', 'google.ico'),
(32, 17, 'Gmail', 'https://mail.google.com/', 'gmail.ico'),
(33, 17, 'Google Drive', 'https://drive.google.com/', 'googledrive.png'),
(34, 17, 'Google Maps', 'https://www.google.com.eg/maps', 'googlemaps.ico'),
(35, 17, 'Google Translator', 'https://translate.google.com.eg/', 'googletranslator.ico'),
(36, 17, 'Youtube', 'https://www.youtube.com/', 'youtube.png'),
(37, 18, 'MDN', 'https://developer.mozilla.org/en-US/', 'mdn.png'),
(38, 18, 'W3Schools', 'https://www.w3schools.com/', 'w3schools.ico'),
(39, 18, 'Freecodecamp', 'https://www.freecodecamp.org/', 'freecodecamp.png'),
(40, 18, 'Javatpoint', 'https://www.javatpoint.com/', 'javatpoint.png'),
(41, 18, 'Tutorial Republic', 'https://www.tutorialrepublic.com/', 'tutorialrepublic.png'),
(42, 18, 'Tutorials Point', 'https://www.tutorialspoint.com/index.htm', 'tutorialspoint.ico'),
(43, 18, 'Dev Docs', 'https://devdocs.io/', 'devdocs.ico'),
(44, 18, 'MySQL Tutorial', 'https://www.mysqltutorial.org/', 'mysqltutorial.png'),
(45, 18, 'JS The Right Way', 'https://jstherightway.org/', 'website.png'),
(46, 18, 'OWASP Cheat Sheet', 'https://cheatsheetseries.owasp.org/', 'owasp.png'),
(47, 19, 'Codewars', 'https://www.codewars.com/', 'codewars.ico'),
(48, 19, 'Exercism', 'https://exercism.io/', 'exercism.png'),
(49, 19, 'Hacker Rank', 'https://www.hackerrank.com/', 'hackerrank.png'),
(50, 19, 'URI Online Judge', 'https://www.urionlinejudge.com.br/judge/en/login', 'uri.ico'),
(51, 19, 'Code Forces', 'https://codeforces.com/', 'codeforces.png'),
(52, 20, 'Youtube', 'https://www.youtube.com/', 'youtube.png'),
(53, 20, 'Udemy', 'https://www.udemy.com/', 'udemy.png'),
(54, 20, 'Udacity', 'https://www.udacity.com/', 'udacity.ico'),
(55, 20, 'Coursera', 'https://www.coursera.org/', 'coursera.png'),
(56, 20, 'Mahara Tech', 'https://maharatech.gov.eg/', 'maharatech.png'),
(57, 20, '5damt Web', 'https://5dmat-web.com/ar', '5dmatweb.png'),
(58, 21, 'El Zero', 'https://www.youtube.com/user/OsamaElzero/playlists', 'youtube.png'),
(59, 21, 'KMR Script', 'https://www.youtube.com/c/KMRScript/playlists', 'youtube.png'),
(60, 20, 'El Zero Web School', 'https://elzero.org/', 'elzerowebschool.ico'),
(61, 21, 'The New Baghdad', 'https://www.youtube.com/c/hussienahmmed/playlists', 'youtube.png'),
(62, 21, 'Muhammed Essa', 'https://www.youtube.com/c/MuhammedEssa/playlists', 'youtube.png'),
(63, 21, 'Php Anonymous', 'https://www.youtube.com/c/PhpAnonymous/playlists', 'youtube.png'),
(64, 21, '5dmat-web', 'https://www.youtube.com/channel/UCf3uCfBXTG4YtBrKxpejOJg/playlists', 'youtube.png'),
(65, 21, 'Droos Online', 'https://www.youtube.com/c/DroosOnline4u/playlists', 'youtube.png'),
(66, 21, 'Mohamed Yehiya', 'https://www.youtube.com/c/firefoxegyweb/playlists', 'youtube.png'),
(67, 21, 'Hassouna Academy', 'https://www.youtube.com/c/firefoxegyweb/playlists', 'youtube.png'),
(68, 21, 'ITI Courses', 'https://www.youtube.com/user/mido330664/playlists', 'youtube.png'),
(69, 21, 'Free4arab', 'https://www.youtube.com/user/Nourelhoda2011/playlists', 'youtube.png'),
(70, 22, 'Traversy Media', 'https://www.youtube.com/user/TechGuyWeb/playlists', 'youtube.png'),
(71, 22, 'The Net Ninja', 'https://www.youtube.com/c/TheNetNinja/playlists', 'youtube.png'),
(72, 22, 'Programming Knowledge', 'https://www.youtube.com/c/ProgrammingKnowledge/playlists', 'youtube.png'),
(73, 22, 'The New Boston', 'https://www.youtube.com/user/thenewboston/playlists', 'youtube.png'),
(74, 22, 'Academic', 'https://www.youtube.com/c/Academind/playlists', 'youtube.png'),
(75, 22, 'Freecodecamp', 'https://www.youtube.com/c/Freecodecamp/playlists', 'youtube.png'),
(76, 22, 'Code With Harry', 'https://www.youtube.com/c/CodeWithHarry/playlists', 'youtube.png'),
(77, 22, 'Learn Code Academy', 'https://www.youtube.com/c/learncodeacademy/playlists', 'youtube.png'),
(78, 23, 'SASS', 'https://sass-lang.com/', 'sass.ico'),
(79, 23, 'LESS', 'http://lesscss.org/', 'less.ico'),
(80, 23, 'Stylus', 'https://stylus-lang.com/', 'stylus.ico'),
(81, 24, 'Bootstrap', 'https://getbootstrap.com/', 'bootstrap.ico'),
(82, 24, 'Tailwind', 'https://tailwindcss.com/', 'tailwind.png'),
(83, 24, 'UI Kit', 'https://getuikit.com/', 'uikit.png'),
(84, 25, 'Image Hover', 'http://imagehover.io/', 'imagehover.png'),
(85, 25, 'Hover.css', 'https://ianlunn.github.io/Hover/', 'website.png'),
(86, 25, 'Hover Buttons', 'https://varin6.github.io/Hover-Buttons/', 'website.png'),
(87, 25, 'I Hover', 'https://gudh.github.io/ihover/dist/index.html', 'website.png'),
(88, 25, 'CSShake', 'https://elrumordelaluz.github.io/csshake/', 'website.png'),
(89, 25, 'Mocassin.css', 'https://eliezerpujols.github.io/mocassin.css/', 'website.png'),
(90, 25, 'Direction Reveal', 'https://nigelotoole.github.io/direction-reveal/', 'website.png'),
(91, 25, 'Simple Hovers', 'https://pineco.de/project/simple-hover/', 'website.png'),
(92, 25, 'Bootstrap Image Hover', 'https://miketricking.github.io/bootstrap-image-hover/', 'website.png'),
(93, 26, 'Animate.css', 'https://animate.style/', 'animatecss.ico'),
(94, 26, 'Animatopy', 'https://sarthology.github.io/Animatopy/', 'animatopy.ico'),
(95, 26, 'Vivify', 'http://vivify.mkcreative.cz/', 'vivify.png'),
(96, 26, 'Magic Animations', 'https://www.minimamente.com/project/magic/', 'magiceffects.png'),
(97, 26, 'Catto CSS', 'https://cattocss.com/', 'cattocss.ico'),
(98, 26, 'Mimic.css', 'https://erictreacy.github.io/mimic.css/', 'website.png'),
(99, 26, 'Tuseday', 'https://shakrmedia.github.io/tuesday/', 'website.png'),
(100, 26, 'Wicked CSS', 'https://kristofferandreasen.github.io/wickedCSS', 'website.png'),
(101, 26, 'Izmir', 'https://ciar4n-izmir.netlify.app/', 'website.png'),
(102, 27, 'Loading.io', 'https://loading.io/css/', 'loading.io.ico'),
(103, 27, 'Spin Kit', 'https://tobiasahlin.com/spinkit/', 'tobiasahlin.ico'),
(104, 27, 'Simbyone', 'https://simbyone.com/demo/30-css-page-preload-animations/', 'simbyone.ico'),
(105, 27, 'CSSPIN', 'https://webkul.github.io/csspin/', 'website.png'),
(106, 27, 'Loaders.css', 'https://connoratherton.com/loaders', 'website.png'),
(107, 11, 'Telegram', 'https://web.telegram.org/', 'telegram.ico'),
(108, 37, 'Normalize.css', 'https://necolas.github.io/normalize.css/', 'normalize.ico'),
(109, 37, 'Moving Letters', 'https://tobiasahlin.com/moving-letters/', 'tobiasahlin.ico'),
(110, 37, 'MoreToggles.css', 'https://jnkkkk.github.io/MoreToggles.css/allToggles.html', 'website.png'),
(111, 38, 'Vue', 'https://v3.vuejs.org/', 'vue.png'),
(112, 38, 'React', 'https://reactjs.org/', 'react.ico'),
(113, 38, 'Angular', 'https://angular.io/', 'angular.ico'),
(114, 39, 'jQuery', 'https://jquery.com/', 'jquery.ico'),
(115, 39, 'Pug', 'https://pugjs.org/', 'pug.ico'),
(116, 39, 'Gulp', 'https://gulpjs.com/', 'gulp.png'),
(117, 39, 'Popper', 'https://popper.js.org/', 'popper.png'),
(118, 39, 'HTML5 Shiv', 'https://github.com/aFarkas/html5shiv', 'github-project.png'),
(119, 40, 'Ani JS', 'https://anijs.github.io/', 'anijs.png'),
(120, 40, 'Anime JS', 'https://animejs.com/', 'animatejs.png'),
(121, 40, 'WOW JS', 'https://wowjs.uk/', 'wowjs.ico'),
(122, 40, 'Animate On Scroll', 'https://michalsnik.github.io/aos/', 'website.png'),
(123, 40, 'Bounce JS', 'http://bouncejs.com/', 'website.png'),
(124, 41, 'TS Particles', 'https://particles.matteobruni.it/', 'particles.png'),
(125, 41, 'Particles.js', 'https://vincentgarreau.com/particles.js/', 'particlesjs.ico'),
(126, 42, 'Veno Box', 'https://veno.es/venobox/', 'venobox.png'),
(127, 42, 'Flickity', 'https://flickity.metafizzy.co/', 'flickity.ico'),
(128, 42, 'Magnific Popup', 'https://dimsemenov.com/plugins/magnific-popup/', 'magnificpopup.ico'),
(129, 42, 'Slick', 'https://kenwheeler.github.io/slick/', 'website.png'),
(130, 42, 'Owl Carousel', 'https://owlcarousel2.github.io/OwlCarousel2/', 'website.png'),
(131, 42, 'Lity', 'https://sorgalla.com/lity/', 'website.png'),
(132, 42, 'Photo Swipe', 'https://photoswipe.com/', 'website.png'),
(133, 43, 'Slip Hover', 'https://wayou.github.io/SlipHover/', 'sliphover.ico'),
(134, 43, 'Tilt.js', 'https://gijsroge.github.io/tilt.js/', 'website.png'),
(135, 44, 'Overlay Scrollbars', 'https://kingsora.github.io/OverlayScrollbars/#!overview', 'overlayscrollbars.ico'),
(136, 44, 'Simple Bar', 'https://grsmto.github.io/simplebar/', 'simplescroll.png'),
(137, 44, 'Barba.js', 'https://barba.js.org/', 'brabra.ico'),
(138, 44, 'Full Page', 'https://alvarotrigo.com/fullPage/', 'fullpagejs.ico'),
(139, 44, 'Page Pilling', 'https://alvarotrigo.com/pagePiling/', 'website.png'),
(140, 44, 'Headroom', 'https://wicky.nillia.ms/headroom.js/', 'website.png'),
(141, 44, 'ScrollLine.js', 'https://github.com/anthonyly/Scrolline.js', 'github-project.png'),
(142, 45, 'Typed.js', 'https://mattboldt.com/demos/typed-js/', 'typedjs.ico'),
(143, 45, 'Midnight.js', 'https://aerolab.github.io/midnight.js/', 'midnight.ico'),
(144, 45, 'Isotope', 'https://isotope.metafizzy.co/', 'isotope.ico'),
(145, 45, 'jQuery Nice Select', 'https://jqueryniceselect.hernansartorio.com/', 'website.png'),
(146, 45, 'jQuery AJAX Form', 'https://jquery-form.github.io/form/', 'website.png'),
(147, 45, 'Counter Up', 'https://github.com/bfintal/Counter-Up2', 'github-project.png'),
(148, 46, 'Slideout.js', 'https://slideout.js.org/', 'slideout.ico'),
(149, 46, 'Slinky.js', 'https://slinky.js.org/', 'slinky.ico'),
(150, 47, 'W3Schools How To', 'https://www.w3schools.com/howto/default.asp', 'w3schools.ico'),
(151, 47, 'CodePen', 'https://codepen.io/', 'codepen.ico'),
(152, 47, 'Code My UI', 'https://codemyui.com/', 'codemyui.png'),
(153, 47, 'Free Frontend', 'https://freefrontend.com/', 'freefrontend.ico'),
(154, 47, 'Bootstrap MD', 'https://mdbootstrap.com/docs/jquery/', 'mdbootstrap.png'),
(155, 47, 'Admin LTE', 'https://adminlte.io/', 'adminlte.png'),
(156, 47, 'Best jQuery', 'https://www.bestjquery.com/codelab/', 'bestjquery.ico'),
(157, 47, 'Awesome Open Projects', 'https://awesomeopensource.com/', 'awesomeopensource.ico'),
(158, 47, 'Bootstrap Checkboxes', 'https://github.com/flatlogic/awesome-bootstrap-checkbox', 'github-project.png'),
(159, 48, 'HTML5 UP', 'https://html5up.net/', 'html5up.ico'),
(160, 48, 'Template MO', 'https://templatemo.com/', 'templatemo.ico'),
(161, 48, 'Tooplate', 'https://www.tooplate.com/', 'tooplate.ico'),
(162, 48, 'Colorlib', 'https://colorlib.com/', 'colorlib.webp'),
(163, 48, 'Templated', 'https://templated.co/', 'templated.ico'),
(164, 48, 'Free CSS', 'https://www.free-css.com/free-css-templates', 'freecss.ico'),
(165, 48, 'Themes For', 'https://themesfor.app/all-themes/', 'themesfor.png'),
(166, 48, 'Bootstrap Made', 'https://bootstrapmade.com/', 'bootstrapmade.png'),
(167, 48, 'Theme Hunt', 'https://themehunt.com/', 'themehunt.png'),
(168, 48, 'Theme Forest Download', 'https://themeforest.download/', 'themeforestdownload.ico'),
(169, 48, 'OS Template', 'https://www.os-templates.com/', 'ostemplate.ico'),
(170, 48, 'Theme Free SIA', 'https://themefreesia.com/', 'themefreesia.png'),
(171, 49, 'Paletton', 'https://paletton.com/', 'paletton.png'),
(172, 49, 'Color Hunt', 'https://colorhunt.co/', 'colorhunt.gif'),
(173, 49, 'Color Hex', 'https://www.color-hex.com/color-palettes/', 'colorhex.ico'),
(174, 49, 'Coolors', 'https://coolors.co/palettes/trending', 'coolors.png'),
(175, 49, 'Color Mind', 'http://colormind.io/', 'colormind.gif'),
(176, 49, 'Gradient Hunt', 'https://gradienthunt.com/', 'gradienthunt.png'),
(177, 49, 'UI Gradients', 'https://uigradients.com/', 'uigradients.png'),
(178, 50, 'Freepik', 'https://www.freepik.com/', 'freepik.ico'),
(179, 50, 'UI Design Daily', 'https://uidesigndaily.com/', 'uidesign.png'),
(180, 50, 'XD Guru', 'https://www.xdguru.com/free-xd-ui-kits/', 'xdguru.ico'),
(181, 50, 'UI Store', 'https://www.uistore.design/', 'uistore.png'),
(182, 50, 'Freebies Bug', 'https://freebiesbug.com/', 'freebiesbug.ico'),
(183, 50, 'Free Design Resources', 'https://freedesignresources.net/', 'freedesignresources.png'),
(184, 51, 'Pexels', 'https://www.pexels.com/', 'pexels.ico'),
(185, 51, 'Unsplash', 'https://unsplash.com/', 'unsplash.png'),
(186, 51, 'Hi Clipart', 'https://www.hiclipart.com/', 'hiclipart.ico'),
(187, 51, 'PNG Tree', 'https://pngtree.com/free-vectors', 'pngtree.ico'),
(188, 51, 'PNG Item', 'https://www.pngitem.com/', 'pngitem.ico'),
(189, 51, 'Pixabay', 'https://pixabay.com/', 'pixabay.png'),
(190, 51, 'Pattern Ico', 'https://patternico.com/', 'patternico.ico'),
(191, 51, 'Image Compressor', 'https://imagecompressor.com/', 'imagecomparessor.png'),
(192, 51, 'Tiny PNG', 'https://tinypng.com/', 'tinypng.ico'),
(193, 52, 'UnDraw', 'https://undraw.co/illustrations', 'undraw.ico'),
(194, 52, 'Draw Kit', 'https://www.drawkit.io/', 'drawkit.png'),
(195, 52, 'Open Doodles', 'https://www.opendoodles.com/', 'opendodles.png'),
(196, 52, 'Storytale', 'https://storytale.io/freebies/', 'storytale.png'),
(197, 52, 'Illlustrations', 'https://illlustrations.co/', 'illlustrations.png'),
(198, 52, 'Pixel True', 'https://www.pixeltrue.com/free-illustrations', 'pixeltrue.png'),
(199, 52, 'Delesign', 'https://delesign.com/free-designs/graphics', 'delesign.png'),
(200, 52, 'Error 404', 'https://error404.fun/', 'error404.png'),
(201, 53, 'Flat Icons', 'https://www.flaticon.com/', 'flaticon.ico'),
(202, 53, 'Icons8', 'https://icons8.com/', 'icons8.png'),
(203, 53, 'Icon Bros', 'https://www.iconbros.com/', 'iconbros.ico'),
(204, 53, 'Simple Icons', 'https://simpleicons.org/', 'simpleicons.ico'),
(206, 53, 'Favicon.io', 'https://favicon.io/', 'favicon.png'),
(207, 53, 'Favicon Generator', 'https://realfavicongenerator.net/', 'favicongenerator.ico'),
(208, 54, 'Font Awesome', 'https://fontawesome.com/', 'fontawesome.png'),
(209, 54, 'Material', 'https://material.io/resources/icons/?style=baseline', 'material.ico'),
(210, 54, 'Line Awesome', 'https://icons8.com/line-awesome', 'lineawesome.png'),
(211, 54, 'Box Icons', 'https://boxicons.com/', 'boxicons.ico'),
(212, 54, 'Fontello', 'http://fontello.com/', 'fontello.ico'),
(213, 54, 'Feather Icons', 'https://feathericons.com/', 'feathericons.png'),
(214, 55, 'Google Fonts', 'https://fonts.google.com/', 'googlefonts.ico'),
(215, 55, '1001 Free Fonts', 'https://www.1001freefonts.com/', '1001freefone.ico'),
(216, 55, 'Dafont', 'https://www.dafont.com/', 'dafont.ico'),
(217, 55, 'Font Space', 'https://www.fontspace.com/', 'fontspaces.ico'),
(218, 55, 'Arabic Fonts', 'https://arabicfonts.net/', 'arabicfonts.png'),
(219, 56, 'Dribbble', 'https://dribbble.com/shots/popular/web-design', 'dribble.ico'),
(220, 56, 'Behance', 'https://www.behance.net/', 'behance.ico'),
(221, 56, 'Theme Forest', 'https://themeforest.net/', 'themeforest.ico'),
(222, 56, 'Awwwards', 'https://www.awwwards.com/', 'awwwards.png'),
(223, 56, 'SaaS Landing Pages', 'https://saaslandingpage.com/', 'sasslandingpage.png'),
(224, 56, 'Web Design Inspiration', 'https://www.webdesign-inspiration.com/', 'webdesign-inispiration.ico');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`bookmark_id`) USING BTREE;

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `links_ibfk1` (`bookmark_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `bookmark_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `link_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `links_ibfk1` FOREIGN KEY (`bookmark_id`) REFERENCES `bookmarks` (`bookmark_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
