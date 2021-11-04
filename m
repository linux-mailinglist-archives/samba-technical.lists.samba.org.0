Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBA2445832
	for <lists+samba-technical@lfdr.de>; Thu,  4 Nov 2021 18:19:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=4MTVITP7934sVbpkRjNd+cTm4ARtzYuGfxYKDbsLfg8=; b=ifqYsiR2/HRioShL+sTOuEJs1U
	ez6S9IyZSx4K8foUuIWDKf62vVSKEYPXmmUafI3T09UZfYVjMXdcXsRNCYroAGrFHtkqpP5kMIh6/
	zsZu/+losgLhILUAr1jQ/xkhk20K9ELfYAZMZjVT1a2s56TYbWql1SSDvXZ+Tyt/eK6wnWKuAwPUX
	q6o6H6aK/ZnysyX9KEYlbXZ7BI+O8mcsOIxwrCRq3unoYQHucj1AUEh3cHz0MwQWa80bMW+05GCDb
	Z2mhv4wXhbu5BH8Z42lWdSmums/QYbd/D8KfZ8Hcp1YEM0ML1C7sAvApzGxb+SA08z5gYaKBSVTao
	zWIfeEsw==;
Received: from ip6-localhost ([::1]:21140 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1migNt-007fVG-Rp; Thu, 04 Nov 2021 17:18:41 +0000
Received: from mail-bn7nam10olkn2027.outbound.protection.outlook.com
 ([40.92.40.27]:6496 helo=NAM10-BN7-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1migNn-007fRS-J4
 for samba-technical@lists.samba.org; Thu, 04 Nov 2021 17:18:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjPpAfIzRM5DB1dJoHjbp4XSRl12MEkUnA17zXbTZFL9QA8QOQGJQiwXY1OrBV5DT98jWKm/9RqnZs8/BkIT07dI4hkO+l9bOvo9DKiQ5lgyer5Zh9kukel/tUTvpiU84GnAXq1aKbd69EEpy2RrNkPhP7vVhyjmxEWBCqxWQ7hHz2o8NbOhJpkhdZwoVJOTvwCE8slFBk9fds882rWskRkJzhXYWO1XmJ0D+kYjNLdbeSi5iU6qW9tMD76fd7D2DAhYtuFrecW+D+yIUFAzvsoPJxMksOgMMdn6xuGrlpsLdpik6AyfXHT6We8CnaBz7k+VEZZPA7T8Tfs5agWriw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2f5oXnkQl1eOfeptf9cU0aDYLHeJn0K8HbwSGwUYQ0=;
 b=PF/Ki2MXwZCsUTev7/kX3aELJHPU0YwM/Y7MazXxiW3hGBXFsglCafBavjZ3Ituv/POjRq2Clgcz6PhwbQ4W9rdfR6TDJnC61pJJN+xkJCT23RwHoxBP5tPuG6a78x/kscbWNiO3YkSBoSitx38T7uBs98jv76Ib6Jro/+7c+BT576Usu9ALRwrDu85OLcGDFUMB2R8dP4eQwnCPOR98aqYazPUVKGVPZZOR1x0yLzPcX9G+OMmowxyHbIR9L5ZTVth1UNroH8rlXfq5+XoF5iPOTc92kX7dzdwMHL4bBWBYguMLbnmYrZShzQmMZXnbUSz7mHoshfbMvMOz8AWW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2f5oXnkQl1eOfeptf9cU0aDYLHeJn0K8HbwSGwUYQ0=;
 b=jOl/pflzIeDJZpgwEFynpOAjJjRavelHcLXvLFZCMAurSQc6+0mbaS3+47CObzND9zR/ws6i4oZfzdhAcdLchyXleQ+kB6ECsrW+wcco8RnjCI16nP7NQslGQp0oMtiVlubfyvXywij2HOIJMwFFRKfhC9IaBxBM58iZbImiaFOtOGMma5RU+HmsEGSUaDWdzCI0BCwxpcgtdFIY6vKLXpE4BZUulbavNc1TK2+nusDA2VV48w6l5CcsJyg09ZVyh5JVlaUyGMEAJuPa8Dfy2HOrZxHda3zC7DUMdUOoVV3p8vRUngQP1igFdjckm8vgMmmCUqoFq2V7oQvHnUACRg==
Received: from CO1PR19MB5109.namprd19.prod.outlook.com (2603:10b6:303:d4::13)
 by MWHPR19MB0926.namprd19.prod.outlook.com (2603:10b6:300:a0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Thu, 4 Nov
 2021 17:18:20 +0000
Received: from CO1PR19MB5109.namprd19.prod.outlook.com
 ([fe80::8cfc:9cda:1339:c896]) by CO1PR19MB5109.namprd19.prod.outlook.com
 ([fe80::8cfc:9cda:1339:c896%9]) with mapi id 15.20.4649.018; Thu, 4 Nov 2021
 17:18:20 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Multiple idmap servers for failover
Thread-Topic: Multiple idmap servers for failover
Thread-Index: AQHX0Z/ulBNLmKQidkGozsuPatyMjg==
Date: Thu, 4 Nov 2021 17:18:20 +0000
Message-ID: <CO1PR19MB5109D90918F5592C8891A0D3D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 921616b2-3d2b-7dad-6c86-7dd60c282d7c
x-tmn: [ymqo9FU1Ui7wZgZxnzJNAqADXrb3rn+b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df5a770d-93ab-4e0c-6823-08d99fb71963
x-ms-traffictypediagnostic: MWHPR19MB0926:
x-microsoft-antispam-message-info: W7K9Replxa6jxiYQ/MoknGkTLz9TV1I/8GwgwWGCDJMTMcljfgrsE+/KwlLt9jgFCbYuYx4Ghxzk2cnJgBdFgoIcyltFUohpq+VE84e4RaKeHvMBmB8HFb/+tzB0gC+ySp05RKzr0iznhvbl08ahcyfYEYMNqYiEvddyJ4Br7MqQLGEYgUD/tNvpUbUVghhstYA5/y8OaJbQ8UL1WV8OK02QVa05xyaOmwMCMdevjVTwipxJaWzrNSHSif6mON6VrHNrRafQkSdQZb/YAY6Ut0fse3riu1U6V9TYaDqPpahTgyfBqmUv/7KC5/h9wJMmnT3RJuxmhy/xSQup7eb2Lbd6f8Zi3mh1x0FAuq3Dw5Dyg/vno55d9sI99/iNmOME8DCW6zPm9AnEBG7bH9dk5IjAGCAGpUBYF3vfLSVP3qANkjaMUmU4xMs7EBlV8qd3zHwmz4oJJ0kPsGvTljkb0IwiNahcQ/wVN8lMjeErSbWGAZenfxjXRZhI8QqPsGjjthbkHYbm91b74DuSJoS4uHppJAv3/LLrxSk1p28y74U=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: wwPF6rBYbeMLcsHOFkl9Ee5ni3lCe0OpQ9PPJuZN6U3FKaA2jsTzv/OBrdP0mkryry7vTlNIvUby6mj51m7svBKFDhvcp2x1perd5QNC5ePbRGBzS6RI4h3UWpXch1fgZNSxBrMknlUQVji6f7pGUDSGnkwWelG6IfxBWVZdAwhZfQugmj5LrzdvFz2ENb35da3aYnO5mVQyKmQyKlV+FB+x0tEjE4NGEWRbtw6D/Pfu+WfUnBzTkKo7f/dX0MQHu4o8YoCnI9rZ6+9LzSkjnbCsg1ozbO2zeRt28zxiuiuRXv7gIqfS7x3JUOtmfPecfUiHlW2iLb0+E3PDan1Yw1SqoGko/GgPVhRcZyq4QGG7WjIQVNrKzG7ZyUdHA/BErVrHEB8YypIaElt5iqJXrhymXTOLyTwaZVGpB5ft6WxlRS8emYH/ED/UEZuxnQKeZkng4Nd39YHm8xHQUTFqTjLEFPdP4u8jq6+KeEY9Sr4KPXqaR8GS/GXMVqsOJOnB9G8M5+uxRDrvQ1PKYRjBib1IdqtPN5icuEYUz6qZ6eprQsYUIiwSO3YCaIpMThHYkeSDLlPBwFX1awwFnsb2/TOrLlDnpcgiLIAoLxn2C+z2bVpiAp4oPQyP5AT66D7DhRrhknmDZaG34ajpP20sX3ykjxZ5Pr7VEyqEyV4AXO3olEYbIGfsj85RSM3o3sf+NQN9ynzXZSP9zrlU8/Jqcw==
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-8efcd.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR19MB5109.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: df5a770d-93ab-4e0c-6823-08d99fb71963
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR19MB0926
X-Warn: EHLO/HELO not verified: Remote host 40.92.40.27
 (mail-bn7nam10olkn2027.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-BN7-obe.outbound.protection.outlook.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Michael Starling via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Starling <mlstarling31@hotmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello.

I would like to specify multiple OpenLDAP server backends for the ldap_url =
option. Is this possible as I don't see any examples showing the format?

Current configuration.

 idmap config * : ldap_url =3D ldap://ldap1.test.com
        idmap config * : range =3D 20000-30000
        idmap config * : ldap_base_dn =3D ou=3Didmap,dc=3Dtest,dc=3Dcom

Proposed. Is it space or comma delimited? Do I need to wrap the entire thin=
g ins double quotes?

 idmap config * : ldap_url =3D ldap://ldap1.test.com  ldap://ldap2.test.com
        idmap config * : range =3D 20000-30000
        idmap config * : ldap_base_dn =3D ou=3Didmap,dc=3Dtest,dc=3Dcom

IDMAP OPTIONS

ldap_base_dn =3D DN

Defines the directory base suffix to use when searching for SID/uid/gid map=
ping entries. If not defined, idmap_ldap will default to using the "ldap id=
map suffix" option from smb.conf.

ldap_user_dn =3D DN

Defines the user DN to be used for authentication. If absent an anonymous b=
ind will be performed.

ldap_url =3D ldap://server/

Specifies the LDAP server to use when searching for existing SID/uid/gid ma=
p entries. If not defined, idmap_ldap will assume that ldap://localhost/ sh=
ould be used.

Mike

