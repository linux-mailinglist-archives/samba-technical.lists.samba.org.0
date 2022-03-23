Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD3B4E5ACA
	for <lists+samba-technical@lfdr.de>; Wed, 23 Mar 2022 22:42:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=8l7kjIOR29HgnZKMrkkEs+sgVzh4mAXM+SrkgPmqCrY=; b=c91dXv1DGscdKzL32AO17Sk1Y3
	goZx7SfoCrcJY7gpJGCbuh6Q6VsMfcJBlpD3bU98OWdjcUzFnuwkcK6ItB5V8cYRYiJ0D9bat5eib
	ZRbrGPEQfNl5jfr5AzPA+f3C94IhNswBM4xPyzNr4Nmr8Qvw2cxHjFWyWoyPjHtB3+J56oilnjLuL
	uYx+Fji1odmfu9GYQE7xoF8KzjZwB5pG8uke8WB/nK/r81g2pEUSGny8yX3NsTcyr3XDKJuysrEep
	wfF3htmVpHXNIb6+gWOcSQ0tCHU0K05PaVW9S+xeSpKckGNeH//0qMjRXffLyA/FdSg8woeIlst/i
	BcBmS2KQ==;
Received: from ip6-localhost ([::1]:60572 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nX8jp-004fC1-Gq; Wed, 23 Mar 2022 21:41:53 +0000
Received: from mail-he1eur04olkn0811.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::811]:46735
 helo=EUR04-HE1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nX8jk-004fBs-Jl
 for samba-technical@lists.samba.org; Wed, 23 Mar 2022 21:41:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkWQ42kYwikbPN9CZPOGsUGGD5Hcr8bSggMI8zt3z6KS54ZKik3cVZjLg529ks3hhZJzTpEUBjmaSpY5MMeQPcUTjbyGGs/EsAnYyZYtuazYT2WF/PY8RsQJCpj93toCrSqLXndbSlf0K+zNyN44FZl2mIZKJBL3QlrqAQcRN/vQkSL6DWXiK+Cb3wC28rAKq4JT5/MeoxT0y6FK5YfEqtvpo88vDzRqf7oZzfRO1rrMudztHp9dJf2VFP10farQNb5Pg5FnLsYqLB0nncDVzkypxoCDmMtgmNbtc5De0Ik2d+KBm+k1H8OyYPKiu6APgsqygBk6S8fNj805w7uJWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6UYgP05UsScABMClUqzNfRmhtfVByhk1Et3UgXknHQ=;
 b=OFfqpt8julyrcqLT6zlqZAVuXeUNvtZspbXw6wmGZ4zjKVTX2LWaM4XA41RzPLMubf2rSKH9CiAUetqMhD4FUNY2Id4crWcTjqrSB2B7y73wWK7IMvbLLmQfqH14bTloGQnzJli/SfJPGWchHCfC6FsYGcCm++70T4rEo79VOyeidpkmCERhgDi9KNsyi0Dc4hpnLLG7J5wHSHAd7N9MEk/Y4hrmJH4TdEEA+4oO2RUQIlf66C2lhu8+Ow7BqbFKe5TCzhajF26evD4iogPKf895WGtNs5rdLBBbzAHIwkEPkxzmh5UFieS349hl7hgVoQI/OHqVQBOCPJNA/YoGuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6UYgP05UsScABMClUqzNfRmhtfVByhk1Et3UgXknHQ=;
 b=BIPNW8ZAa3P0T66ry67pODkxvjTyjYBzatvBbNn3zq4qmHG/GmbEFuyoYWpUKrcO60fi6Z0rSuYQ1D5LBemB8C3wYqOXEKDXzkLEcg+SEHjmW9Nh8wkAxf11VNGhg+tpRg3KmU2/cy2wyp1SMVz/WFLbqB0Vef/aSsECNQQysPnPjwPcVmtw9X0JQCjpAcY57qgzM505pnyGqBCL7SwJnq7HIYykIIY/W8XcS8/9P0zoQTxE99qW8s26ZmfjDovOJoZU9Y8NUG6yzMktHAHEFDsjnDWs2ZU6W5L7p/WYlm/LxNdfM7QJsRXRphV3CMCeOvsNayD05TNxLhbMHqDfcw==
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com (2603:10a6:7:1b::19) by
 VE1PR06MB6350.eurprd06.prod.outlook.com (2603:10a6:803:11f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 23 Mar
 2022 21:41:35 +0000
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd]) by HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd%6]) with mapi id 15.20.5102.018; Wed, 23 Mar 2022
 21:41:35 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: getpwuid(13891) failed Failed to finalize nt token 
