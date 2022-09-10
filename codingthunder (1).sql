-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2022 at 04:42 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `SNo` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`SNo`, `name`, `email`, `phone_num`, `msg`, `date`) VALUES
(1, 'first', 'first@gmail.com', '021022010', 'first msg', '2022-09-02 19:09:00'),
(4, 'name', 'name@yahoo.com', '0332343893', 'hello world', NULL),
(21, 'name2', 'name2@yahoo.com', '033234675464', 'hey sohaib good ', NULL),
(22, '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `S_No` int(10) NOT NULL,
  `title` varchar(30) NOT NULL DEFAULT 'FIRST FLASK POST',
  `slug` varchar(30) NOT NULL DEFAULT 'first-post',
  `content` varchar(2000) NOT NULL DEFAULT 'hello  you are seeing first flask post''s content',
  `date` date NOT NULL DEFAULT current_timestamp(),
  `subtitle` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`S_No`, `title`, `slug`, `content`, `date`, `subtitle`) VALUES
(1, 'Homeschooling', 'first-post', 'Hello, you are seeing first  flask post\'s content. Click here to see more:\nParents’ decisions to educate their children outside of formal institutions have received little attention from sociologists even though the number of homeschooling families has grown dramatically over the past decade. According to estimation procedures developed by Lines (1991), approximately 294,000 American children were being homeschooled in 1988, a substantial increase over the 244,000 estimated in 1985. Several years later, Ray (1998), using different methods, placed the number of homeschooled children in 1997-98 between 1.1 and 1.5 million. In regard to homeschool estimates, Lines (1991, p. 35) stated: “[T]hey permit one to say that there is a home school movement … and that it is growing.”  As a result of the success of the movement, homeschooling is legal in all fifty states, albeit with varying levels of regulations and restrictions.\nIn this essay, I attempt to analyze the homeschool movement by grounding it in the social movement literature, particularly the literature that focuses on what Habermas (1981) has called “new social movements,” and by highlighting the recent global social and cultural changes that have occurred as developed societies have been transformed from industrial to information societies, and their cultures from modern to postmodern ones (Bartos, 1996; Inglehart, Nevitte, & Basanez, 1996). I argue that these changes are in large part responsible for the appearance, growth, and persistence of the homeschool movement on the social landscape of the late twentieth century. I will support this thesis by including information I have gathered while interviewing and interacting with homeschooling families who are members of two homeschool support groups in the Midwest, with dozens of homeschoolers attending several homeschool conventions and activities, and with over a hundred homeschoolers across the nation via the Internet. These data are being gathered as a part of a', '2022-09-04', 'Introduction'),
(2, 'Homeschooling', 'second-post', 'Hello,  you are seeing second flask post\'s content.Click here to see more:\nWhile homeschooling has previously been defined and successfully defended as a social movement (Hadeed, 1991; Knowles, Marlow, & Muchmore, 1992; Mayberry, 1988; Mayberry, Knowles, Ray, and Marlow, 1995), I will revisit the issue in order to acquaint readers with the current literature and to lay a foundation for the ideas that I will present later on. A social movement is defined as a substantial number of people who organize and take action to prevent or promote social change (see Thompson & Hickey, 1996, p. 338). The actions taken by these collectivities are goal directed and generally occur outside established organizations and institutions. This is because established organizations and institutions are often challenged or threatened by the goals and activities of the social movements that often arise in opposition to them. Melucci (1989, p. 29) further contributes to our understanding of social movements by specifying that social movements are forms of “collective action” with three characteristics. First, the participants have a sense of unity in that they recognize that they are part of a larger unit. Second, participants often engage in degrees of conflict with forces that oppose their goals; and third, the movement often goes beyond the limits of that with which the status quo of the system is currently comfortable or compatible. That is to say, if the movement is successful both the statuses of established institutions and contemporary social practices are often affected.', '2022-09-05', 'New Social Movements'),
(3, 'Energy', 'third-post', 'Hello,  you are seeing third flask post\'s content .Click here to see more:\nAccess to affordable and reliable energy is absolutely essential for human development, but energy production takes a heavy toll on the environment. With demand for energy expected to grow for decades to come as developing nations emerge from poverty, substantial innovation into clean energy technologies will be necessary to achieve our ambitious goals for greenhouse gas emissions reductions.', '2022-09-05', 'Make energy cheap'),
(4, 'Food and Agriculture', 'fourth-post', 'Hello,  you are seeing fourth flask post\'s content.Click here to see more:\r\nWe need a pragmatic vision for our global food system, one that meets rising food demand to ensure a healthy and prosperous population, while simultaneously minimizing greenhouse gas emissions and humanity’s intrusion into wild nature.', '2022-09-05', 'Grow more food'),
(5, 'Ecomodernism', 'fifth-post', 'Hello,  you are seeing fifth flask post\'s content.Click here to read more:  \nAn environmental philosophy that argues that humans can protect nature and improve human wellbeing by decoupling human development from environmental impacts.', '2022-09-09', 'Introduction');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`SNo`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`S_No`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `SNo` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `S_No` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
