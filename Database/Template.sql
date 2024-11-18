-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2024 at 05:16 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `other_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `command_logs`
--

CREATE TABLE `command_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `command` varchar(1000) NOT NULL,
  `args` varchar(2000) NOT NULL DEFAULT '{}',
  `tstamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discord_logs`
--

CREATE TABLE `discord_logs` (
  `id` int(11) NOT NULL,
  `discord_id` varchar(1000) NOT NULL,
  `discord_tag` varchar(1000) NOT NULL,
  `type` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `motd` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `place_settings`
--

CREATE TABLE `place_settings` (
  `id` int(11) NOT NULL,
  `universe_id` bigint(11) NOT NULL,
  `place_id` bigint(11) NOT NULL,
  `owner_type` enum('0','1') NOT NULL DEFAULT '0',
  `owner_id` int(11) NOT NULL,
  `game_title` varchar(255) NOT NULL,
  `loads` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Owner Type: 1 - Group  0 - User';

--
-- Dumping data for table `place_settings`
--

INSERT INTO `place_settings` (`id`, `universe_id`, `place_id`, `owner_type`, `owner_id`, `game_title`, `loads`) VALUES
(1, 0, 15505199845, '1', 326930923, 'Development Place (1)', 0);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `discord_id` varchar(500) NOT NULL,
  `discord_nickname` text NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rank` int(11) NOT NULL DEFAULT 0,
  `prefix` varchar(25) NOT NULL DEFAULT '.',
  `server` varchar(255) NOT NULL,
  `place_id` int(11) NOT NULL,
  `verified` enum('0','1') NOT NULL DEFAULT '0',
  `roblox_verified` enum('0','1') NOT NULL DEFAULT '0',
  `alpha_tester` enum('0','1') NOT NULL DEFAULT '0',
  `override_gamepass` enum('0','1') NOT NULL DEFAULT '0',
  `extra_data` varchar(1000) NOT NULL DEFAULT '{}',
  `discord_data` varchar(1000) NOT NULL DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `user_id`, `discord_id`, `discord_nickname`, `join_date`, `rank`, `prefix`, `server`, `place_id`, `verified`, `roblox_verified`, `alpha_tester`, `override_gamepass`, `extra_data`, `discord_data`) VALUES
(1, 326930923, '0', '0', '2024-01-19 01:24:00', 5, '', '', 0, '1', '1', '1', '1', '', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `prior_bans`
--

CREATE TABLE `prior_bans` (
  `prior_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `purch_amt` int(11) NOT NULL,
  `place_id` int(11) NOT NULL DEFAULT 1679056195,
  `notes` varchar(255) NOT NULL DEFAULT 'None',
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `reporter` text NOT NULL,
  `reporter_name` varchar(1000) NOT NULL,
  `reportee` text NOT NULL,
  `description` text NOT NULL,
  `proof` text NOT NULL,
  `notes` varchar(10000) NOT NULL DEFAULT '[]',
  `resolved` enum('0','1') NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `resolver` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `server_number` int(100) NOT NULL,
  `place_id` int(11) NOT NULL,
  `job_id` varchar(255) NOT NULL,
  `player_count` int(11) NOT NULL,
  `max_players` int(11) NOT NULL,
  `send_msg` text NOT NULL,
  `shutting_down` set('0','1') NOT NULL DEFAULT '0',
  `shutdown_msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skid_tracker`
--

CREATE TABLE `skid_tracker` (
  `id` int(11) NOT NULL,
  `ip` text NOT NULL,
  `user_agent` text NOT NULL,
  `happened` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_applications`
--

CREATE TABLE `staff_applications` (
  `id` int(11) NOT NULL,
  `discord_id` varchar(500) NOT NULL,
  `position` enum('1','2') NOT NULL DEFAULT '1',
  `why` text NOT NULL,
  `what` text NOT NULL,
  `extra` text NOT NULL,
  `accepted` enum('-1','0','1') NOT NULL DEFAULT '0',
  `decided` set('0','1') NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `discord_id` varchar(500) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `token` varchar(500) NOT NULL,
  `user_roblox_uid` int(11) NOT NULL,
  `access_token` varchar(500) NOT NULL,
  `oauth` varchar(1000) NOT NULL DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warns`
--

CREATE TABLE `warns` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `accepted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `command_logs`
--
ALTER TABLE `command_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `discord_logs`
--
ALTER TABLE `discord_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `place_settings`
--
ALTER TABLE `place_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `discord_id` (`discord_id`);

--
-- Indexes for table `prior_bans`
--
ALTER TABLE `prior_bans`
  ADD PRIMARY KEY (`prior_id`),
  ADD UNIQUE KEY `p_id` (`user_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`server_number`);

--
-- Indexes for table `skid_tracker`
--
ALTER TABLE `skid_tracker`
  ADD KEY `id` (`id`);

--
-- Indexes for table `staff_applications`
--
ALTER TABLE `staff_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `discord_id` (`discord_id`),
  ADD UNIQUE KEY `discord_id_3` (`discord_id`),
  ADD KEY `discord_id_2` (`discord_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `discord_id` (`discord_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD UNIQUE KEY `user_roblox_uid_2` (`user_roblox_uid`),
  ADD KEY `user_roblox_uid` (`user_roblox_uid`);

--
-- Indexes for table `warns`
--
ALTER TABLE `warns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `command_logs`
--
ALTER TABLE `command_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10732;

--
-- AUTO_INCREMENT for table `discord_logs`
--
ALTER TABLE `discord_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `place_settings`
--
ALTER TABLE `place_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148223;

--
-- AUTO_INCREMENT for table `prior_bans`
--
ALTER TABLE `prior_bans`
  MODIFY `prior_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=527;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `server_number` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `skid_tracker`
--
ALTER TABLE `skid_tracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_applications`
--
ALTER TABLE `staff_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warns`
--
ALTER TABLE `warns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `command_logs`
--
ALTER TABLE `command_logs`
  ADD CONSTRAINT `cmd_logs-players` FOREIGN KEY (`user_id`) REFERENCES `players` (`user_id`);

--
-- Constraints for table `prior_bans`
--
ALTER TABLE `prior_bans`
  ADD CONSTRAINT `robloxid_priorban` FOREIGN KEY (`user_id`) REFERENCES `players` (`user_id`);

--
-- Constraints for table `staff_applications`
--
ALTER TABLE `staff_applications`
  ADD CONSTRAINT `staff_app-players` FOREIGN KEY (`discord_id`) REFERENCES `players` (`discord_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users-players` FOREIGN KEY (`user_roblox_uid`) REFERENCES `players` (`user_id`);

--
-- Constraints for table `warns`
--
ALTER TABLE `warns`
  ADD CONSTRAINT `robloxid_warn` FOREIGN KEY (`user_id`) REFERENCES `players` (`user_id`),
  ADD CONSTRAINT `robloxid_warn_staff` FOREIGN KEY (`staff_id`) REFERENCES `players` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