Thread-Topic: getpwuid(13891) failed Failed to finalize nt token 
Thread-Index: AQHYPv5LdU7dCTO6eUOwRvAfLDRLZQ==
Date: Wed, 23 Mar 2022 21:41:35 +0000
Message-ID: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [eAI2iubhtOoFu4qNEc2Xjlx/r+8hzbZo]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97e65df8-45e2-4755-a32d-08da0d15e75a
x-ms-traffictypediagnostic: VE1PR06MB6350:EE_
x-microsoft-antispam-message-info: fTQlJTozoiYYYbbzujPuNt5XLLHJ4vnXbM2XTuQGQREyN93nXi+TM+sK2jZUs4XYxcVDTQffjYwDFQIuVEp8H5lLCvGcw/xqkHgnOrxXFRNH9IiMBeMiM/ekyrmVOenZ5kdxDc58hOyIatbvRZpHCI4zUgHvrL4Kctu4637obFRA+tFvoFkU9076HzVwVqRigIaiadFMZHnYlp9r3l4q+jEPKncVXL4PglVqIuU7ZZp8f+oZnk4THnQ2ytHXjKLNET5mWWFmrbKbf2wuDSctrPsa353JkGBiWpUvPOnv+NnTbBYLMEvRZW/ucMdTgLl6CFXoIgDFcu6S8ntWoHpyz4n+6WjgrpUIa4Kz5fMh96Wy1TuYKV6CQmNMLzfwv/kYg3peNwp75Vz/qSuKaXxpIS1RErbwqWJnvQ1+Pyp2kSlTrm0FP2sTAjSteWvaT5WWAtJ3Req9Tt+vuXkULXXoLTUKTWTihJ5M0Mk+ErRfcqixgtg+XuD0KxE6Rxc26kbVhPEklnKNIKx0AVgvQDphs2Q/eJPcrvT0aYbqnTCrViWZID/G5Qz5EDJy3HSgDCqlLz9F0L+8Ib5JlSBr5bQ1aQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?A3+vJly7QY4TNMBK1RTdMZdRWguCG91fi+V9+mfhNj4NQFrsCmSTjtR6iV?=
 =?iso-8859-1?Q?vgS1yPax4mvUGv+P69OVq1J9IjjVagVxhffpru1XNZk9cZypEo12mh+J4O?=
 =?iso-8859-1?Q?+MpKYcbiuZ6WhFlsNMCbopKHaEFnetiLtw4DrYYGPvQfq55Ip8eDUT2NQN?=
 =?iso-8859-1?Q?K80DTD/Nvw60zPcxuZS8zIjfXWPglAl4MS/BAo+aYBxUYnuH2fXiSjkJ5Q?=
 =?iso-8859-1?Q?YuifPwFL+f/nC2+RHYVzjk9UkYIxRD7EM//qHJk6W2J1dbhLY2LexBnV2G?=
 =?iso-8859-1?Q?95hhPhEsNYOxcApeCHyWRISYsq527vWXWlXS7yXmE+AN1uwU6YrE3vl8uU?=
 =?iso-8859-1?Q?t1GMwgl7LyZ/hAA2PQtKH7IhkfiUmBAZQtRl/+e6bRY+sBIE3UkQI1RKLD?=
 =?iso-8859-1?Q?VM4/7wmyCHzI8sPBKh4eui/y+M+AcOjqTSKiRigi1hedaMJ9rryNbvX/Hd?=
 =?iso-8859-1?Q?OIx0A/uaLT3bm7RqSAjX7BAVWvfuG0Y4YQ+QYrh3xwvDTcSMSNW0mvep6o?=
 =?iso-8859-1?Q?M6kc2rd4DZx52fx99W5UGzvJLlGB2CZ7oYLvj59daR/9p8GFbVBEr+Oup6?=
 =?iso-8859-1?Q?gxyUGdx2XhG6INne0Jademmc4bWgtzFA98Mk8ygYjVcwYxxQqovYsxGZaT?=
 =?iso-8859-1?Q?wThISG/ZrdNdJ8DWb+LUjFeldgUdU4F33/S5DT+oaccIaP7OxYeo2fZhAH?=
 =?iso-8859-1?Q?ZdV4NySncW5/YAjd/FehMrZEcvB8rQfX10l6tW0ce1iPbLKAeMGJQz7f72?=
 =?iso-8859-1?Q?mE8JKQV/s6BjIojDKmWFjzpd7ba2mDQZlNYzDCJlYGLyof5vwhyc5RVefk?=
 =?iso-8859-1?Q?VDmSA8dIfRyxvkxLceilcWPRbaRN6bl3Lr43a/tCt7+uBXhpzzM4P69VFz?=
 =?iso-8859-1?Q?qyjRSyTWpfoN95l0J7PhMWeY0gp0onLpdE5doHR5z4qjQgpFqn9OghlAM+?=
 =?iso-8859-1?Q?JNXKqxP2M89jSrsAi1EOy82vUVgw+MwzWOtNZcpOeSmpNbHELtDB73Ovta?=
 =?iso-8859-1?Q?bncA8K0tpKcOM/bujVNEWJDtqeROaYDRh6MKXIE1fRiUw3QxFZDyxYBkK4?=
 =?iso-8859-1?Q?QcZI+8BrEs9vfHGPue7hp79qATBZMmxeeK4OzVMCu2jQlhv8+aGzM7PUT7?=
 =?iso-8859-1?Q?ByOJoD0xkR3AwMDEEUpl1TkXQVDpSfbBDX4fXhwHRHOq0BOPI2jfXR0n0a?=
 =?iso-8859-1?Q?Z1AUsPRuL2g2mA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6e454.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR06MB3148.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e65df8-45e2-4755-a32d-08da0d15e75a
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6350
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:fe0d::811
 (mail-he1eur04olkn0811.outbound.protection.outlook.com) incorrectly presented
 itself as EUR04-HE1-obe.outbound.protection.outlook.com
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
From: capricorn cap via samba-technical <samba-technical@lists.samba.org>
Reply-To: capricorn cap <cool_capricorn80@hotmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!
I have joined  4.5.16-Debian to AD.
sudo net ads testjoin
Join is OK
getent passwd works
getent group works

But When I try to browse from windows computer then I get popup to enter us=
ername and password.
Below is the log message.

Kerberos ticket principal name is [xyz@TP.NUTI.LOCAL]
SID S-1-5-21-774976744-1476728229-930774774-3891 -> getpwuid(13891) failed
Failed to map kerberos pac to server info (NT_STATUS_UNSUCCESSFUL)

Can anyone help me that what can be the solution to fix this issue.

Thanks
