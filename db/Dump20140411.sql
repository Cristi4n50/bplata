CREATE DATABASE  IF NOT EXISTS `bfxdev` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `bfxdev`;
-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bfxdev
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.10.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `crypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preferences` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'paulo','carmona ','admin','pcarmonaz@hotmail.com',1,'26b5c02d6786-9b245cb07973','0876c8154258a7cd4d99e3e45fc4b720328530ea','484fe5c783297770cbea68302b1bf4ba40a27246','---\n:locale: en\n','2014-03-12 15:02:12','2014-03-12 15:37:45');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nonce` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `associates`
--

DROP TABLE IF EXISTS `associates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `associates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `part` decimal(8,4) DEFAULT NULL,
  `prefcurrency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefwallet` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monitor` int(11) DEFAULT NULL,
  `associate` int(11) DEFAULT NULL,
  `accountant` int(11) DEFAULT NULL,
  `support` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associates`
--

LOCK TABLES `associates` WRITE;
/*!40000 ALTER TABLE `associates` DISABLE KEYS */;
/*!40000 ALTER TABLE `associates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autolends`
--

DROP TABLE IF EXISTS `autolends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autolends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `rate` decimal(16,10) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insure` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autolends`
--

LOCK TABLES `autolends` WRITE;
/*!40000 ALTER TABLE `autolends` DISABLE KEYS */;
/*!40000 ALTER TABLE `autolends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_accounts`
--

DROP TABLE IF EXISTS `bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `swift` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_accounts`
--

LOCK TABLES `bank_accounts` WRITE;
/*!40000 ALTER TABLE `bank_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitcoin_addresses`
--

DROP TABLE IF EXISTS `bitcoin_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitcoin_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitcoin_addresses`
--

LOCK TABLES `bitcoin_addresses` WRITE;
/*!40000 ALTER TABLE `bitcoin_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitcoin_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitcoin_transactions`
--

DROP TABLE IF EXISTS `bitcoin_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitcoin_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(40,8) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `confirmations` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitcoin_transactions`
--

LOCK TABLES `bitcoin_transactions` WRITE;
/*!40000 ALTER TABLE `bitcoin_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitcoin_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candlesticks`
--

DROP TABLE IF EXISTS `candlesticks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candlesticks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pair` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `open` decimal(16,8) DEFAULT NULL,
  `close` decimal(16,8) DEFAULT NULL,
  `highest` decimal(16,8) DEFAULT NULL,
  `lowest` decimal(16,8) DEFAULT NULL,
  `volume` decimal(40,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candlesticks`
--

LOCK TABLES `candlesticks` WRITE;
/*!40000 ALTER TABLE `candlesticks` DISABLE KEYS */;
/*!40000 ALTER TABLE `candlesticks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capitals`
--

DROP TABLE IF EXISTS `capitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capitals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` decimal(40,8) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capitals`
--

LOCK TABLES `capitals` WRITE;
/*!40000 ALTER TABLE `capitals` DISABLE KEYS */;
/*!40000 ALTER TABLE `capitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_applications`
--

DROP TABLE IF EXISTS `client_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `support_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `callback_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_client_applications_on_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_applications`
--

LOCK TABLES `client_applications` WRITE;
/*!40000 ALTER TABLE `client_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliances`
--

DROP TABLE IF EXISTS `compliances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compliances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_expiration_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliances`
--

LOCK TABLES `compliances` WRITE;
/*!40000 ALTER TABLE `compliances` DISABLE KEYS */;
/*!40000 ALTER TABLE `compliances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counterorders`
--

DROP TABLE IF EXISTS `counterorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counterorders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(40,8) DEFAULT NULL,
  `remainingamount` decimal(40,8) DEFAULT NULL,
  `price` decimal(16,8) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counterorders`
--

LOCK TABLES `counterorders` WRITE;
/*!40000 ALTER TABLE `counterorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `counterorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credits`
--

DROP TABLE IF EXISTS `credits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(40,8) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `rate` decimal(30,20) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `renew` tinyint(1) DEFAULT NULL,
  `notify` int(11) DEFAULT '0',
  `insured` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credits`
--

LOCK TABLES `credits` WRITE;
/*!40000 ALTER TABLE `credits` DISABLE KEYS */;
/*!40000 ALTER TABLE `credits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dailyprofits`
--

DROP TABLE IF EXISTS `dailyprofits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dailyprofits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(40,8) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `profit_system` decimal(40,8) DEFAULT NULL,
  `profit_calculated` decimal(40,8) DEFAULT NULL,
  `spread_pl` decimal(40,8) DEFAULT NULL,
  `total_curr_assets` decimal(40,8) DEFAULT NULL,
  `surplus` decimal(40,8) DEFAULT NULL,
  `total_assets` decimal(40,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dailyprofits`
--

LOCK TABLES `dailyprofits` WRITE;
/*!40000 ALTER TABLE `dailyprofits` DISABLE KEYS */;
/*!40000 ALTER TABLE `dailyprofits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(40,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egopay_transactions`
--

DROP TABLE IF EXISTS `egopay_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egopay_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(30,8) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fee` decimal(20,8) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egopay_transactions`
--

LOCK TABLES `egopay_transactions` WRITE;
/*!40000 ALTER TABLE `egopay_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `egopay_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` decimal(20,14) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledger_entries`
--

DROP TABLE IF EXISTS `ledger_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ledger_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(40,8) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` decimal(40,8) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledger_entries`
--

LOCK TABLES `ledger_entries` WRITE;
/*!40000 ALTER TABLE `ledger_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ledger_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litecoin_addresses`
--

DROP TABLE IF EXISTS `litecoin_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litecoin_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litecoin_addresses`
--

LOCK TABLES `litecoin_addresses` WRITE;
/*!40000 ALTER TABLE `litecoin_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `litecoin_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litecoin_transactions`
--

DROP TABLE IF EXISTS `litecoin_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litecoin_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(40,8) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `confirmations` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litecoin_transactions`
--

LOCK TABLES `litecoin_transactions` WRITE;
/*!40000 ALTER TABLE `litecoin_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `litecoin_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(30,20) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `rate` decimal(30,20) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `lender_id` int(11) DEFAULT NULL,
  `loaner_id` int(11) DEFAULT NULL,
  `renew` tinyint(1) DEFAULT NULL,
  `notify` int(11) DEFAULT '0',
  `insured` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_makers`
--

DROP TABLE IF EXISTS `market_makers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_makers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pricedistance` decimal(10,8) DEFAULT NULL,
  `amount_insured` decimal(40,8) DEFAULT NULL,
  `ref_currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_makers`
--

LOCK TABLES `market_makers` WRITE;
/*!40000 ALTER TABLE `market_makers` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_makers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_nonces`
--

DROP TABLE IF EXISTS `oauth_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_nonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nonce` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_nonces_on_nonce_and_timestamp` (`nonce`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_nonces`
--

LOCK TABLES `oauth_nonces` WRITE;
/*!40000 ALTER TABLE `oauth_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_tokens`
--

DROP TABLE IF EXISTS `oauth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_application_id` int(11) DEFAULT NULL,
  `token` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `callback_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verifier` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorized_at` datetime DEFAULT NULL,
  `invalidated_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_tokens_on_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_tokens`
--

LOCK TABLES `oauth_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(40,8) DEFAULT NULL,
  `originalamount` decimal(40,8) DEFAULT NULL,
  `offertype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `rate` decimal(30,20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `notify` tinyint(1) DEFAULT '0',
  `renew` tinyint(1) DEFAULT '0',
  `insure` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers_histories`
--

DROP TABLE IF EXISTS `offers_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(40,8) DEFAULT NULL,
  `originalamount` decimal(40,8) DEFAULT NULL,
  `offertype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `rate` decimal(30,20) DEFAULT NULL,
  `notify` tinyint(1) DEFAULT '0',
  `renew` tinyint(1) DEFAULT '0',
  `insure` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_offers_histories_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers_histories`
--

LOCK TABLES `offers_histories` WRITE;
/*!40000 ALTER TABLE `offers_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers_migrates`
--

DROP TABLE IF EXISTS `offers_migrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers_migrates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(40,8) DEFAULT NULL,
  `originalamount` decimal(40,8) DEFAULT NULL,
  `offertype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `rate` decimal(30,20) DEFAULT NULL,
  `notify` tinyint(1) DEFAULT '0',
  `renew` tinyint(1) DEFAULT '0',
  `insure` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers_migrates`
--

LOCK TABLES `offers_migrates` WRITE;
/*!40000 ALTER TABLE `offers_migrates` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers_migrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pair` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notify` int(11) DEFAULT '0',
  `amount` decimal(40,8) DEFAULT NULL,
  `price` decimal(16,8) DEFAULT NULL,
  `originalamount` decimal(40,8) DEFAULT NULL,
  `routing` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `lockedperiod` int(11) DEFAULT NULL,
  `trailingprice` decimal(8,4) DEFAULT '0.0000',
  `hidden` tinyint(1) DEFAULT '0',
  `vir` int(11) DEFAULT '1',
  `maxrate` decimal(30,20) DEFAULT '0.00000000000000000000',
  `placed_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `placed_trades` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nopayback` int(11) DEFAULT NULL,
  `avg_price` decimal(40,20) DEFAULT '0.00000000000000000000',
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_histories`
--

DROP TABLE IF EXISTS `orders_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pair` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notify` int(11) DEFAULT '0',
  `amount` decimal(40,8) DEFAULT NULL,
  `price` decimal(16,8) DEFAULT NULL,
  `originalamount` decimal(40,8) DEFAULT NULL,
  `routing` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `trailingprice` decimal(8,4) DEFAULT '0.0000',
  `hidden` tinyint(1) DEFAULT '0',
  `vir` int(11) DEFAULT '1',
  `maxrate` decimal(30,20) DEFAULT '0.00000000000000000000',
  `avg_price` decimal(40,20) DEFAULT '0.00000000000000000000',
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_orders_histories_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_histories`
--

LOCK TABLES `orders_histories` WRITE;
/*!40000 ALTER TABLE `orders_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_migrates`
--

DROP TABLE IF EXISTS `orders_migrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_migrates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pair` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notify` int(11) DEFAULT '0',
  `amount` decimal(40,8) DEFAULT NULL,
  `price` decimal(16,8) DEFAULT NULL,
  `originalamount` decimal(40,8) DEFAULT NULL,
  `routing` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `trailingprice` decimal(8,4) DEFAULT '0.0000',
  `hidden` tinyint(1) DEFAULT '0',
  `vir` int(11) DEFAULT '1',
  `maxrate` decimal(30,20) DEFAULT '0.00000000000000000000',
  `avg_price` decimal(40,20) DEFAULT '0.00000000000000000000',
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_migrates`
--

LOCK TABLES `orders_migrates` WRITE;
/*!40000 ALTER TABLE `orders_migrates` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_migrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pair` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `amount` decimal(40,8) DEFAULT NULL,
  `base` decimal(40,8) DEFAULT NULL,
  `swap` decimal(40,8) DEFAULT '0.00000000',
  `noliquidation` int(11) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `vir` int(11) DEFAULT NULL,
  `maxrate` decimal(30,20) DEFAULT '0.00000000000000000000',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `permalink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_published` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referrals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `representative_id` int(11) DEFAULT NULL,
  `referee_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `earned_seven_days` decimal(40,8) DEFAULT NULL,
  `earned_thirty_days` decimal(40,8) DEFAULT NULL,
  `earned_total` decimal(40,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrals`
--

LOCK TABLES `referrals` WRITE;
/*!40000 ALTER TABLE `referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `representatives`
--

DROP TABLE IF EXISTS `representatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `representatives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `referrer_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `representatives`
--

LOCK TABLES `representatives` WRITE;
/*!40000 ALTER TABLE `representatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `representatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20110905100732'),('20110905154520'),('20110905174243'),('20110905175627'),('20110905180349'),('20110905180414'),('20110907065331'),('20110907130814'),('20110907154238'),('20110907161459'),('20110908071109'),('20110910065912'),('20110910182641'),('20110911212045'),('20110917181412'),('20110917181726'),('20110917182704'),('20110917192757'),('20111113134321'),('20111115004827'),('20111130094928'),('20120113060757'),('20120113090355'),('20120113091254'),('20120123125135'),('20120123125923'),('20120213033130'),('20120213094539'),('20120213094623'),('20120217070755'),('20120217071025'),('20120217135022'),('20120217135302'),('20120218042541'),('20120421002643'),('20121102065912'),('20121105065912'),('20121107065912'),('20121109065912'),('20121116094539'),('20121118103612'),('20121118212203'),('20121118212222'),('20121118212301'),('20121118212316'),('20121119183613'),('20121122111216'),('20121122184745'),('20121122184888'),('20121123204247'),('20121125164816'),('20121125171406'),('20121125171504'),('20121126184459'),('20121130085746'),('20121130091323'),('20121204091323'),('20121206084237'),('20121206124559'),('20121206130458'),('20121206224153'),('20121206232529'),('20121208121411'),('20121210184101'),('20121210184445'),('20121211085021'),('20121212142235'),('20121217083236'),('20121219093535'),('20121226224510'),('20121227131036'),('20130103184334'),('20130112130643'),('20130118082601'),('20130118082754'),('20130122082439'),('20130124182810'),('20130129084813'),('20130131182251'),('20130131182818'),('20130131183110'),('20130131183202'),('20130131185505'),('20130204183019'),('20130207185025'),('20130213102505'),('20130219073932'),('20130221073401'),('20130221073505'),('20130301073151'),('20130306124628'),('20130313080121'),('20130313080355'),('20130313080457'),('20130314072854'),('20130314073359'),('20130314074647'),('20130314074704'),('20130321173055'),('20130322155604'),('20130327165755'),('20130402063100'),('20130405063816'),('20130406165355'),('20130406170227'),('20130408163754'),('20130410160917'),('20130412090938'),('20130423062723'),('20130429200800'),('20130502162938'),('20130503103439'),('20130503105142'),('20130504120356'),('20130504120510'),('20130504120528'),('20130504164050'),('20130507085147'),('20130510092204'),('20130510092356'),('20130516201729'),('20130518190920'),('20130522065702'),('20130522065801'),('20130522065901'),('20130528065958'),('20130528070327'),('20130620100915'),('20130627151821'),('20130630105119'),('20130702093601'),('20130724080753'),('20130806113005'),('20130810140254'),('20130818142634'),('20130820115921'),('20131005135853'),('20131012132229'),('20131025093313'),('20131025094034'),('20131105122021'),('20131107133338'),('20131216191437'),('20131217183146'),('20140120121324'),('20140122120122'),('20140122120208'),('20140124120556'),('20140124120613'),('20140124130222'),('20140128010032'),('20140214215844'),('20140214215928'),('20140304092434'),('20140304092453'),('20140305212218'),('20140305212237'),('20140305212256'),('20140306134840'),('20140306134859'),('20140306134917'),('20140306134949'),('20140306135005'),('20140306135028');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'mtgox_fees','0.004','2014-03-06 21:16:50','2014-03-06 21:16:50'),(2,'base_interest','0.1','2014-03-06 21:16:50','2014-03-06 21:16:50'),(3,'bfx_fees','0.001','2014-03-06 21:16:50','2014-03-06 21:16:50'),(4,'bitstamp_fees','0.004','2014-03-06 21:16:50','2014-03-06 21:16:50'),(5,'antispamfee','0.001','2014-03-06 21:16:50','2014-03-06 21:16:50'),(6,'minhiddenorder','500','2014-03-06 21:16:50','2014-03-06 21:16:50'),(7,'hiddenorder_fee','0.1','2014-03-06 21:16:50','2014-03-06 21:16:50'),(8,'minlendingperiod','7','2014-03-06 21:16:50','2014-03-06 21:16:50'),(9,'wirewithdrawal_fees','30','2014-03-06 21:16:50','2014-03-06 21:16:50'),(10,'btcwithdrawal_fees','0','2014-03-06 21:16:50','2014-03-06 21:16:50'),(11,'rebalance_mode','1','2014-03-06 21:16:50','2014-03-06 21:16:50'),(12,'lag_limit','250','2014-03-06 21:16:50','2014-03-06 21:16:50');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `value` decimal(40,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickers`
--

DROP TABLE IF EXISTS `tickers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pair` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `buying` decimal(16,8) DEFAULT NULL,
  `selling` decimal(16,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickers`
--

LOCK TABLES `tickers` WRITE;
/*!40000 ALTER TABLE `tickers` DISABLE KEYS */;
INSERT INTO `tickers` VALUES (1,'BTCUSD','2014-03-12 10:08:00','2014-03-12 10:08:00',650.00000000,660.00000000),(2,'LTCUSD','2014-03-12 10:09:00','2014-03-12 10:09:00',651.00000000,661.00000000),(3,'LTCBTC','2014-03-12 10:10:00','2014-03-12 10:10:00',652.00000000,662.00000000);
/*!40000 ALTER TABLE `tickers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trades`
--

DROP TABLE IF EXISTS `trades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `response` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `amount` decimal(40,8) DEFAULT NULL,
  `price` decimal(16,8) DEFAULT NULL,
  `platform` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `pair` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'BTCUSD',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trades`
--

LOCK TABLES `trades` WRITE;
/*!40000 ALTER TABLE `trades` DISABLE KEYS */;
/*!40000 ALTER TABLE `trades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otp_enabled` int(11) DEFAULT NULL,
  `notify_withdrawal` int(11) DEFAULT '1',
  `notify_deposit` int(11) DEFAULT '1',
  `agreed_tos` int(11) DEFAULT NULL,
  `prefcurrency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `margin_requirement` decimal(16,8) DEFAULT NULL,
  `leverage` decimal(16,8) DEFAULT NULL,
  `overdraft_limit` decimal(16,8) DEFAULT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'deposit',
  `lastip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currentip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locktocken` int(11) DEFAULT NULL,
  `verified` int(11) DEFAULT NULL,
  `no_withdraw` int(11) DEFAULT NULL,
  `dest_tag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'pollcaz','pcarmonaz@hotmail.com','$2a$10$ndMuRo7W91yovxONY/mqzuwcQSRn/yqUYDl0GvXxoeklDGrZlTwFi','$2a$10$ndMuRo7W91yovxONY/mqzu','2014-03-07 22:16:33','2014-03-26 16:32:28','Bogota','hcnih6jhqttypnr5',NULL,1,1,1,'USD',0.10000000,2.50000000,NULL,'trader',NULL,NULL,5665,NULL,NULL,NULL),(2,'andres','pcarmona@misena.edu.co','$2a$10$wAyHMr06qIAa17WolAwQOOIgOsJEY6Qp.5j4itbubvkDLDtqhHBwS','$2a$10$wAyHMr06qIAa17WolAwQOO','2014-03-22 00:02:33','2014-03-22 00:02:33','Bogota',NULL,NULL,1,1,1,'USD',0.10000000,2.50000000,NULL,'deposit',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variableinterests`
--

DROP TABLE IF EXISTS `variableinterests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variableinterests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` decimal(30,20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `amount` decimal(40,8) DEFAULT NULL,
  `avgperiod` decimal(40,8) DEFAULT NULL,
  `annual_volatility` decimal(30,20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variableinterests`
--

LOCK TABLES `variableinterests` WRITE;
/*!40000 ALTER TABLE `variableinterests` DISABLE KEYS */;
/*!40000 ALTER TABLE `variableinterests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `walletbalances`
--

DROP TABLE IF EXISTS `walletbalances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `walletbalances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wallet_id` int(11) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` decimal(40,8) DEFAULT '0.00000000',
  `unsettled_interest` decimal(40,8) DEFAULT '0.00000000',
  PRIMARY KEY (`id`),
  KEY `wallet_id` (`wallet_id`,`currency`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `walletbalances`
--

LOCK TABLES `walletbalances` WRITE;
/*!40000 ALTER TABLE `walletbalances` DISABLE KEYS */;
INSERT INTO `walletbalances` VALUES (1,1,'USD',0.00000000,0.00000000),(2,1,'BTC',0.00000000,0.00000000),(3,2,'USD',0.00000000,0.00000000),(4,2,'BTC',0.00000000,0.00000000),(5,3,'USD',0.00000000,0.00000000),(6,3,'BTC',0.00000000,0.00000000),(7,4,'USD',0.00000000,0.00000000),(8,4,'BTC',0.00000000,0.00000000);
/*!40000 ALTER TABLE `walletbalances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wallettype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES (1,'trading',1,'trading'),(2,'deposit',1,'deposit'),(3,'exchange',1,'exchange'),(4,'deposit',2,'deposit');
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawal_methods`
--

DROP TABLE IF EXISTS `withdrawal_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdrawal_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `benef_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `benef_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `benef_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `benef_country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `benef_acc_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `benef_bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `benef_bank_add` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `benef_bank_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `benef_bank_country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `benef_bank_swift` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inter_bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inter_bank_add` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inter_bank_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inter_bank_country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inter_bank_account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inter_bank_swift` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawal_methods`
--

LOCK TABLES `withdrawal_methods` WRITE;
/*!40000 ALTER TABLE `withdrawal_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdrawal_methods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-11 14:02:00
