-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2014 at 02:47 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `broadleaf`
--

-- --------------------------------------------------------

--
-- Table structure for table `blc_additional_offer_info`
--

CREATE TABLE IF NOT EXISTS `blc_additional_offer_info` (
  `BLC_ORDER_ORDER_ID` bigint(20) NOT NULL,
  `OFFER_INFO_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`BLC_ORDER_ORDER_ID`,`OFFER_ID`),
  KEY `FK3BFDBD63B5D9C34D` (`OFFER_INFO_ID`),
  KEY `FK3BFDBD63D5F3FAF4` (`OFFER_ID`),
  KEY `FK3BFDBD631891FF79` (`BLC_ORDER_ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_address`
--

CREATE TABLE IF NOT EXISTS `blc_address` (
  `ADDRESS_ID` bigint(20) NOT NULL,
  `ADDRESS_LINE1` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `ADDRESS_LINE2` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ADDRESS_LINE3` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CITY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `COUNTY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FAX` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FIRST_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `IS_BUSINESS` tinyint(1) DEFAULT NULL,
  `IS_DEFAULT` tinyint(1) DEFAULT NULL,
  `LAST_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `POSTAL_CODE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `PRIMARY_PHONE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SECONDARY_PHONE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `STANDARDIZED` tinyint(1) DEFAULT NULL,
  `TOKENIZED_ADDRESS` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `VERIFICATION_LEVEL` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ZIP_FOUR` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `COUNTRY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `PHONE_FAX_ID` bigint(20) DEFAULT NULL,
  `PHONE_PRIMARY_ID` bigint(20) DEFAULT NULL,
  `PHONE_SECONDARY_ID` bigint(20) DEFAULT NULL,
  `STATE_PROV_REGION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `ADDRESS_COUNTRY_INDEX` (`COUNTRY`),
  KEY `ADDRESS_PHONE_FAX_IDX` (`PHONE_FAX_ID`),
  KEY `ADDRESS_PHONE_PRI_IDX` (`PHONE_PRIMARY_ID`),
  KEY `ADDRESS_PHONE_SEC_IDX` (`PHONE_SECONDARY_ID`),
  KEY `ADDRESS_STATE_INDEX` (`STATE_PROV_REGION`),
  KEY `FK299F86CEA46E16CF` (`COUNTRY`),
  KEY `FK299F86CEF1A6533F` (`PHONE_FAX_ID`),
  KEY `FK299F86CEBF4449BA` (`PHONE_PRIMARY_ID`),
  KEY `FK299F86CEE12DC0C8` (`PHONE_SECONDARY_ID`),
  KEY `FK299F86CE337C4D50` (`STATE_PROV_REGION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_admin_module`
--

CREATE TABLE IF NOT EXISTS `blc_admin_module` (
  `ADMIN_MODULE_ID` bigint(20) NOT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `ICON` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `MODULE_KEY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`ADMIN_MODULE_ID`),
  KEY `ADMINMODULE_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_admin_module`
--

INSERT INTO `blc_admin_module` (`ADMIN_MODULE_ID`, `DISPLAY_ORDER`, `ICON`, `MODULE_KEY`, `NAME`) VALUES
(-7, 500, 'icon-refresh', 'BLCWorkflow', 'Site Updates'),
(-6, 400, 'icon-picture', 'BLCDesign', 'Design'),
(-5, 700, 'icon-gear', 'BLCModuleConfiguration', 'Settings'),
(-4, 600, 'icon-user', 'BLCOpenAdmin', 'Security'),
(-3, 300, 'icon-heart', 'BLCCustomerCare', 'Customer Care'),
(-2, 200, 'icon-file', 'BLCContentManagement', 'Content'),
(-1, 100, 'icon-barcode', 'BLCMerchandising', 'Catalog');

-- --------------------------------------------------------

--
-- Table structure for table `blc_admin_password_token`
--

CREATE TABLE IF NOT EXISTS `blc_admin_password_token` (
  `PASSWORD_TOKEN` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `TOKEN_USED_DATE` datetime DEFAULT NULL,
  `TOKEN_USED_FLAG` tinyint(1) NOT NULL,
  PRIMARY KEY (`PASSWORD_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_admin_permission`
--

CREATE TABLE IF NOT EXISTS `blc_admin_permission` (
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `IS_FRIENDLY` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `PERMISSION_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_admin_permission`
--

INSERT INTO `blc_admin_permission` (`ADMIN_PERMISSION_ID`, `DESCRIPTION`, `IS_FRIENDLY`, `NAME`, `PERMISSION_TYPE`) VALUES
(-201, 'Read Structured Content Template', 0, 'PERMISSION_READ_STRUCTURED_CONTENT_TEMPLATE', 'READ'),
(-200, 'Read Page Template', 0, 'PERMISSION_READ_PAGE_TEMPLATE', 'READ'),
(-151, 'Maintain Permissions', 1, 'PERMISSION_PERM_ALL', 'ALL'),
(-150, 'View Permissions', 1, 'PERMISSION_PERM_VIEW', 'READ'),
(-141, 'Maintain Roles', 1, 'PERMISSION_ROLE_ALL', 'ALL'),
(-140, 'View Roles', 1, 'PERMISSION_ROLE_VIEW', 'READ'),
(-131, 'Maintain Translations', 1, 'PERMISSION_TRANSLATION', 'ALL'),
(-130, 'View Translations', 1, 'PERMISSION_TRANSLATION', 'READ'),
(-127, 'Maintain Module Configurations', 1, 'PERMISSION_MODULECONFIGURATION', 'ALL'),
(-126, 'View Module Configurations', 1, 'PERMISSION_MODULECONFIGURATION', 'READ'),
(-123, 'Maintain System Properties', 1, 'PERMISSION_SYSTEMPROPERTY', 'ALL'),
(-122, 'View System Properties', 1, 'PERMISSION_SYSTEMPROPERTY', 'READ'),
(-121, 'Maintain Users', 1, 'PERMISSION_USER', 'ALL'),
(-120, 'View Users', 1, 'PERMISSION_USER', 'READ'),
(-119, 'Maintain Customers', 1, 'PERMISSION_CUSTOMER', 'ALL'),
(-118, 'View Customers', 1, 'PERMISSION_CUSTOMER', 'READ'),
(-117, 'Maintain Orders', 1, 'PERMISSION_ORDER', 'ALL'),
(-116, 'View Orders', 1, 'PERMISSION_ORDER', 'READ'),
(-115, 'Maintain URL Redirects', 1, 'PERMISSION_URLREDIRECT', 'ALL'),
(-114, 'View URL Redirects', 1, 'PERMISSION_URLREDIRECT', 'READ'),
(-113, 'Maintain Structured Contents', 1, 'PERMISSION_STRUCTUREDCONTENT', 'ALL'),
(-112, 'View Structured Contents', 1, 'PERMISSION_STRUCTUREDCONTENT', 'READ'),
(-111, 'Maintain Assets', 1, 'PERMISSION_ASSET', 'ALL'),
(-110, 'View Assets', 1, 'PERMISSION_ASSET', 'READ'),
(-109, 'Maintain Pages', 1, 'PERMISSION_PAGE', 'ALL'),
(-108, 'View Pages', 1, 'PERMISSION_PAGE', 'READ'),
(-107, 'Maintain Offers', 1, 'PERMISSION_OFFER', 'ALL'),
(-106, 'View Offers', 1, 'PERMISSION_OFFER', 'READ'),
(-105, 'Maintain Product Options', 1, 'PERMISSION_PRODUCTOPTIONS', 'ALL'),
(-104, 'View Product Options', 1, 'PERMISSION_PRODUCTOPTIONS', 'READ'),
(-103, 'Maintain Products', 1, 'PERMISSION_PRODUCT', 'ALL'),
(-102, 'View Products', 1, 'PERMISSION_PRODUCT', 'READ'),
(-101, 'Maintain Categories', 1, 'PERMISSION_CATEGORY', 'ALL'),
(-100, 'View Categories', 1, 'PERMISSION_CATEGORY', 'READ'),
(-51, 'All Catalog Permissions', 0, 'PERMISSION_ALL_CATALOG_PERMS', 'ALL'),
(-50, 'Read Catalog Permissions', 0, 'PERMISSION_READ_CATALOG_PERMS', 'READ'),
(-49, 'All Admin Permissions', 0, 'PERMISSION_ALL_ADMIN_PERMS', 'ALL'),
(-48, 'Read Admin Permissions', 0, 'PERMISSION_READ_ADMIN_PERMS', 'READ'),
(-47, 'All Admin Roles', 0, 'PERMISSION_ALL_ADMIN_ROLES', 'ALL'),
(-46, 'Read Admin Roles', 0, 'PERMISSION_READ_ADMIN_ROLES', 'READ'),
(-45, 'All System Property', 0, 'PERMISSION_ALL_SYSTEM_PROPERTY', 'ALL'),
(-44, 'Read System Property', 0, 'PERMISSION_READ_SYSTEM_PROPERTY', 'READ'),
(-43, 'All Site Map Gen Configuration', 0, 'PERMISSION_ALL_SITE_MAP_GEN_CONFIG', 'ALL'),
(-42, 'Read Site Map Gen Configuration', 0, 'PERMISSION_READ_SITE_MAP_GEN_CONFIG', 'READ'),
(-41, 'All Translation', 0, 'PERMISSION_ALL_TRANSLATION', 'ALL'),
(-40, 'Read Translation', 0, 'PERMISSION_READ_TRANSLATION', 'READ'),
(-39, 'All Enumeration', 0, 'PERMISSION_ALL_ENUMERATION', 'ALL'),
(-38, 'Read Enumeration', 0, 'PERMISSION_READ_ENUMERATION', 'READ'),
(-37, 'All Configuration', 0, 'PERMISSION_ALL_MODULECONFIGURATION', 'ALL'),
(-36, 'Read Configuration', 0, 'PERMISSION_READ_MODULECONFIGURATION', 'READ'),
(-35, 'All Currency', 0, 'PERMISSION_ALL_CURRENCY', 'ALL'),
(-34, 'Read Currency', 0, 'PERMISSION_READ_CURRENCY', 'READ'),
(-33, 'All SearchFacet', 0, 'PERMISSION_ALL_SEARCHFACET', 'ALL'),
(-32, 'Read SearchFacet', 0, 'PERMISSION_READ_SEARCHFACET', 'READ'),
(-31, 'All SearchRedirect', 0, 'PERMISSION_ALL_SEARCHREDIRECT', 'ALL'),
(-30, 'Read SearchRedirect', 0, 'PERMISSION_READ_SEARCHREDIRECT', 'READ'),
(-29, 'All URLHandler', 0, 'PERMISSION_ALL_URLHANDLER', 'ALL'),
(-28, 'Read URLHandler', 0, 'PERMISSION_READ_URLHANDLER', 'READ'),
(-27, 'All Admin User', 0, 'PERMISSION_ALL_ADMIN_USER', 'ALL'),
(-26, 'Read Admin User', 0, 'PERMISSION_READ_ADMIN_USER', 'READ'),
(-25, 'All Structured Content', 0, 'PERMISSION_ALL_STRUCTURED_CONTENT', 'ALL'),
(-24, 'Read Structured Content', 0, 'PERMISSION_READ_STRUCTURED_CONTENT', 'READ'),
(-23, 'All Asset', 0, 'PERMISSION_ALL_ASSET', 'ALL'),
(-22, 'Read Asset', 0, 'PERMISSION_READ_ASSET', 'READ'),
(-21, 'All Page', 0, 'PERMISSION_ALL_PAGE', 'ALL'),
(-20, 'Read Page', 0, 'PERMISSION_READ_PAGE', 'READ'),
(-19, 'All Customer', 0, 'PERMISSION_ALL_CUSTOMER', 'ALL'),
(-18, 'Read Customer', 0, 'PERMISSION_READ_CUSTOMER', 'READ'),
(-17, 'All Order Item', 0, 'PERMISSION_ALL_ORDER_ITEM', 'ALL'),
(-16, 'Read Order Item', 0, 'PERMISSION_READ_ORDER_ITEM', 'READ'),
(-15, 'All Fulfillment Group', 0, 'PERMISSION_ALL_FULFILLMENT_GROUP', 'ALL'),
(-14, 'Read Fulfillment Group', 0, 'PERMISSION_READ_FULFILLMENT_GROUP', 'READ'),
(-13, 'All Order', 0, 'PERMISSION_ALL_ORDER', 'ALL'),
(-12, 'Read Order', 0, 'PERMISSION_READ_ORDER', 'READ'),
(-11, 'All Promotion', 0, 'PERMISSION_ALL_PROMOTION', 'ALL'),
(-10, 'Read Promotion', 0, 'PERMISSION_READ_PROMOTION', 'READ'),
(-9, 'All Sku', 0, 'PERMISSION_ALL_SKU', 'ALL'),
(-8, 'Read Sku', 0, 'PERMISSION_READ_SKU', 'READ'),
(-7, 'All Product Option', 0, 'PERMISSION_ALL_PRODUCT_OPTION', 'ALL'),
(-6, 'Read Product Option', 0, 'PERMISSION_READ_PRODUCT_OPTION', 'READ'),
(-5, 'All Product', 0, 'PERMISSION_ALL_PRODUCT', 'ALL'),
(-4, 'Read Product', 0, 'PERMISSION_READ_PRODUCT', 'READ'),
(-3, 'All Category', 0, 'PERMISSION_ALL_CATEGORY', 'ALL'),
(-2, 'Read Category', 0, 'PERMISSION_READ_CATEGORY', 'READ'),
(-1, 'Default Permission', 0, 'PERMISSION_OTHER_DEFAULT', 'OTHER');

-- --------------------------------------------------------

--
-- Table structure for table `blc_admin_permission_entity`
--

CREATE TABLE IF NOT EXISTS `blc_admin_permission_entity` (
  `ADMIN_PERMISSION_ENTITY_ID` bigint(20) NOT NULL,
  `CEILING_ENTITY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ENTITY_ID`),
  KEY `FK23C09E3DE88B7D38` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_admin_permission_entity`
--

INSERT INTO `blc_admin_permission_entity` (`ADMIN_PERMISSION_ENTITY_ID`, `CEILING_ENTITY`, `ADMIN_PERMISSION_ID`) VALUES
(-987, 'org.broadleafcommerce.common.site.domain.Site', -51),
(-986, 'org.broadleafcommerce.common.site.domain.Site', -50),
(-985, 'org.broadleafcommerce.common.site.domain.Catalog', -51),
(-984, 'org.broadleafcommerce.common.site.domain.Catalog', -50),
(-983, 'org.broadleafcommerce.openadmin.server.security.domain.AdminPermissionQualifiedEntity', -48),
(-982, 'org.broadleafcommerce.openadmin.server.security.domain.AdminPermissionQualifiedEntity', -49),
(-981, 'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission', -48),
(-980, 'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission', -48),
(-971, 'org.broadleafcommerce.openadmin.server.security.domain.AdminRole', -47),
(-970, 'org.broadleafcommerce.openadmin.server.security.domain.AdminRole', -46),
(-961, 'org.broadleafcommerce.common.config.domain.SystemProperty', -45),
(-960, 'org.broadleafcommerce.common.config.domain.SystemProperty', -44),
(-953, 'org.broadleafcommerce.common.sitemap.domain.SiteMapURLEntry', -43),
(-952, 'org.broadleafcommerce.common.sitemap.domain.SiteMapURLEntry', -42),
(-951, 'org.broadleafcommerce.common.sitemap.domain.SiteMapGeneratorConfiguration', -43),
(-950, 'org.broadleafcommerce.common.sitemap.domain.SiteMapGeneratorConfiguration', -42),
(-911, 'org.broadleafcommerce.common.i18n.domain.Translation', -41),
(-910, 'org.broadleafcommerce.common.i18n.domain.Translation', -40),
(-903, 'org.broadleafcommerce.common.enumeration.domain.DataDrivenEnumerationValue', -39),
(-902, 'org.broadleafcommerce.common.enumeration.domain.DataDrivenEnumerationValue', -38),
(-901, 'org.broadleafcommerce.common.enumeration.domain.DataDrivenEnumeration', -39),
(-900, 'org.broadleafcommerce.common.enumeration.domain.DataDrivenEnumeration', -38),
(-881, 'org.broadleafcommerce.common.config.domain.ModuleConfiguration', -37),
(-880, 'org.broadleafcommerce.common.config.domain.ModuleConfiguration', -36),
(-851, 'org.broadleafcommerce.common.currency.domain.BroadleafCurrency', -35),
(-850, 'org.broadleafcommerce.common.currency.domain.BroadleafCurrency', -34),
(-809, 'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet', -33),
(-808, 'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet', -32),
(-807, 'org.broadleafcommerce.core.search.domain.SearchFacetRange', -33),
(-806, 'org.broadleafcommerce.core.search.domain.SearchFacetRange', -32),
(-805, 'org.broadleafcommerce.core.search.domain.CategorySearchFacet', -33),
(-804, 'org.broadleafcommerce.core.search.domain.CategorySearchFacet', -32),
(-803, 'org.broadleafcommerce.core.search.domain.Field', -33),
(-802, 'org.broadleafcommerce.core.search.domain.Field', -32),
(-801, 'org.broadleafcommerce.core.search.domain.SearchFacet', -33),
(-800, 'org.broadleafcommerce.core.search.domain.SearchFacet', -32),
(-781, 'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect', -31),
(-780, 'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect', -30),
(-753, 'org.broadleafcommerce.common.locale.domain.Locale', -29),
(-752, 'org.broadleafcommerce.common.locale.domain.Locale', -28),
(-751, 'org.broadleafcommerce.cms.url.domain.URLHandler', -29),
(-750, 'org.broadleafcommerce.cms.url.domain.URLHandler', -28),
(-721, 'org.broadleafcommerce.openadmin.server.security.domain.AdminUser', -27),
(-720, 'org.broadleafcommerce.openadmin.server.security.domain.AdminUser', -26),
(-659, 'org.broadleafcommerce.common.locale.domain.Locale', -25),
(-658, 'org.broadleafcommerce.common.locale.domain.Locale', -24),
(-657, 'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate', -201),
(-655, 'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria', -25),
(-654, 'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria', -24),
(-653, 'org.broadleafcommerce.cms.structure.domain.StructuredContentType', -201),
(-651, 'org.broadleafcommerce.cms.structure.domain.StructuredContent', -25),
(-650, 'org.broadleafcommerce.cms.structure.domain.StructuredContent', -24),
(-603, 'org.broadleafcommerce.cms.file.domain.StaticAssetFolder', -23),
(-602, 'org.broadleafcommerce.cms.file.domain.StaticAssetFolder', -22),
(-601, 'org.broadleafcommerce.cms.file.domain.StaticAsset', -23),
(-600, 'org.broadleafcommerce.cms.file.domain.StaticAsset', -22),
(-557, 'org.broadleafcommerce.common.locale.domain.Locale', -21),
(-556, 'org.broadleafcommerce.common.locale.domain.Locale', -20),
(-555, 'org.broadleafcommerce.cms.page.domain.PageItemCriteria', -21),
(-554, 'org.broadleafcommerce.cms.page.domain.PageItemCriteria', -20),
(-552, 'org.broadleafcommerce.cms.page.domain.PageTemplate', -200),
(-551, 'org.broadleafcommerce.cms.page.domain.Page', -21),
(-550, 'org.broadleafcommerce.cms.page.domain.Page', -20),
(-514, 'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl', -19),
(-513, 'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl', -18),
(-512, 'org.broadleafcommerce.profile.core.domain.CustomerPhone', -19),
(-511, 'org.broadleafcommerce.profile.core.domain.CustomerPhone', -18),
(-510, 'org.broadleafcommerce.profile.core.domain.CustomerPayment', -19),
(-509, 'org.broadleafcommerce.profile.core.domain.CustomerPayment', -18),
(-508, 'org.broadleafcommerce.profile.core.domain.CustomerAddress', -19),
(-507, 'org.broadleafcommerce.profile.core.domain.CustomerAddress', -18),
(-506, 'org.broadleafcommerce.profile.core.domain.CustomerAttribute', -19),
(-504, 'org.broadleafcommerce.profile.core.domain.CustomerAttribute', -18),
(-503, 'org.broadleafcommerce.profile.core.domain.ChallengeQuestion', -19),
(-502, 'org.broadleafcommerce.profile.core.domain.ChallengeQuestion', -18),
(-501, 'org.broadleafcommerce.profile.core.domain.Customer', -19),
(-500, 'org.broadleafcommerce.profile.core.domain.Customer', -18),
(-461, 'org.broadleafcommerce.core.order.domain.BundleOrderItemFeePriceImpl', -17),
(-460, 'org.broadleafcommerce.core.order.domain.BundleOrderItemFeePriceImpl', -16),
(-459, 'org.broadleafcommerce.core.order.domain.OrderItemPriceDetailImpl', -17),
(-458, 'org.broadleafcommerce.core.order.domain.OrderItemPriceDetailImpl', -16),
(-457, 'org.broadleafcommerce.core.offer.domain.OrderItemPriceDetailAdjustmentImpl', -17),
(-456, 'org.broadleafcommerce.core.offer.domain.OrderItemPriceDetailAdjustmentImpl', -16),
(-455, 'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment', -17),
(-454, 'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment', -16),
(-453, 'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice', -17),
(-452, 'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice', -16),
(-451, 'org.broadleafcommerce.core.order.domain.OrderItem', -17),
(-450, 'org.broadleafcommerce.core.order.domain.OrderItem', -16),
(-407, 'org.broadleafcommerce.core.order.domain.FulfillmentGroupItemImpl', -15),
(-406, 'org.broadleafcommerce.core.order.domain.FulfillmentGroupItemImpl', -14),
(-405, 'org.broadleafcommerce.core.order.domain.FulfillmentGroupFeeImpl', -15),
(-404, 'org.broadleafcommerce.core.order.domain.FulfillmentGroupFeeImpl', -14),
(-403, 'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment', -15),
(-402, 'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment', -14),
(-401, 'org.broadleafcommerce.core.order.domain.FulfillmentGroup', -15),
(-400, 'org.broadleafcommerce.core.order.domain.FulfillmentGroup', -14),
(-370, 'org.broadleafcommerce.core.payment.domain.PaymentTransactionImpl', -13),
(-369, 'org.broadleafcommerce.core.payment.domain.PaymentTransactionImpl', -12),
(-368, 'org.broadleafcommerce.profile.core.domain.State', -13),
(-367, 'org.broadleafcommerce.profile.core.domain.State', -12),
(-366, 'org.broadleafcommerce.profile.core.domain.Country', -13),
(-365, 'org.broadleafcommerce.profile.core.domain.Country', -12),
(-361, 'org.broadleafcommerce.core.payment.domain.OrderPayment', -13),
(-360, 'org.broadleafcommerce.core.payment.domain.OrderPayment', -12),
(-356, 'org.broadleafcommerce.core.offer.domain.OrderAdjustment', -13),
(-355, 'org.broadleafcommerce.core.offer.domain.OrderAdjustment', -12),
(-351, 'org.broadleafcommerce.core.order.domain.Order', -13),
(-350, 'org.broadleafcommerce.core.order.domain.Order', -12),
(-307, 'org.broadleafcommerce.core.offer.domain.OfferTier', -11),
(-306, 'org.broadleafcommerce.core.offer.domain.OfferTier', -10),
(-305, 'org.broadleafcommerce.core.offer.domain.OfferCode', -11),
(-304, 'org.broadleafcommerce.core.offer.domain.OfferCode', -10),
(-303, 'org.broadleafcommerce.core.offer.domain.OfferItemCriteria', -11),
(-302, 'org.broadleafcommerce.core.offer.domain.OfferItemCriteria', -10),
(-301, 'org.broadleafcommerce.core.offer.domain.Offer', -11),
(-300, 'org.broadleafcommerce.core.offer.domain.Offer', -10),
(-251, 'org.broadleafcommerce.core.catalog.domain.Sku', -9),
(-250, 'org.broadleafcommerce.core.catalog.domain.Sku', -8),
(-205, 'org.broadleafcommerce.core.catalog.domain.ProductOptionXref', -7),
(-204, 'org.broadleafcommerce.core.catalog.domain.ProductOptionXref', -6),
(-203, 'org.broadleafcommerce.core.catalog.domain.ProductOptionValue', -7),
(-202, 'org.broadleafcommerce.core.catalog.domain.ProductOptionValue', -6),
(-201, 'org.broadleafcommerce.core.catalog.domain.ProductOption', -7),
(-200, 'org.broadleafcommerce.core.catalog.domain.ProductOption', -6),
(-107, 'org.broadleafcommerce.core.catalog.domain.SkuBundleItemImpl', -5),
(-106, 'org.broadleafcommerce.core.catalog.domain.SkuBundleItemImpl', -4),
(-105, 'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl', -5),
(-104, 'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl', -4),
(-103, 'org.broadleafcommerce.core.catalog.domain.ProductAttribute', -5),
(-102, 'org.broadleafcommerce.core.catalog.domain.ProductAttribute', -4),
(-101, 'org.broadleafcommerce.core.catalog.domain.Product', -5),
(-100, 'org.broadleafcommerce.core.catalog.domain.Product', -4),
(-14, 'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl', -3),
(-13, 'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl', -2),
(-12, 'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl', -3),
(-11, 'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl', -2),
(-10, 'org.broadleafcommerce.core.catalog.domain.FeaturedProductImpl', -3),
(-9, 'org.broadleafcommerce.core.catalog.domain.FeaturedProductImpl', -2),
(-8, 'org.broadleafcommerce.core.catalog.domain.CategoryXrefImpl', -3),
(-7, 'org.broadleafcommerce.core.catalog.domain.CategoryXrefImpl', -2),
(-6, 'org.broadleafcommerce.core.catalog.domain.CategoryProductXrefImpl', -3),
(-5, 'org.broadleafcommerce.core.catalog.domain.CategoryProductXrefImpl', -2),
(-4, 'org.broadleafcommerce.core.catalog.domain.CategoryAttribute', -3),
(-3, 'org.broadleafcommerce.core.catalog.domain.CategoryAttribute', -2),
(-2, 'org.broadleafcommerce.core.catalog.domain.Category', -3),
(-1, 'org.broadleafcommerce.core.catalog.domain.Category', -2);

-- --------------------------------------------------------

--
-- Table structure for table `blc_admin_permission_xref`
--

CREATE TABLE IF NOT EXISTS `blc_admin_permission_xref` (
  `CHILD_PERMISSION_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  KEY `FKBCAD1F5E88B7D38` (`ADMIN_PERMISSION_ID`),
  KEY `FKBCAD1F575A3C445` (`CHILD_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_admin_permission_xref`
--

INSERT INTO `blc_admin_permission_xref` (`CHILD_PERMISSION_ID`, `ADMIN_PERMISSION_ID`) VALUES
(-2, -100),
(-4, -100),
(-32, -100),
(-51, -100),
(-3, -101),
(-4, -101),
(-32, -101),
(-51, -101),
(-4, -102),
(-6, -102),
(-8, -102),
(-34, -102),
(-51, -101),
(-5, -103),
(-6, -103),
(-9, -103),
(-34, -103),
(-51, -103),
(-6, -104),
(-32, -104),
(-51, -104),
(-7, -105),
(-32, -105),
(-51, -105),
(-10, -106),
(-51, -106),
(-11, -107),
(-51, -106),
(-20, -108),
(-200, -108),
(-21, -109),
(-200, -109),
(-22, -110),
(-23, -111),
(-24, -112),
(-201, -112),
(-25, -113),
(-201, -113),
(-28, -114),
(-29, -115),
(-12, -116),
(-16, -116),
(-14, -116),
(-10, -116),
(-13, -117),
(-16, -117),
(-14, -117),
(-10, -117),
(-18, -118),
(-19, -119),
(-26, -120),
(-46, -120),
(-48, -120),
(-27, -121),
(-46, -120),
(-48, -120),
(-44, -122),
(-45, -123),
(-36, -126),
(-37, -127),
(-40, -130),
(-41, -131),
(-46, -140),
(-48, -140),
(-47, -141),
(-48, -141),
(-48, -150),
(-49, -151);

-- --------------------------------------------------------

--
-- Table structure for table `blc_admin_role`
--

CREATE TABLE IF NOT EXISTS `blc_admin_role` (
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`ADMIN_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_admin_role`
--

INSERT INTO `blc_admin_role` (`ADMIN_ROLE_ID`, `DESCRIPTION`, `NAME`) VALUES
(-7, 'CMS Designer', 'ROLE_CONTENT_DESIGNER'),
(-6, 'CMS Approver', 'ROLE_CONTENT_APPROVER'),
(-5, 'CMS Editor', 'ROLE_CONTENT_EDITOR'),
(-4, 'CSR', 'ROLE_CUSTOMER_SERVICE_REP'),
(-3, 'Promotion Manager', 'ROLE_PROMOTION_MANAGER'),
(-2, 'Merchandiser', 'ROLE_MERCHANDISE_MANAGER'),
(-1, 'Admin Master Access', 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `blc_admin_role_permission_xref`
--

CREATE TABLE IF NOT EXISTS `blc_admin_role_permission_xref` (
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`,`ADMIN_ROLE_ID`),
  KEY `FK4A819D98E88B7D38` (`ADMIN_PERMISSION_ID`),
  KEY `FK4A819D985F43AAD8` (`ADMIN_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_admin_role_permission_xref`
--

INSERT INTO `blc_admin_role_permission_xref` (`ADMIN_ROLE_ID`, `ADMIN_PERMISSION_ID`) VALUES
(-1, -141),
(-5, -131),
(-3, -131),
(-2, -131),
(-1, -131),
(-1, -127),
(-1, -123),
(-1, -121),
(-4, -119),
(-1, -119),
(-4, -117),
(-1, -117),
(-1, -115),
(-5, -113),
(-1, -113),
(-6, -111),
(-5, -111),
(-2, -111),
(-1, -111),
(-6, -109),
(-5, -109),
(-1, -109),
(-3, -107),
(-1, -107),
(-2, -105),
(-1, -105),
(-2, -103),
(-1, -103),
(-2, -101),
(-1, -101);

-- --------------------------------------------------------

--
-- Table structure for table `blc_admin_section`
--

CREATE TABLE IF NOT EXISTS `blc_admin_section` (
  `ADMIN_SECTION_ID` bigint(20) NOT NULL,
  `CEILING_ENTITY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DISPLAY_CONTROLLER` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `SECTION_KEY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `USE_DEFAULT_HANDLER` tinyint(1) DEFAULT NULL,
  `ADMIN_MODULE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_SECTION_ID`),
  UNIQUE KEY `uc_BLC_ADMIN_SECTION_1` (`SECTION_KEY`),
  KEY `ADMINSECTION_MODULE_INDEX` (`ADMIN_MODULE_ID`),
  KEY `ADMINSECTION_NAME_INDEX` (`NAME`),
  KEY `FK7EA7D92FB1A18498` (`ADMIN_MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_admin_section`
--

INSERT INTO `blc_admin_section` (`ADMIN_SECTION_ID`, `CEILING_ENTITY`, `DISPLAY_CONTROLLER`, `DISPLAY_ORDER`, `NAME`, `SECTION_KEY`, `URL`, `USE_DEFAULT_HANDLER`, `ADMIN_MODULE_ID`) VALUES
(-17, 'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission', NULL, 3000, 'Permission Management', 'PermissionManagement', '/permission-management', NULL, -4),
(-16, 'org.broadleafcommerce.common.config.domain.SystemProperty', NULL, 2000, 'System Properties', 'SystemProperties', '/system-properties', NULL, -5),
(-15, 'org.broadleafcommerce.common.config.domain.SystemProperty', NULL, 3000, 'System Property Management', 'SystemPropertyManagement', '/system-properties-management', NULL, -5),
(-13, 'org.broadleafcommerce.common.config.domain.ModuleConfiguration', NULL, 1000, 'Configuration Management', 'ConfigurationManagement', '/configuration-management', NULL, -5),
(-12, 'org.broadleafcommerce.openadmin.server.security.domain.AdminRole', NULL, 2000, 'Role Management', 'RoleManagement', '/role-management', NULL, -4),
(-11, 'org.broadleafcommerce.openadmin.server.security.domain.AdminUser', NULL, 1000, 'User Management', 'UserManagement', '/user-management', NULL, -4),
(-10, 'org.broadleafcommerce.profile.core.domain.Customer', NULL, 1000, 'Customer', 'Customer', '/customer', NULL, -3),
(-9, 'org.broadleafcommerce.core.order.domain.Order', NULL, 2000, 'Order', 'Order', '/order', NULL, -3),
(-8, 'org.broadleafcommerce.cms.url.domain.URLHandler', NULL, 4000, 'Redirect URL', 'RedirectURL', '/redirect-url', NULL, -2),
(-7, 'org.broadleafcommerce.cms.structure.domain.StructuredContent', NULL, 2000, 'Structured Content', 'StructuredContent', '/structured-content', NULL, -2),
(-6, 'org.broadleafcommerce.cms.file.domain.StaticAsset', NULL, 3000, 'Assets', 'Assets', '/assets', NULL, -2),
(-5, 'org.broadleafcommerce.cms.page.domain.Page', NULL, 1000, 'Pages', 'Pages', '/pages', NULL, -2),
(-4, 'org.broadleafcommerce.core.offer.domain.Offer', NULL, 4000, 'Offer', 'Offer', '/offer', NULL, -1),
(-3, 'org.broadleafcommerce.core.catalog.domain.ProductOption', NULL, 3000, 'Product Options', 'ProductOptions', '/product-options', NULL, -1),
(-2, 'org.broadleafcommerce.core.catalog.domain.Product', NULL, 2000, 'Product', 'Product', '/product', NULL, -1),
(-1, 'org.broadleafcommerce.core.catalog.domain.Category', NULL, 1000, 'Category', 'Category', '/category', NULL, -1);

-- --------------------------------------------------------

--
-- Table structure for table `blc_admin_sec_perm_xref`
--

CREATE TABLE IF NOT EXISTS `blc_admin_sec_perm_xref` (
  `ADMIN_SECTION_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  KEY `FK5E832966E88B7D38` (`ADMIN_PERMISSION_ID`),
  KEY `FK5E8329663AF7F0FC` (`ADMIN_SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_admin_sec_perm_xref`
--

INSERT INTO `blc_admin_sec_perm_xref` (`ADMIN_SECTION_ID`, `ADMIN_PERMISSION_ID`) VALUES
(-1, -100),
(-1, -101),
(-2, -102),
(-2, -103),
(-3, -104),
(-3, -105),
(-4, -106),
(-4, -107),
(-5, -108),
(-5, -109),
(-6, -110),
(-6, -111),
(-7, -112),
(-7, -113),
(-8, -114),
(-8, -115),
(-9, -116),
(-9, -117),
(-10, -118),
(-10, -119),
(-11, -120),
(-11, -121),
(-12, -140),
(-12, -141),
(-13, -126),
(-13, -127),
(-15, -122),
(-15, -123),
(-16, -122),
(-16, -123),
(-17, -150),
(-17, -151);

-- --------------------------------------------------------

--
-- Table structure for table `blc_admin_user`
--

CREATE TABLE IF NOT EXISTS `blc_admin_user` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ACTIVE_STATUS_FLAG` tinyint(1) DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `LOGIN` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `PHONE_NUMBER` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`ADMIN_USER_ID`),
  KEY `ADMINPERM_EMAIL_INDEX` (`EMAIL`),
  KEY `ADMINUSER_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_admin_user`
--

INSERT INTO `blc_admin_user` (`ADMIN_USER_ID`, `ACTIVE_STATUS_FLAG`, `EMAIL`, `LOGIN`, `NAME`, `PASSWORD`, `PHONE_NUMBER`) VALUES
(-6, 1, 'cms_approver@yourdomain.com', 'cmsApprover', 'CMS Approver', 'admin{-6}', NULL),
(-5, 1, 'cms_edit@yourdomain.com', 'cmsEditor', 'CMS Editor', 'admin{-5}', NULL),
(-4, 1, 'csr@yourdomain.com', 'csr', 'CSR', 'admin{-4}', NULL),
(-3, 1, 'promo@yourdomain.com', 'promo', 'Promotion Manager', 'admin{-3}', NULL),
(-2, 1, 'merchandise@yourdomain.com', 'merchandise', 'Merchandise Manager', 'admin{-2}', NULL),
(-1, 1, 'admin@yourdomain.com', 'admin', 'Administrator', 'admin{-1}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blc_admin_user_addtl_fields`
--

CREATE TABLE IF NOT EXISTS `blc_admin_user_addtl_fields` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FIELD_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`ADMIN_USER_ID`,`FIELD_NAME`),
  KEY `FK73274CDD46EBC38` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_admin_user_permission_xref`
--

CREATE TABLE IF NOT EXISTS `blc_admin_user_permission_xref` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`,`ADMIN_USER_ID`),
  KEY `FKF0B3BEEDE88B7D38` (`ADMIN_PERMISSION_ID`),
  KEY `FKF0B3BEED46EBC38` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_admin_user_role_xref`
--

CREATE TABLE IF NOT EXISTS `blc_admin_user_role_xref` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_ROLE_ID`,`ADMIN_USER_ID`),
  KEY `FKFFD33A265F43AAD8` (`ADMIN_ROLE_ID`),
  KEY `FKFFD33A2646EBC38` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_admin_user_role_xref`
--

INSERT INTO `blc_admin_user_role_xref` (`ADMIN_USER_ID`, `ADMIN_ROLE_ID`) VALUES
(-6, -6),
(-5, -5),
(-4, -4),
(-3, -3),
(-2, -2),
(-1, -1);

-- --------------------------------------------------------

--
-- Table structure for table `blc_admin_user_sandbox`
--

CREATE TABLE IF NOT EXISTS `blc_admin_user_sandbox` (
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_USER_ID`),
  KEY `FKD0A97E09579FE59D` (`SANDBOX_ID`),
  KEY `FKD0A97E0946EBC38` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_asset_desc_map`
--

CREATE TABLE IF NOT EXISTS `blc_asset_desc_map` (
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  `STATIC_ASSET_DESC_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`,`MAP_KEY`),
  KEY `FKE886BAE3E2BA0C9D` (`STATIC_ASSET_DESC_ID`),
  KEY `FKE886BAE367F70B63` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_bank_account_payment`
--

CREATE TABLE IF NOT EXISTS `blc_bank_account_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `ACCOUNT_NUMBER` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `REFERENCE_NUMBER` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `ROUTING_NUMBER` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `BANKACCOUNT_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_bundle_order_item`
--

CREATE TABLE IF NOT EXISTS `blc_bundle_order_item` (
  `BASE_RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `BASE_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `PRODUCT_BUNDLE_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FK489703DBCCF29B96` (`PRODUCT_BUNDLE_ID`),
  KEY `FK489703DBB78C9977` (`SKU_ID`),
  KEY `FK489703DB9AF166DF` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_bund_item_fee_price`
--

CREATE TABLE IF NOT EXISTS `blc_bund_item_fee_price` (
  `BUND_ITEM_FEE_PRICE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `IS_TAXABLE` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `REPORTING_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `BUND_ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`BUND_ITEM_FEE_PRICE_ID`),
  KEY `FK14267A943FC68307` (`BUND_ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_candidate_fg_offer`
--

CREATE TABLE IF NOT EXISTS `blc_candidate_fg_offer` (
  `CANDIDATE_FG_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CANDIDATE_FG_OFFER_ID`),
  KEY `CANDIDATE_FG_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `CANDIDATE_FGOFFER_INDEX` (`OFFER_ID`),
  KEY `FKCE785605028DC55` (`FULFILLMENT_GROUP_ID`),
  KEY `FKCE78560D5F3FAF4` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_candidate_item_offer`
--

CREATE TABLE IF NOT EXISTS `blc_candidate_item_offer` (
  `CANDIDATE_ITEM_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ITEM_OFFER_ID`),
  KEY `CANDIDATE_ITEMOFFER_INDEX` (`OFFER_ID`),
  KEY `CANDIDATE_ITEM_INDEX` (`ORDER_ITEM_ID`),
  KEY `FK9EEE9B2D5F3FAF4` (`OFFER_ID`),
  KEY `FK9EEE9B29AF166DF` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_candidate_order_offer`
--

CREATE TABLE IF NOT EXISTS `blc_candidate_order_offer` (
  `CANDIDATE_ORDER_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ORDER_OFFER_ID`),
  KEY `CANDIDATE_ORDEROFFER_INDEX` (`OFFER_ID`),
  KEY `CANDIDATE_ORDER_INDEX` (`ORDER_ID`),
  KEY `FK61852289D5F3FAF4` (`OFFER_ID`),
  KEY `FK6185228989FE8A02` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_catalog`
--

CREATE TABLE IF NOT EXISTS `blc_catalog` (
  `CATALOG_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`CATALOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_category`
--

CREATE TABLE IF NOT EXISTS `blc_category` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `ARCHIVED` char(1) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DISPLAY_TEMPLATE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FULFILLMENT_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `INVENTORY_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LONG_DESCRIPTION` longtext COLLATE utf8_vietnamese_ci,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `TAX_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `URL_KEY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DEFAULT_PARENT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `CATEGORY_PARENT_INDEX` (`DEFAULT_PARENT_CATEGORY_ID`),
  KEY `CATEGORY_NAME_INDEX` (`NAME`),
  KEY `CATEGORY_URL_INDEX` (`URL`),
  KEY `CATEGORY_URLKEY_INDEX` (`URL_KEY`),
  KEY `FK55F82D44B177E6` (`DEFAULT_PARENT_CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_category`
--

INSERT INTO `blc_category` (`CATEGORY_ID`, `ACTIVE_END_DATE`, `ACTIVE_START_DATE`, `ARCHIVED`, `DESCRIPTION`, `DISPLAY_TEMPLATE`, `FULFILLMENT_TYPE`, `INVENTORY_TYPE`, `LONG_DESCRIPTION`, `NAME`, `TAX_CODE`, `URL`, `URL_KEY`, `DEFAULT_PARENT_CATEGORY_ID`) VALUES
(1, NULL, '2014-06-29 19:39:38', NULL, 'Root', NULL, NULL, NULL, NULL, 'Root', NULL, NULL, NULL, NULL),
(2, NULL, '2014-06-29 19:39:38', NULL, 'Primary Nav', NULL, NULL, NULL, NULL, 'Primary Nav', NULL, NULL, NULL, 1),
(2001, NULL, '2014-06-29 19:39:38', NULL, 'Home', 'layout/home', NULL, NULL, NULL, 'Home', NULL, '/', NULL, 2),
(2002, NULL, '2014-06-29 19:39:38', NULL, 'Hot Sauces', NULL, NULL, NULL, NULL, 'Hot Sauces', NULL, '/hot-sauces', NULL, 2),
(2003, NULL, '2014-06-29 19:39:38', NULL, 'Merchandise', NULL, NULL, NULL, NULL, 'Merchandise', NULL, '/merchandise', NULL, 2),
(2004, NULL, '2014-06-29 19:39:38', NULL, 'Clearance', NULL, NULL, NULL, NULL, 'Clearance', NULL, '/clearance', NULL, 2),
(2005, NULL, '2014-06-29 19:39:38', NULL, 'New to Hot Sauce?', NULL, NULL, NULL, NULL, 'New to Hot Sauce?', NULL, '/new-to-hot-sauce', NULL, 2),
(2006, NULL, '2014-06-29 19:39:38', NULL, 'FAQs', NULL, NULL, NULL, NULL, 'FAQs', NULL, '/faq', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `blc_category_attribute`
--

CREATE TABLE IF NOT EXISTS `blc_category_attribute` (
  `CATEGORY_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `SEARCHABLE` tinyint(1) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_ATTRIBUTE_ID`),
  KEY `CATEGORYATTRIBUTE_INDEX` (`CATEGORY_ID`),
  KEY `CATEGORYATTRIBUTE_NAME_INDEX` (`NAME`),
  KEY `FK4E441D4115D1A13D` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_category_image`
--

CREATE TABLE IF NOT EXISTS `blc_category_image` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `URL` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`NAME`),
  KEY `FK27CF3E8015D1A13D` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_category_media_map`
--

CREATE TABLE IF NOT EXISTS `blc_category_media_map` (
  `BLC_CATEGORY_CATEGORY_ID` bigint(20) NOT NULL,
  `MEDIA_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`BLC_CATEGORY_CATEGORY_ID`,`MAP_KEY`),
  KEY `FKCD24B1066E4720E0` (`MEDIA_ID`),
  KEY `FKCD24B106D786CEA2` (`BLC_CATEGORY_CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_category_product_xref`
--

CREATE TABLE IF NOT EXISTS `blc_category_product_xref` (
  `CATEGORY_PRODUCT_ID` bigint(20) NOT NULL,
  `DISPLAY_ORDER` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_PRODUCT_ID`),
  KEY `FK635EB1A615D1A13D` (`CATEGORY_ID`),
  KEY `FK635EB1A65F11A0B7` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_category_product_xref`
--

INSERT INTO `blc_category_product_xref` (`CATEGORY_PRODUCT_ID`, `DISPLAY_ORDER`, `CATEGORY_ID`, `PRODUCT_ID`) VALUES
(1, '1.000000', 2002, 1),
(2, '2.000000', 2002, 2),
(3, '3.000000', 2002, 3),
(4, '4.000000', 2002, 4),
(5, '5.000000', 2002, 5),
(6, '6.000000', 2002, 6),
(7, '7.000000', 2002, 7),
(8, '8.000000', 2002, 8),
(9, '9.000000', 2002, 9),
(10, '10.000000', 2002, 10),
(11, '11.000000', 2002, 11),
(12, '12.000000', 2002, 12),
(13, '13.000000', 2002, 13),
(14, '14.000000', 2002, 14),
(15, '15.000000', 2002, 15),
(16, '16.000000', 2002, 16),
(17, '17.000000', 2002, 17),
(18, '18.000000', 2002, 18),
(19, '19.000000', 2002, 19),
(20, '1.000000', 2001, 3),
(21, '2.000000', 2001, 6),
(22, '3.000000', 2001, 9),
(23, '4.000000', 2001, 12),
(24, '1.000000', 2004, 7),
(25, '2.000000', 2004, 8),
(26, '3.000000', 2004, 10),
(27, '4.000000', 2004, 11),
(28, '5.000000', 2004, 18),
(29, '1.000000', 2003, 100),
(30, '2.000000', 2003, 200),
(31, '3.000000', 2003, 300),
(32, '4.000000', 2003, 400),
(33, '5.000000', 2003, 500),
(34, '6.000000', 2003, 600);

-- --------------------------------------------------------

--
-- Table structure for table `blc_category_xref`
--

CREATE TABLE IF NOT EXISTS `blc_category_xref` (
  `CATEGORY_XREF_ID` bigint(20) NOT NULL,
  `DISPLAY_ORDER` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  `SUB_CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_XREF_ID`),
  KEY `FKE889733615D1A13D` (`CATEGORY_ID`),
  KEY `FKE8897336D6D45DBE` (`SUB_CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_category_xref`
--

INSERT INTO `blc_category_xref` (`CATEGORY_XREF_ID`, `DISPLAY_ORDER`, `CATEGORY_ID`, `SUB_CATEGORY_ID`) VALUES
(1, '1.000000', 1, 2),
(2, '1.000000', 2, 2001),
(3, '2.000000', 2, 2002),
(4, '3.000000', 2, 2003),
(5, '4.000000', 2, 2004),
(6, '5.000000', 2, 2005),
(7, '6.000000', 2, 2006);

-- --------------------------------------------------------

--
-- Table structure for table `blc_cat_search_facet_excl_xref`
--

CREATE TABLE IF NOT EXISTS `blc_cat_search_facet_excl_xref` (
  `CAT_EXCL_SEARCH_FACET_ID` bigint(20) NOT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CAT_EXCL_SEARCH_FACET_ID`),
  KEY `FK8361EF4E15D1A13D` (`CATEGORY_ID`),
  KEY `FK8361EF4EB96B1C93` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_cat_search_facet_xref`
--

CREATE TABLE IF NOT EXISTS `blc_cat_search_facet_xref` (
  `CATEGORY_SEARCH_FACET_ID` bigint(20) NOT NULL,
  `SEQUENCE` decimal(19,2) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_SEARCH_FACET_ID`),
  KEY `FK32210EEB15D1A13D` (`CATEGORY_ID`),
  KEY `FK32210EEBB96B1C93` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_cat_search_facet_xref`
--

INSERT INTO `blc_cat_search_facet_xref` (`CATEGORY_SEARCH_FACET_ID`, `SEQUENCE`, `CATEGORY_ID`, `SEARCH_FACET_ID`) VALUES
(1, '1.00', 2002, 1),
(2, '2.00', 2002, 2),
(3, '3.00', 1, 3),
(4, '1.00', 2003, 4);

-- --------------------------------------------------------

--
-- Table structure for table `blc_cat_site_map_gen_cfg`
--

CREATE TABLE IF NOT EXISTS `blc_cat_site_map_gen_cfg` (
  `ENDING_DEPTH` int(11) NOT NULL,
  `STARTING_DEPTH` int(11) NOT NULL,
  `GEN_CONFIG_ID` bigint(20) NOT NULL,
  `ROOT_CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`GEN_CONFIG_ID`),
  KEY `FK1BA4E695C5F3D60` (`ROOT_CATEGORY_ID`),
  KEY `FK1BA4E69BCAB9F56` (`GEN_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_cat_site_map_gen_cfg`
--

INSERT INTO `blc_cat_site_map_gen_cfg` (`ENDING_DEPTH`, `STARTING_DEPTH`, `GEN_CONFIG_ID`, `ROOT_CATEGORY_ID`) VALUES
(1, 1, -4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `blc_challenge_question`
--

CREATE TABLE IF NOT EXISTS `blc_challenge_question` (
  `QUESTION_ID` bigint(20) NOT NULL,
  `QUESTION` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_challenge_question`
--

INSERT INTO `blc_challenge_question` (`QUESTION_ID`, `QUESTION`) VALUES
(1, 'What is your favorite sports team?'),
(2, 'What was your high school name?'),
(3, 'What was your childhood nickname?'),
(4, 'What street did you live on in third grade?'),
(5, 'What is your oldest sibling''s middle name?'),
(6, 'What school did you attend for sixth grade?'),
(7, 'Where does your nearest sibling live?'),
(8, 'What is your youngest brother''s birthday?'),
(9, 'In what city or town was your first job?');

-- --------------------------------------------------------

--
-- Table structure for table `blc_code_types`
--

CREATE TABLE IF NOT EXISTS `blc_code_types` (
  `CODE_ID` bigint(20) NOT NULL,
  `CODE_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `CODE_DESC` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CODE_KEY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `MODIFIABLE` char(1) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_country`
--

CREATE TABLE IF NOT EXISTS `blc_country` (
  `ABBREVIATION` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_country`
--

INSERT INTO `blc_country` (`ABBREVIATION`, `NAME`) VALUES
('CA', 'Canada'),
('MX', 'Mexico'),
('US', 'United States');

-- --------------------------------------------------------

--
-- Table structure for table `blc_credit_card_payment`
--

CREATE TABLE IF NOT EXISTS `blc_credit_card_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `EXPIRATION_MONTH` int(11) NOT NULL,
  `EXPIRATION_YEAR` int(11) NOT NULL,
  `NAME_ON_CARD` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `PAN` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `REFERENCE_NUMBER` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `CREDITCARD_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_currency`
--

CREATE TABLE IF NOT EXISTS `blc_currency` (
  `CURRENCY_CODE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `DEFAULT_FLAG` tinyint(1) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_currency`
--

INSERT INTO `blc_currency` (`CURRENCY_CODE`, `DEFAULT_FLAG`, `FRIENDLY_NAME`) VALUES
('EUR', 0, 'EURO Dollar'),
('GBP', 0, 'GB Pound'),
('MXN', 0, 'Mexican Peso'),
('USD', 1, 'US Dollar');

-- --------------------------------------------------------

--
-- Table structure for table `blc_customer`
--

CREATE TABLE IF NOT EXISTS `blc_customer` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `CHALLENGE_ANSWER` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DEACTIVATED` tinyint(1) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FIRST_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `PASSWORD_CHANGE_REQUIRED` tinyint(1) DEFAULT NULL,
  `IS_PREVIEW` tinyint(1) DEFAULT NULL,
  `RECEIVE_EMAIL` tinyint(1) DEFAULT NULL,
  `IS_REGISTERED` tinyint(1) DEFAULT NULL,
  `TAX_EXEMPTION_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `USER_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CHALLENGE_QUESTION_ID` bigint(20) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  KEY `CUSTOMER_CHALLENGE_INDEX` (`CHALLENGE_QUESTION_ID`),
  KEY `CUSTOMER_EMAIL_INDEX` (`EMAIL_ADDRESS`),
  KEY `FK7716F0241422B204` (`CHALLENGE_QUESTION_ID`),
  KEY `FK7716F024A1E1C128` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_customer_address`
--

CREATE TABLE IF NOT EXISTS `blc_customer_address` (
  `CUSTOMER_ADDRESS_ID` bigint(20) NOT NULL,
  `ADDRESS_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ADDRESS_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ADDRESS_ID`),
  UNIQUE KEY `CSTMR_ADDR_UNIQUE_CNSTRNT` (`CUSTOMER_ID`,`ADDRESS_NAME`),
  KEY `CUSTOMERADDRESS_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `FK75B95AB9C13085DD` (`ADDRESS_ID`),
  KEY `FK75B95AB97470F437` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_customer_attribute`
--

CREATE TABLE IF NOT EXISTS `blc_customer_attribute` (
  `CUSTOMER_ATTR_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ATTR_ID`),
  KEY `FKB974C8217470F437` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_customer_offer_xref`
--

CREATE TABLE IF NOT EXISTS `blc_customer_offer_xref` (
  `CUSTOMER_OFFER_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_OFFER_ID`),
  KEY `CUSTOFFER_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `CUSTOFFER_OFFER_INDEX` (`OFFER_ID`),
  KEY `FK685E80397470F437` (`CUSTOMER_ID`),
  KEY `FK685E8039D5F3FAF4` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_customer_password_token`
--

CREATE TABLE IF NOT EXISTS `blc_customer_password_token` (
  `PASSWORD_TOKEN` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `TOKEN_USED_DATE` datetime DEFAULT NULL,
  `TOKEN_USED_FLAG` tinyint(1) NOT NULL,
  PRIMARY KEY (`PASSWORD_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_customer_payment`
--

CREATE TABLE IF NOT EXISTS `blc_customer_payment` (
  `CUSTOMER_PAYMENT_ID` bigint(20) NOT NULL,
  `IS_DEFAULT` tinyint(1) DEFAULT NULL,
  `PAYMENT_TOKEN` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ADDRESS_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PAYMENT_ID`),
  UNIQUE KEY `CSTMR_PAY_UNIQUE_CNSTRNT` (`CUSTOMER_ID`,`PAYMENT_TOKEN`),
  KEY `FK8B3DF0CBC13085DD` (`ADDRESS_ID`),
  KEY `FK8B3DF0CB7470F437` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_customer_payment_fields`
--

CREATE TABLE IF NOT EXISTS `blc_customer_payment_fields` (
  `CUSTOMER_PAYMENT_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FIELD_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`CUSTOMER_PAYMENT_ID`,`FIELD_NAME`),
  KEY `FK5CCB14ADCA0B98E0` (`CUSTOMER_PAYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_customer_phone`
--

CREATE TABLE IF NOT EXISTS `blc_customer_phone` (
  `CUSTOMER_PHONE_ID` bigint(20) NOT NULL,
  `PHONE_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `PHONE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PHONE_ID`),
  UNIQUE KEY `CSTMR_PHONE_UNIQUE_CNSTRNT` (`CUSTOMER_ID`,`PHONE_NAME`),
  KEY `CUSTPHONE_PHONE_INDEX` (`PHONE_ID`),
  KEY `FK3D28ED737470F437` (`CUSTOMER_ID`),
  KEY `FK3D28ED73D894CB5D` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_customer_role`
--

CREATE TABLE IF NOT EXISTS `blc_customer_role` (
  `CUSTOMER_ROLE_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ROLE_ID`),
  KEY `CUSTROLE_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `CUSTROLE_ROLE_INDEX` (`ROLE_ID`),
  KEY `FK548EB7B17470F437` (`CUSTOMER_ID`),
  KEY `FK548EB7B1B8587B7` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_cust_site_map_gen_cfg`
--

CREATE TABLE IF NOT EXISTS `blc_cust_site_map_gen_cfg` (
  `GEN_CONFIG_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`GEN_CONFIG_ID`),
  KEY `FK67C0DBA0BCAB9F56` (`GEN_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_cust_site_map_gen_cfg`
--

INSERT INTO `blc_cust_site_map_gen_cfg` (`GEN_CONFIG_ID`) VALUES
(-1);

-- --------------------------------------------------------

--
-- Table structure for table `blc_data_drvn_enum`
--

CREATE TABLE IF NOT EXISTS `blc_data_drvn_enum` (
  `ENUM_ID` bigint(20) NOT NULL,
  `ENUM_KEY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `MODIFIABLE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ENUM_ID`),
  KEY `ENUM_KEY_INDEX` (`ENUM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_data_drvn_enum_val`
--

CREATE TABLE IF NOT EXISTS `blc_data_drvn_enum_val` (
  `ENUM_VAL_ID` bigint(20) NOT NULL,
  `DISPLAY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `HIDDEN` tinyint(1) DEFAULT NULL,
  `ENUM_KEY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ENUM_TYPE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ENUM_VAL_ID`),
  KEY `HIDDEN_INDEX` (`HIDDEN`),
  KEY `ENUM_VAL_KEY_INDEX` (`ENUM_KEY`),
  KEY `FKB2D5700DA60E0554` (`ENUM_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_discrete_order_item`
--

CREATE TABLE IF NOT EXISTS `blc_discrete_order_item` (
  `BASE_RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `BASE_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `BUNDLE_ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  `SKU_BUNDLE_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `DISCRETE_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `DISCRETE_SKU_INDEX` (`SKU_ID`),
  KEY `FKBC3A8A845CDFCA80` (`BUNDLE_ORDER_ITEM_ID`),
  KEY `FKBC3A8A845F11A0B7` (`PRODUCT_ID`),
  KEY `FKBC3A8A84B78C9977` (`SKU_ID`),
  KEY `FKBC3A8A841285903B` (`SKU_BUNDLE_ITEM_ID`),
  KEY `FKBC3A8A849AF166DF` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_disc_item_fee_price`
--

CREATE TABLE IF NOT EXISTS `blc_disc_item_fee_price` (
  `DISC_ITEM_FEE_PRICE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `REPORTING_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`DISC_ITEM_FEE_PRICE_ID`),
  KEY `FK2A641CC8B76B9466` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_dyn_discrete_order_item`
--

CREATE TABLE IF NOT EXISTS `blc_dyn_discrete_order_item` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FK209DEE9EB76B9466` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_email_tracking`
--

CREATE TABLE IF NOT EXISTS `blc_email_tracking` (
  `EMAIL_TRACKING_ID` bigint(20) NOT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`EMAIL_TRACKING_ID`),
  KEY `EMAILTRACKING_INDEX` (`EMAIL_ADDRESS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_email_tracking_clicks`
--

CREATE TABLE IF NOT EXISTS `blc_email_tracking_clicks` (
  `CLICK_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DATE_CLICKED` datetime NOT NULL,
  `DESTINATION_URI` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `QUERY_STRING` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `EMAIL_TRACKING_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CLICK_ID`),
  KEY `TRACKINGCLICKS_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `TRACKINGCLICKS_TRACKING_INDEX` (`EMAIL_TRACKING_ID`),
  KEY `FKFDF9F52AFA1E5D61` (`EMAIL_TRACKING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_email_tracking_opens`
--

CREATE TABLE IF NOT EXISTS `blc_email_tracking_opens` (
  `OPEN_ID` bigint(20) NOT NULL,
  `DATE_OPENED` datetime DEFAULT NULL,
  `USER_AGENT` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `EMAIL_TRACKING_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`OPEN_ID`),
  KEY `TRACKINGOPEN_TRACKING` (`EMAIL_TRACKING_ID`),
  KEY `FKA5C3722AFA1E5D61` (`EMAIL_TRACKING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_fg_adjustment`
--

CREATE TABLE IF NOT EXISTS `blc_fg_adjustment` (
  `FG_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `ADJUSTMENT_REASON` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FG_ADJUSTMENT_ID`),
  KEY `FGADJUSTMENT_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `FGADJUSTMENT_OFFER_INDEX` (`OFFER_ID`),
  KEY `FK468C8F255028DC55` (`FULFILLMENT_GROUP_ID`),
  KEY `FK468C8F25D5F3FAF4` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_fg_fee_tax_xref`
--

CREATE TABLE IF NOT EXISTS `blc_fg_fee_tax_xref` (
  `FULFILLMENT_GROUP_FEE_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `UK_25426DC0FA888C35` (`TAX_DETAIL_ID`),
  KEY `FK25426DC071448C19` (`TAX_DETAIL_ID`),
  KEY `FK25426DC0598F6D02` (`FULFILLMENT_GROUP_FEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_fg_fg_tax_xref`
--

CREATE TABLE IF NOT EXISTS `blc_fg_fg_tax_xref` (
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `UK_61BEA455FA888C35` (`TAX_DETAIL_ID`),
  KEY `FK61BEA45571448C19` (`TAX_DETAIL_ID`),
  KEY `FK61BEA4555028DC55` (`FULFILLMENT_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_fg_item_tax_xref`
--

CREATE TABLE IF NOT EXISTS `blc_fg_item_tax_xref` (
  `FULFILLMENT_GROUP_ITEM_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `UK_DD3E8443FA888C35` (`TAX_DETAIL_ID`),
  KEY `FKDD3E844371448C19` (`TAX_DETAIL_ID`),
  KEY `FKDD3E8443E3BBB4D2` (`FULFILLMENT_GROUP_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_field`
--

CREATE TABLE IF NOT EXISTS `blc_field` (
  `FIELD_ID` bigint(20) NOT NULL,
  `ABBREVIATION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `FACET_FIELD_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `PROPERTY_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `SEARCHABLE` tinyint(1) DEFAULT NULL,
  `TRANSLATABLE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`FIELD_ID`),
  KEY `ENTITY_TYPE_INDEX` (`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_field`
--

INSERT INTO `blc_field` (`FIELD_ID`, `ABBREVIATION`, `ENTITY_TYPE`, `FACET_FIELD_TYPE`, `PROPERTY_NAME`, `SEARCHABLE`, `TRANSLATABLE`) VALUES
(1, 'mfg', 'PRODUCT', 's', 'manufacturer', 1, NULL),
(2, 'heatRange', 'PRODUCT', 'i', 'productAttributes.heatRange', 0, NULL),
(3, 'price', 'PRODUCT', 'p', 'defaultSku.retailPrice', 0, NULL),
(4, 'name', 'PRODUCT', 's', 'defaultSku.name', 1, 1),
(5, 'model', 'PRODUCT', 's', 'model', 1, NULL),
(6, 'desc', 'PRODUCT', NULL, 'defaultSku.description', 1, 1),
(7, 'ldesc', 'PRODUCT', NULL, 'defaultSku.longDescription', 1, 1),
(8, 'color', 'PRODUCT', 's', 'productAttributes.color', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blc_field_search_types`
--

CREATE TABLE IF NOT EXISTS `blc_field_search_types` (
  `FIELD_ID` bigint(20) NOT NULL,
  `SEARCHABLE_FIELD_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  KEY `FKF52D130D3C3907C4` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_field_search_types`
--

INSERT INTO `blc_field_search_types` (`FIELD_ID`, `SEARCHABLE_FIELD_TYPE`) VALUES
(1, 't'),
(4, 't'),
(5, 't'),
(6, 't'),
(7, 't');

-- --------------------------------------------------------

--
-- Table structure for table `blc_fld_def`
--

CREATE TABLE IF NOT EXISTS `blc_fld_def` (
  `FLD_DEF_ID` bigint(20) NOT NULL,
  `ALLOW_MULTIPLES` tinyint(1) DEFAULT NULL,
  `COLUMN_WIDTH` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FLD_ORDER` int(11) DEFAULT NULL,
  `FLD_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `HIDDEN_FLAG` tinyint(1) DEFAULT NULL,
  `MAX_LENGTH` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `REQUIRED_FLAG` tinyint(1) DEFAULT NULL,
  `SECURITY_LEVEL` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TEXT_AREA_FLAG` tinyint(1) DEFAULT NULL,
  `VLDTN_ERROR_MSSG_KEY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `VLDTN_REGEX` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ENUM_ID` bigint(20) DEFAULT NULL,
  `FLD_GROUP_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FLD_DEF_ID`),
  KEY `FK3FCB575E38D08AB5` (`ENUM_ID`),
  KEY `FK3FCB575E6A79BDB5` (`FLD_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_fld_def`
--

INSERT INTO `blc_fld_def` (`FLD_DEF_ID`, `ALLOW_MULTIPLES`, `COLUMN_WIDTH`, `FLD_ORDER`, `FLD_TYPE`, `FRIENDLY_NAME`, `HIDDEN_FLAG`, `MAX_LENGTH`, `NAME`, `REQUIRED_FLAG`, `SECURITY_LEVEL`, `TEXT_AREA_FLAG`, `VLDTN_ERROR_MSSG_KEY`, `VLDTN_REGEX`, `ENUM_ID`, `FLD_GROUP_ID`) VALUES
(-2, 0, '*', 1, 'BOOLEAN', 'Plain Text', 0, NULL, 'plainText', NULL, NULL, 0, NULL, NULL, NULL, -3),
(-1, 0, '*', 0, 'HTML', 'File Contents', 0, NULL, 'body', NULL, NULL, 0, NULL, NULL, NULL, -3),
(2, 0, '*', 1, 'HTML', 'Body', 0, NULL, 'body', NULL, NULL, 0, NULL, NULL, NULL, 1),
(3, 0, '*', 0, 'STRING', 'Title', 0, NULL, 'title', NULL, NULL, 0, NULL, NULL, NULL, 1),
(7, 0, '*', 0, 'STRING', 'Image URL', 0, 150, 'imageUrl', NULL, NULL, 0, NULL, NULL, NULL, 4),
(8, 0, '*', 1, 'STRING', 'Target URL', 0, 150, 'targetUrl', NULL, NULL, 0, NULL, NULL, NULL, 4),
(9, 0, '*', 0, 'STRING', 'Message Text', 0, 150, 'messageText', NULL, NULL, 0, NULL, NULL, NULL, 6),
(10, 0, '*', 0, 'HTML', 'HTML Content', 0, NULL, 'htmlContent', NULL, NULL, 0, NULL, NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `blc_fld_enum`
--

CREATE TABLE IF NOT EXISTS `blc_fld_enum` (
  `FLD_ENUM_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_fld_enum_item`
--

CREATE TABLE IF NOT EXISTS `blc_fld_enum_item` (
  `FLD_ENUM_ITEM_ID` bigint(20) NOT NULL,
  `FLD_ORDER` int(11) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FLD_ENUM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FLD_ENUM_ITEM_ID`),
  KEY `FK83A6A84AFD2EA299` (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_fld_group`
--

CREATE TABLE IF NOT EXISTS `blc_fld_group` (
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `INIT_COLLAPSED_FLAG` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`FLD_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_fld_group`
--

INSERT INTO `blc_fld_group` (`FLD_GROUP_ID`, `INIT_COLLAPSED_FLAG`, `NAME`) VALUES
(-3, 0, 'None'),
(1, 0, 'Content'),
(4, 0, 'Ad Fields'),
(5, 0, 'HTML Fields'),
(6, 0, 'Message Fields');

-- --------------------------------------------------------

--
-- Table structure for table `blc_fulfillment_group`
--

CREATE TABLE IF NOT EXISTS `blc_fulfillment_group` (
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `DELIVERY_INSTRUCTION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `PRICE` decimal(19,5) DEFAULT NULL,
  `SHIPPING_PRICE_TAXABLE` tinyint(1) DEFAULT NULL,
  `MERCHANDISE_TOTAL` decimal(19,5) DEFAULT NULL,
  `METHOD` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `IS_PRIMARY` tinyint(1) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_SEQUNCE` int(11) DEFAULT NULL,
  `SERVICE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SHIPPING_OVERRIDE` tinyint(1) DEFAULT NULL,
  `STATUS` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TOTAL` decimal(19,5) DEFAULT NULL,
  `TOTAL_FEE_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_FG_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_ITEM_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,5) DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  `PERSONAL_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `PHONE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_ID`),
  KEY `FG_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `FG_METHOD_INDEX` (`METHOD`),
  KEY `FG_ORDER_INDEX` (`ORDER_ID`),
  KEY `FG_MESSAGE_INDEX` (`PERSONAL_MESSAGE_ID`),
  KEY `FG_PHONE_INDEX` (`PHONE_ID`),
  KEY `FG_PRIMARY_INDEX` (`IS_PRIMARY`),
  KEY `FG_REFERENCE_INDEX` (`REFERENCE_NUMBER`),
  KEY `FG_SERVICE_INDEX` (`SERVICE`),
  KEY `FG_STATUS_INDEX` (`STATUS`),
  KEY `FKC5B9EF18C13085DD` (`ADDRESS_ID`),
  KEY `FKC5B9EF1881F34C7F` (`FULFILLMENT_OPTION_ID`),
  KEY `FKC5B9EF1889FE8A02` (`ORDER_ID`),
  KEY `FKC5B9EF1877F565E1` (`PERSONAL_MESSAGE_ID`),
  KEY `FKC5B9EF18D894CB5D` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_fulfillment_group_fee`
--

CREATE TABLE IF NOT EXISTS `blc_fulfillment_group_fee` (
  `FULFILLMENT_GROUP_FEE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `FEE_TAXABLE_FLAG` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `REPORTING_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TOTAL_FEE_TAX` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_FEE_ID`),
  KEY `FK6AA8E1BF5028DC55` (`FULFILLMENT_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_fulfillment_group_item`
--

CREATE TABLE IF NOT EXISTS `blc_fulfillment_group_item` (
  `FULFILLMENT_GROUP_ITEM_ID` bigint(20) NOT NULL,
  `PRORATED_ORDER_ADJ` decimal(19,2) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `STATUS` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TOTAL_ITEM_AMOUNT` decimal(19,5) DEFAULT NULL,
  `TOTAL_ITEM_TAXABLE_AMOUNT` decimal(19,5) DEFAULT NULL,
  `TOTAL_ITEM_TAX` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_ITEM_ID`),
  KEY `FGITEM_FG_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `FGITEM_STATUS_INDEX` (`STATUS`),
  KEY `FKEA74EBDA5028DC55` (`FULFILLMENT_GROUP_ID`),
  KEY `FKEA74EBDA9AF166DF` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_fulfillment_option`
--

CREATE TABLE IF NOT EXISTS `blc_fulfillment_option` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  `FULFILLMENT_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `LONG_DESCRIPTION` longtext COLLATE utf8_vietnamese_ci,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TAX_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TAXABLE` tinyint(1) DEFAULT NULL,
  `USE_FLAT_RATES` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_fulfillment_option`
--

INSERT INTO `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`, `FULFILLMENT_TYPE`, `LONG_DESCRIPTION`, `NAME`, `TAX_CODE`, `TAXABLE`, `USE_FLAT_RATES`) VALUES
(1, 'PHYSICAL_SHIP', '5 - 7 Days', 'Standard', NULL, NULL, 0),
(2, 'PHYSICAL_SHIP', '3 - 5 Days', 'Priority', NULL, NULL, 0),
(3, 'PHYSICAL_SHIP', '1 - 2 Days', 'Express', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `blc_fulfillment_option_fixed`
--

CREATE TABLE IF NOT EXISTS `blc_fulfillment_option_fixed` (
  `PRICE` decimal(19,5) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  `CURRENCY_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FK408360313E2FC4F9` (`CURRENCY_CODE`),
  KEY `FK4083603181F34C7F` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_fulfillment_option_fixed`
--

INSERT INTO `blc_fulfillment_option_fixed` (`PRICE`, `FULFILLMENT_OPTION_ID`, `CURRENCY_CODE`) VALUES
('5.00000', 1, NULL),
('10.00000', 2, NULL),
('20.00000', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blc_fulfillment_opt_banded_prc`
--

CREATE TABLE IF NOT EXISTS `blc_fulfillment_opt_banded_prc` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FKB1FD71E981F34C7F` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_fulfillment_opt_banded_wgt`
--

CREATE TABLE IF NOT EXISTS `blc_fulfillment_opt_banded_wgt` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FKB1FD8AEC81F34C7F` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_fulfillment_price_band`
--

CREATE TABLE IF NOT EXISTS `blc_fulfillment_price_band` (
  `FULFILLMENT_PRICE_BAND_ID` bigint(20) NOT NULL,
  `RESULT_AMOUNT` decimal(19,5) NOT NULL,
  `RESULT_AMOUNT_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `RETAIL_PRICE_MINIMUM_AMOUNT` decimal(19,5) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_PRICE_BAND_ID`),
  KEY `FK46C9EA726CDF59CA` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_fulfillment_weight_band`
--

CREATE TABLE IF NOT EXISTS `blc_fulfillment_weight_band` (
  `FULFILLMENT_WEIGHT_BAND_ID` bigint(20) NOT NULL,
  `RESULT_AMOUNT` decimal(19,5) NOT NULL,
  `RESULT_AMOUNT_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `MINIMUM_WEIGHT` decimal(19,5) DEFAULT NULL,
  `WEIGHT_UNIT_OF_MEASURE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_WEIGHT_BAND_ID`),
  KEY `FK6A048D95A0B429C3` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_giftwrap_order_item`
--

CREATE TABLE IF NOT EXISTS `blc_giftwrap_order_item` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FKE1BE1563B76B9466` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_gift_card_payment`
--

CREATE TABLE IF NOT EXISTS `blc_gift_card_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `PAN` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `PIN` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `GIFTCARD_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_id_generation`
--

CREATE TABLE IF NOT EXISTS `blc_id_generation` (
  `ID_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `BATCH_SIZE` bigint(20) NOT NULL,
  `BATCH_START` bigint(20) NOT NULL,
  `ID_MIN` bigint(20) DEFAULT NULL,
  `ID_MAX` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_id_generation`
--

INSERT INTO `blc_id_generation` (`ID_TYPE`, `BATCH_SIZE`, `BATCH_START`, `ID_MIN`, `ID_MAX`, `version`) VALUES
('org.broadleafcommerce.profile.core.domain.Customer', 100, 100, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blc_img_static_asset`
--

CREATE TABLE IF NOT EXISTS `blc_img_static_asset` (
  `HEIGHT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`),
  KEY `FKCC4B772167F70B63` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_item_offer_qualifier`
--

CREATE TABLE IF NOT EXISTS `blc_item_offer_qualifier` (
  `ITEM_OFFER_QUALIFIER_ID` bigint(20) NOT NULL,
  `QUANTITY` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ITEM_OFFER_QUALIFIER_ID`),
  KEY `FKD9C50C61D5F3FAF4` (`OFFER_ID`),
  KEY `FKD9C50C619AF166DF` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_locale`
--

CREATE TABLE IF NOT EXISTS `blc_locale` (
  `LOCALE_CODE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `DEFAULT_FLAG` tinyint(1) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `USE_IN_SEARCH_INDEX` tinyint(1) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`LOCALE_CODE`),
  KEY `FK56C7DC203E2FC4F9` (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_locale`
--

INSERT INTO `blc_locale` (`LOCALE_CODE`, `DEFAULT_FLAG`, `FRIENDLY_NAME`, `USE_IN_SEARCH_INDEX`, `CURRENCY_CODE`) VALUES
('en', 0, 'English', NULL, 'USD'),
('en_GB', 0, 'English (United Kingdom)', NULL, 'GBP'),
('en_US', 1, 'English US', NULL, 'USD'),
('es', 0, 'Spanish', NULL, 'EUR'),
('es_ES', 0, 'Spanish (Spain)', NULL, 'EUR'),
('es_MX', 0, 'Spanish (Mexico)', NULL, 'MXN'),
('fr', 0, 'French', NULL, 'EUR'),
('fr_FR', 0, 'French (France)', NULL, 'EUR');

-- --------------------------------------------------------

--
-- Table structure for table `blc_media`
--

CREATE TABLE IF NOT EXISTS `blc_media` (
  `MEDIA_ID` bigint(20) NOT NULL,
  `ALT_TEXT` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`MEDIA_ID`),
  KEY `MEDIA_TITLE_INDEX` (`TITLE`),
  KEY `MEDIA_URL_INDEX` (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_media`
--

INSERT INTO `blc_media` (`MEDIA_ID`, `ALT_TEXT`, `TAGS`, `TITLE`, `URL`) VALUES
(101, 'primary', NULL, 'Sudden Death Sauce Bottle', '/cmsstatic/img/sauces/Sudden-Death-Sauce-Bottle.jpg'),
(102, 'alt1', NULL, 'Sudden Death Sauce Close-up', '/cmsstatic/img/sauces/Sudden-Death-Sauce-Close.jpg'),
(201, 'primary', NULL, 'Sweet Death Sauce Bottle', '/cmsstatic/img/sauces/Sweet-Death-Sauce-Bottle.jpg'),
(202, 'alt1', NULL, 'Sweet Death Sauce Close-up', '/cmsstatic/img/sauces/Sweet-Death-Sauce-Close.jpg'),
(203, 'alt2', NULL, 'Sweet Death Sauce Close-up', '/cmsstatic/img/sauces/Sweet-Death-Sauce-Skull.jpg'),
(204, 'alt3', NULL, 'Sweet Death Sauce Close-up', '/cmsstatic/img/sauces/Sweet-Death-Sauce-Tile.jpg'),
(205, 'alt4', NULL, 'Sweet Death Sauce Close-up', '/cmsstatic/img/sauces/Sweet-Death-Sauce-Grass.jpg'),
(206, 'alt5', NULL, 'Sweet Death Sauce Close-up', '/cmsstatic/img/sauces/Sweet-Death-Sauce-Logo.jpg'),
(301, 'primary', NULL, 'Hoppin Hot Sauce Bottle', '/cmsstatic/img/sauces/Hoppin-Hot-Sauce-Bottle.jpg'),
(302, 'alt1', NULL, 'Hoppin Hot Sauce Close-up', '/cmsstatic/img/sauces/Hoppin-Hot-Sauce-Close.jpg'),
(401, 'primary', NULL, 'Day of the Dead Chipotle Hot Sauce Bottle', '/cmsstatic/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Bottle.jpg'),
(402, 'alt1', NULL, 'Day of the Dead Chipotle Hot Sauce Close-up', '/cmsstatic/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Close.jpg'),
(501, 'primary', NULL, 'Day of the Dead Habanero Hot Sauce Bottle', '/cmsstatic/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Bottle.jpg'),
(502, 'alt1', NULL, 'Day of the Dead Habanero Hot Sauce Close-up', '/cmsstatic/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Close.jpg'),
(601, 'primary', NULL, 'Day of the Dead Scotch Bonnet Hot Sauce Bottle', '/cmsstatic/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Bottle.jpg'),
(602, 'alt1', NULL, 'Day of the Dead Scotch Bonnet Hot Sauce Close-up', '/cmsstatic/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Close.jpg'),
(701, 'primary', NULL, 'Green Ghost Bottle', '/cmsstatic/img/sauces/Green-Ghost-Bottle.jpg'),
(702, 'alt1', NULL, 'Green Ghost Close-up', '/cmsstatic/img/sauces/Green-Ghost-Close.jpg'),
(801, 'primary', NULL, 'Blazin Saddle XXX Hot Habanero Pepper Sauce Bottle', '/cmsstatic/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Bottle.jpg'),
(802, 'alt1', NULL, 'Blazin Saddle XXX Hot Habanero Pepper Sauce Close-up', '/cmsstatic/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Close.jpg'),
(901, 'primary', NULL, 'Armageddon The Hot Sauce To End All Bottle', '/cmsstatic/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Bottle.jpg'),
(902, 'alt1', NULL, 'Armageddon The Hot Sauce To End All Close-up', '/cmsstatic/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Close.jpg'),
(1001, 'primary', NULL, 'Dr. Chilemeisters Insane Hot Sauce Bottle', '/cmsstatic/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Bottle.jpg'),
(1002, 'alt1', NULL, 'Dr. Chilemeisters Insane Hot Sauce Close-up', '/cmsstatic/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Close.jpg'),
(1101, 'primary', NULL, 'Bull Snort Cowboy Cayenne Pepper Hot Sauce Bottle', '/cmsstatic/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Bottle.jpg'),
(1102, 'alt1', NULL, 'Bull Snort Cowboy Cayenne Pepper Hot Sauce Close-up', '/cmsstatic/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Close.jpg'),
(1201, 'primary', NULL, 'Cafe Louisiane Sweet Cajun Blackening Sauce Bottle', '/cmsstatic/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Bottle.jpg'),
(1202, 'alt1', NULL, 'Cafe Louisiane Sweet Cajun Blackening Sauce Close-up', '/cmsstatic/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Close.jpg'),
(1301, 'primary', NULL, 'Bull Snort Smokin Toncils Hot Sauce Bottle', '/cmsstatic/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Bottle.jpg'),
(1302, 'alt1', NULL, 'Bull Snort Smokin Toncils Hot Sauce Close-up', '/cmsstatic/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Close.jpg'),
(1401, 'primary', NULL, 'Cool Cayenne Pepper Hot Sauce Bottle', '/cmsstatic/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Bottle.jpg'),
(1402, 'alt1', NULL, 'Cool Cayenne Pepper Hot Sauce Close-up', '/cmsstatic/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Close.jpg'),
(1501, 'primary', NULL, 'Roasted Garlic Hot Sauce Bottle', '/cmsstatic/img/sauces/Roasted-Garlic-Hot-Sauce-Bottle.jpg'),
(1502, 'alt1', NULL, 'Roasted Garlic Hot Sauce Close-up', '/cmsstatic/img/sauces/Roasted-Garlic-Hot-Sauce-Close.jpg'),
(1601, 'primary', NULL, 'Scotch Bonnet Hot Sauce Bottle', '/cmsstatic/img/sauces/Scotch-Bonnet-Hot-Sauce-Bottle.jpg'),
(1602, 'alt1', NULL, 'Scotch Bonnet Hot Sauce Close-up', '/cmsstatic/img/sauces/Scotch-Bonnet-Hot-Sauce-Close.jpg'),
(1701, 'primary', NULL, 'Insanity Sauce Bottle', '/cmsstatic/img/sauces/Insanity-Sauce-Bottle.jpg'),
(1702, 'alt1', NULL, 'Insanity Sauce Close-up', '/cmsstatic/img/sauces/Insanity-Sauce-Close.jpg'),
(1801, 'primary', NULL, 'Hurtin Jalepeno Hot Sauce Bottle', '/cmsstatic/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Bottle.jpg'),
(1802, 'alt1', NULL, 'Hurtin Jalepeno Hot Sauce Close-up', '/cmsstatic/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Close.jpg'),
(1901, 'primary', NULL, 'Roasted Red Pepper and Chipotle Hot Sauce Bottle', '/cmsstatic/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Bottle.jpg'),
(1902, 'alt1', NULL, 'Roasted Red Pepper and Chipotle Hot Sauce Close-up', '/cmsstatic/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Close.jpg'),
(10001, 'primary', 'Black', 'Hawt Like a Habanero Men''s Black', '/cmsstatic/img/merch/habanero_mens_black.jpg'),
(10002, 'primary', 'Red', 'Hawt Like a Habanero Men''s Red', '/cmsstatic/img/merch/habanero_mens_red.jpg'),
(10003, 'primary', 'Silver', 'Hawt Like a Habanero Men''s Silver', '/cmsstatic/img/merch/habanero_mens_silver.jpg'),
(20001, 'primary', 'Black', 'Hawt Like a Habanero Women''s Black', '/cmsstatic/img/merch/habanero_womens_black.jpg'),
(20002, 'primary', 'Red', 'Hawt Like a Habanero Women''s Red', '/cmsstatic/img/merch/habanero_womens_red.jpg'),
(20003, 'primary', 'Silver', 'Hawt Like a Habanero Women''s Silver', '/cmsstatic/img/merch/habanero_womens_silver.jpg'),
(30001, 'primary', 'Black', 'Heat Clinic Hand-Drawn Men''s Black', '/cmsstatic/img/merch/heat_clinic_handdrawn_mens_black.jpg'),
(30002, 'primary', 'Red', 'Heat Clinic Hand-Drawn Men''s Red', '/cmsstatic/img/merch/heat_clinic_handdrawn_mens_red.jpg'),
(30003, 'primary', 'Silver', 'Heat Clinic Hand-Drawn Men''s Silver', '/cmsstatic/img/merch/heat_clinic_handdrawn_mens_silver.jpg'),
(40001, 'primary', 'Black', 'Heat Clinic Hand-Drawn Women''s Black', '/cmsstatic/img/merch/heat_clinic_handdrawn_womens_black.jpg'),
(40002, 'primary', 'Red', 'Heat Clinic Hand-Drawn Women''s Red', '/cmsstatic/img/merch/heat_clinic_handdrawn_womens_red.jpg'),
(40003, 'primary', 'Silver', 'Heat Clinic Hand-Drawn Women''s Silver', '/cmsstatic/img/merch/heat_clinic_handdrawn_womens_silver.jpg'),
(50001, 'primary', 'Black', 'Heat Clinic Mascot Men''s Black', '/cmsstatic/img/merch/heat_clinic_mascot_mens_black.jpg'),
(50002, 'primary', 'Red', 'Heat Clinic Mascot Men''s Red', '/cmsstatic/img/merch/heat_clinic_mascot_mens_red.jpg'),
(50003, 'primary', 'Silver', 'Heat Clinic Mascot Men''s Silver', '/cmsstatic/img/merch/heat_clinic_mascot_mens_silver.jpg'),
(60001, 'primary', 'Black', 'Heat Clinic Mascot Women''s Black', '/cmsstatic/img/merch/heat_clinic_mascot_womens_black.jpg'),
(60002, 'primary', 'Red', 'Heat Clinic Mascot Women''s Red', '/cmsstatic/img/merch/heat_clinic_mascot_womens_red.jpg'),
(60003, 'primary', 'Silver', 'Heat Clinic Mascot Women''s Silver', '/cmsstatic/img/merch/heat_clinic_mascot_womens_silver.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `blc_module_configuration`
--

CREATE TABLE IF NOT EXISTS `blc_module_configuration` (
  `MODULE_CONFIG_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `ARCHIVED` char(1) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `CONFIG_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `IS_DEFAULT` tinyint(1) NOT NULL,
  `MODULE_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `MODULE_PRIORITY` int(11) NOT NULL,
  PRIMARY KEY (`MODULE_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_module_configuration`
--

INSERT INTO `blc_module_configuration` (`MODULE_CONFIG_ID`, `ACTIVE_END_DATE`, `ACTIVE_START_DATE`, `ARCHIVED`, `CREATED_BY`, `DATE_CREATED`, `DATE_UPDATED`, `UPDATED_BY`, `CONFIG_TYPE`, `IS_DEFAULT`, `MODULE_NAME`, `MODULE_PRIORITY`) VALUES
(-1, NULL, '2014-06-29 19:39:39', NULL, NULL, NULL, NULL, NULL, 'SITE_MAP', 1, 'SITE_MAP', 100);

-- --------------------------------------------------------

--
-- Table structure for table `blc_offer`
--

CREATE TABLE IF NOT EXISTS `blc_offer` (
  `OFFER_ID` bigint(20) NOT NULL,
  `APPLIES_WHEN_RULES` longtext COLLATE utf8_vietnamese_ci,
  `APPLIES_TO_RULES` longtext COLLATE utf8_vietnamese_ci,
  `APPLY_OFFER_TO_MARKED_ITEMS` tinyint(1) DEFAULT NULL,
  `APPLY_TO_SALE_PRICE` tinyint(1) DEFAULT NULL,
  `ARCHIVED` char(1) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `AUTOMATICALLY_ADDED` tinyint(1) DEFAULT NULL,
  `COMBINABLE_WITH_OTHER_OFFERS` tinyint(1) DEFAULT NULL,
  `OFFER_DELIVERY_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `OFFER_DESCRIPTION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `OFFER_DISCOUNT_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `MARKETING_MESSASGE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `MAX_USES_PER_CUSTOMER` bigint(20) DEFAULT NULL,
  `MAX_USES` int(11) DEFAULT NULL,
  `OFFER_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `OFFER_ITEM_QUALIFIER_RULE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `OFFER_ITEM_TARGET_RULE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `OFFER_PRIORITY` int(11) DEFAULT NULL,
  `QUALIFYING_ITEM_MIN_TOTAL` decimal(19,5) DEFAULT NULL,
  `REQUIRES_RELATED_TAR_QUAL` tinyint(1) DEFAULT NULL,
  `STACKABLE` tinyint(1) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `TARGET_SYSTEM` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TOTALITARIAN_OFFER` tinyint(1) DEFAULT NULL,
  `USE_NEW_FORMAT` tinyint(1) DEFAULT NULL,
  `OFFER_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `USES` int(11) DEFAULT NULL,
  `OFFER_VALUE` decimal(19,5) NOT NULL,
  PRIMARY KEY (`OFFER_ID`),
  KEY `OFFER_DISCOUNT_INDEX` (`OFFER_DISCOUNT_TYPE`),
  KEY `OFFER_MARKETING_MESSAGE_INDEX` (`MARKETING_MESSASGE`),
  KEY `OFFER_NAME_INDEX` (`OFFER_NAME`),
  KEY `OFFER_TYPE_INDEX` (`OFFER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_offer`
--

INSERT INTO `blc_offer` (`OFFER_ID`, `APPLIES_WHEN_RULES`, `APPLIES_TO_RULES`, `APPLY_OFFER_TO_MARKED_ITEMS`, `APPLY_TO_SALE_PRICE`, `ARCHIVED`, `AUTOMATICALLY_ADDED`, `COMBINABLE_WITH_OTHER_OFFERS`, `OFFER_DELIVERY_TYPE`, `OFFER_DESCRIPTION`, `OFFER_DISCOUNT_TYPE`, `END_DATE`, `MARKETING_MESSASGE`, `MAX_USES_PER_CUSTOMER`, `MAX_USES`, `OFFER_NAME`, `OFFER_ITEM_QUALIFIER_RULE`, `OFFER_ITEM_TARGET_RULE`, `OFFER_PRIORITY`, `QUALIFYING_ITEM_MIN_TOTAL`, `REQUIRES_RELATED_TAR_QUAL`, `STACKABLE`, `START_DATE`, `TARGET_SYSTEM`, `TOTALITARIAN_OFFER`, `USE_NEW_FORMAT`, `OFFER_TYPE`, `USES`, `OFFER_VALUE`) VALUES
(1, NULL, NULL, 0, 0, NULL, NULL, 1, 'AUTOMATIC', NULL, 'PERCENT_OFF', '2020-01-01 00:00:00', NULL, NULL, 0, 'Shirts Special', NULL, NULL, 10, NULL, NULL, 1, '2014-06-29 00:00:00', NULL, NULL, NULL, 'ORDER_ITEM', 0, '20.00000');

-- --------------------------------------------------------

--
-- Table structure for table `blc_offer_audit`
--

CREATE TABLE IF NOT EXISTS `blc_offer_audit` (
  `OFFER_AUDIT_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  `OFFER_CODE_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `REDEEMED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`OFFER_AUDIT_ID`),
  KEY `OFFERAUDIT_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `OFFERAUDIT_OFFER_CODE_INDEX` (`OFFER_CODE_ID`),
  KEY `OFFERAUDIT_OFFER_INDEX` (`OFFER_ID`),
  KEY `OFFERAUDIT_ORDER_INDEX` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_offer_code`
--

CREATE TABLE IF NOT EXISTS `blc_offer_code` (
  `OFFER_CODE_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `MAX_USES` int(11) DEFAULT NULL,
  `OFFER_CODE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `USES` int(11) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_CODE_ID`),
  KEY `OFFERCODE_OFFER_INDEX` (`OFFER_ID`),
  KEY `OFFERCODE_CODE_INDEX` (`OFFER_CODE`),
  KEY `FK76B8C8D6D5F3FAF4` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_offer_info`
--

CREATE TABLE IF NOT EXISTS `blc_offer_info` (
  `OFFER_INFO_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_offer_info_fields`
--

CREATE TABLE IF NOT EXISTS `blc_offer_info_fields` (
  `OFFER_INFO_FIELDS_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FIELD_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`OFFER_INFO_FIELDS_ID`,`FIELD_NAME`),
  KEY `FKA901886183AE7237` (`OFFER_INFO_FIELDS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_offer_item_criteria`
--

CREATE TABLE IF NOT EXISTS `blc_offer_item_criteria` (
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext COLLATE utf8_vietnamese_ci,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`OFFER_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_offer_item_criteria`
--

INSERT INTO `blc_offer_item_criteria` (`OFFER_ITEM_CRITERIA_ID`, `ORDER_ITEM_MATCH_RULE`, `QUANTITY`) VALUES
(1, 'MVEL.eval("toUpperCase()",discreteOrderItem.category.name)==MVEL.eval("toUpperCase()","merchandise")', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blc_offer_rule`
--

CREATE TABLE IF NOT EXISTS `blc_offer_rule` (
  `OFFER_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext COLLATE utf8_vietnamese_ci,
  PRIMARY KEY (`OFFER_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_offer_rule_map`
--

CREATE TABLE IF NOT EXISTS `blc_offer_rule_map` (
  `BLC_OFFER_OFFER_ID` bigint(20) NOT NULL,
  `OFFER_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`BLC_OFFER_OFFER_ID`,`MAP_KEY`),
  KEY `FKCA468FE2C11A218D` (`OFFER_RULE_ID`),
  KEY `FKCA468FE245C66D1D` (`BLC_OFFER_OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_order`
--

CREATE TABLE IF NOT EXISTS `blc_order` (
  `ORDER_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ORDER_NUMBER` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `IS_PREVIEW` tinyint(1) DEFAULT NULL,
  `ORDER_STATUS` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ORDER_SUBTOTAL` decimal(19,5) DEFAULT NULL,
  `SUBMIT_DATE` datetime DEFAULT NULL,
  `TAX_OVERRIDE` tinyint(1) DEFAULT NULL,
  `ORDER_TOTAL` decimal(19,5) DEFAULT NULL,
  `TOTAL_SHIPPING` decimal(19,5) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,5) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `LOCALE_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `ORDER_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `ORDER_EMAIL_INDEX` (`EMAIL_ADDRESS`),
  KEY `ORDER_NAME_INDEX` (`NAME`),
  KEY `ORDER_NUMBER_INDEX` (`ORDER_NUMBER`),
  KEY `ORDER_STATUS_INDEX` (`ORDER_STATUS`),
  KEY `FK8F5B64A83E2FC4F9` (`CURRENCY_CODE`),
  KEY `FK8F5B64A87470F437` (`CUSTOMER_ID`),
  KEY `FK8F5B64A8A1E1C128` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_order_adjustment`
--

CREATE TABLE IF NOT EXISTS `blc_order_adjustment` (
  `ORDER_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `ADJUSTMENT_REASON` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ADJUSTMENT_ID`),
  KEY `ORDERADJUST_OFFER_INDEX` (`OFFER_ID`),
  KEY `ORDERADJUST_ORDER_INDEX` (`ORDER_ID`),
  KEY `FK1E92D164D5F3FAF4` (`OFFER_ID`),
  KEY `FK1E92D16489FE8A02` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_order_attribute`
--

CREATE TABLE IF NOT EXISTS `blc_order_attribute` (
  `ORDER_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ATTRIBUTE_ID`),
  KEY `FKB3A467A589FE8A02` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_order_item`
--

CREATE TABLE IF NOT EXISTS `blc_order_item` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `DISCOUNTS_ALLOWED` tinyint(1) DEFAULT NULL,
  `ITEM_TAXABLE_FLAG` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ORDER_ITEM_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `PRICE` decimal(19,5) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `RETAIL_PRICE_OVERRIDE` tinyint(1) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE_OVERRIDE` tinyint(1) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,2) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `GIFT_WRAP_ITEM_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `PARENT_ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  `PERSONAL_MESSAGE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `ORDERITEM_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `ORDERITEM_GIFT_INDEX` (`GIFT_WRAP_ITEM_ID`),
  KEY `ORDERITEM_ORDER_INDEX` (`ORDER_ID`),
  KEY `ORDERITEM_TYPE_INDEX` (`ORDER_ITEM_TYPE`),
  KEY `ORDERITEM_PARENT_INDEX` (`PARENT_ORDER_ITEM_ID`),
  KEY `ORDERITEM_MESSAGE_INDEX` (`PERSONAL_MESSAGE_ID`),
  KEY `FK9A2E704A15D1A13D` (`CATEGORY_ID`),
  KEY `FK9A2E704AFD2F1F10` (`GIFT_WRAP_ITEM_ID`),
  KEY `FK9A2E704A89FE8A02` (`ORDER_ID`),
  KEY `FK9A2E704AB0B0D00A` (`PARENT_ORDER_ITEM_ID`),
  KEY `FK9A2E704A77F565E1` (`PERSONAL_MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_order_item_add_attr`
--

CREATE TABLE IF NOT EXISTS `blc_order_item_add_attr` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`,`NAME`),
  KEY `FKA466AB44B76B9466` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_order_item_adjustment`
--

CREATE TABLE IF NOT EXISTS `blc_order_item_adjustment` (
  `ORDER_ITEM_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `APPLIED_TO_SALE_PRICE` tinyint(1) DEFAULT NULL,
  `ADJUSTMENT_REASON` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ADJUSTMENT_ID`),
  KEY `OIADJUST_OFFER_INDEX` (`OFFER_ID`),
  KEY `OIADJUST_ITEM_INDEX` (`ORDER_ITEM_ID`),
  KEY `FKA2658C82D5F3FAF4` (`OFFER_ID`),
  KEY `FKA2658C829AF166DF` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_order_item_attribute`
--

CREATE TABLE IF NOT EXISTS `blc_order_item_attribute` (
  `ORDER_ITEM_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ATTRIBUTE_ID`),
  KEY `FK9F1ED0C79AF166DF` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_order_item_dtl_adj`
--

CREATE TABLE IF NOT EXISTS `blc_order_item_dtl_adj` (
  `ORDER_ITEM_DTL_ADJ_ID` bigint(20) NOT NULL,
  `APPLIED_TO_SALE_PRICE` tinyint(1) DEFAULT NULL,
  `OFFER_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ADJUSTMENT_REASON` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_PRICE_DTL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_DTL_ADJ_ID`),
  KEY `FK85F0248FD5F3FAF4` (`OFFER_ID`),
  KEY `FK85F0248FD4AEA2C0` (`ORDER_ITEM_PRICE_DTL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_order_item_price_dtl`
--

CREATE TABLE IF NOT EXISTS `blc_order_item_price_dtl` (
  `ORDER_ITEM_PRICE_DTL_ID` bigint(20) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `USE_SALE_PRICE` tinyint(1) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_PRICE_DTL_ID`),
  KEY `FK1FB64BF19AF166DF` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_order_multiship_option`
--

CREATE TABLE IF NOT EXISTS `blc_order_multiship_option` (
  `ORDER_MULTISHIP_OPTION_ID` bigint(20) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_MULTISHIP_OPTION_ID`),
  KEY `MULTISHIP_OPTION_ORDER_INDEX` (`ORDER_ID`),
  KEY `FKB3D3F7D6C13085DD` (`ADDRESS_ID`),
  KEY `FKB3D3F7D681F34C7F` (`FULFILLMENT_OPTION_ID`),
  KEY `FKB3D3F7D689FE8A02` (`ORDER_ID`),
  KEY `FKB3D3F7D69AF166DF` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_order_offer_code_xref`
--

CREATE TABLE IF NOT EXISTS `blc_order_offer_code_xref` (
  `ORDER_ID` bigint(20) NOT NULL,
  `OFFER_CODE_ID` bigint(20) NOT NULL,
  KEY `FKFDF0E8533BB10F6D` (`OFFER_CODE_ID`),
  KEY `FKFDF0E85389FE8A02` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_order_payment`
--

CREATE TABLE IF NOT EXISTS `blc_order_payment` (
  `ORDER_PAYMENT_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `ARCHIVED` char(1) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `GATEWAY_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_PAYMENT_ID`),
  KEY `ORDERPAYMENT_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `ORDERPAYMENT_ORDER_INDEX` (`ORDER_ID`),
  KEY `ORDERPAYMENT_REFERENCE_INDEX` (`REFERENCE_NUMBER`),
  KEY `ORDERPAYMENT_TYPE_INDEX` (`PAYMENT_TYPE`),
  KEY `FK9517A14FC13085DD` (`ADDRESS_ID`),
  KEY `FK9517A14F89FE8A02` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_order_payment_transaction`
--

CREATE TABLE IF NOT EXISTS `blc_order_payment_transaction` (
  `PAYMENT_TRANSACTION_ID` bigint(20) NOT NULL,
  `TRANSACTION_AMOUNT` decimal(19,2) DEFAULT NULL,
  `ARCHIVED` char(1) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CUSTOMER_IP_ADDRESS` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DATE_RECORDED` datetime DEFAULT NULL,
  `RAW_RESPONSE` longtext COLLATE utf8_vietnamese_ci,
  `SUCCESS` tinyint(1) DEFAULT NULL,
  `TRANSACTION_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ORDER_PAYMENT` bigint(20) NOT NULL,
  `PARENT_TRANSACTION` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_TRANSACTION_ID`),
  KEY `FK86FDE7CE6A69DD9D` (`ORDER_PAYMENT`),
  KEY `FK86FDE7CEE1B66C71` (`PARENT_TRANSACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_page`
--

CREATE TABLE IF NOT EXISTS `blc_page` (
  `PAGE_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `EXCLUDE_FROM_SITE_MAP` tinyint(1) DEFAULT NULL,
  `FULL_URL` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `OFFLINE_FLAG` tinyint(1) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PAGE_TMPLT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAGE_ID`),
  KEY `PAGE_FULL_URL_INDEX` (`FULL_URL`),
  KEY `FKF41BEDD5D49D3961` (`PAGE_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_page`
--

INSERT INTO `blc_page` (`PAGE_ID`, `CREATED_BY`, `DATE_CREATED`, `DATE_UPDATED`, `UPDATED_BY`, `DESCRIPTION`, `EXCLUDE_FROM_SITE_MAP`, `FULL_URL`, `OFFLINE_FLAG`, `PRIORITY`, `PAGE_TMPLT_ID`) VALUES
(1, NULL, NULL, NULL, NULL, 'About Us', NULL, '/about_us', NULL, NULL, 1),
(2, NULL, NULL, NULL, NULL, 'FAQ', NULL, '/faq', NULL, NULL, 1),
(3, NULL, NULL, NULL, NULL, 'New to Hot Sauce', NULL, '/new-to-hot-sauce', NULL, NULL, 1),
(10, NULL, NULL, NULL, NULL, 'Prueba de Contenido', NULL, '/about_us', NULL, NULL, 2),
(11, NULL, NULL, NULL, NULL, 'FAQ', NULL, '/faq', NULL, NULL, 2),
(13, NULL, NULL, NULL, NULL, 'New to Hot Sauce', NULL, '/new-to-hot-sauce', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `blc_page_fld`
--

CREATE TABLE IF NOT EXISTS `blc_page_fld` (
  `PAGE_FLD_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `FLD_KEY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LOB_VALUE` longtext COLLATE utf8_vietnamese_ci,
  `VALUE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`PAGE_FLD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_page_fld`
--

INSERT INTO `blc_page_fld` (`PAGE_FLD_ID`, `CREATED_BY`, `DATE_CREATED`, `DATE_UPDATED`, `UPDATED_BY`, `FLD_KEY`, `LOB_VALUE`, `VALUE`) VALUES
(1, NULL, NULL, NULL, NULL, 'body', NULL, 'test content'),
(2, NULL, NULL, NULL, NULL, 'title', NULL, ''),
(3, NULL, NULL, NULL, NULL, 'body', NULL, '<h2 style="text-align:center;">This is an example of a content-managed page.</h2><h4 style="text-align:center;"><a href="http://www.broadleafcommerce.com/features/content">Click Here</a> to see more about Content Management in Broadleaf.</h4>'),
(4, NULL, NULL, NULL, NULL, 'body', NULL, '<h2 style="text-align:center;">This is an example of a content-managed page.</h2>'),
(10, NULL, NULL, NULL, NULL, 'body', NULL, 'prueba de contenido'),
(11, NULL, NULL, NULL, NULL, 'title', NULL, 'Espa&ntilde;ol G&eacute;nerico'),
(12, NULL, NULL, NULL, NULL, 'body', NULL, '<h2 style="text-align:center;">Este es un ejemplo de una p&aacute;gina de contenido-manejado.</h2><h4 style="text-align:center;">Haga <a href="http://www.broadleafcommerce.com/features/content">click aqu&iacute;</a> para mas informaci&oacute;n.</h4>'),
(13, NULL, NULL, NULL, NULL, 'body', NULL, '<h2 style="text-align:center;">Este es un ejemplo de una p&aacute;gina de contenido-manejado.</h2>');

-- --------------------------------------------------------

--
-- Table structure for table `blc_page_fld_map`
--

CREATE TABLE IF NOT EXISTS `blc_page_fld_map` (
  `PAGE_ID` bigint(20) NOT NULL,
  `PAGE_FLD_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`PAGE_ID`,`MAP_KEY`),
  KEY `FKE9EE09515AEDD08A` (`PAGE_FLD_ID`),
  KEY `FKE9EE0951883C2667` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_page_fld_map`
--

INSERT INTO `blc_page_fld_map` (`PAGE_ID`, `PAGE_FLD_ID`, `MAP_KEY`) VALUES
(1, 1, 'body'),
(1, 2, 'title'),
(2, 3, 'body'),
(3, 4, 'body'),
(10, 10, 'body'),
(10, 11, 'title'),
(11, 12, 'body'),
(13, 13, 'body');

-- --------------------------------------------------------

--
-- Table structure for table `blc_page_item_criteria`
--

CREATE TABLE IF NOT EXISTS `blc_page_item_criteria` (
  `PAGE_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext COLLATE utf8_vietnamese_ci,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`PAGE_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_page_rule`
--

CREATE TABLE IF NOT EXISTS `blc_page_rule` (
  `PAGE_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext COLLATE utf8_vietnamese_ci,
  PRIMARY KEY (`PAGE_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_page_rule_map`
--

CREATE TABLE IF NOT EXISTS `blc_page_rule_map` (
  `BLC_PAGE_PAGE_ID` bigint(20) NOT NULL,
  `PAGE_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`BLC_PAGE_PAGE_ID`,`MAP_KEY`),
  KEY `FK1ABA0CA336D91846` (`PAGE_RULE_ID`),
  KEY `FK1ABA0CA3C38455DD` (`BLC_PAGE_PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_page_tmplt`
--

CREATE TABLE IF NOT EXISTS `blc_page_tmplt` (
  `PAGE_TMPLT_ID` bigint(20) NOT NULL,
  `TMPLT_DESCR` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TMPLT_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TMPLT_PATH` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LOCALE_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`PAGE_TMPLT_ID`),
  KEY `FK325C9D5A1E1C128` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_page_tmplt`
--

INSERT INTO `blc_page_tmplt` (`PAGE_TMPLT_ID`, `TMPLT_DESCR`, `TMPLT_NAME`, `TMPLT_PATH`, `LOCALE_CODE`) VALUES
(-3, 'Outputs the body field.', 'NONE', 'NONE', NULL),
(1, 'Provides a basic layout with header and footer surrounding the content and title.', 'Default Template', '/content/default', NULL),
(2, 'This template provides a basic layout with header and footer surrounding the content and title.', 'Basic Spanish Template', '/content/default', 'es');

-- --------------------------------------------------------

--
-- Table structure for table `blc_payment_log`
--

CREATE TABLE IF NOT EXISTS `blc_payment_log` (
  `PAYMENT_LOG_ID` bigint(20) NOT NULL,
  `AMOUNT_PAID` decimal(19,5) DEFAULT NULL,
  `EXCEPTION_MESSAGE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LOG_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `ORDER_PAYMENT_ID` bigint(20) DEFAULT NULL,
  `ORDER_PAYMENT_REF_NUM` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TRANSACTION_SUCCESS` tinyint(1) DEFAULT NULL,
  `TRANSACTION_TIMESTAMP` datetime NOT NULL,
  `TRANSACTION_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `USER_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `CURRENCY_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_LOG_ID`),
  KEY `PAYMENTLOG_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `PAYMENTLOG_LOGTYPE_INDEX` (`LOG_TYPE`),
  KEY `PAYMENTLOG_ORDERPAYMENT_INDEX` (`ORDER_PAYMENT_ID`),
  KEY `PAYMENTLOG_REFERENCE_INDEX` (`ORDER_PAYMENT_REF_NUM`),
  KEY `PAYMENTLOG_TRANTYPE_INDEX` (`TRANSACTION_TYPE`),
  KEY `PAYMENTLOG_USER_INDEX` (`USER_NAME`),
  KEY `FKA43703453E2FC4F9` (`CURRENCY_CODE`),
  KEY `FKA43703457470F437` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_personal_message`
--

CREATE TABLE IF NOT EXISTS `blc_personal_message` (
  `PERSONAL_MESSAGE_ID` bigint(20) NOT NULL,
  `MESSAGE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `MESSAGE_FROM` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `MESSAGE_TO` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `OCCASION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`PERSONAL_MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_pgtmplt_fldgrp_xref`
--

CREATE TABLE IF NOT EXISTS `blc_pgtmplt_fldgrp_xref` (
  `PAGE_TMPLT_ID` bigint(20) NOT NULL,
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `GROUP_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`PAGE_TMPLT_ID`,`GROUP_ORDER`),
  KEY `FK99D625F66A79BDB5` (`FLD_GROUP_ID`),
  KEY `FK99D625F6D49D3961` (`PAGE_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_pgtmplt_fldgrp_xref`
--

INSERT INTO `blc_pgtmplt_fldgrp_xref` (`PAGE_TMPLT_ID`, `FLD_GROUP_ID`, `GROUP_ORDER`) VALUES
(-3, -3, 0),
(1, 1, 0),
(2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `blc_phone`
--

CREATE TABLE IF NOT EXISTS `blc_phone` (
  `PHONE_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `IS_DEFAULT` tinyint(1) DEFAULT NULL,
  `PHONE_NUMBER` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_product`
--

CREATE TABLE IF NOT EXISTS `blc_product` (
  `PRODUCT_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CAN_SELL_WITHOUT_OPTIONS` tinyint(1) DEFAULT NULL,
  `DISPLAY_TEMPLATE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `IS_FEATURED_PRODUCT` tinyint(1) NOT NULL,
  `MANUFACTURE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `MODEL` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `URL_KEY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DEFAULT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  `DEFAULT_SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `PRODUCT_CATEGORY_INDEX` (`DEFAULT_CATEGORY_ID`),
  KEY `PRODUCT_URL_INDEX` (`URL`,`URL_KEY`),
  KEY `FK5B95B7C9DF057C3F` (`DEFAULT_CATEGORY_ID`),
  KEY `FK5B95B7C96D386535` (`DEFAULT_SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_product`
--

INSERT INTO `blc_product` (`PRODUCT_ID`, `ARCHIVED`, `CAN_SELL_WITHOUT_OPTIONS`, `DISPLAY_TEMPLATE`, `IS_FEATURED_PRODUCT`, `MANUFACTURE`, `MODEL`, `URL`, `URL_KEY`, `DEFAULT_CATEGORY_ID`, `DEFAULT_SKU_ID`) VALUES
(1, NULL, NULL, NULL, 1, 'Blair''s', NULL, '/hot-sauces/sudden_death_sauce', NULL, 2002, 1),
(2, NULL, NULL, NULL, 0, 'Blair''s', NULL, '/hot-sauces/sweet_death_sauce', NULL, 2002, 2),
(3, NULL, NULL, NULL, 0, 'Salsa Express', NULL, '/hot-sauces/hoppin_hot_sauce', NULL, 2002, 3),
(4, NULL, NULL, NULL, 0, 'Spice Exchange', NULL, '/hot-sauces/day_of_the_dead_chipotle_hot_sauce', NULL, 2002, 4),
(5, NULL, NULL, NULL, 0, 'Spice Exchange', NULL, '/hot-sauces/day_of_the_dead_habanero_hot_sauce', NULL, 2002, 5),
(6, NULL, NULL, NULL, 0, 'Spice Exchange', NULL, '/hot-sauces/day_of_the_dead_scotch_bonnet_sauce', NULL, 2002, 6),
(7, NULL, NULL, NULL, 0, 'Garden Row', NULL, '/hot-sauces/green_ghost', NULL, 2002, 7),
(8, NULL, NULL, NULL, 0, 'D. L. Jardine''s', NULL, '/hot-sauces/blazin_saddle_hot_habanero_pepper_sauce', NULL, 2002, 8),
(9, NULL, NULL, NULL, 1, 'Figueroa Brothers', NULL, '/hot-sauces/armageddon_hot_sauce_to_end_all', NULL, 2002, 9),
(10, NULL, NULL, NULL, 0, 'Figueroa Brothers', NULL, '/hot-sauces/dr_chilemeisters_insane_hot_sauce', NULL, 2002, 10),
(11, NULL, NULL, NULL, 0, 'Brazos Legends', NULL, '/hot-sauces/bull_snort_cowboy_cayenne_pepper_hot_sauce', NULL, 2002, 11),
(12, NULL, NULL, NULL, 0, 'Garden Row', NULL, '/hot-sauces/cafe_louisiane_sweet_cajun_blackening_sauce', NULL, 2002, 12),
(13, NULL, NULL, NULL, 1, 'Brazos Legends', NULL, '/hot-sauces/bull_snort_smokin_toncils_hot_sauce', NULL, 2002, 13),
(14, NULL, NULL, NULL, 0, 'Dave''s Gourmet', NULL, '/hot-sauces/cool_cayenne_pepper_hot_sauce', NULL, 2002, 14),
(15, NULL, NULL, NULL, 0, 'Dave''s Gourmet', NULL, '/hot-sauces/roasted_garlic_hot_sauce', NULL, 2002, 15),
(16, NULL, NULL, NULL, 0, 'Dave''s Gourmet', NULL, '/hot-sauces/scotch_bonnet_hot_sauce', NULL, 2002, 16),
(17, NULL, NULL, NULL, 0, 'Dave''s Gourmet', NULL, '/hot-sauces/insanity_sauce', NULL, 2002, 17),
(18, NULL, NULL, NULL, 0, 'Dave''s Gourmet', NULL, '/hot-sauces/hurtin_jalepeno_hot_sauce', NULL, 2002, 18),
(19, NULL, NULL, NULL, 0, 'Dave''s Gourmet', NULL, '/hot-sauces/roasted_red_pepper_chipotle_hot_sauce', NULL, 2002, 19),
(100, NULL, NULL, NULL, 0, 'The Heat Clinic', NULL, '/merchandise/hawt_like_a_habanero_mens', NULL, 2003, 100),
(200, NULL, NULL, NULL, 0, 'The Heat Clinic', NULL, '/merchandise/hawt_like_a_habanero_womens', NULL, 2003, 200),
(300, NULL, NULL, NULL, 0, 'The Heat Clinic', NULL, '/merchandise/heat_clinic_hand-drawn_mens', NULL, 2003, 300),
(400, NULL, NULL, NULL, 0, 'The Heat Clinic', NULL, '/merchandise/heat_clinic_hand-drawn_womens', NULL, 2003, 400),
(500, NULL, NULL, NULL, 0, 'The Heat Clinic', NULL, '/merchandise/heat_clinic_mascot_mens', NULL, 2003, 500),
(600, NULL, NULL, NULL, 0, 'The Heat Clinic', NULL, '/merchandise/heat_clinic_mascot_womens', NULL, 2003, 600),
(992, 'N', 0, NULL, 0, NULL, NULL, '/bundle1', NULL, NULL, 9992),
(993, 'N', 0, NULL, 0, NULL, NULL, '/bundle2', NULL, NULL, 9993);

-- --------------------------------------------------------

--
-- Table structure for table `blc_product_attribute`
--

CREATE TABLE IF NOT EXISTS `blc_product_attribute` (
  `PRODUCT_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `SEARCHABLE` tinyint(1) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_ATTRIBUTE_ID`),
  KEY `PRODUCTATTRIBUTE_NAME_INDEX` (`NAME`),
  KEY `PRODUCTATTRIBUTE_INDEX` (`PRODUCT_ID`),
  KEY `FK56CE05865F11A0B7` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_product_attribute`
--

INSERT INTO `blc_product_attribute` (`PRODUCT_ATTRIBUTE_ID`, `NAME`, `SEARCHABLE`, `VALUE`, `PRODUCT_ID`) VALUES
(1, 'heatRange', NULL, '4', 1),
(2, 'heatRange', NULL, '1', 2),
(3, 'heatRange', NULL, '2', 3),
(4, 'heatRange', NULL, '2', 4),
(5, 'heatRange', NULL, '4', 5),
(6, 'heatRange', NULL, '4', 6),
(7, 'heatRange', NULL, '3', 7),
(8, 'heatRange', NULL, '4', 8),
(9, 'heatRange', NULL, '5', 9),
(10, 'heatRange', NULL, '5', 10),
(11, 'heatRange', NULL, '2', 11),
(12, 'heatRange', NULL, '1', 12),
(13, 'heatRange', NULL, '2', 13),
(14, 'heatRange', NULL, '2', 14),
(15, 'heatRange', NULL, '1', 15),
(16, 'heatRange', NULL, '3', 16),
(17, 'heatRange', NULL, '5', 17),
(18, 'heatRange', NULL, '3', 18),
(19, 'heatRange', NULL, '1', 19);

-- --------------------------------------------------------

--
-- Table structure for table `blc_product_bundle`
--

CREATE TABLE IF NOT EXISTS `blc_product_bundle` (
  `AUTO_BUNDLE` tinyint(1) DEFAULT NULL,
  `BUNDLE_PROMOTABLE` tinyint(1) DEFAULT NULL,
  `ITEMS_PROMOTABLE` tinyint(1) DEFAULT NULL,
  `PRICING_MODEL` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `BUNDLE_PRIORITY` int(11) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `FK8CC5B85F11A0B7` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_product_bundle`
--

INSERT INTO `blc_product_bundle` (`AUTO_BUNDLE`, `BUNDLE_PROMOTABLE`, `ITEMS_PROMOTABLE`, `PRICING_MODEL`, `BUNDLE_PRIORITY`, `PRODUCT_ID`) VALUES
(0, 0, 0, 'ITEM_SUM', 99, 992),
(0, 0, 0, 'BUNDLE', 99, 993);

-- --------------------------------------------------------

--
-- Table structure for table `blc_product_cross_sale`
--

CREATE TABLE IF NOT EXISTS `blc_product_cross_sale` (
  `CROSS_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SEQUENCE` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `RELATED_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CROSS_SALE_PRODUCT_ID`),
  KEY `CROSSSALE_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `CROSSSALE_INDEX` (`PRODUCT_ID`),
  KEY `CROSSSALE_RELATED_INDEX` (`RELATED_SALE_PRODUCT_ID`),
  KEY `FK8324FB3C15D1A13D` (`CATEGORY_ID`),
  KEY `FK8324FB3C5F11A0B7` (`PRODUCT_ID`),
  KEY `FK8324FB3C62D84F9B` (`RELATED_SALE_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_product_featured`
--

CREATE TABLE IF NOT EXISTS `blc_product_featured` (
  `FEATURED_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SEQUENCE` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FEATURED_PRODUCT_ID`),
  KEY `PRODFEATURED_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `PRODFEATURED_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `FK4C49FFE415D1A13D` (`CATEGORY_ID`),
  KEY `FK4C49FFE45F11A0B7` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_product_featured`
--

INSERT INTO `blc_product_featured` (`FEATURED_PRODUCT_ID`, `PROMOTION_MESSAGE`, `SEQUENCE`, `CATEGORY_ID`, `PRODUCT_ID`) VALUES
(1, NULL, '1.000000', 1, 18),
(2, NULL, '2.000000', 1, 15),
(3, NULL, '3.000000', 1, 200),
(4, NULL, '4.000000', 1, 100),
(5, NULL, '1.000000', 2003, 4),
(8, NULL, '1.000000', 2002, 500),
(9, NULL, '2.000000', 2002, 200),
(10, NULL, '3.000000', 2002, 300);

-- --------------------------------------------------------

--
-- Table structure for table `blc_product_option`
--

CREATE TABLE IF NOT EXISTS `blc_product_option` (
  `PRODUCT_OPTION_ID` bigint(20) NOT NULL,
  `ATTRIBUTE_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `ERROR_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LABEL` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `VALIDATION_STRATEGY_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `VALIDATION_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `REQUIRED` tinyint(1) DEFAULT NULL,
  `OPTION_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `USE_IN_SKU_GENERATION` tinyint(1) DEFAULT NULL,
  `VALIDATION_STRING` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_product_option`
--

INSERT INTO `blc_product_option` (`PRODUCT_OPTION_ID`, `ATTRIBUTE_NAME`, `DISPLAY_ORDER`, `ERROR_CODE`, `ERROR_MESSAGE`, `LABEL`, `VALIDATION_STRATEGY_TYPE`, `VALIDATION_TYPE`, `REQUIRED`, `OPTION_TYPE`, `USE_IN_SKU_GENERATION`, `VALIDATION_STRING`) VALUES
(1, 'COLOR', NULL, NULL, NULL, 'Shirt Color', NULL, NULL, 1, 'COLOR', NULL, NULL),
(2, 'SIZE', NULL, NULL, NULL, 'Shirt Size', NULL, NULL, 1, 'SIZE', NULL, NULL),
(3, 'NAME', NULL, 'INVALID_NAME', 'Name must be less than 30 characters, with only letters and spaces', 'Personalized Name', NULL, 'REGEX', 0, 'TEXT', 0, '[a-zA-Z ]{3,30}');

-- --------------------------------------------------------

--
-- Table structure for table `blc_product_option_value`
--

CREATE TABLE IF NOT EXISTS `blc_product_option_value` (
  `PRODUCT_OPTION_VALUE_ID` bigint(20) NOT NULL,
  `ATTRIBUTE_VALUE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DISPLAY_ORDER` bigint(20) DEFAULT NULL,
  `PRICE_ADJUSTMENT` decimal(19,5) DEFAULT NULL,
  `PRODUCT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_VALUE_ID`),
  KEY `FK6DEEEDBD92EA8136` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_product_option_value`
--

INSERT INTO `blc_product_option_value` (`PRODUCT_OPTION_VALUE_ID`, `ATTRIBUTE_VALUE`, `DISPLAY_ORDER`, `PRICE_ADJUSTMENT`, `PRODUCT_OPTION_ID`) VALUES
(1, 'Black', 1, NULL, 1),
(2, 'Red', 2, NULL, 1),
(3, 'Silver', 3, NULL, 1),
(11, 'S', 1, NULL, 2),
(12, 'M', 2, NULL, 2),
(13, 'L', 3, NULL, 2),
(14, 'XL', 4, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `blc_product_option_xref`
--

CREATE TABLE IF NOT EXISTS `blc_product_option_xref` (
  `PRODUCT_OPTION_XREF_ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  `PRODUCT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_XREF_ID`),
  KEY `FKDA42AB2F5F11A0B7` (`PRODUCT_ID`),
  KEY `FKDA42AB2F92EA8136` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_product_option_xref`
--

INSERT INTO `blc_product_option_xref` (`PRODUCT_OPTION_XREF_ID`, `PRODUCT_ID`, `PRODUCT_OPTION_ID`) VALUES
(1, 100, 1),
(2, 200, 1),
(3, 300, 1),
(4, 400, 1),
(5, 500, 1),
(6, 600, 1),
(7, 100, 2),
(8, 200, 2),
(9, 300, 2),
(10, 400, 2),
(11, 500, 2),
(12, 600, 2),
(13, 100, 3);

-- --------------------------------------------------------

--
-- Table structure for table `blc_product_sku_xref`
--

CREATE TABLE IF NOT EXISTS `blc_product_sku_xref` (
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ID`),
  KEY `FKF2DBF6D35F11A0B7` (`PRODUCT_ID`),
  KEY `FKF2DBF6D3B78C9977` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_product_sku_xref`
--

INSERT INTO `blc_product_sku_xref` (`PRODUCT_ID`, `SKU_ID`) VALUES
(100, 111),
(100, 112),
(100, 113),
(100, 114),
(100, 121),
(100, 122),
(100, 123),
(100, 124),
(100, 131),
(100, 132),
(100, 133),
(100, 134),
(200, 211),
(200, 212),
(200, 213),
(200, 214),
(200, 221),
(200, 222),
(200, 223),
(200, 224),
(200, 231),
(200, 232),
(200, 233),
(200, 234),
(300, 311),
(300, 312),
(300, 313),
(300, 314),
(300, 321),
(300, 322),
(300, 323),
(300, 324),
(300, 331),
(300, 332),
(300, 333),
(300, 334),
(400, 411),
(400, 412),
(400, 413),
(400, 414),
(400, 421),
(400, 422),
(400, 423),
(400, 424),
(400, 431),
(400, 432),
(400, 433),
(400, 434),
(500, 511),
(500, 512),
(500, 513),
(500, 514),
(500, 521),
(500, 522),
(500, 523),
(500, 524),
(500, 531),
(500, 532),
(500, 533),
(500, 534),
(600, 611),
(600, 612),
(600, 613),
(600, 614),
(600, 621),
(600, 622),
(600, 623),
(600, 624),
(600, 631),
(600, 632),
(600, 633),
(600, 634);

-- --------------------------------------------------------

--
-- Table structure for table `blc_product_up_sale`
--

CREATE TABLE IF NOT EXISTS `blc_product_up_sale` (
  `UP_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SEQUENCE` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `RELATED_SALE_PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UP_SALE_PRODUCT_ID`),
  KEY `UPSALE_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `UPSALE_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `UPSALE_RELATED_INDEX` (`RELATED_SALE_PRODUCT_ID`),
  KEY `FKF69054F515D1A13D` (`CATEGORY_ID`),
  KEY `FKF69054F55F11A0B7` (`PRODUCT_ID`),
  KEY `FKF69054F562D84F9B` (`RELATED_SALE_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_qual_crit_offer_xref`
--

CREATE TABLE IF NOT EXISTS `blc_qual_crit_offer_xref` (
  `OFFER_ID` bigint(20) NOT NULL,
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_ID`,`OFFER_ITEM_CRITERIA_ID`),
  UNIQUE KEY `UK_D592E919E7AB0252` (`OFFER_ITEM_CRITERIA_ID`),
  KEY `FKD592E919D5F3FAF4` (`OFFER_ID`),
  KEY `FKD592E9193615A91A` (`OFFER_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_qual_crit_page_xref`
--

CREATE TABLE IF NOT EXISTS `blc_qual_crit_page_xref` (
  `PAGE_ID` bigint(20) NOT NULL DEFAULT '0',
  `PAGE_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PAGE_ID`,`PAGE_ITEM_CRITERIA_ID`),
  UNIQUE KEY `UK_874BE5902B6BC67F` (`PAGE_ITEM_CRITERIA_ID`),
  KEY `FK874BE590883C2667` (`PAGE_ID`),
  KEY `FK874BE590378418CD` (`PAGE_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_qual_crit_sc_xref`
--

CREATE TABLE IF NOT EXISTS `blc_qual_crit_sc_xref` (
  `SC_ID` bigint(20) NOT NULL,
  `SC_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SC_ID`,`SC_ITEM_CRITERIA_ID`),
  UNIQUE KEY `UK_C4A353AFFF06F4DE` (`SC_ITEM_CRITERIA_ID`),
  KEY `FKC4A353AF13D95585` (`SC_ID`),
  KEY `FKC4A353AF85C77F2B` (`SC_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_rating_detail`
--

CREATE TABLE IF NOT EXISTS `blc_rating_detail` (
  `RATING_DETAIL_ID` bigint(20) NOT NULL,
  `RATING` double NOT NULL,
  `RATING_SUBMITTED_DATE` datetime NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`RATING_DETAIL_ID`),
  KEY `RATING_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `FKC9D04AD7470F437` (`CUSTOMER_ID`),
  KEY `FKC9D04ADD4E76BF4` (`RATING_SUMMARY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_rating_summary`
--

CREATE TABLE IF NOT EXISTS `blc_rating_summary` (
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  `AVERAGE_RATING` double NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `RATING_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`RATING_SUMMARY_ID`),
  KEY `RATINGSUMM_ITEM_INDEX` (`ITEM_ID`),
  KEY `RATINGSUMM_TYPE_INDEX` (`RATING_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_review_detail`
--

CREATE TABLE IF NOT EXISTS `blc_review_detail` (
  `REVIEW_DETAIL_ID` bigint(20) NOT NULL,
  `HELPFUL_COUNT` int(11) NOT NULL,
  `NOT_HELPFUL_COUNT` int(11) NOT NULL,
  `REVIEW_SUBMITTED_DATE` datetime NOT NULL,
  `REVIEW_STATUS` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `REVIEW_TEXT` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RATING_DETAIL_ID` bigint(20) DEFAULT NULL,
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`REVIEW_DETAIL_ID`),
  KEY `REVIEWDETAIL_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `REVIEWDETAIL_RATING_INDEX` (`RATING_DETAIL_ID`),
  KEY `REVIEWDETAIL_SUMMARY_INDEX` (`RATING_SUMMARY_ID`),
  KEY `REVIEWDETAIL_STATUS_INDEX` (`REVIEW_STATUS`),
  KEY `FK9CD7E6927470F437` (`CUSTOMER_ID`),
  KEY `FK9CD7E69245DC39E0` (`RATING_DETAIL_ID`),
  KEY `FK9CD7E692D4E76BF4` (`RATING_SUMMARY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_review_feedback`
--

CREATE TABLE IF NOT EXISTS `blc_review_feedback` (
  `REVIEW_FEEDBACK_ID` bigint(20) NOT NULL,
  `IS_HELPFUL` tinyint(1) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `REVIEW_DETAIL_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`REVIEW_FEEDBACK_ID`),
  KEY `REVIEWFEED_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `REVIEWFEED_DETAIL_INDEX` (`REVIEW_DETAIL_ID`),
  KEY `FK7CC929867470F437` (`CUSTOMER_ID`),
  KEY `FK7CC92986AE4769D6` (`REVIEW_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_role`
--

CREATE TABLE IF NOT EXISTS `blc_role` (
  `ROLE_ID` bigint(20) NOT NULL,
  `ROLE_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`),
  KEY `ROLE_NAME_INDEX` (`ROLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_role`
--

INSERT INTO `blc_role` (`ROLE_ID`, `ROLE_NAME`) VALUES
(1, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `blc_sandbox`
--

CREATE TABLE IF NOT EXISTS `blc_sandbox` (
  `SANDBOX_ID` bigint(20) NOT NULL,
  `AUTHOR` bigint(20) DEFAULT NULL,
  `COLOR` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `GO_LIVE_DATE` datetime DEFAULT NULL,
  `SANDBOX_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SANDBOX_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `PARENT_SANDBOX_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SANDBOX_ID`),
  KEY `SANDBOX_NAME_INDEX` (`SANDBOX_NAME`),
  KEY `FKDD37A9A174160452` (`PARENT_SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_sandbox_mgmt`
--

CREATE TABLE IF NOT EXISTS `blc_sandbox_mgmt` (
  `SANDBOX_MGMT_ID` bigint(20) NOT NULL,
  `SANDBOX_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SANDBOX_MGMT_ID`),
  UNIQUE KEY `UK_4845009FE52B6993` (`SANDBOX_ID`),
  KEY `FK4845009F579FE59D` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_sc`
--

CREATE TABLE IF NOT EXISTS `blc_sc` (
  `SC_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `CONTENT_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `OFFLINE_FLAG` tinyint(1) DEFAULT NULL,
  `PRIORITY` int(11) NOT NULL,
  `LOCALE_CODE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `SC_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_ID`),
  KEY `CONTENT_NAME_INDEX` (`CONTENT_NAME`),
  KEY `SC_OFFLN_FLG_INDX` (`OFFLINE_FLAG`),
  KEY `CONTENT_PRIORITY_INDEX` (`PRIORITY`),
  KEY `FK74EEB716A1E1C128` (`LOCALE_CODE`),
  KEY `FK74EEB71671EBFA46` (`SC_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_sc`
--

INSERT INTO `blc_sc` (`SC_ID`, `CREATED_BY`, `DATE_CREATED`, `DATE_UPDATED`, `UPDATED_BY`, `CONTENT_NAME`, `OFFLINE_FLAG`, `PRIORITY`, `LOCALE_CODE`, `SC_TYPE_ID`) VALUES
(100, 1, '2014-06-29 19:39:38', '2014-06-29 19:39:38', 1, 'Buy One Get One - Twice the Burn', 0, 5, 'en', 1),
(101, 1, '2014-06-29 19:39:38', '2014-06-29 19:39:38', 1, 'Shirt Special - 20% off all shirts', 0, 1, 'en', 1),
(102, 1, '2014-06-29 19:39:38', '2014-06-29 19:39:38', 1, 'Member Special - $10 off next order over $50', 0, 5, 'en', 1),
(110, 1, '2014-06-29 19:39:39', '2014-06-29 19:39:39', 1, 'Home Page Snippet - Aficionado', 0, 5, 'en', 2),
(130, 1, '2014-06-29 19:39:39', '2014-06-29 19:39:39', 1, 'Home Page Featured Products Title', 0, 5, 'en', 3),
(140, 1, '2014-06-29 19:39:39', '2014-06-29 19:39:39', 1, 'RHS - The Essentials Collection', 0, 5, 'en', 4),
(151, 1, '2014-06-29 19:39:39', '2014-06-29 19:39:39', 1, 'Promocion - 20% de descuento en todas las camisas', 0, 1, 'es', 1),
(152, 1, '2014-06-29 19:39:39', '2014-06-29 19:39:39', 1, 'Promocion - 20% de descuento en todas las camisas', 0, 1, 'fr', 1),
(153, 1, '2014-06-29 19:39:39', '2014-06-29 19:39:39', 1, 'Home Page Snippet (es) - Aficionado', 0, 5, 'es', 2),
(154, 1, '2014-06-29 19:39:39', '2014-06-29 19:39:39', 1, 'Home Page Snippet (es) - Aficionado', 0, 5, 'fr', 2),
(155, 1, '2014-06-29 19:39:39', '2014-06-29 19:39:39', 1, 'Home Page Featured Products Title', 0, 5, 'es', 3),
(156, 1, '2014-06-29 19:39:39', '2014-06-29 19:39:39', 1, 'Home Page Featured Products Title', 0, 5, 'fr', 3);

-- --------------------------------------------------------

--
-- Table structure for table `blc_sc_fld`
--

CREATE TABLE IF NOT EXISTS `blc_sc_fld` (
  `SC_FLD_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `FLD_KEY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LOB_VALUE` longtext COLLATE utf8_vietnamese_ci,
  `VALUE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`SC_FLD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_sc_fld`
--

INSERT INTO `blc_sc_fld` (`SC_FLD_ID`, `CREATED_BY`, `DATE_CREATED`, `DATE_UPDATED`, `UPDATED_BY`, `FLD_KEY`, `LOB_VALUE`, `VALUE`) VALUES
(1, 1, '2014-06-29 19:39:39', NULL, NULL, 'imageUrl', NULL, '/img/banners/buy-one-get-one-home-banner.jpg'),
(2, 1, '2014-06-29 19:39:39', NULL, NULL, 'targetUrl', NULL, '/hot-sauces'),
(3, 1, '2014-06-29 19:39:39', NULL, NULL, 'imageUrl', NULL, '/img/banners/shirt-special.jpg'),
(4, 1, '2014-06-29 19:39:39', NULL, NULL, 'targetUrl', NULL, '/merchandise'),
(5, 1, '2014-06-29 19:39:39', NULL, NULL, 'imageUrl', NULL, '/img/banners/member-special.jpg'),
(6, 1, '2014-06-29 19:39:39', NULL, NULL, 'targetUrl', NULL, '/register'),
(9, 1, '2014-06-29 19:39:39', NULL, NULL, 'htmlContent', NULL, '<h2>HOT SAUCE AFICIONADO?</h2> Click to join our Heat Clinic Frequent Care Program. The place to get all the deals on burn treatment.'),
(11, 1, '2014-06-29 19:39:39', NULL, NULL, 'messageText', NULL, 'The Heat Clinic''s Top Selling Sauces'),
(12, 1, '2014-06-29 19:39:39', NULL, NULL, 'imageUrl', NULL, '/img/rhs-ad.jpg'),
(13, 1, '2014-06-29 19:39:39', NULL, NULL, 'targetUrl', NULL, '/hot-sauces'),
(51, 1, '2014-06-29 19:39:39', NULL, NULL, 'imageUrl', NULL, '/img/banners/promocion-camisas.jpg'),
(52, 1, '2014-06-29 19:39:39', NULL, NULL, 'targetUrl', NULL, '/merchandise'),
(53, 1, '2014-06-29 19:39:39', NULL, NULL, 'imageUrl', NULL, '/img/banners/shirts-speciale.jpg'),
(54, 1, '2014-06-29 19:39:39', NULL, NULL, 'targetUrl', NULL, '/merchandise'),
(55, 1, '2014-06-29 19:39:39', NULL, NULL, 'htmlContent', NULL, '<h2>AFICIONADO DE SALSAS PICANTES?</h2> Haga click para unirse a nuerto programa de Cuidades Intensivos de Heat Clinic. El lugar para conseguir las mejores ofertas.'),
(56, 1, '2014-06-29 19:39:39', NULL, NULL, 'htmlContent', NULL, '<h2>AFICIONADO SAUCE PIQUANTE?</h2> Cliquez ici pour vous joindre &agrave; notre clinique de chaleur du Programme de soins fr&eacute;quents. L&#39;endroit pour obtenir toutes les offres sur le traitement des br&ucirc;lures.'),
(57, 1, '2014-06-29 19:39:39', NULL, NULL, 'messageText', NULL, 'Las Salsas M&aacute;s vendidas de Heat Clinic'),
(58, 1, '2014-06-29 19:39:39', NULL, NULL, 'messageText', NULL, 'La Clinique Heat Sauces Meilleures Ventes');

-- --------------------------------------------------------

--
-- Table structure for table `blc_sc_fldgrp_xref`
--

CREATE TABLE IF NOT EXISTS `blc_sc_fldgrp_xref` (
  `SC_FLD_TMPLT_ID` bigint(20) NOT NULL,
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `GROUP_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`SC_FLD_TMPLT_ID`,`GROUP_ORDER`),
  KEY `FK71612AEA6A79BDB5` (`FLD_GROUP_ID`),
  KEY `FK71612AEAF6B0BA84` (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_sc_fldgrp_xref`
--

INSERT INTO `blc_sc_fldgrp_xref` (`SC_FLD_TMPLT_ID`, `FLD_GROUP_ID`, `GROUP_ORDER`) VALUES
(1, 4, 0),
(2, 5, 0),
(3, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `blc_sc_fld_map`
--

CREATE TABLE IF NOT EXISTS `blc_sc_fld_map` (
  `SC_ID` bigint(20) NOT NULL,
  `SC_FLD_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`SC_ID`,`MAP_KEY`),
  KEY `FKD9480192DD6FD28A` (`SC_FLD_ID`),
  KEY `FKD948019213D95585` (`SC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_sc_fld_map`
--

INSERT INTO `blc_sc_fld_map` (`SC_ID`, `SC_FLD_ID`, `MAP_KEY`) VALUES
(100, 1, 'imageUrl'),
(100, 2, 'targetUrl'),
(101, 3, 'imageUrl'),
(101, 4, 'targetUrl'),
(102, 5, 'imageUrl'),
(102, 6, 'targetUrl'),
(110, 9, 'htmlContent'),
(130, 11, 'messageText'),
(140, 12, 'imageUrl'),
(140, 13, 'targetUrl'),
(151, 51, 'imageUrl'),
(151, 52, 'targetUrl'),
(152, 53, 'imageUrl'),
(152, 54, 'targetUrl'),
(153, 55, 'htmlContent'),
(154, 56, 'htmlContent'),
(155, 57, 'messageText'),
(156, 58, 'messageText');

-- --------------------------------------------------------

--
-- Table structure for table `blc_sc_fld_tmplt`
--

CREATE TABLE IF NOT EXISTS `blc_sc_fld_tmplt` (
  `SC_FLD_TMPLT_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_sc_fld_tmplt`
--

INSERT INTO `blc_sc_fld_tmplt` (`SC_FLD_TMPLT_ID`, `NAME`) VALUES
(1, 'Ad Template'),
(2, 'HTML Template'),
(3, 'Message Template');

-- --------------------------------------------------------

--
-- Table structure for table `blc_sc_item_criteria`
--

CREATE TABLE IF NOT EXISTS `blc_sc_item_criteria` (
  `SC_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext COLLATE utf8_vietnamese_ci,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`SC_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_sc_rule`
--

CREATE TABLE IF NOT EXISTS `blc_sc_rule` (
  `SC_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext COLLATE utf8_vietnamese_ci,
  PRIMARY KEY (`SC_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_sc_rule_map`
--

CREATE TABLE IF NOT EXISTS `blc_sc_rule_map` (
  `BLC_SC_SC_ID` bigint(20) NOT NULL,
  `SC_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`BLC_SC_SC_ID`,`MAP_KEY`),
  KEY `FK169F1C8256E51A06` (`SC_RULE_ID`),
  KEY `FK169F1C82156E72FC` (`BLC_SC_SC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_sc_type`
--

CREATE TABLE IF NOT EXISTS `blc_sc_type` (
  `SC_TYPE_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SC_FLD_TMPLT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_TYPE_ID`),
  KEY `SC_TYPE_NAME_INDEX` (`NAME`),
  KEY `FKE19886C3F6B0BA84` (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_sc_type`
--

INSERT INTO `blc_sc_type` (`SC_TYPE_ID`, `DESCRIPTION`, `NAME`, `SC_FLD_TMPLT_ID`) VALUES
(1, NULL, 'Homepage Banner Ad', 1),
(2, NULL, 'Homepage Middle Promo Snippet', 2),
(3, NULL, 'Homepage Featured Products Title', 3),
(4, NULL, 'Right Hand Side Banner Ad', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blc_search_facet`
--

CREATE TABLE IF NOT EXISTS `blc_search_facet` (
  `SEARCH_FACET_ID` bigint(20) NOT NULL,
  `MULTISELECT` tinyint(1) DEFAULT NULL,
  `LABEL` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `REQUIRES_ALL_DEPENDENT` tinyint(1) DEFAULT NULL,
  `SEARCH_DISPLAY_PRIORITY` int(11) DEFAULT NULL,
  `SHOW_ON_SEARCH` tinyint(1) DEFAULT NULL,
  `FIELD_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SEARCH_FACET_ID`),
  KEY `FK4FFCC9863C3907C4` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_search_facet`
--

INSERT INTO `blc_search_facet` (`SEARCH_FACET_ID`, `MULTISELECT`, `LABEL`, `REQUIRES_ALL_DEPENDENT`, `SEARCH_DISPLAY_PRIORITY`, `SHOW_ON_SEARCH`, `FIELD_ID`) VALUES
(1, 1, 'Manufacturer', NULL, 0, 0, 1),
(2, 1, 'Heat Range', NULL, 0, 0, 2),
(3, 1, 'Price', NULL, 1, 1, 3),
(4, 1, 'Color', NULL, 0, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `blc_search_facet_range`
--

CREATE TABLE IF NOT EXISTS `blc_search_facet_range` (
  `SEARCH_FACET_RANGE_ID` bigint(20) NOT NULL,
  `MAX_VALUE` decimal(19,5) DEFAULT NULL,
  `MIN_VALUE` decimal(19,5) NOT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SEARCH_FACET_RANGE_ID`),
  KEY `SEARCH_FACET_INDEX` (`SEARCH_FACET_ID`),
  KEY `FK7EC3B124B96B1C93` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_search_facet_range`
--

INSERT INTO `blc_search_facet_range` (`SEARCH_FACET_RANGE_ID`, `MAX_VALUE`, `MIN_VALUE`, `SEARCH_FACET_ID`) VALUES
(1, '5.00000', '0.00000', 3),
(2, '10.00000', '5.00000', 3),
(3, '15.00000', '10.00000', 3),
(4, NULL, '15.00000', 3);

-- --------------------------------------------------------

--
-- Table structure for table `blc_search_facet_xref`
--

CREATE TABLE IF NOT EXISTS `blc_search_facet_xref` (
  `ID` bigint(20) NOT NULL,
  `REQUIRED_FACET_ID` bigint(20) NOT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK35A63034DA7E1C7C` (`REQUIRED_FACET_ID`),
  KEY `FK35A63034B96B1C93` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_search_intercept`
--

CREATE TABLE IF NOT EXISTS `blc_search_intercept` (
  `SEARCH_REDIRECT_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `SEARCH_TERM` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`SEARCH_REDIRECT_ID`),
  KEY `SEARCH_ACTIVE_INDEX` (`ACTIVE_END_DATE`),
  KEY `SEARCH_PRIORITY_INDEX` (`PRIORITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_search_intercept`
--

INSERT INTO `blc_search_intercept` (`SEARCH_REDIRECT_ID`, `ACTIVE_END_DATE`, `ACTIVE_START_DATE`, `PRIORITY`, `SEARCH_TERM`, `URL`) VALUES
(1, NULL, NULL, 1, 'insanity', '/hot-sauces/insanity_sauce'),
(2, '1999-10-15 21:28:36', '1992-10-15 14:28:36', -10, 'new york', '/search?q=pace picante');

-- --------------------------------------------------------

--
-- Table structure for table `blc_search_synonym`
--

CREATE TABLE IF NOT EXISTS `blc_search_synonym` (
  `SEARCH_SYNONYM_ID` bigint(20) NOT NULL,
  `SYNONYMS` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TERM` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`SEARCH_SYNONYM_ID`),
  KEY `SEARCHSYNONYM_TERM_INDEX` (`TERM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_shipping_rate`
--

CREATE TABLE IF NOT EXISTS `blc_shipping_rate` (
  `ID` bigint(20) NOT NULL,
  `BAND_RESULT_PCT` int(11) NOT NULL,
  `BAND_RESULT_QTY` decimal(19,2) NOT NULL,
  `BAND_UNIT_QTY` decimal(19,2) NOT NULL,
  `FEE_BAND` int(11) NOT NULL,
  `FEE_SUB_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FEE_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SHIPPINGRATE_FEESUB_INDEX` (`FEE_SUB_TYPE`),
  KEY `SHIPPINGRATE_FEE_INDEX` (`FEE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_site`
--

CREATE TABLE IF NOT EXISTS `blc_site` (
  `SITE_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DEACTIVATED` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SITE_IDENTIFIER_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SITE_IDENTIFIER_VALUE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`SITE_ID`),
  KEY `BLC_SITE_ID_VAL_INDEX` (`SITE_IDENTIFIER_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_site_catalog`
--

CREATE TABLE IF NOT EXISTS `blc_site_catalog` (
  `CATALOG_ID` bigint(20) NOT NULL,
  `SITE_ID` bigint(20) NOT NULL,
  KEY `FK5F3F2047843A8B63` (`SITE_ID`),
  KEY `FK5F3F2047A350C7F1` (`CATALOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_site_map_cfg`
--

CREATE TABLE IF NOT EXISTS `blc_site_map_cfg` (
  `INDEXED_SITE_MAP_FILE_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `INDEXED_SITE_MAP_FILE_PATTERN` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `MAX_URL_ENTRIES_PER_FILE` int(11) DEFAULT NULL,
  `SITE_MAP_FILE_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `MODULE_CONFIG_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`MODULE_CONFIG_ID`),
  KEY `FK7012930FC50D449` (`MODULE_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_site_map_cfg`
--

INSERT INTO `blc_site_map_cfg` (`INDEXED_SITE_MAP_FILE_NAME`, `INDEXED_SITE_MAP_FILE_PATTERN`, `MAX_URL_ENTRIES_PER_FILE`, `SITE_MAP_FILE_NAME`, `MODULE_CONFIG_ID`) VALUES
(NULL, NULL, NULL, NULL, -1);

-- --------------------------------------------------------

--
-- Table structure for table `blc_site_map_gen_cfg`
--

CREATE TABLE IF NOT EXISTS `blc_site_map_gen_cfg` (
  `GEN_CONFIG_ID` bigint(20) NOT NULL,
  `CHANGE_FREQ` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `DISABLED` tinyint(1) NOT NULL,
  `GENERATOR_TYPE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `PRIORITY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `MODULE_CONFIG_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`GEN_CONFIG_ID`),
  KEY `FK1D76000A340ED71` (`MODULE_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_site_map_gen_cfg`
--

INSERT INTO `blc_site_map_gen_cfg` (`GEN_CONFIG_ID`, `CHANGE_FREQ`, `DISABLED`, `GENERATOR_TYPE`, `PRIORITY`, `MODULE_CONFIG_ID`) VALUES
(-4, 'HOURLY', 0, 'CATEGORY', '0.5', -1),
(-3, 'HOURLY', 0, 'PAGE', '0.5', -1),
(-2, 'HOURLY', 0, 'PRODUCT', '0.5', -1),
(-1, 'HOURLY', 0, 'CUSTOM', '0.5', -1);

-- --------------------------------------------------------

--
-- Table structure for table `blc_site_map_url_entry`
--

CREATE TABLE IF NOT EXISTS `blc_site_map_url_entry` (
  `URL_ENTRY_ID` bigint(20) NOT NULL,
  `CHANGE_FREQ` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `LAST_MODIFIED` datetime NOT NULL,
  `LOCATION` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `PRIORITY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `GEN_CONFIG_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`URL_ENTRY_ID`),
  KEY `FKE2004FED36AFE1EE` (`GEN_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_site_map_url_entry`
--

INSERT INTO `blc_site_map_url_entry` (`URL_ENTRY_ID`, `CHANGE_FREQ`, `LAST_MODIFIED`, `LOCATION`, `PRIORITY`, `GEN_CONFIG_ID`) VALUES
(-8, 'HOURLY', '2014-06-29 19:39:39', 'http://www.heatclinic.com/8', '0.5', -1),
(-7, 'HOURLY', '2014-06-29 19:39:39', 'http://www.heatclinic.com/7', '0.5', -1),
(-6, 'HOURLY', '2014-06-29 19:39:39', 'http://www.heatclinic.com/6', '0.5', -1),
(-5, 'HOURLY', '2014-06-29 19:39:39', 'http://www.heatclinic.com/5', '0.5', -1),
(-4, 'HOURLY', '2014-06-29 19:39:39', 'http://www.heatclinic.com/4', '0.5', -1),
(-3, 'HOURLY', '2014-06-29 19:39:39', 'http://www.heatclinic.com/3', '0.5', -1),
(-2, 'HOURLY', '2014-06-29 19:39:39', 'http://www.heatclinic.com/2', '0.5', -1),
(-1, 'HOURLY', '2014-06-29 19:39:39', 'http://www.heatclinic.com/1', '0.5', -1);

-- --------------------------------------------------------

--
-- Table structure for table `blc_sku`
--

CREATE TABLE IF NOT EXISTS `blc_sku` (
  `SKU_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `AVAILABLE_FLAG` char(1) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CONTAINER_SHAPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DEPTH` decimal(19,2) DEFAULT NULL,
  `DIMENSION_UNIT_OF_MEASURE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `GIRTH` decimal(19,2) DEFAULT NULL,
  `HEIGHT` decimal(19,2) DEFAULT NULL,
  `CONTAINER_SIZE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `WIDTH` decimal(19,2) DEFAULT NULL,
  `DISCOUNTABLE_FLAG` char(1) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FULFILLMENT_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `INVENTORY_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `IS_MACHINE_SORTABLE` tinyint(1) DEFAULT NULL,
  `LONG_DESCRIPTION` longtext COLLATE utf8_vietnamese_ci,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `TAX_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TAXABLE_FLAG` char(1) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `WEIGHT` decimal(19,2) DEFAULT NULL,
  `WEIGHT_UNIT_OF_MEASURE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DEFAULT_PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SKU_ID`),
  KEY `SKU_ACTIVE_END_INDEX` (`ACTIVE_END_DATE`),
  KEY `SKU_ACTIVE_START_INDEX` (`ACTIVE_START_DATE`),
  KEY `SKU_AVAILABLE_INDEX` (`AVAILABLE_FLAG`),
  KEY `SKU_DISCOUNTABLE_INDEX` (`DISCOUNTABLE_FLAG`),
  KEY `SKU_NAME_INDEX` (`NAME`),
  KEY `SKU_TAXABLE_INDEX` (`TAXABLE_FLAG`),
  KEY `FK28E82CF73E2FC4F9` (`CURRENCY_CODE`),
  KEY `FK28E82CF77E555D75` (`DEFAULT_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_sku`
--

INSERT INTO `blc_sku` (`SKU_ID`, `ACTIVE_END_DATE`, `ACTIVE_START_DATE`, `AVAILABLE_FLAG`, `DESCRIPTION`, `CONTAINER_SHAPE`, `DEPTH`, `DIMENSION_UNIT_OF_MEASURE`, `GIRTH`, `HEIGHT`, `CONTAINER_SIZE`, `WIDTH`, `DISCOUNTABLE_FLAG`, `FULFILLMENT_TYPE`, `INVENTORY_TYPE`, `IS_MACHINE_SORTABLE`, `LONG_DESCRIPTION`, `NAME`, `RETAIL_PRICE`, `SALE_PRICE`, `TAX_CODE`, `TAXABLE_FLAG`, `WEIGHT`, `WEIGHT_UNIT_OF_MEASURE`, `CURRENCY_CODE`, `DEFAULT_PRODUCT_ID`) VALUES
(1, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'As my Chilipals know, I am never one to be satisfied. Hence, the creation of Sudden Death. When you need to go beyond... Sudden Death will deliver! ', 'Sudden Death Sauce', '10.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 1),
(2, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'The perfect topper for chicken, fish, burgers or pizza. A great blend of Habanero, Mango, Passion Fruit and more make this Death Sauce an amazing tropical treat.', 'Sweet Death Sauce', '10.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 2),
(3, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'Tangy, ripe cayenne peppes flow together with garlic, onion, tomato paste and a hint of cane sugar to make this a smooth sauce with a bite.  Wonderful on eggs, poultry, pork, or fish, this sauce blends to make rich marinades and soups.', 'Hoppin'' Hot Sauce', '4.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 3),
(4, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'When any pepper is dried and smoked, it is referred to as a Chipotle. Usually with a wrinkled, drak brown appearance, the Chipotle delivers a smokey, sweet flavor which is generally used for adding a smokey, roasted flavor to salsas, stews and marinades.', 'Day of the Dead Chipotle Hot Sauce', '6.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 4),
(5, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'If you want hot, this is the chile to choose. Native to the Carribean, Yucatan and Northern Coast of South America, the Habanero presents itself in a variety of colors ranging from light green to a bright red. The Habanero''s bold heat, unique flavor and aroma has made it the favorite of chile lovers.', 'Day of the Dead Habanero Hot Sauce', '6.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 5),
(6, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'Often mistaken for the Habanero, the Scotch Bonnet has a deeply inverted tip as opposed to the pointed end of the Habanero. Ranging in many colors from green to yellow-orange, the Scotch Bonnet is a staple in West Indies and Barbados style pepper sauces.', 'Day of the Dead Scotch Bonnet Hot Sauce', '6.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 6),
(7, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'Made with Naga Bhut Jolokia, the World''s Hottest pepper.', 'Green Ghost', '11.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 7),
(8, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'You bet your boots, this hot sauce earned its name from folks that appreciate an outstanding hot sauce. What you''ll find here is a truly original zesty flavor, not an overpowering pungency that is found in those ordinary Tabasco pepper sauces - even though the pepper used in this product was tested at 285,000 Scoville units. So, saddle up for a ride to remember. To make sure we brought you only the finest Habanero pepper sauce, we went to the foothills of the Mayan mountains in Belize, Central America. This product is prepared entirely by hand using only fresh vegetables and all natural ingredients.', 'Blazin'' Saddle XXX Hot Habanero Pepper Sauce', '4.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 8),
(9, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'All Hell is breaking loose, fire &amp; brimstone rain down? prepare to meet your maker.', 'Armageddon The Hot Sauce To End All', '12.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 9),
(10, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'Here is the Prescription for those who enjoy intolerable heat. Dr. Chilemeister''s sick and evil deadly brew should be used with caution. Pain can become addictive!', 'Dr. Chilemeister''s Insane Hot Sauce', '12.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 10),
(11, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'Been there, roped that. Hotter than a buckin'' mare in heat! Sprinkle on meat entrees, seafood and vegetables. Use as additive in barbecue sauce or any food that needs a spicy flavor. Start with a few drops and work up to the desired flavor.', 'Bull Snort Cowboy Cayenne Pepper Hot Sauce', '3.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 11),
(12, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'One of the more unusual sauces we sell. The original was an old style Cajun sauce and this is it''s updated blackening version. It''s sweet but you get a great hit of cinnamon and cloves with a nice kick of cayenne heat. Use on all foods to give that Cajun flair!', 'Cafe Louisiane Sweet Cajun Blackening Sauce', '4.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 12),
(13, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'Everything is bigger in Texas, even the burn of a Bull Snortin'' Hot Sauce! shower on that Texas sized steak they call the Ole 96er or your plane Jane vegetables. If you are a fan on making BBQ sauce from scratch like I am, you can use Bull Snort Smokin'' Tonsils Hot Sauce as an additive. Red hot habaneros and cayenne peppers give this tonsil tingler it''s famous flavor and red hot heat. Bull Snort Smokin'' Tonsils Hot Sauce''ll have your bowels buckin'' with just a drop!', 'Bull Snort Smokin'' Toncils Hot Sauce', '3.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 13),
(14, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.', 'Cool Cayenne Pepper Hot Sauce', '5.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 14),
(15, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.', 'Roasted Garlic Hot Sauce', '5.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 15),
(16, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.', 'Scotch Bonnet Hot Sauce', '5.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 16),
(17, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.', 'Insanity Sauce', '5.99000', '4.99000', NULL, 'Y', NULL, NULL, NULL, 17),
(18, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.', 'Hurtin'' Jalepeno Hot Sauce', '5.99000', '4.49000', NULL, 'Y', NULL, NULL, NULL, 18),
(19, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.', 'Roasted Red Pepper & Chipotle Hot Sauce', '5.99000', '4.09000', NULL, 'Y', NULL, NULL, NULL, 19),
(100, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'Men''s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.', 'Hawt Like a Habanero Shirt (Men''s)', '14.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 100),
(111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'Women''s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.', 'Hawt Like a Habanero Shirt (Women''s)', '14.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 200),
(211, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(213, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(214, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(231, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(232, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(233, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(300, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'This hand-drawn logo shirt for men features a regular fit in three different colors', 'Heat Clinic Hand-Drawn (Men''s)', '15.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 300),
(311, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(312, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(313, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(314, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(321, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(322, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(323, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(324, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(331, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(332, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(333, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(334, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(400, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'This hand-drawn logo shirt for women features a regular fit in three different colors', 'Heat Clinic Hand-Drawn (Women''s)', '15.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 400),
(411, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(412, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(413, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(414, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(421, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(422, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(423, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(424, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(431, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(432, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(433, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(434, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(500, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'Don''t you just love our mascot? Get your very own shirt today!', 'Heat Clinic Mascot (Men''s)', '15.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 500),
(511, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(512, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(513, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(514, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(521, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(522, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(523, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(524, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(531, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(532, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(533, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(534, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(600, NULL, '2014-06-29 19:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'Don''t you just love our mascot? Get your very own shirt today!', 'Heat Clinic Mascot (Women''s)', '15.99000', NULL, NULL, 'Y', NULL, NULL, NULL, 600),
(611, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(612, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(613, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(614, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(621, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(622, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(623, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(624, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(631, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(632, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(633, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(634, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '16.99000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9992, '2099-04-05 00:00:00', '2001-02-24 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'bundle1', '13.00000', '3.00000', NULL, NULL, NULL, NULL, NULL, 992),
(9993, '2099-01-06 00:00:00', '2001-02-24 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'bundle2', '12.00000', '2.00000', NULL, NULL, NULL, NULL, NULL, 993);

-- --------------------------------------------------------

--
-- Table structure for table `blc_sku_attribute`
--

CREATE TABLE IF NOT EXISTS `blc_sku_attribute` (
  `SKU_ATTR_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `SEARCHABLE` tinyint(1) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ATTR_ID`),
  KEY `SKUATTR_NAME_INDEX` (`NAME`),
  KEY `SKUATTR_SKU_INDEX` (`SKU_ID`),
  KEY `FK6C6A5934B78C9977` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_sku_availability`
--

CREATE TABLE IF NOT EXISTS `blc_sku_availability` (
  `SKU_AVAILABILITY_ID` bigint(20) NOT NULL,
  `AVAILABILITY_DATE` datetime DEFAULT NULL,
  `AVAILABILITY_STATUS` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LOCATION_ID` bigint(20) DEFAULT NULL,
  `QTY_ON_HAND` int(11) DEFAULT NULL,
  `RESERVE_QTY` int(11) DEFAULT NULL,
  `SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SKU_AVAILABILITY_ID`),
  KEY `SKUAVAIL_STATUS_INDEX` (`AVAILABILITY_STATUS`),
  KEY `SKUAVAIL_LOCATION_INDEX` (`LOCATION_ID`),
  KEY `SKUAVAIL_SKU_INDEX` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_sku_bundle_item`
--

CREATE TABLE IF NOT EXISTS `blc_sku_bundle_item` (
  `SKU_BUNDLE_ITEM_ID` bigint(20) NOT NULL,
  `ITEM_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `PRODUCT_BUNDLE_ID` bigint(20) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_BUNDLE_ITEM_ID`),
  KEY `FKD55968CCF29B96` (`PRODUCT_BUNDLE_ID`),
  KEY `FKD55968B78C9977` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_sku_bundle_item`
--

INSERT INTO `blc_sku_bundle_item` (`SKU_BUNDLE_ITEM_ID`, `ITEM_SALE_PRICE`, `QUANTITY`, `PRODUCT_BUNDLE_ID`, `SKU_ID`) VALUES
(-103, NULL, 1, 993, 2),
(-102, NULL, 1, 993, 1),
(-101, NULL, 1, 992, 2),
(-100, NULL, 1, 992, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blc_sku_fee`
--

CREATE TABLE IF NOT EXISTS `blc_sku_fee` (
  `SKU_FEE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `EXPRESSION` longtext COLLATE utf8_vietnamese_ci,
  `FEE_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TAXABLE` tinyint(1) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`SKU_FEE_ID`),
  KEY `FKEEB7181E3E2FC4F9` (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_sku_fee_xref`
--

CREATE TABLE IF NOT EXISTS `blc_sku_fee_xref` (
  `SKU_FEE_ID` bigint(20) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  KEY `FKD88D409CB78C9977` (`SKU_ID`),
  KEY `FKD88D409CCF4C9A82` (`SKU_FEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_sku_fulfillment_excluded`
--

CREATE TABLE IF NOT EXISTS `blc_sku_fulfillment_excluded` (
  `SKU_ID` bigint(20) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  KEY `FK84162D7381F34C7F` (`FULFILLMENT_OPTION_ID`),
  KEY `FK84162D73B78C9977` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_sku_fulfillment_flat_rates`
--

CREATE TABLE IF NOT EXISTS `blc_sku_fulfillment_flat_rates` (
  `SKU_ID` bigint(20) NOT NULL,
  `RATE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ID`,`FULFILLMENT_OPTION_ID`),
  KEY `FKC1988C9681F34C7F` (`FULFILLMENT_OPTION_ID`),
  KEY `FKC1988C96B78C9977` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_sku_media_map`
--

CREATE TABLE IF NOT EXISTS `blc_sku_media_map` (
  `BLC_SKU_SKU_ID` bigint(20) NOT NULL,
  `MEDIA_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`BLC_SKU_SKU_ID`,`MAP_KEY`),
  KEY `FKEB4AECF96E4720E0` (`MEDIA_ID`),
  KEY `FKEB4AECF9D93D857F` (`BLC_SKU_SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_sku_media_map`
--

INSERT INTO `blc_sku_media_map` (`BLC_SKU_SKU_ID`, `MEDIA_ID`, `MAP_KEY`) VALUES
(1, 101, 'primary'),
(1, 102, 'alt1'),
(2, 201, 'primary'),
(2, 202, 'alt1'),
(2, 203, 'alt2'),
(2, 204, 'alt3'),
(2, 205, 'alt4'),
(2, 206, 'alt5'),
(3, 301, 'primary'),
(3, 302, 'alt1'),
(4, 401, 'primary'),
(4, 402, 'alt1'),
(5, 501, 'primary'),
(5, 502, 'alt1'),
(6, 601, 'primary'),
(6, 602, 'alt1'),
(7, 701, 'primary'),
(7, 702, 'alt1'),
(8, 801, 'primary'),
(8, 802, 'alt1'),
(9, 901, 'primary'),
(9, 902, 'alt1'),
(10, 1001, 'primary'),
(10, 1002, 'alt1'),
(11, 1101, 'primary'),
(11, 1102, 'alt1'),
(12, 1201, 'primary'),
(12, 1202, 'alt1'),
(13, 1301, 'primary'),
(13, 1302, 'alt1'),
(14, 1401, 'primary'),
(14, 1402, 'alt1'),
(15, 1501, 'primary'),
(15, 1502, 'alt1'),
(16, 1601, 'primary'),
(16, 1602, 'alt1'),
(17, 1701, 'primary'),
(17, 1702, 'alt1'),
(18, 1801, 'primary'),
(18, 1802, 'alt1'),
(19, 1901, 'primary'),
(19, 1902, 'alt1'),
(100, 10001, 'primary'),
(100, 10002, 'alt1'),
(100, 10003, 'alt2'),
(200, 20001, 'alt1'),
(200, 20002, 'primary'),
(200, 20003, 'alt2'),
(300, 30001, 'alt1'),
(300, 30002, 'alt2'),
(300, 30003, 'primary'),
(400, 40001, 'alt1'),
(400, 40002, 'primary'),
(400, 40003, 'alt2'),
(500, 50001, 'alt1'),
(500, 50002, 'alt2'),
(500, 50003, 'primary'),
(600, 60001, 'primary'),
(600, 60002, 'alt1'),
(600, 60003, 'alt2');

-- --------------------------------------------------------

--
-- Table structure for table `blc_sku_option_value_xref`
--

CREATE TABLE IF NOT EXISTS `blc_sku_option_value_xref` (
  `SKU_ID` bigint(20) NOT NULL,
  `PRODUCT_OPTION_VALUE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ID`,`PRODUCT_OPTION_VALUE_ID`),
  KEY `FK7B61DC0BB0C16A73` (`PRODUCT_OPTION_VALUE_ID`),
  KEY `FK7B61DC0BB78C9977` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_sku_option_value_xref`
--

INSERT INTO `blc_sku_option_value_xref` (`SKU_ID`, `PRODUCT_OPTION_VALUE_ID`) VALUES
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(311, 1),
(312, 1),
(313, 1),
(314, 1),
(411, 1),
(412, 1),
(413, 1),
(414, 1),
(511, 1),
(512, 1),
(513, 1),
(514, 1),
(611, 1),
(612, 1),
(613, 1),
(614, 1),
(121, 2),
(122, 2),
(123, 2),
(124, 2),
(221, 2),
(222, 2),
(223, 2),
(224, 2),
(321, 2),
(322, 2),
(323, 2),
(324, 2),
(421, 2),
(422, 2),
(423, 2),
(424, 2),
(521, 2),
(522, 2),
(523, 2),
(524, 2),
(621, 2),
(622, 2),
(623, 2),
(624, 2),
(131, 3),
(132, 3),
(133, 3),
(134, 3),
(231, 3),
(232, 3),
(233, 3),
(234, 3),
(331, 3),
(332, 3),
(333, 3),
(334, 3),
(431, 3),
(432, 3),
(433, 3),
(434, 3),
(531, 3),
(532, 3),
(533, 3),
(534, 3),
(631, 3),
(632, 3),
(633, 3),
(634, 3),
(111, 11),
(121, 11),
(131, 11),
(211, 11),
(221, 11),
(231, 11),
(311, 11),
(321, 11),
(331, 11),
(411, 11),
(421, 11),
(431, 11),
(511, 11),
(521, 11),
(531, 11),
(611, 11),
(621, 11),
(631, 11),
(112, 12),
(122, 12),
(132, 12),
(212, 12),
(222, 12),
(232, 12),
(312, 12),
(322, 12),
(332, 12),
(412, 12),
(422, 12),
(432, 12),
(512, 12),
(522, 12),
(532, 12),
(612, 12),
(622, 12),
(632, 12),
(113, 13),
(123, 13),
(133, 13),
(213, 13),
(223, 13),
(233, 13),
(313, 13),
(323, 13),
(333, 13),
(413, 13),
(423, 13),
(433, 13),
(513, 13),
(523, 13),
(533, 13),
(613, 13),
(623, 13),
(633, 13),
(114, 14),
(124, 14),
(134, 14),
(214, 14),
(224, 14),
(234, 14),
(314, 14),
(324, 14),
(334, 14),
(414, 14),
(424, 14),
(434, 14),
(514, 14),
(524, 14),
(534, 14),
(614, 14),
(624, 14),
(634, 14);

-- --------------------------------------------------------

--
-- Table structure for table `blc_state`
--

CREATE TABLE IF NOT EXISTS `blc_state` (
  `ABBREVIATION` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `COUNTRY` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`ABBREVIATION`),
  KEY `STATE_NAME_INDEX` (`NAME`),
  KEY `FK8F94A1EBA46E16CF` (`COUNTRY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_state`
--

INSERT INTO `blc_state` (`ABBREVIATION`, `NAME`, `COUNTRY`) VALUES
('AA', 'ARMED FORCES AMERICA', 'US'),
('AB', 'ALBERTA', 'CA'),
('AE', 'ARMED FORCES', 'US'),
('AK', 'ALASKA', 'US'),
('AL', 'ALABAMA', 'US'),
('AP', 'ARMED FORCES PACIFIC', 'US'),
('AR', 'ARKANSAS', 'US'),
('AS', 'AMERICAN SAMOA', 'US'),
('AZ', 'ARIZONA', 'US'),
('BC', 'BRITISH COLUMBIA', 'CA'),
('CA', 'CALIFORNIA', 'US'),
('CO', 'COLORADO', 'US'),
('CT', 'CONNECTICUT', 'US'),
('DC', 'DISTRICT OF COLUMBIA', 'US'),
('DE', 'DELAWARE', 'US'),
('FL', 'FLORIDA', 'US'),
('FM', 'FEDERATED STATES OF MICRONESIA', 'US'),
('GA', 'GEORGIA', 'US'),
('GU', 'GUAM', 'US'),
('HI', 'HAWAII', 'US'),
('IA', 'IOWA', 'US'),
('ID', 'IDAHO', 'US'),
('IL', 'ILLINOIS', 'US'),
('IN', 'INDIANA', 'US'),
('KS', 'KANSAS', 'US'),
('KY', 'KENTUCKY', 'US'),
('LA', 'LOUISIANA', 'US'),
('MA', 'MASSACHUSETTS', 'US'),
('MB', 'MANITOBA', 'CA'),
('MD', 'MARYLAND', 'US'),
('ME', 'MAINE', 'US'),
('MH', 'MARSHALL ISLANDS', 'US'),
('MI', 'MICHIGAN', 'US'),
('MN', 'MINNESOTA', 'US'),
('MO', 'MISSOURI', 'US'),
('MP', 'NORTHERN MARIANA ISLANDS', 'US'),
('MS', 'MISSISSIPPI', 'US'),
('MT', 'MONTANA', 'US'),
('NB', 'NEW BRUNSWICK', 'CA'),
('NC', 'NORTH CAROLINA', 'US'),
('ND', 'NORTH DAKOTA', 'US'),
('NE', 'NEBRASKA', 'US'),
('NH', 'NEW HAMPSHIRE', 'US'),
('NJ', 'NEW JERSEY', 'US'),
('NL', 'NEWFOUNDLAND', 'CA'),
('NM', 'NEW MEXICO', 'US'),
('NS', 'NOVA SCOTIA', 'CA'),
('NT', 'NORTHWEST TERRITORIES', 'CA'),
('NU', 'NUNAVUT', 'CA'),
('NV', 'NEVADA', 'US'),
('NY', 'NEW YORK', 'US'),
('OH', 'OHIO', 'US'),
('OK', 'OKLAHOMA', 'US'),
('ON', 'ONTARIO', 'CA'),
('OR', 'OREGON', 'US'),
('PA', 'PENNSYLVANIA', 'US'),
('PE', 'PRINCE EDWARD ISLAND', 'CA'),
('PR', 'PUERTO RICO', 'US'),
('PW', 'PALAU', 'US'),
('QC', 'QUEBEC', 'CA'),
('RI', 'RHODE ISLAND', 'US'),
('SC', 'SOUTH CAROLINA', 'US'),
('SD', 'SOUTH DAKOTA', 'US'),
('SK', 'SASKATCHEWAN', 'CA'),
('TN', 'TENNESSEE', 'US'),
('TX', 'TEXAS', 'US'),
('UT', 'UTAH', 'US'),
('VA', 'VIRGINIA', 'US'),
('VI', 'VIRGIN ISLANDS', 'US'),
('VT', 'VERMONT', 'US'),
('WA', 'WASHINGTON', 'US'),
('WI', 'WISCONSIN', 'US'),
('WV', 'WEST VIRGINIA', 'US'),
('WY', 'WYOMING', 'US'),
('YT', 'YUKON', 'CA');

-- --------------------------------------------------------

--
-- Table structure for table `blc_static_asset`
--

CREATE TABLE IF NOT EXISTS `blc_static_asset` (
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  `ALT_TEXT` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `FILE_EXTENSION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `FULL_URL` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `MIME_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `STORAGE_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`),
  KEY `ASST_FULL_URL_INDX` (`FULL_URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_static_asset`
--

INSERT INTO `blc_static_asset` (`STATIC_ASSET_ID`, `ALT_TEXT`, `CREATED_BY`, `DATE_CREATED`, `DATE_UPDATED`, `UPDATED_BY`, `FILE_EXTENSION`, `FILE_SIZE`, `FULL_URL`, `MIME_TYPE`, `NAME`, `STORAGE_TYPE`, `TITLE`) VALUES
(101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Sudden-Death-Sauce-Bottle.jpg', 'image/jpg', 'Sudden Death Sauce Bottle', 'FILESYSTEM', NULL),
(102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Sudden-Death-Sauce-Close.jpg', 'image/jpg', 'Sudden Death Sauce Close-up', 'FILESYSTEM', NULL),
(201, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Sweet-Death-Sauce-Bottle.jpg', 'image/jpg', 'Sweet Death Sauce Bottle', 'FILESYSTEM', NULL),
(202, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Sweet-Death-Sauce-Close.jpg', 'image/jpg', 'Sweet Death Sauce Close-up', 'FILESYSTEM', NULL),
(203, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Sweet-Death-Sauce-Skull.jpg', 'image/jpg', 'Sweet Death Sauce Close-up', 'FILESYSTEM', NULL),
(204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Sweet-Death-Sauce-Tile.jpg', 'image/jpg', 'Sweet Death Sauce Close-up', 'FILESYSTEM', NULL),
(205, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Sweet-Death-Sauce-Grass.jpg', 'image/jpg', 'Sweet Death Sauce Close-up', 'FILESYSTEM', NULL),
(206, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Sweet-Death-Sauce-Logo.jpg', 'image/jpg', 'Sweet Death Sauce Close-up', 'FILESYSTEM', NULL),
(301, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Hoppin-Hot-Sauce-Bottle.jpg', 'image/jpg', 'Hoppin Hot Sauce Bottle', 'FILESYSTEM', NULL),
(302, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Hoppin-Hot-Sauce-Close.jpg', 'image/jpg', 'Hoppin Hot Sauce Close-up', 'FILESYSTEM', NULL),
(401, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Bottle.jpg', 'image/jpg', 'Day of the Dead Chipotle Hot Sauce Bottle', 'FILESYSTEM', NULL),
(402, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Close.jpg', 'image/jpg', 'Day of the Dead Chipotle Hot Sauce Close-up', 'FILESYSTEM', NULL),
(501, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Bottle.jpg', 'image/jpg', 'Day of the Dead Habanero Hot Sauce Bottle', 'FILESYSTEM', NULL),
(502, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Close.jpg', 'image/jpg', 'Day of the Dead Habanero Hot Sauce Close-up', 'FILESYSTEM', NULL),
(601, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Bottle.jpg', 'image/jpg', 'Day of the Dead Scotch Bonnet Hot Sauce Bottle', 'FILESYSTEM', NULL),
(602, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Close.jpg', 'image/jpg', 'Day of the Dead Scotch Bonnet Hot Sauce Close-up', 'FILESYSTEM', NULL),
(701, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Green-Ghost-Bottle.jpg', 'image/jpg', 'Green Ghost Bottle', 'FILESYSTEM', NULL),
(702, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Green-Ghost-Close.jpg', 'image/jpg', 'Green Ghost Close-up', 'FILESYSTEM', NULL),
(801, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Bottle.jpg', 'image/jpg', 'Blazin Saddle XXX Hot Habanero Pepper Sauce Bottle', 'FILESYSTEM', NULL),
(802, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Close.jpg', 'image/jpg', 'Blazin Saddle XXX Hot Habanero Pepper Sauce Close-up', 'FILESYSTEM', NULL),
(901, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Bottle.jpg', 'image/jpg', 'Armageddon The Hot Sauce To End All Bottle', 'FILESYSTEM', NULL),
(902, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Close.jpg', 'image/jpg', 'Armageddon The Hot Sauce To End All Close-up', 'FILESYSTEM', NULL),
(1001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Bottle.jpg', 'image/jpg', 'Dr. Chilemeisters Insane Hot Sauce Bottle', 'FILESYSTEM', NULL),
(1002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Close.jpg', 'image/jpg', 'Dr. Chilemeisters Insane Hot Sauce Close-up', 'FILESYSTEM', NULL),
(1101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Bottle.jpg', 'image/jpg', 'Bull Snort Cowboy Cayenne Pepper Hot Sauce Bottle', 'FILESYSTEM', NULL),
(1102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Close.jpg', 'image/jpg', 'Bull Snort Cowboy Cayenne Pepper Hot Sauce Close-up', 'FILESYSTEM', NULL),
(1201, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Bottle.jpg', 'image/jpg', 'Cafe Louisiane Sweet Cajun Blackening Sauce Bottle', 'FILESYSTEM', NULL),
(1202, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Close.jpg', 'image/jpg', 'Cafe Louisiane Sweet Cajun Blackening Sauce Close-up', 'FILESYSTEM', NULL),
(1301, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Bottle.jpg', 'image/jpg', 'Bull Snort Smokin Toncils Hot Sauce Bottle', 'FILESYSTEM', NULL),
(1302, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Close.jpg', 'image/jpg', 'Bull Snort Smokin Toncils Hot Sauce Close-up', 'FILESYSTEM', NULL),
(1401, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Bottle.jpg', 'image/jpg', 'Cool Cayenne Pepper Hot Sauce Bottle', 'FILESYSTEM', NULL),
(1402, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Close.jpg', 'image/jpg', 'Cool Cayenne Pepper Hot Sauce Close-up', 'FILESYSTEM', NULL),
(1501, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Roasted-Garlic-Hot-Sauce-Bottle.jpg', 'image/jpg', 'Roasted Garlic Hot Sauce Bottle', 'FILESYSTEM', NULL),
(1502, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Roasted-Garlic-Hot-Sauce-Close.jpg', 'image/jpg', 'Roasted Garlic Hot Sauce Close-up', 'FILESYSTEM', NULL),
(1601, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Scotch-Bonnet-Hot-Sauce-Bottle.jpg', 'image/jpg', 'Scotch Bonnet Hot Sauce Bottle', 'FILESYSTEM', NULL),
(1602, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Scotch-Bonnet-Hot-Sauce-Close.jpg', 'image/jpg', 'Scotch Bonnet Hot Sauce Close-up', 'FILESYSTEM', NULL),
(1701, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Insanity-Sauce-Bottle.jpg', 'image/jpg', 'Insanity Sauce Bottle', 'FILESYSTEM', NULL),
(1702, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Insanity-Sauce-Close.jpg', 'image/jpg', 'Insanity Sauce Close-up', 'FILESYSTEM', NULL),
(1801, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Bottle.jpg', 'image/jpg', 'Hurtin Jalepeno Hot Sauce Bottle', 'FILESYSTEM', NULL),
(1802, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Close.jpg', 'image/jpg', 'Hurtin Jalepeno Hot Sauce Close-up', 'FILESYSTEM', NULL),
(1901, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Bottle.jpg', 'image/jpg', 'Roasted Red Pepper and Chipotle Hot Sauce Bottle', 'FILESYSTEM', NULL),
(1902, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Close.jpg', 'image/jpg', 'Roasted Red Pepper and Chipotle Hot Sauce Close-up', 'FILESYSTEM', NULL),
(10001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/habanero_mens_black.jpg', 'image/jpg', 'Hawt Like a Habanero Men''s Black', 'FILESYSTEM', NULL),
(10002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/habanero_mens_red.jpg', 'image/jpg', 'Hawt Like a Habanero Men''s Red', 'FILESYSTEM', NULL),
(10003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/habanero_mens_silver.jpg', 'image/jpg', 'Hawt Like a Habanero Men''s Silver', 'FILESYSTEM', NULL),
(20001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/habanero_womens_black.jpg', 'image/jpg', 'Hawt Like a Habanero Women''s Black', 'FILESYSTEM', NULL),
(20002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/habanero_womens_red.jpg', 'image/jpg', 'Hawt Like a Habanero Women''s Red', 'FILESYSTEM', NULL),
(20003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/habanero_womens_silver.jpg', 'image/jpg', 'Hawt Like a Habanero Women''s Silver', 'FILESYSTEM', NULL),
(30001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/heat_clinic_handdrawn_mens_black.jpg', 'image/jpg', 'Heat Clinic Hand-Drawn Men''s Black', 'FILESYSTEM', NULL),
(30002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/heat_clinic_handdrawn_mens_red.jpg', 'image/jpg', 'Heat Clinic Hand-Drawn Men''s Red', 'FILESYSTEM', NULL),
(30003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/heat_clinic_handdrawn_mens_silver.jpg', 'image/jpg', 'Heat Clinic Hand-Drawn Men''s Silver', 'FILESYSTEM', NULL),
(40001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/heat_clinic_handdrawn_womens_black.jpg', 'image/jpg', 'Heat Clinic Hand-Drawn Women''s Black', 'FILESYSTEM', NULL),
(40002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/heat_clinic_handdrawn_womens_red.jpg', 'image/jpg', 'Heat Clinic Hand-Drawn Women''s Red', 'FILESYSTEM', NULL),
(40003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/heat_clinic_handdrawn_womens_silver.jpg', 'image/jpg', 'Heat Clinic Hand-Drawn Women''s Silver', 'FILESYSTEM', NULL),
(50001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/heat_clinic_mascot_mens_black.jpg', 'image/jpg', 'Heat Clinic Mascot Men''s Black', 'FILESYSTEM', NULL),
(50002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/heat_clinic_mascot_mens_red.jpg', 'image/jpg', 'Heat Clinic Mascot Men''s Red', 'FILESYSTEM', NULL),
(50003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/heat_clinic_mascot_mens_silver.jpg', 'image/jpg', 'Heat Clinic Mascot Men''s Silver', 'FILESYSTEM', NULL),
(60001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/heat_clinic_mascot_womens_black.jpg', 'image/jpg', 'Heat Clinic Mascot Women''s Black', 'FILESYSTEM', NULL),
(60002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/heat_clinic_mascot_womens_red.jpg', 'image/jpg', 'Heat Clinic Mascot Women''s Red', 'FILESYSTEM', NULL),
(60003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/merch/heat_clinic_mascot_womens_silver.jpg', 'image/jpg', 'Heat Clinic Mascot Women''s Silver', 'FILESYSTEM', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blc_static_asset_desc`
--

CREATE TABLE IF NOT EXISTS `blc_static_asset_desc` (
  `STATIC_ASSET_DESC_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LONG_DESCRIPTION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`STATIC_ASSET_DESC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_static_asset_strg`
--

CREATE TABLE IF NOT EXISTS `blc_static_asset_strg` (
  `STATIC_ASSET_STRG_ID` bigint(20) NOT NULL,
  `FILE_DATA` longblob,
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_STRG_ID`),
  KEY `STATIC_ASSET_ID_INDEX` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_store`
--

CREATE TABLE IF NOT EXISTS `blc_store` (
  `STORE_ID` bigint(20) NOT NULL,
  `ADDRESS_1` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ADDRESS_2` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `STORE_CITY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `STORE_COUNTRY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `LONGITUDE` double DEFAULT NULL,
  `STORE_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `STORE_PHONE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `STORE_STATE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `STORE_ZIP` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`STORE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_system_property`
--

CREATE TABLE IF NOT EXISTS `blc_system_property` (
  `BLC_SYSTEM_PROPERTY_ID` bigint(20) NOT NULL,
  `FRIENDLY_GROUP` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FRIENDLY_TAB` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `PROPERTY_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `PROPERTY_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `PROPERTY_VALUE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`BLC_SYSTEM_PROPERTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_tar_crit_offer_xref`
--

CREATE TABLE IF NOT EXISTS `blc_tar_crit_offer_xref` (
  `OFFER_ID` bigint(20) NOT NULL,
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_ID`,`OFFER_ITEM_CRITERIA_ID`),
  UNIQUE KEY `UK_125F5803E7AB0252` (`OFFER_ITEM_CRITERIA_ID`),
  KEY `FK125F58033615A91A` (`OFFER_ITEM_CRITERIA_ID`),
  KEY `FK125F5803D5F3FAF4` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_tar_crit_offer_xref`
--

INSERT INTO `blc_tar_crit_offer_xref` (`OFFER_ID`, `OFFER_ITEM_CRITERIA_ID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blc_tax_detail`
--

CREATE TABLE IF NOT EXISTS `blc_tax_detail` (
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `TAX_COUNTRY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `JURISDICTION_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `RATE` decimal(19,5) DEFAULT NULL,
  `TAX_REGION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TAX_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `MODULE_CONFIG_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TAX_DETAIL_ID`),
  KEY `FKEABE4A4B3E2FC4F9` (`CURRENCY_CODE`),
  KEY `FKEABE4A4BC50D449` (`MODULE_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_translation`
--

CREATE TABLE IF NOT EXISTS `blc_translation` (
  `TRANSLATION_ID` bigint(20) NOT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FIELD_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LOCALE_CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TRANSLATED_VALUE` longtext COLLATE utf8_vietnamese_ci,
  PRIMARY KEY (`TRANSLATION_ID`),
  KEY `TRANSLATION_INDEX` (`ENTITY_TYPE`,`ENTITY_ID`,`FIELD_NAME`,`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_translation`
--

INSERT INTO `blc_translation` (`TRANSLATION_ID`, `ENTITY_ID`, `ENTITY_TYPE`, `FIELD_NAME`, `LOCALE_CODE`, `TRANSLATED_VALUE`) VALUES
(-396, '3', 'FulfillmentOption', 'longDescription', 'fr', '1 - 2 Journ&eacute;es'),
(-395, '3', 'FulfillmentOption', 'name', 'fr', 'Express'),
(-394, '2', 'FulfillmentOption', 'longDescription', 'fr', '3 - 5 Journ&eacute;es'),
(-393, '2', 'FulfillmentOption', 'name', 'fr', 'Priorit&eacute;'),
(-392, '1', 'FulfillmentOption', 'longDescription', 'fr', '5 - 7 Journ&eacute;es'),
(-391, '1', 'FulfillmentOption', 'name', 'fr', 'Norme'),
(-382, '3', 'SearchFacet', 'label', 'fr', 'Prix'),
(-381, '2', 'SearchFacet', 'label', 'fr', 'Degr&eacute; de chaleur'),
(-380, '1', 'SearchFacet', 'label', 'fr', 'Fabricant'),
(-300, '600', 'Sku', 'longDescription', 'fr', 'Avez-vous pas juste notre mascotte? Obtenez votre chemise propre aujourd''hui!'),
(-299, '600', 'Sku', 'name', 'fr', 'Mascot Clinique chaleur (Femmes)'),
(-298, '500', 'Sku', 'longDescription', 'fr', 'Avez-vous pas juste notre mascotte? Obtenez votre chemise propre aujourd''hui!'),
(-297, '500', 'Sku', 'name', 'fr', 'Mascot Clinique chaleur (Hommes)'),
(-296, '400', 'Sku', 'longDescription', 'fr', 'Ce t-shirt logo dessin&eacute; &agrave; la main pour les femmes dispose d''une coupe r&eacute;guli&egrave;re en trois couleurs diff&eacute;rentes.'),
(-295, '400', 'Sku', 'name', 'fr', 'Clinique de chaleur tir&eacute; par la main (Femmes)'),
(-294, '300', 'Sku', 'longDescription', 'fr', 'Ce t-shirt logo dessin&eacute; &agrave; la main pour les hommes dispose d''une coupe r&eacute;guli&egrave;re en trois couleurs diff&eacute;rentes.'),
(-293, '300', 'Sku', 'name', 'fr', 'Clinique de chaleur tir&eacute; par la main (Hommes)'),
(-292, '200', 'Sku', 'longDescription', 'fr', 'Collecte de femmes Habanero standards chemise &agrave; manches courtes shirt s&eacute;rigraphi&eacute; &agrave; 30 coton doux singles en coupe regular.'),
(-291, '200', 'Sku', 'name', 'fr', 'Hawt comme une chemise Habanero (Femmes)'),
(-290, '100', 'Sku', 'longDescription', 'fr', 'Collecte Hommes Habanero standards chemise &agrave; manches courtes t s&eacute;rigraphi&eacute;es en 30 coton doux singles en coupe regular.'),
(-289, '100', 'Sku', 'name', 'fr', 'Hawt comme une chemise Habanero (Hommes)'),
(-288, '19', 'Sku', 'longDescription', 'fr', 'Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d''am&eacute;liorer la saveur de la plupart de n''importe quel repas.'),
(-287, '19', 'Sku', 'name', 'fr', 'Sauce chaudes Chipotle'),
(-286, '18', 'Sku', 'longDescription', 'fr', 'Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d''am&eacute;liorer la saveur de la plupart de n''importe quel repas.'),
(-285, '18', 'Sku', 'name', 'fr', 'Sauces chaudes Jalapeno'),
(-284, '17', 'Sku', 'longDescription', 'fr', 'Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d''am&eacute;liorer la saveur de la plupart de n''importe quel repas.'),
(-283, '17', 'Sku', 'name', 'fr', 'Sauce Scotch Bonnet chaud'),
(-282, '16', 'Sku', 'longDescription', 'fr', 'Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d''am&eacute;liorer la saveur de la plupart de n''importe quel repas.'),
(-281, '16', 'Sku', 'name', 'fr', 'Sauce Scotch Bonnet chaud'),
(-280, '15', 'Sku', 'longDescription', 'fr', 'Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d''am&eacute;liorer la saveur de la plupart de n''importe quel repas.'),
(-279, '15', 'Sku', 'name', 'fr', 'Sauce &agrave; l''ail rÃ´ti chaud'),
(-278, '14', 'Sku', 'longDescription', 'fr', 'Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d''am&eacute;liorer la saveur de la plupart de n''importe quel repas.'),
(-277, '14', 'Sku', 'name', 'fr', 'Frais Poivre de Cayenne Hot Sauce'),
(-276, '13', 'Sku', 'longDescription', 'fr', 'Todo es m&aacute;s grande en Texas, incluso lo picante de la Salsa de Snortin Bull! Tout est plus grand au Texas, m&ecirc;me la brÃ»lure de Hot Sauce une Snortin Bull! douche sur le Texas Steak taille qu''ils appellent le 96er Ole ou vos l&eacute;gumes Jane avion. Si vous &ecirc;tes un fan sur faire de la sauce barbecue &agrave; partir de z&eacute;ro comme je suis, vous pouvez utiliser la sauce Bull amygdales Snort Smokin ''Hot tant qu''additif. Red hot habaneros et piments donner &agrave; cette tingler amygdales sa saveur c&eacute;l&egrave;bre et rouge de chaleur chaud. Bull Snort Smokin ''Hot amygdales Sauce''ll avoir vos entrailles buckin Â»avec une goutte d''eau.'),
(-275, '13', 'Sku', 'name', 'fr', 'Bull Snort Smokin ''Hot Sauce Toncils'),
(-274, '12', 'Sku', 'longDescription', 'fr', 'L''une des sauces les plus insolites que nous vendons. L''original &eacute;tait un vieux style sauce cajun et c''est Ã§a le noircissement &agrave; jour de version. C''est gentil, mais vous obtenez un grand succ&egrave;s de cannelle et de clou de girofle avec un coup de chaleur agr&eacute;able de Cayenne. Utilisez-le sur tous les aliments &agrave; donner cette ambiance cajun.'),
(-273, '12', 'Sku', 'name', 'fr', 'Caf&eacute; Cajun Louisiane Douce Sauce Blackening'),
(-272, '11', 'Sku', 'longDescription', 'fr', 'Been there, encord&eacute;s cela. Hotter than jument buckin ''en chaleur! Saupoudrez de plats de viande, de fruits de mer et l&eacute;gumes. Utilisation comme additif dans une sauce barbecue ou tout aliment qui a besoin d''une saveur &eacute;pic&eacute;e. Commencez avec quelques gouttes et travailler jusqu''&agrave; la saveur d&eacute;sir&eacute;e.'),
(-271, '11', 'Sku', 'name', 'fr', 'Bull Snort Cowboy poivre de Cayenne Hot Sauce'),
(-270, '10', 'Sku', 'longDescription', 'fr', 'Voici la prescription pour ceux qui aiment la chaleur intol&eacute;rable. Dr Chilemeister potion de malades et mal mortel doit &ecirc;tre utilis&eacute; avec prudence. La douleur peut devenir une d&eacute;pendance!'),
(-269, '10', 'Sku', 'name', 'fr', 'Dr Chilemeister Sauce Hot Insane'),
(-268, '9', 'Sku', 'longDescription', 'fr', 'Tout l''enfer se d&eacute;chaÃ®ne, le feu et le soufre pleuvoir? se pr&eacute;parer &agrave; rencontrer votre machine?'),
(-267, '9', 'Sku', 'name', 'fr', 'Armageddon Le Hot Sauce To End All'),
(-266, '8', 'Sku', 'longDescription', 'fr', 'Vous misez vos bottes, cette sauce chaude valu son nom de gens qui appr&eacute;cient une sauce chaude exceptionnel. Ce que vous trouverez ici est une saveur piquante vraiment original, pas un piquant irr&eacute;sistible que l''on retrouve dans les sauces au poivre Tabasco ordinaires - m&ecirc;me si le piment utilis&eacute; dans ce produit a &eacute;t&eacute; test&eacute; &agrave; 285.000 unit&eacute;s Scoville. Alors, en selle pour une balade inoubliable. Pour vous assurer que nous vous avons apport&eacute; la plus belle sauce au poivre de Habanero, nous sommes all&eacute;s aux contreforts des montagnes mayas au Belize, en Am&eacute;rique centrale. Ce produit est pr&eacute;par&eacute; enti&egrave;rement &agrave; la main en utilisant uniquement des l&eacute;gumes frais et de tous les ingr&eacute;dients naturels.'),
(-265, '8', 'Sku', 'name', 'fr', 'Blazin ''Selle XXX Hot Habanero sauce au poivre'),
(-264, '7', 'Sku', 'longDescription', 'fr', 'Fabriqu&eacute; avec Naga Bhut Jolokia, plus chaud poivre dans le monde.'),
(-263, '7', 'Sku', 'name', 'fr', 'Green Ghost'),
(-262, '6', 'Sku', 'longDescription', 'fr', 'Souvent confondu avec le Habanero, le Scotch Bonnet a une pointe profond&eacute;ment invers&eacute;e par rapport &agrave; l''extr&eacute;mit&eacute; pointue de l''Habanero. Allant dans de nombreuses couleurs allant du vert au jaune-orange, le Scotch Bonnet est un aliment de base dans les Antilles et sauces au poivre de style Barbade.'),
(-261, '6', 'Sku', 'name', 'fr', 'Jour de la sauce Scotch Bonnet Hot Morte'),
(-260, '5', 'Sku', 'longDescription', 'fr', 'Si vous voulez chaud, c''est le piment de choisir. Originaire de la CaraÃ¯be, du Yucatan et du Nord CÃ´te de l''Am&eacute;rique du Sud, le Habanero se pr&eacute;sente dans une vari&eacute;t&eacute; de couleurs allant du vert p&acirc;le au rouge vif. La chaleur gras Habanero, la saveur et l''arÃ´me unique, en a fait le favori des amateurs de chili.'),
(-259, '5', 'Sku', 'name', 'fr', 'Jour de la sauce Habanero Hot Morte'),
(-258, '4', 'Sku', 'longDescription', 'fr', 'Lorsque tout le poivre est s&eacute;ch&eacute; et fum&eacute;, il est consid&eacute;r&eacute; comme un Chipotle. Normalement, avec un aspect froiss&eacute;, drak brun, le chipotle fum&eacute; offre une saveur douce qui est g&eacute;n&eacute;ralement utilis&eacute; pour ajouter un smokey, saveur rÃ´tie aux salsas, les ragoÃ»ts et marinades.'),
(-257, '4', 'Sku', 'name', 'fr', 'Jour de la sauce chaude Morte Chipotle'),
(-256, '3', 'Sku', 'longDescription', 'fr', 'Tangy, venu de Cayenne poivron flux avec l''ail, l''oignon p&acirc;te de tomate, et un soupÃ§on de sucre de canne pour en faire une sauce onctueuse avec une morsure. Magnifique sur les Å“ufs, la volaille, le porc ou le poisson, cette sauce marie pour faire des marinades et des soupes riches.'),
(-255, '3', 'Sku', 'name', 'fr', 'Hot Sauce Hoppin'),
(-254, '2', 'Sku', 'longDescription', 'fr', 'Le parfait topper pour le poulet, le poisson, des hamburgers ou une pizza. Un grand m&eacute;lange de Habanero, mangue, fruits de la passion et de plus faire cette sauce Mort d''un festin incroyable tropicale'),
(-253, '2', 'Sku', 'name', 'fr', 'Sauce Sweet Death'),
(-252, '1', 'Sku', 'longDescription', 'fr', 'Comme mes Chilipals sais, je suis pas du genre &agrave; &ecirc;tre satisfaite. Par cons&eacute;quent, la cr&eacute;ation de la mort subite. Lorsque vous avez besoin d''aller au-del&agrave; ... Mort subite livrera!'),
(-251, '1', 'Sku', 'name', 'fr', 'Sauce mort subite'),
(-247, '14', 'ProdOptionVal', 'attributeValue', 'fr', 'XG'),
(-246, '13', 'ProdOptionVal', 'attributeValue', 'fr', 'G'),
(-245, '12', 'ProdOptionVal', 'attributeValue', 'fr', 'M'),
(-244, '11', 'ProdOptionVal', 'attributeValue', 'fr', 'P'),
(-243, '3', 'ProdOptionVal', 'attributeValue', 'fr', 'Argent'),
(-242, '2', 'ProdOptionVal', 'attributeValue', 'fr', 'Rouge'),
(-241, '1', 'ProdOptionVal', 'attributeValue', 'fr', 'Noir'),
(-232, '2', 'ProdOption', 'label', 'fr', 'Shirt Taille'),
(-231, '1', 'ProdOption', 'label', 'fr', 'Shirt Couleur'),
(-216, '2006', 'Category', 'description', 'fr', 'FAQ'),
(-215, '2005', 'Category', 'description', 'fr', 'Nouveau Hot Sauce?'),
(-214, '2004', 'Category', 'description', 'fr', 'D&eacute;gagement'),
(-213, '2003', 'Category', 'description', 'fr', 'Marchandisfr'),
(-212, '2002', 'Category', 'description', 'fr', 'Sauces chaudfr'),
(-211, '2001', 'Category', 'description', 'fr', 'Page d''accueil'),
(-206, '2006', 'Category', 'name', 'fr', 'FAQ'),
(-205, '2005', 'Category', 'name', 'fr', 'Nouveau Hot Sauce?'),
(-204, '2004', 'Category', 'name', 'fr', 'D&eacute;gagement'),
(-203, '2003', 'Category', 'name', 'fr', 'Marchandisfr'),
(-202, '2002', 'Category', 'name', 'fr', 'Sauces chaudfr'),
(-201, '2001', 'Category', 'name', 'fr', 'Page d''accueil'),
(-196, '3', 'FulfillmentOption', 'longDescription', 'es', '1 - 2 D&iacute;as'),
(-195, '3', 'FulfillmentOption', 'name', 'es', 'Express'),
(-194, '2', 'FulfillmentOption', 'longDescription', 'es', '3 - 5 D&iacute;as'),
(-193, '2', 'FulfillmentOption', 'name', 'es', 'Ejecutiva'),
(-192, '1', 'FulfillmentOption', 'longDescription', 'es', '5 - 7 D&iacute;as'),
(-191, '1', 'FulfillmentOption', 'name', 'es', 'EstÃ¡ndar'),
(-182, '3', 'SearchFacet', 'label', 'es', 'Precio'),
(-181, '2', 'SearchFacet', 'label', 'es', 'Rango de Calor'),
(-180, '1', 'SearchFacet', 'label', 'es', 'Fabricante'),
(-100, '600', 'Sku', 'longDescription', 'es', '&iquest;No te encanta nuestra mascota? Compre su propia camiseta hoy!'),
(-99, '600', 'Sku', 'name', 'es', 'Mascota de Heat Clinic (Mujeres)'),
(-98, '500', 'Sku', 'longDescription', 'es', '&iquest;No te encanta nuestra mascota? Compre su propia camiseta hoy!'),
(-97, '500', 'Sku', 'name', 'es', 'Mascota de Heat Clinic (Hombres)'),
(-96, '400', 'Sku', 'longDescription', 'es', 'Esta camiseta tiene el logo dibujado a mano para hombres, ofrece un ajuste regular en tres colores diferentes.'),
(-95, '400', 'Sku', 'name', 'es', 'Heat Clinic dibujado a mano (Mujeres)'),
(-94, '300', 'Sku', 'longDescription', 'es', 'Esta camiseta tiene el logo dibujado a mano para hombres, ofrece un ajuste regular en tres colores diferentes.'),
(-93, '300', 'Sku', 'name', 'es', 'Heat Clinic dibujado a mano (Hombres)'),
(-92, '200', 'Sku', 'longDescription', 'es', 'Colecci&oacute;n de Mujeres Habanero est&aacute;ndar de manga corta serigrafiadas, camiseta de algod&oacute;n suave en ajuste normal.'),
(-91, '200', 'Sku', 'name', 'es', 'Camisa de Habanero Hawt (Mujeres)'),
(-90, '100', 'Sku', 'longDescription', 'es', 'Colecci&oacute;n de Hombres Habanero est&aacute;ndar de manga corta serigrafiadas, camiseta de algod&oacute;n suave en ajuste normal.'),
(-89, '100', 'Sku', 'name', 'es', 'Camisa de Habanero Hawt (Hombres)'),
(-88, '19', 'Sku', 'longDescription', 'es', 'Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.'),
(-87, '19', 'Sku', 'name', 'es', 'Salsa de Pimienta Roja y Chipotle'),
(-86, '18', 'Sku', 'longDescription', 'es', 'Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.'),
(-85, '18', 'Sku', 'name', 'es', 'Salsa de Jalape&ntilde;o Ardiente'),
(-84, '17', 'Sku', 'longDescription', 'es', 'Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.'),
(-83, '17', 'Sku', 'name', 'es', 'Salsa de Locura'),
(-82, '16', 'Sku', 'longDescription', 'es', 'Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.'),
(-81, '16', 'Sku', 'name', 'es', 'Salsa de Locura'),
(-80, '15', 'Sku', 'longDescription', 'es', 'Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.'),
(-79, '15', 'Sku', 'name', 'es', 'Salsa de Ajo Tostado'),
(-78, '14', 'Sku', 'longDescription', 'es', 'Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.'),
(-77, '14', 'Sku', 'name', 'es', 'Salsa de Cayene Fresco'),
(-76, '13', 'Sku', 'longDescription', 'es', 'Todo es m&aacute;s grande en Texas, incluso lo picante de la Salsa de Snortin Bull! Si usted es un fan de hacer la salsa de barbacoa a partir de cero, como yo, puede utilizar la Salsa de Snortin Bull como aditivo. Habaneros ardientes y los pimientos de cayena dan a la garganta un sabor y calor al rojo vivo.'),
(-75, '13', 'Sku', 'name', 'es', 'Salsa Mata-Gargantas de Bull Snort'),
(-74, '12', 'Sku', 'longDescription', 'es', 'Una de las salsas m&aacute;s inusuales que vendemos. La original era un viejo estilo salsa caj&uacute;n y esto versi&oacute;n actualizada ennegrecimiento. Es dulce, pero se obtiene un gran sabor de canela y clavo de olor con un tiro agradable de piacnte de Cayena. Use en todos los alimentos para dar ese toque caj&uacute;n.'),
(-73, '12', 'Sku', 'name', 'es', 'Salsa Dulce de Cajun de Lousiane'),
(-72, '11', 'Sku', 'longDescription', 'es', 'Espolvorear con platos de carne, pescado y verduras. Use como aditivo en la salsa de barbacoa o cualquier alimento que necesita un sabor picante. Comience con unas gotas y aumente hasta llegar al sabor deseado.'),
(-71, '11', 'Sku', 'name', 'es', 'Salsa Picante del Vaquero'),
(-70, '10', 'Sku', 'longDescription', 'es', 'AquÃ­ est&aacute; la receta para aquellos que disfrutan de picante intolerable. Esta salsa macabra y mortal del Dr. Chilemeister se debe utilizar con precauci&oacute;n. El dolor puede llegar a ser adictivo!'),
(-69, '10', 'Sku', 'name', 'es', 'Salsa Loca del Dr. Chilemeister'),
(-68, '9', 'Sku', 'longDescription', 'es', 'Todo el infierno se ha desatado, fuego y azufre. Est&aacute; listo para el fin?'),
(-67, '9', 'Sku', 'name', 'es', 'Fin del Mundo Salsa'),
(-66, '8', 'Sku', 'longDescription', 'es', 'Esta salsa caliente recibe su nombre por la gente que aprecian una salsa picante. Lo que vas a encontrar aquÃ­ es un sabor picante realmente original, no una acritud abrumador que se encuentra en las salsas de chile Tabasco ordinarios - a pesar de la pimienta usado en este producto ha sido probado en 285.000 unidades Scoville. Por lo tanto, ensillar a dar un paseo para recordar. Para asegurarnos de que usted trajo s&oacute;lo la mejor salsa de pimiento habanero, nos fuimos a las faldas de las monta&ntilde;as mayas en Belice, Am&eacute;rica Central. Este producto se prepara totalmente a mano utilizando s&oacute;lo las verduras frescas y solo ingredientes naturales.'),
(-65, '8', 'Sku', 'name', 'es', 'Salsa de Habanero de la Silla Ardiente'),
(-64, '7', 'Sku', 'longDescription', 'es', 'Hecho con Naga Jolokia Bhut, el chile m&aacute;s picante del mundo.'),
(-63, '7', 'Sku', 'name', 'es', 'Fantasma Verde'),
(-62, '6', 'Sku', 'longDescription', 'es', 'Parecido al Habanero, el Bonnet Escoc&eacute;s tiene una punta profundamente invertidas en comparaci&oacute;n con el extremo puntiagudo del Habanero. Van en colores de verde a amarillo-naranja, el Bonnet Escoc&eacute;s es un alimento b&aacute;sico en West Indies, en Barbados y salsas estilo pimienta.'),
(-61, '6', 'Sku', 'name', 'es', 'Salsa del D&iacute;a de los Muertos de Bonnet Escoc&eacute;s'),
(-60, '5', 'Sku', 'longDescription', 'es', 'Si quieres picante, este es el Chile a elegir. Originario del Caribe, Yucat&aacute;n y la Costa norte de Am&eacute;rica del Sur, el habanero se presenta en una variedad de colores que van desde el verde claro a un rojo brillante. El calor, sabor y aroma &uacute;nicos del Habanero ha convertido el chile en el favorito de los amantes del picante.'),
(-59, '5', 'Sku', 'name', 'es', 'Salsa del D&iacute;a de los Muertos de Habanero'),
(-58, '4', 'Sku', 'longDescription', 'es', 'Cuando cualquier pimienta se seca y se fuma, se refiere como un Chipotle. Por lo general, con una apariencia arrugada, caf&eacute; oscuro, el Chipotle ofrece un sabor ahumado y dulce que se utiliza generalmente para agregar un sabor asado a las salsas, guisos y adobos.'),
(-57, '4', 'Sku', 'name', 'es', 'Salsa del D&iacute;a de los Muertos de Chipotle'),
(-56, '3', 'Sku', 'longDescription', 'es', 'Picante, maduro pimienta que se mezcla junto con el ajo, la cebolla, pasta de tomate y una pizca de az&uacute;car de ca&ntilde;a para hacer de esto una salsa suave. Maravilloso en huevos, aves de corral, carne de cerdo o pescado, esta salsa se â€‹â€‹mezcla para hacer los adobos y sopas ricas.'),
(-55, '3', 'Sku', 'name', 'es', 'Salsa de la Muerte Saltante'),
(-54, '2', 'Sku', 'longDescription', 'es', 'El perfecto acompa&ntilde;ante para el pollo, el pescado, hamburguesas o pizza. Una gran mezcla de habanero, mango, fruta de la pasi&oacute;n y mucho m&aacute;s hacen de esta salsa de la Muerte una delicia tropical incre&iacute;ble.'),
(-53, '2', 'Sku', 'name', 'es', 'Salsa de la Muerte Dulce'),
(-52, '1', 'Sku', 'longDescription', 'es', 'Como mis amigos salseros saben, nunca soy f&aacute;cil de satisfacer. Por lo tanto, naci&oacute; la creaci&oacute;n de la Muerte S&uacute;bita. Cuando este listo para saborear al m&aacute;s all&aacute; ... Muerte s&uacute;bita entregar&aacute;!'),
(-51, '1', 'Sku', 'name', 'es', 'Salsa de la Muerte S&uacute;bita'),
(-47, '14', 'ProdOptionVal', 'attributeValue', 'es', 'XG'),
(-46, '13', 'ProdOptionVal', 'attributeValue', 'es', 'G'),
(-45, '12', 'ProdOptionVal', 'attributeValue', 'es', 'M'),
(-44, '11', 'ProdOptionVal', 'attributeValue', 'es', 'CH'),
(-43, '3', 'ProdOptionVal', 'attributeValue', 'es', 'Plateado'),
(-42, '2', 'ProdOptionVal', 'attributeValue', 'es', 'Rojo'),
(-41, '1', 'ProdOptionVal', 'attributeValue', 'es', 'Negro'),
(-32, '2', 'ProdOption', 'label', 'es', 'Tama&ntilde;o de Camisa'),
(-31, '1', 'ProdOption', 'label', 'es', 'Color de Camisa'),
(-16, '2006', 'Category', 'description', 'es', 'FAQ'),
(-15, '2005', 'Category', 'description', 'es', 'Iniciando con Salsas?'),
(-14, '2004', 'Category', 'description', 'es', 'Descuento'),
(-13, '2003', 'Category', 'description', 'es', 'Mercanc&iacute;a'),
(-12, '2002', 'Category', 'description', 'es', 'Salsas Picantes'),
(-11, '2001', 'Category', 'description', 'es', 'Inicio'),
(-6, '2006', 'Category', 'name', 'es', 'FAQ'),
(-5, '2005', 'Category', 'name', 'es', 'Nuevo a la Salsa?'),
(-4, '2004', 'Category', 'name', 'es', 'Descuento'),
(-3, '2003', 'Category', 'name', 'es', 'Mercanc&iacute;a'),
(-2, '2002', 'Category', 'name', 'es', 'Salsas'),
(-1, '2001', 'Category', 'name', 'es', 'Inicio');

-- --------------------------------------------------------

--
-- Table structure for table `blc_trans_additnl_fields`
--

CREATE TABLE IF NOT EXISTS `blc_trans_additnl_fields` (
  `PAYMENT_TRANSACTION_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` longtext COLLATE utf8_vietnamese_ci,
  `FIELD_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`PAYMENT_TRANSACTION_ID`,`FIELD_NAME`),
  KEY `FK376DDE4B9E955B1D` (`PAYMENT_TRANSACTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_url_handler`
--

CREATE TABLE IF NOT EXISTS `blc_url_handler` (
  `URL_HANDLER_ID` bigint(20) NOT NULL,
  `INCOMING_URL` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `NEW_URL` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `URL_REDIRECT_TYPE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`URL_HANDLER_ID`),
  KEY `INCOMING_URL_INDEX` (`INCOMING_URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `blc_url_handler`
--

INSERT INTO `blc_url_handler` (`URL_HANDLER_ID`, `INCOMING_URL`, `NEW_URL`, `URL_REDIRECT_TYPE`) VALUES
(1, '/googlePerm', 'http://www.google.com', 'REDIRECT_PERM'),
(2, '/googleTemp', 'http://www.google.com', 'REDIRECT_TEMP'),
(3, '/insanity', '/hot-sauces/insanity_sauce', 'FORWARD'),
(4, '/jalepeno', '/hot-sauces/hurtin_jalepeno_hot_sauce', 'REDIRECT_TEMP');

-- --------------------------------------------------------

--
-- Table structure for table `blc_userconnection`
--

CREATE TABLE IF NOT EXISTS `blc_userconnection` (
  `providerId` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `providerUserId` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `userId` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `displayName` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  `imageUrl` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `profileUrl` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `rank` int(11) NOT NULL,
  `refreshToken` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`providerId`,`providerUserId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blc_zip_code`
--

CREATE TABLE IF NOT EXISTS `blc_zip_code` (
  `ZIP_CODE_ID` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `ZIP_CITY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ZIP_LATITUDE` double DEFAULT NULL,
  `ZIP_LONGITUDE` double DEFAULT NULL,
  `ZIP_STATE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ZIPCODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ZIP_CODE_ID`),
  KEY `ZIPCODE_CITY_INDEX` (`ZIP_CITY`),
  KEY `ZIPCODE_LATITUDE_INDEX` (`ZIP_LATITUDE`),
  KEY `ZIPCODE_LONGITUDE_INDEX` (`ZIP_LONGITUDE`),
  KEY `ZIPCODE_STATE_INDEX` (`ZIP_STATE`),
  KEY `ZIPCODE_ZIP_INDEX` (`ZIPCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_generator`
--

CREATE TABLE IF NOT EXISTS `sequence_generator` (
  `ID_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `ID_VAL` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `sequence_generator`
--

INSERT INTO `sequence_generator` (`ID_NAME`, `ID_VAL`) VALUES
('CategoryExcludedSearchFacetImpl', 1000),
('CategoryImpl', 10000),
('CategoryProductImpl', 1000),
('CategoryProductXrefImpl', 1000),
('CategorySearchFacetImpl', 1000),
('CategoryXrefImpl', 1000),
('ChallengeQuestionImpl', 1000),
('FeaturedProductImpl', 1000),
('FieldDefinitionImpl', 1000),
('FieldEnumerationImpl', 1000),
('FieldEnumerationItemImpl', 1000),
('FieldGroupImpl', 1000),
('FieldImpl', 1000),
('FulfillmentOptionImpl', 1000),
('MediaImpl', 100000),
('OfferCodeImpl', 1000),
('OfferImpl', 1000),
('OfferItemCriteriaImpl', 1000),
('PageFieldImpl', 1000),
('PageImpl', 1000),
('PageTemplateImpl', 1000),
('ProductAttributeImpl', 1000),
('ProductImpl', 10000),
('ProductOptionImpl', 1000),
('ProductOptionValueImpl', 1000),
('ProductOptionXrefImpl', 1000),
('RoleImpl', 1000),
('SearchFacetImpl', 1000),
('SearchFacetRangeImpl', 1000),
('SearchInterceptImpl', 1000),
('SkuImpl', 10000),
('StaticAssetImpl', 100000),
('StructuredContentFieldImpl', 1000),
('StructuredContentImpl', 1000),
('StructuredContentRuleImpl', 1000),
('StructuredContentTypeImpl', 1000),
('URLHandlerImpl', 1000);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blc_additional_offer_info`
--
ALTER TABLE `blc_additional_offer_info`
  ADD CONSTRAINT `FK3BFDBD631891FF79` FOREIGN KEY (`BLC_ORDER_ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  ADD CONSTRAINT `FK3BFDBD63B5D9C34D` FOREIGN KEY (`OFFER_INFO_ID`) REFERENCES `blc_offer_info` (`OFFER_INFO_ID`),
  ADD CONSTRAINT `FK3BFDBD63D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`);

--
-- Constraints for table `blc_address`
--
ALTER TABLE `blc_address`
  ADD CONSTRAINT `FK299F86CE337C4D50` FOREIGN KEY (`STATE_PROV_REGION`) REFERENCES `blc_state` (`ABBREVIATION`),
  ADD CONSTRAINT `FK299F86CEA46E16CF` FOREIGN KEY (`COUNTRY`) REFERENCES `blc_country` (`ABBREVIATION`),
  ADD CONSTRAINT `FK299F86CEBF4449BA` FOREIGN KEY (`PHONE_PRIMARY_ID`) REFERENCES `blc_phone` (`PHONE_ID`),
  ADD CONSTRAINT `FK299F86CEE12DC0C8` FOREIGN KEY (`PHONE_SECONDARY_ID`) REFERENCES `blc_phone` (`PHONE_ID`),
  ADD CONSTRAINT `FK299F86CEF1A6533F` FOREIGN KEY (`PHONE_FAX_ID`) REFERENCES `blc_phone` (`PHONE_ID`);

--
-- Constraints for table `blc_admin_permission_entity`
--
ALTER TABLE `blc_admin_permission_entity`
  ADD CONSTRAINT `FK23C09E3DE88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`);

--
-- Constraints for table `blc_admin_permission_xref`
--
ALTER TABLE `blc_admin_permission_xref`
  ADD CONSTRAINT `FKBCAD1F575A3C445` FOREIGN KEY (`CHILD_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`),
  ADD CONSTRAINT `FKBCAD1F5E88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`);

--
-- Constraints for table `blc_admin_role_permission_xref`
--
ALTER TABLE `blc_admin_role_permission_xref`
  ADD CONSTRAINT `FK4A819D985F43AAD8` FOREIGN KEY (`ADMIN_ROLE_ID`) REFERENCES `blc_admin_role` (`ADMIN_ROLE_ID`),
  ADD CONSTRAINT `FK4A819D98E88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`);

--
-- Constraints for table `blc_admin_section`
--
ALTER TABLE `blc_admin_section`
  ADD CONSTRAINT `FK7EA7D92FB1A18498` FOREIGN KEY (`ADMIN_MODULE_ID`) REFERENCES `blc_admin_module` (`ADMIN_MODULE_ID`);

--
-- Constraints for table `blc_admin_sec_perm_xref`
--
ALTER TABLE `blc_admin_sec_perm_xref`
  ADD CONSTRAINT `FK5E8329663AF7F0FC` FOREIGN KEY (`ADMIN_SECTION_ID`) REFERENCES `blc_admin_section` (`ADMIN_SECTION_ID`),
  ADD CONSTRAINT `FK5E832966E88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`);

--
-- Constraints for table `blc_admin_user_addtl_fields`
--
ALTER TABLE `blc_admin_user_addtl_fields`
  ADD CONSTRAINT `FK73274CDD46EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`);

--
-- Constraints for table `blc_admin_user_permission_xref`
--
ALTER TABLE `blc_admin_user_permission_xref`
  ADD CONSTRAINT `FKF0B3BEED46EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  ADD CONSTRAINT `FKF0B3BEEDE88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`);

--
-- Constraints for table `blc_admin_user_role_xref`
--
ALTER TABLE `blc_admin_user_role_xref`
  ADD CONSTRAINT `FKFFD33A2646EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  ADD CONSTRAINT `FKFFD33A265F43AAD8` FOREIGN KEY (`ADMIN_ROLE_ID`) REFERENCES `blc_admin_role` (`ADMIN_ROLE_ID`);

--
-- Constraints for table `blc_admin_user_sandbox`
--
ALTER TABLE `blc_admin_user_sandbox`
  ADD CONSTRAINT `FKD0A97E0946EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  ADD CONSTRAINT `FKD0A97E09579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`);

--
-- Constraints for table `blc_asset_desc_map`
--
ALTER TABLE `blc_asset_desc_map`
  ADD CONSTRAINT `FKE886BAE367F70B63` FOREIGN KEY (`STATIC_ASSET_ID`) REFERENCES `blc_static_asset` (`STATIC_ASSET_ID`),
  ADD CONSTRAINT `FKE886BAE3E2BA0C9D` FOREIGN KEY (`STATIC_ASSET_DESC_ID`) REFERENCES `blc_static_asset_desc` (`STATIC_ASSET_DESC_ID`);

--
-- Constraints for table `blc_bundle_order_item`
--
ALTER TABLE `blc_bundle_order_item`
  ADD CONSTRAINT `FK489703DB9AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  ADD CONSTRAINT `FK489703DBB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  ADD CONSTRAINT `FK489703DBCCF29B96` FOREIGN KEY (`PRODUCT_BUNDLE_ID`) REFERENCES `blc_product_bundle` (`PRODUCT_ID`);

--
-- Constraints for table `blc_bund_item_fee_price`
--
ALTER TABLE `blc_bund_item_fee_price`
  ADD CONSTRAINT `FK14267A943FC68307` FOREIGN KEY (`BUND_ORDER_ITEM_ID`) REFERENCES `blc_bundle_order_item` (`ORDER_ITEM_ID`);

--
-- Constraints for table `blc_candidate_fg_offer`
--
ALTER TABLE `blc_candidate_fg_offer`
  ADD CONSTRAINT `FKCE78560D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`),
  ADD CONSTRAINT `FKCE785605028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`);

--
-- Constraints for table `blc_candidate_item_offer`
--
ALTER TABLE `blc_candidate_item_offer`
  ADD CONSTRAINT `FK9EEE9B29AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  ADD CONSTRAINT `FK9EEE9B2D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`);

--
-- Constraints for table `blc_candidate_order_offer`
--
ALTER TABLE `blc_candidate_order_offer`
  ADD CONSTRAINT `FK6185228989FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  ADD CONSTRAINT `FK61852289D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`);

--
-- Constraints for table `blc_category`
--
ALTER TABLE `blc_category`
  ADD CONSTRAINT `FK55F82D44B177E6` FOREIGN KEY (`DEFAULT_PARENT_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`);

--
-- Constraints for table `blc_category_attribute`
--
ALTER TABLE `blc_category_attribute`
  ADD CONSTRAINT `FK4E441D4115D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`);

--
-- Constraints for table `blc_category_image`
--
ALTER TABLE `blc_category_image`
  ADD CONSTRAINT `FK27CF3E8015D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`);

--
-- Constraints for table `blc_category_media_map`
--
ALTER TABLE `blc_category_media_map`
  ADD CONSTRAINT `FKCD24B106D786CEA2` FOREIGN KEY (`BLC_CATEGORY_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  ADD CONSTRAINT `FKCD24B1066E4720E0` FOREIGN KEY (`MEDIA_ID`) REFERENCES `blc_media` (`MEDIA_ID`);

--
-- Constraints for table `blc_category_product_xref`
--
ALTER TABLE `blc_category_product_xref`
  ADD CONSTRAINT `FK635EB1A65F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  ADD CONSTRAINT `FK635EB1A615D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`);

--
-- Constraints for table `blc_category_xref`
--
ALTER TABLE `blc_category_xref`
  ADD CONSTRAINT `FKE8897336D6D45DBE` FOREIGN KEY (`SUB_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  ADD CONSTRAINT `FKE889733615D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`);

--
-- Constraints for table `blc_cat_search_facet_excl_xref`
--
ALTER TABLE `blc_cat_search_facet_excl_xref`
  ADD CONSTRAINT `FK8361EF4EB96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`),
  ADD CONSTRAINT `FK8361EF4E15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`);

--
-- Constraints for table `blc_cat_search_facet_xref`
--
ALTER TABLE `blc_cat_search_facet_xref`
  ADD CONSTRAINT `FK32210EEBB96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`),
  ADD CONSTRAINT `FK32210EEB15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`);

--
-- Constraints for table `blc_cat_site_map_gen_cfg`
--
ALTER TABLE `blc_cat_site_map_gen_cfg`
  ADD CONSTRAINT `FK1BA4E69BCAB9F56` FOREIGN KEY (`GEN_CONFIG_ID`) REFERENCES `blc_site_map_gen_cfg` (`GEN_CONFIG_ID`),
  ADD CONSTRAINT `FK1BA4E695C5F3D60` FOREIGN KEY (`ROOT_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`);

--
-- Constraints for table `blc_customer`
--
ALTER TABLE `blc_customer`
  ADD CONSTRAINT `FK7716F024A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`),
  ADD CONSTRAINT `FK7716F0241422B204` FOREIGN KEY (`CHALLENGE_QUESTION_ID`) REFERENCES `blc_challenge_question` (`QUESTION_ID`);

--
-- Constraints for table `blc_customer_address`
--
ALTER TABLE `blc_customer_address`
  ADD CONSTRAINT `FK75B95AB97470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  ADD CONSTRAINT `FK75B95AB9C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`);

--
-- Constraints for table `blc_customer_attribute`
--
ALTER TABLE `blc_customer_attribute`
  ADD CONSTRAINT `FKB974C8217470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`);

--
-- Constraints for table `blc_customer_offer_xref`
--
ALTER TABLE `blc_customer_offer_xref`
  ADD CONSTRAINT `FK685E8039D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`),
  ADD CONSTRAINT `FK685E80397470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`);

--
-- Constraints for table `blc_customer_payment`
--
ALTER TABLE `blc_customer_payment`
  ADD CONSTRAINT `FK8B3DF0CB7470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  ADD CONSTRAINT `FK8B3DF0CBC13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`);

--
-- Constraints for table `blc_customer_payment_fields`
--
ALTER TABLE `blc_customer_payment_fields`
  ADD CONSTRAINT `FK5CCB14ADCA0B98E0` FOREIGN KEY (`CUSTOMER_PAYMENT_ID`) REFERENCES `blc_customer_payment` (`CUSTOMER_PAYMENT_ID`);

--
-- Constraints for table `blc_customer_phone`
--
ALTER TABLE `blc_customer_phone`
  ADD CONSTRAINT `FK3D28ED73D894CB5D` FOREIGN KEY (`PHONE_ID`) REFERENCES `blc_phone` (`PHONE_ID`),
  ADD CONSTRAINT `FK3D28ED737470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`);

--
-- Constraints for table `blc_customer_role`
--
ALTER TABLE `blc_customer_role`
  ADD CONSTRAINT `FK548EB7B1B8587B7` FOREIGN KEY (`ROLE_ID`) REFERENCES `blc_role` (`ROLE_ID`),
  ADD CONSTRAINT `FK548EB7B17470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`);

--
-- Constraints for table `blc_cust_site_map_gen_cfg`
--
ALTER TABLE `blc_cust_site_map_gen_cfg`
  ADD CONSTRAINT `FK67C0DBA0BCAB9F56` FOREIGN KEY (`GEN_CONFIG_ID`) REFERENCES `blc_site_map_gen_cfg` (`GEN_CONFIG_ID`);

--
-- Constraints for table `blc_data_drvn_enum_val`
--
ALTER TABLE `blc_data_drvn_enum_val`
  ADD CONSTRAINT `FKB2D5700DA60E0554` FOREIGN KEY (`ENUM_TYPE`) REFERENCES `blc_data_drvn_enum` (`ENUM_ID`);

--
-- Constraints for table `blc_discrete_order_item`
--
ALTER TABLE `blc_discrete_order_item`
  ADD CONSTRAINT `FKBC3A8A849AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  ADD CONSTRAINT `FKBC3A8A841285903B` FOREIGN KEY (`SKU_BUNDLE_ITEM_ID`) REFERENCES `blc_sku_bundle_item` (`SKU_BUNDLE_ITEM_ID`),
  ADD CONSTRAINT `FKBC3A8A845CDFCA80` FOREIGN KEY (`BUNDLE_ORDER_ITEM_ID`) REFERENCES `blc_bundle_order_item` (`ORDER_ITEM_ID`),
  ADD CONSTRAINT `FKBC3A8A845F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  ADD CONSTRAINT `FKBC3A8A84B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`);

--
-- Constraints for table `blc_disc_item_fee_price`
--
ALTER TABLE `blc_disc_item_fee_price`
  ADD CONSTRAINT `FK2A641CC8B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`);

--
-- Constraints for table `blc_dyn_discrete_order_item`
--
ALTER TABLE `blc_dyn_discrete_order_item`
  ADD CONSTRAINT `FK209DEE9EB76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`);

--
-- Constraints for table `blc_email_tracking_clicks`
--
ALTER TABLE `blc_email_tracking_clicks`
  ADD CONSTRAINT `FKFDF9F52AFA1E5D61` FOREIGN KEY (`EMAIL_TRACKING_ID`) REFERENCES `blc_email_tracking` (`EMAIL_TRACKING_ID`);

--
-- Constraints for table `blc_email_tracking_opens`
--
ALTER TABLE `blc_email_tracking_opens`
  ADD CONSTRAINT `FKA5C3722AFA1E5D61` FOREIGN KEY (`EMAIL_TRACKING_ID`) REFERENCES `blc_email_tracking` (`EMAIL_TRACKING_ID`);

--
-- Constraints for table `blc_fg_adjustment`
--
ALTER TABLE `blc_fg_adjustment`
  ADD CONSTRAINT `FK468C8F25D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`),
  ADD CONSTRAINT `FK468C8F255028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`);

--
-- Constraints for table `blc_fg_fee_tax_xref`
--
ALTER TABLE `blc_fg_fee_tax_xref`
  ADD CONSTRAINT `FK25426DC0598F6D02` FOREIGN KEY (`FULFILLMENT_GROUP_FEE_ID`) REFERENCES `blc_fulfillment_group_fee` (`FULFILLMENT_GROUP_FEE_ID`),
  ADD CONSTRAINT `FK25426DC071448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `blc_tax_detail` (`TAX_DETAIL_ID`);

--
-- Constraints for table `blc_fg_fg_tax_xref`
--
ALTER TABLE `blc_fg_fg_tax_xref`
  ADD CONSTRAINT `FK61BEA4555028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`),
  ADD CONSTRAINT `FK61BEA45571448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `blc_tax_detail` (`TAX_DETAIL_ID`);

--
-- Constraints for table `blc_fg_item_tax_xref`
--
ALTER TABLE `blc_fg_item_tax_xref`
  ADD CONSTRAINT `FKDD3E8443E3BBB4D2` FOREIGN KEY (`FULFILLMENT_GROUP_ITEM_ID`) REFERENCES `blc_fulfillment_group_item` (`FULFILLMENT_GROUP_ITEM_ID`),
  ADD CONSTRAINT `FKDD3E844371448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `blc_tax_detail` (`TAX_DETAIL_ID`);

--
-- Constraints for table `blc_field_search_types`
--
ALTER TABLE `blc_field_search_types`
  ADD CONSTRAINT `FKF52D130D3C3907C4` FOREIGN KEY (`FIELD_ID`) REFERENCES `blc_field` (`FIELD_ID`);

--
-- Constraints for table `blc_fld_def`
--
ALTER TABLE `blc_fld_def`
  ADD CONSTRAINT `FK3FCB575E6A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `blc_fld_group` (`FLD_GROUP_ID`),
  ADD CONSTRAINT `FK3FCB575E38D08AB5` FOREIGN KEY (`ENUM_ID`) REFERENCES `blc_data_drvn_enum` (`ENUM_ID`);

--
-- Constraints for table `blc_fld_enum_item`
--
ALTER TABLE `blc_fld_enum_item`
  ADD CONSTRAINT `FK83A6A84AFD2EA299` FOREIGN KEY (`FLD_ENUM_ID`) REFERENCES `blc_fld_enum` (`FLD_ENUM_ID`);

--
-- Constraints for table `blc_fulfillment_group`
--
ALTER TABLE `blc_fulfillment_group`
  ADD CONSTRAINT `FKC5B9EF18D894CB5D` FOREIGN KEY (`PHONE_ID`) REFERENCES `blc_phone` (`PHONE_ID`),
  ADD CONSTRAINT `FKC5B9EF1877F565E1` FOREIGN KEY (`PERSONAL_MESSAGE_ID`) REFERENCES `blc_personal_message` (`PERSONAL_MESSAGE_ID`),
  ADD CONSTRAINT `FKC5B9EF1881F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  ADD CONSTRAINT `FKC5B9EF1889FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  ADD CONSTRAINT `FKC5B9EF18C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`);

--
-- Constraints for table `blc_fulfillment_group_fee`
--
ALTER TABLE `blc_fulfillment_group_fee`
  ADD CONSTRAINT `FK6AA8E1BF5028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`);

--
-- Constraints for table `blc_fulfillment_group_item`
--
ALTER TABLE `blc_fulfillment_group_item`
  ADD CONSTRAINT `FKEA74EBDA9AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  ADD CONSTRAINT `FKEA74EBDA5028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`);

--
-- Constraints for table `blc_fulfillment_option_fixed`
--
ALTER TABLE `blc_fulfillment_option_fixed`
  ADD CONSTRAINT `FK4083603181F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  ADD CONSTRAINT `FK408360313E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`);

--
-- Constraints for table `blc_fulfillment_opt_banded_prc`
--
ALTER TABLE `blc_fulfillment_opt_banded_prc`
  ADD CONSTRAINT `FKB1FD71E981F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`);

--
-- Constraints for table `blc_fulfillment_opt_banded_wgt`
--
ALTER TABLE `blc_fulfillment_opt_banded_wgt`
  ADD CONSTRAINT `FKB1FD8AEC81F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`);

--
-- Constraints for table `blc_fulfillment_price_band`
--
ALTER TABLE `blc_fulfillment_price_band`
  ADD CONSTRAINT `FK46C9EA726CDF59CA` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_opt_banded_prc` (`FULFILLMENT_OPTION_ID`);

--
-- Constraints for table `blc_fulfillment_weight_band`
--
ALTER TABLE `blc_fulfillment_weight_band`
  ADD CONSTRAINT `FK6A048D95A0B429C3` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_opt_banded_wgt` (`FULFILLMENT_OPTION_ID`);

--
-- Constraints for table `blc_giftwrap_order_item`
--
ALTER TABLE `blc_giftwrap_order_item`
  ADD CONSTRAINT `FKE1BE1563B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`);

--
-- Constraints for table `blc_img_static_asset`
--
ALTER TABLE `blc_img_static_asset`
  ADD CONSTRAINT `FKCC4B772167F70B63` FOREIGN KEY (`STATIC_ASSET_ID`) REFERENCES `blc_static_asset` (`STATIC_ASSET_ID`);

--
-- Constraints for table `blc_item_offer_qualifier`
--
ALTER TABLE `blc_item_offer_qualifier`
  ADD CONSTRAINT `FKD9C50C619AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  ADD CONSTRAINT `FKD9C50C61D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`);

--
-- Constraints for table `blc_locale`
--
ALTER TABLE `blc_locale`
  ADD CONSTRAINT `FK56C7DC203E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`);

--
-- Constraints for table `blc_offer_code`
--
ALTER TABLE `blc_offer_code`
  ADD CONSTRAINT `FK76B8C8D6D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`);

--
-- Constraints for table `blc_offer_info_fields`
--
ALTER TABLE `blc_offer_info_fields`
  ADD CONSTRAINT `FKA901886183AE7237` FOREIGN KEY (`OFFER_INFO_FIELDS_ID`) REFERENCES `blc_offer_info` (`OFFER_INFO_ID`);

--
-- Constraints for table `blc_offer_rule_map`
--
ALTER TABLE `blc_offer_rule_map`
  ADD CONSTRAINT `FKCA468FE245C66D1D` FOREIGN KEY (`BLC_OFFER_OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`),
  ADD CONSTRAINT `FKCA468FE2C11A218D` FOREIGN KEY (`OFFER_RULE_ID`) REFERENCES `blc_offer_rule` (`OFFER_RULE_ID`);

--
-- Constraints for table `blc_order`
--
ALTER TABLE `blc_order`
  ADD CONSTRAINT `FK8F5B64A8A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`),
  ADD CONSTRAINT `FK8F5B64A83E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`),
  ADD CONSTRAINT `FK8F5B64A87470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`);

--
-- Constraints for table `blc_order_adjustment`
--
ALTER TABLE `blc_order_adjustment`
  ADD CONSTRAINT `FK1E92D16489FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  ADD CONSTRAINT `FK1E92D164D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`);

--
-- Constraints for table `blc_order_attribute`
--
ALTER TABLE `blc_order_attribute`
  ADD CONSTRAINT `FKB3A467A589FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`);

--
-- Constraints for table `blc_order_item`
--
ALTER TABLE `blc_order_item`
  ADD CONSTRAINT `FK9A2E704A77F565E1` FOREIGN KEY (`PERSONAL_MESSAGE_ID`) REFERENCES `blc_personal_message` (`PERSONAL_MESSAGE_ID`),
  ADD CONSTRAINT `FK9A2E704A15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  ADD CONSTRAINT `FK9A2E704A89FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  ADD CONSTRAINT `FK9A2E704AB0B0D00A` FOREIGN KEY (`PARENT_ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  ADD CONSTRAINT `FK9A2E704AFD2F1F10` FOREIGN KEY (`GIFT_WRAP_ITEM_ID`) REFERENCES `blc_giftwrap_order_item` (`ORDER_ITEM_ID`);

--
-- Constraints for table `blc_order_item_add_attr`
--
ALTER TABLE `blc_order_item_add_attr`
  ADD CONSTRAINT `FKA466AB44B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`);

--
-- Constraints for table `blc_order_item_adjustment`
--
ALTER TABLE `blc_order_item_adjustment`
  ADD CONSTRAINT `FKA2658C829AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  ADD CONSTRAINT `FKA2658C82D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`);

--
-- Constraints for table `blc_order_item_attribute`
--
ALTER TABLE `blc_order_item_attribute`
  ADD CONSTRAINT `FK9F1ED0C79AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`);

--
-- Constraints for table `blc_order_item_dtl_adj`
--
ALTER TABLE `blc_order_item_dtl_adj`
  ADD CONSTRAINT `FK85F0248FD4AEA2C0` FOREIGN KEY (`ORDER_ITEM_PRICE_DTL_ID`) REFERENCES `blc_order_item_price_dtl` (`ORDER_ITEM_PRICE_DTL_ID`),
  ADD CONSTRAINT `FK85F0248FD5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`);

--
-- Constraints for table `blc_order_item_price_dtl`
--
ALTER TABLE `blc_order_item_price_dtl`
  ADD CONSTRAINT `FK1FB64BF19AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`);

--
-- Constraints for table `blc_order_multiship_option`
--
ALTER TABLE `blc_order_multiship_option`
  ADD CONSTRAINT `FKB3D3F7D69AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  ADD CONSTRAINT `FKB3D3F7D681F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  ADD CONSTRAINT `FKB3D3F7D689FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  ADD CONSTRAINT `FKB3D3F7D6C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`);

--
-- Constraints for table `blc_order_offer_code_xref`
--
ALTER TABLE `blc_order_offer_code_xref`
  ADD CONSTRAINT `FKFDF0E85389FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  ADD CONSTRAINT `FKFDF0E8533BB10F6D` FOREIGN KEY (`OFFER_CODE_ID`) REFERENCES `blc_offer_code` (`OFFER_CODE_ID`);

--
-- Constraints for table `blc_order_payment`
--
ALTER TABLE `blc_order_payment`
  ADD CONSTRAINT `FK9517A14F89FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  ADD CONSTRAINT `FK9517A14FC13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`);

--
-- Constraints for table `blc_order_payment_transaction`
--
ALTER TABLE `blc_order_payment_transaction`
  ADD CONSTRAINT `FK86FDE7CEE1B66C71` FOREIGN KEY (`PARENT_TRANSACTION`) REFERENCES `blc_order_payment_transaction` (`PAYMENT_TRANSACTION_ID`),
  ADD CONSTRAINT `FK86FDE7CE6A69DD9D` FOREIGN KEY (`ORDER_PAYMENT`) REFERENCES `blc_order_payment` (`ORDER_PAYMENT_ID`);

--
-- Constraints for table `blc_page`
--
ALTER TABLE `blc_page`
  ADD CONSTRAINT `FKF41BEDD5D49D3961` FOREIGN KEY (`PAGE_TMPLT_ID`) REFERENCES `blc_page_tmplt` (`PAGE_TMPLT_ID`);

--
-- Constraints for table `blc_page_fld_map`
--
ALTER TABLE `blc_page_fld_map`
  ADD CONSTRAINT `FKE9EE0951883C2667` FOREIGN KEY (`PAGE_ID`) REFERENCES `blc_page` (`PAGE_ID`),
  ADD CONSTRAINT `FKE9EE09515AEDD08A` FOREIGN KEY (`PAGE_FLD_ID`) REFERENCES `blc_page_fld` (`PAGE_FLD_ID`);

--
-- Constraints for table `blc_page_rule_map`
--
ALTER TABLE `blc_page_rule_map`
  ADD CONSTRAINT `FK1ABA0CA3C38455DD` FOREIGN KEY (`BLC_PAGE_PAGE_ID`) REFERENCES `blc_page` (`PAGE_ID`),
  ADD CONSTRAINT `FK1ABA0CA336D91846` FOREIGN KEY (`PAGE_RULE_ID`) REFERENCES `blc_page_rule` (`PAGE_RULE_ID`);

--
-- Constraints for table `blc_page_tmplt`
--
ALTER TABLE `blc_page_tmplt`
  ADD CONSTRAINT `FK325C9D5A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`);

--
-- Constraints for table `blc_payment_log`
--
ALTER TABLE `blc_payment_log`
  ADD CONSTRAINT `FKA43703457470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  ADD CONSTRAINT `FKA43703453E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`);

--
-- Constraints for table `blc_pgtmplt_fldgrp_xref`
--
ALTER TABLE `blc_pgtmplt_fldgrp_xref`
  ADD CONSTRAINT `FK99D625F6D49D3961` FOREIGN KEY (`PAGE_TMPLT_ID`) REFERENCES `blc_page_tmplt` (`PAGE_TMPLT_ID`),
  ADD CONSTRAINT `FK99D625F66A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `blc_fld_group` (`FLD_GROUP_ID`);

--
-- Constraints for table `blc_product`
--
ALTER TABLE `blc_product`
  ADD CONSTRAINT `FK5B95B7C96D386535` FOREIGN KEY (`DEFAULT_SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  ADD CONSTRAINT `FK5B95B7C9DF057C3F` FOREIGN KEY (`DEFAULT_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`);

--
-- Constraints for table `blc_product_attribute`
--
ALTER TABLE `blc_product_attribute`
  ADD CONSTRAINT `FK56CE05865F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`);

--
-- Constraints for table `blc_product_bundle`
--
ALTER TABLE `blc_product_bundle`
  ADD CONSTRAINT `FK8CC5B85F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`);

--
-- Constraints for table `blc_product_cross_sale`
--
ALTER TABLE `blc_product_cross_sale`
  ADD CONSTRAINT `FK8324FB3C62D84F9B` FOREIGN KEY (`RELATED_SALE_PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  ADD CONSTRAINT `FK8324FB3C15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  ADD CONSTRAINT `FK8324FB3C5F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`);

--
-- Constraints for table `blc_product_featured`
--
ALTER TABLE `blc_product_featured`
  ADD CONSTRAINT `FK4C49FFE45F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  ADD CONSTRAINT `FK4C49FFE415D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`);

--
-- Constraints for table `blc_product_option_value`
--
ALTER TABLE `blc_product_option_value`
  ADD CONSTRAINT `FK6DEEEDBD92EA8136` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `blc_product_option` (`PRODUCT_OPTION_ID`);

--
-- Constraints for table `blc_product_option_xref`
--
ALTER TABLE `blc_product_option_xref`
  ADD CONSTRAINT `FKDA42AB2F92EA8136` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `blc_product_option` (`PRODUCT_OPTION_ID`),
  ADD CONSTRAINT `FKDA42AB2F5F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`);

--
-- Constraints for table `blc_product_sku_xref`
--
ALTER TABLE `blc_product_sku_xref`
  ADD CONSTRAINT `FKF2DBF6D3B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  ADD CONSTRAINT `FKF2DBF6D35F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`);

--
-- Constraints for table `blc_product_up_sale`
--
ALTER TABLE `blc_product_up_sale`
  ADD CONSTRAINT `FKF69054F562D84F9B` FOREIGN KEY (`RELATED_SALE_PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  ADD CONSTRAINT `FKF69054F515D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  ADD CONSTRAINT `FKF69054F55F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`);

--
-- Constraints for table `blc_qual_crit_offer_xref`
--
ALTER TABLE `blc_qual_crit_offer_xref`
  ADD CONSTRAINT `FKD592E9193615A91A` FOREIGN KEY (`OFFER_ITEM_CRITERIA_ID`) REFERENCES `blc_offer_item_criteria` (`OFFER_ITEM_CRITERIA_ID`),
  ADD CONSTRAINT `FKD592E919D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`);

--
-- Constraints for table `blc_qual_crit_page_xref`
--
ALTER TABLE `blc_qual_crit_page_xref`
  ADD CONSTRAINT `FK874BE590378418CD` FOREIGN KEY (`PAGE_ITEM_CRITERIA_ID`) REFERENCES `blc_page_item_criteria` (`PAGE_ITEM_CRITERIA_ID`),
  ADD CONSTRAINT `FK874BE590883C2667` FOREIGN KEY (`PAGE_ID`) REFERENCES `blc_page` (`PAGE_ID`);

--
-- Constraints for table `blc_qual_crit_sc_xref`
--
ALTER TABLE `blc_qual_crit_sc_xref`
  ADD CONSTRAINT `FKC4A353AF85C77F2B` FOREIGN KEY (`SC_ITEM_CRITERIA_ID`) REFERENCES `blc_sc_item_criteria` (`SC_ITEM_CRITERIA_ID`),
  ADD CONSTRAINT `FKC4A353AF13D95585` FOREIGN KEY (`SC_ID`) REFERENCES `blc_sc` (`SC_ID`);

--
-- Constraints for table `blc_rating_detail`
--
ALTER TABLE `blc_rating_detail`
  ADD CONSTRAINT `FKC9D04ADD4E76BF4` FOREIGN KEY (`RATING_SUMMARY_ID`) REFERENCES `blc_rating_summary` (`RATING_SUMMARY_ID`),
  ADD CONSTRAINT `FKC9D04AD7470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`);

--
-- Constraints for table `blc_review_detail`
--
ALTER TABLE `blc_review_detail`
  ADD CONSTRAINT `FK9CD7E692D4E76BF4` FOREIGN KEY (`RATING_SUMMARY_ID`) REFERENCES `blc_rating_summary` (`RATING_SUMMARY_ID`),
  ADD CONSTRAINT `FK9CD7E69245DC39E0` FOREIGN KEY (`RATING_DETAIL_ID`) REFERENCES `blc_rating_detail` (`RATING_DETAIL_ID`),
  ADD CONSTRAINT `FK9CD7E6927470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`);

--
-- Constraints for table `blc_review_feedback`
--
ALTER TABLE `blc_review_feedback`
  ADD CONSTRAINT `FK7CC92986AE4769D6` FOREIGN KEY (`REVIEW_DETAIL_ID`) REFERENCES `blc_review_detail` (`REVIEW_DETAIL_ID`),
  ADD CONSTRAINT `FK7CC929867470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`);

--
-- Constraints for table `blc_sandbox`
--
ALTER TABLE `blc_sandbox`
  ADD CONSTRAINT `FKDD37A9A174160452` FOREIGN KEY (`PARENT_SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`);

--
-- Constraints for table `blc_sandbox_mgmt`
--
ALTER TABLE `blc_sandbox_mgmt`
  ADD CONSTRAINT `FK4845009F579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`);

--
-- Constraints for table `blc_sc`
--
ALTER TABLE `blc_sc`
  ADD CONSTRAINT `FK74EEB71671EBFA46` FOREIGN KEY (`SC_TYPE_ID`) REFERENCES `blc_sc_type` (`SC_TYPE_ID`),
  ADD CONSTRAINT `FK74EEB716A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`);

--
-- Constraints for table `blc_sc_fldgrp_xref`
--
ALTER TABLE `blc_sc_fldgrp_xref`
  ADD CONSTRAINT `FK71612AEAF6B0BA84` FOREIGN KEY (`SC_FLD_TMPLT_ID`) REFERENCES `blc_sc_fld_tmplt` (`SC_FLD_TMPLT_ID`),
  ADD CONSTRAINT `FK71612AEA6A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `blc_fld_group` (`FLD_GROUP_ID`);

--
-- Constraints for table `blc_sc_fld_map`
--
ALTER TABLE `blc_sc_fld_map`
  ADD CONSTRAINT `FKD948019213D95585` FOREIGN KEY (`SC_ID`) REFERENCES `blc_sc` (`SC_ID`),
  ADD CONSTRAINT `FKD9480192DD6FD28A` FOREIGN KEY (`SC_FLD_ID`) REFERENCES `blc_sc_fld` (`SC_FLD_ID`);

--
-- Constraints for table `blc_sc_rule_map`
--
ALTER TABLE `blc_sc_rule_map`
  ADD CONSTRAINT `FK169F1C82156E72FC` FOREIGN KEY (`BLC_SC_SC_ID`) REFERENCES `blc_sc` (`SC_ID`),
  ADD CONSTRAINT `FK169F1C8256E51A06` FOREIGN KEY (`SC_RULE_ID`) REFERENCES `blc_sc_rule` (`SC_RULE_ID`);

--
-- Constraints for table `blc_sc_type`
--
ALTER TABLE `blc_sc_type`
  ADD CONSTRAINT `FKE19886C3F6B0BA84` FOREIGN KEY (`SC_FLD_TMPLT_ID`) REFERENCES `blc_sc_fld_tmplt` (`SC_FLD_TMPLT_ID`);

--
-- Constraints for table `blc_search_facet`
--
ALTER TABLE `blc_search_facet`
  ADD CONSTRAINT `FK4FFCC9863C3907C4` FOREIGN KEY (`FIELD_ID`) REFERENCES `blc_field` (`FIELD_ID`);

--
-- Constraints for table `blc_search_facet_range`
--
ALTER TABLE `blc_search_facet_range`
  ADD CONSTRAINT `FK7EC3B124B96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`);

--
-- Constraints for table `blc_search_facet_xref`
--
ALTER TABLE `blc_search_facet_xref`
  ADD CONSTRAINT `FK35A63034B96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`),
  ADD CONSTRAINT `FK35A63034DA7E1C7C` FOREIGN KEY (`REQUIRED_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`);

--
-- Constraints for table `blc_site_catalog`
--
ALTER TABLE `blc_site_catalog`
  ADD CONSTRAINT `FK5F3F2047A350C7F1` FOREIGN KEY (`CATALOG_ID`) REFERENCES `blc_catalog` (`CATALOG_ID`),
  ADD CONSTRAINT `FK5F3F2047843A8B63` FOREIGN KEY (`SITE_ID`) REFERENCES `blc_site` (`SITE_ID`);

--
-- Constraints for table `blc_site_map_cfg`
--
ALTER TABLE `blc_site_map_cfg`
  ADD CONSTRAINT `FK7012930FC50D449` FOREIGN KEY (`MODULE_CONFIG_ID`) REFERENCES `blc_module_configuration` (`MODULE_CONFIG_ID`);

--
-- Constraints for table `blc_site_map_gen_cfg`
--
ALTER TABLE `blc_site_map_gen_cfg`
  ADD CONSTRAINT `FK1D76000A340ED71` FOREIGN KEY (`MODULE_CONFIG_ID`) REFERENCES `blc_site_map_cfg` (`MODULE_CONFIG_ID`);

--
-- Constraints for table `blc_site_map_url_entry`
--
ALTER TABLE `blc_site_map_url_entry`
  ADD CONSTRAINT `FKE2004FED36AFE1EE` FOREIGN KEY (`GEN_CONFIG_ID`) REFERENCES `blc_cust_site_map_gen_cfg` (`GEN_CONFIG_ID`);

--
-- Constraints for table `blc_sku`
--
ALTER TABLE `blc_sku`
  ADD CONSTRAINT `FK28E82CF77E555D75` FOREIGN KEY (`DEFAULT_PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  ADD CONSTRAINT `FK28E82CF73E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`);

--
-- Constraints for table `blc_sku_attribute`
--
ALTER TABLE `blc_sku_attribute`
  ADD CONSTRAINT `FK6C6A5934B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`);

--
-- Constraints for table `blc_sku_bundle_item`
--
ALTER TABLE `blc_sku_bundle_item`
  ADD CONSTRAINT `FKD55968B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  ADD CONSTRAINT `FKD55968CCF29B96` FOREIGN KEY (`PRODUCT_BUNDLE_ID`) REFERENCES `blc_product_bundle` (`PRODUCT_ID`);

--
-- Constraints for table `blc_sku_fee`
--
ALTER TABLE `blc_sku_fee`
  ADD CONSTRAINT `FKEEB7181E3E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`);

--
-- Constraints for table `blc_sku_fee_xref`
--
ALTER TABLE `blc_sku_fee_xref`
  ADD CONSTRAINT `FKD88D409CCF4C9A82` FOREIGN KEY (`SKU_FEE_ID`) REFERENCES `blc_sku_fee` (`SKU_FEE_ID`),
  ADD CONSTRAINT `FKD88D409CB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`);

--
-- Constraints for table `blc_sku_fulfillment_excluded`
--
ALTER TABLE `blc_sku_fulfillment_excluded`
  ADD CONSTRAINT `FK84162D73B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  ADD CONSTRAINT `FK84162D7381F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`);

--
-- Constraints for table `blc_sku_fulfillment_flat_rates`
--
ALTER TABLE `blc_sku_fulfillment_flat_rates`
  ADD CONSTRAINT `FKC1988C96B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  ADD CONSTRAINT `FKC1988C9681F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`);

--
-- Constraints for table `blc_sku_media_map`
--
ALTER TABLE `blc_sku_media_map`
  ADD CONSTRAINT `FKEB4AECF9D93D857F` FOREIGN KEY (`BLC_SKU_SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  ADD CONSTRAINT `FKEB4AECF96E4720E0` FOREIGN KEY (`MEDIA_ID`) REFERENCES `blc_media` (`MEDIA_ID`);

--
-- Constraints for table `blc_sku_option_value_xref`
--
ALTER TABLE `blc_sku_option_value_xref`
  ADD CONSTRAINT `FK7B61DC0BB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  ADD CONSTRAINT `FK7B61DC0BB0C16A73` FOREIGN KEY (`PRODUCT_OPTION_VALUE_ID`) REFERENCES `blc_product_option_value` (`PRODUCT_OPTION_VALUE_ID`);

--
-- Constraints for table `blc_state`
--
ALTER TABLE `blc_state`
  ADD CONSTRAINT `FK8F94A1EBA46E16CF` FOREIGN KEY (`COUNTRY`) REFERENCES `blc_country` (`ABBREVIATION`);

--
-- Constraints for table `blc_tar_crit_offer_xref`
--
ALTER TABLE `blc_tar_crit_offer_xref`
  ADD CONSTRAINT `FK125F5803D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`),
  ADD CONSTRAINT `FK125F58033615A91A` FOREIGN KEY (`OFFER_ITEM_CRITERIA_ID`) REFERENCES `blc_offer_item_criteria` (`OFFER_ITEM_CRITERIA_ID`);

--
-- Constraints for table `blc_tax_detail`
--
ALTER TABLE `blc_tax_detail`
  ADD CONSTRAINT `FKEABE4A4BC50D449` FOREIGN KEY (`MODULE_CONFIG_ID`) REFERENCES `blc_module_configuration` (`MODULE_CONFIG_ID`),
  ADD CONSTRAINT `FKEABE4A4B3E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`);

--
-- Constraints for table `blc_trans_additnl_fields`
--
ALTER TABLE `blc_trans_additnl_fields`
  ADD CONSTRAINT `FK376DDE4B9E955B1D` FOREIGN KEY (`PAYMENT_TRANSACTION_ID`) REFERENCES `blc_order_payment_transaction` (`PAYMENT_TRANSACTION_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
