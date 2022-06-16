Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A6A54DDDF
	for <lists+samba-technical@lfdr.de>; Thu, 16 Jun 2022 11:08:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=by1gfeJu9vxl+wZ4dTOQ6cOgj4iSz/KCn5JDQLFph0U=; b=As9rE6usqnYkDWYT3iKwcKpxSY
	kn2u7P8w/JCx3fEfGlYJvHePfYwV3RLdi1EdS91JdSlH6h9QqibqnkhGdnftszCpzz50TQfdQHNxg
	nIG//v+gybqqSeUVID+QUGtrtnyyKb/tpgkPIxKCwWWNVBEHvAfGczshBkxdLvxw8tb5bXBjhozEr
	2fskQwSKLw2SUYIJXFMPxN78HjRzU9mhb5Vb6T8vkkJDOy18nMMGkK7TlHR5Kx1ZyiQXO3naABxlM
	hg5TaR4ppFVLVTM6pVC1T513xmVKs0izdRyofxdBmuysV4NquOo2VVJeRaQk9GIAu6B4NXAz4H98O
	u7y/V5xg==;
Received: from ip6-localhost ([::1]:47874 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o1lTJ-00AcXQ-8a; Thu, 16 Jun 2022 09:07:25 +0000
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:36364) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1o1lTC-00AcXH-TL
 for samba-technical@lists.samba.org; Thu, 16 Jun 2022 09:07:22 +0000
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G622gj025025
 for <samba-technical@lists.samba.org>; Thu, 16 Jun 2022 07:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pps0720; bh=by1gfeJu9vxl+wZ4dTOQ6cOgj4iSz/KCn5JDQLFph0U=;
 b=FnaJk0PJn6En39E3mujg9VH4a1kjL17wXGgEmGJtofzcxp3ELsm8LEUJdAeRuGqaEDFm
 xeqpykk0xAFaVDD19LqmBd0Tnk2KH3oby4bCsy9+SyZHK1Li3mpUagVf8jgpNDlrwEqD
 pGrCR2VmRWIlIvsaIW+ZdJZdBl3gt3ISLUoszPK0USqB12dWpiLWU74vhgesONMDmAcA
 vFypGEqLeJ7SbWcdDOK+wQ8F5Fukx4nm+efcL/OsQ4ahvewi54ZY561IzvMoRTtAF4yk
 MFoTNzrw2OIR6mh4N5DuwXwZioqvN6FnyzHMLoKsSyZTjqr0zZFR5sbPUW3N/9li/yH4 oA== 
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
 by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3gqdjj1ru8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Thu, 16 Jun 2022 07:16:05 +0000
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 1FBB21318F
 for <samba-technical@lists.samba.org>; Thu, 16 Jun 2022 07:16:05 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 15 Jun 2022 19:16:04 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15
 via Frontend Transport; Wed, 15 Jun 2022 19:16:04 -1200
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 15 Jun 2022 19:16:04 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIo6drRU1sX75eyurVWLYRBz3A1VJFtVBBeHNaawwNrB0zZ3fh/k0GUaAKDyXHatUpHpJGnaisLIKJAzcJjafJc/Prx5SgCnZexzfqy+jgwGcFpdiTlgHQbFjwqQb5a7ec9G+RzPv02wqX2ELtyolIqI7rr/kuIvS4qmZHbw9exU4JsNKwe9magSH0+d9J2TS75nf5UExPkP5qihLqNy8FzppRT2qvroxNmm0ZtIJk19kg2U/sSGdPeaLSDNaa3GCKau+VA9Q7SsBH95cfsd+j1UXMx1fx/g5pQ7AjSFHmn/xSpKRwyxCda9j9Y/Ksdf95ODQmr5p408BCd86z99Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=by1gfeJu9vxl+wZ4dTOQ6cOgj4iSz/KCn5JDQLFph0U=;
 b=H9GwqIb+0hLfxXKhqV6R/rlV0OiLvI77l3X6w0exWDD/qjRpzKaanWYdn8BuIaLaHc0x8net0uh4C4PUNmtS3wBPKSdh2Xu4at3VwpPEYQ2Fyd6HHEivV7WUGGEFSQEueQD8QcJX3eEyIXNFPMbAeyWwmHQHwzHqUFLc+Wfydjo1KnByfIMOOdfkRzZZZYCMZS3ruViV+O3RM/ObQVCIUg+wdh6F7HFQGTY6DAQhg+0bnF067Wv30BuvN8MUbcBdBuQl932tlSvMXDEh3CE5iqjpavZdY1aSRj1Dg1CGcTmGr9+24/yMkXqBi1FK8vMroB8EhhqieaLvwEZNZFUCWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from PH7PR84MB1983.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:156::17)
 by SJ1PR84MB3041.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:48c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 16 Jun
 2022 07:16:03 +0000
Received: from PH7PR84MB1983.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::f4fb:59bc:a5ed:fcf6]) by PH7PR84MB1983.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::f4fb:59bc:a5ed:fcf6%9]) with mapi id 15.20.5332.013; Thu, 16 Jun 2022
 07:16:03 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: CVE-2022-26809 (MS SMB CVE)
Thread-Topic: CVE-2022-26809 (MS SMB CVE)
Thread-Index: AdiBUAbkqbV8GGBtRWuwUIYvSCBL5w==
Date: Thu, 16 Jun 2022 07:16:02 +0000
Message-ID: <PH7PR84MB19838ADADB313719212BD4BFF7AC9@PH7PR84MB1983.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5fff412-e59c-43b2-df7e-08da4f68125a
x-ms-traffictypediagnostic: SJ1PR84MB3041:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: YMvCyXHUq+B7II4TTosKoF5vhgpGKuK9nfutlGCYM2dNqVVl13ITiFP6ps/IEvsgM/Icfw0jqSLXP92TMAc+2eqWbL3Pc1tA6LOXjwJw1eJ8BeaRzPsYQyAnzkctXGUwAyHhGOxooqrSGWo+Hp/xckB8fBWwQ8vgjbrxzzTLaJFUh9XovXXk6sjU0kkYhIEUFs/zDNOyZe5/bj4ONYShNhmkTNgv1MPr58IMkCb9jorKbauYGC/mDgTuZECWM67OknckB8X9rdX+DKz7RTZKcQDhRNlt/rzYzJHnA5fMOQnSmTcaTzL3FAb/RYMAh7CXS5iNYPmT223/YKfPrCJZo6gUXL4fy4kXQDh8hhSkPNTdXcXSLZn1uLQKG8gpWoJjuwG4EqvjF0PieIkwNF7AdZ2GcijXo2uI4/PS35/+uTVLaBKd8crhDYcMfKOSqWQGqnWm3EbBWZUvY5TBuWwnI9LIJwW1ZJtCOoJTnRWL959vPJqm4D8mr1BNHDpCnINzuYdR4MYlPnuHqGlu9SpBIr1E1wwLhkul/M5D1wy8pHeQNg57qV6DnO5tfG3Eg58p18btVdwK6CMCttrYQJZ4g8n04cfpQz/jlD68jcxmrrOcrgBRvnaVpidkDUv+Aed0u+VGNbs3Ab5hHoZp79NRP7M0fgnrtg5Kf4ECdw1E/PL3qJsJArSEerNVEY3pgBu54RFdpnqSUUXkC8QHvDZNDg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?njVZpDroDOUlUmv2UaSFU9LYASOf5PRfoCcsHQzOVaZsTlW0kWQQqIUiILxO?=
 =?us-ascii?Q?SRQLc1KacqdmObN2XXDhwFd/THl3vuVRy+TrM9Pdo8ZTPFYggGXqKgy4jlh6?=
 =?us-ascii?Q?1D07UksBT9Pl6XK52vgSfxRiX9ejjw6wAU684wHucvhQJpoluKypSDroxEhM?=
 =?us-ascii?Q?xUdVcOHgMXpJWY8KP3RoFuvCrPI9CRmMBTNzyMS5Lz+Lt/d8YwT1zXUShkrW?=
 =?us-ascii?Q?aDgHNpvjN5vL7xarn3Ja4OM8LSKKTw+keSW0tpxtw7BMweC1T6f0tXHJHLv3?=
 =?us-ascii?Q?LcvRCP2fOA91M/4xG27DZB/viio/lBaqOIyCjV6Yvn1csPqw/H+w/mLD5MIr?=
 =?us-ascii?Q?3X8ThP93cNqU8gbNSjDbWKmn18W4cR2wfnopcZru/Sn/2jPSJAaOcQW+APt2?=
 =?us-ascii?Q?EdB0sztJMf9CQd5ck0P856sqaJcup7WSpafSm9Uit1a9lNgNU3azd6te4JOM?=
 =?us-ascii?Q?pwnzOdp+k9bqkIywYHLrykYLEEfUQc12VqsA3XC3PMUfBQH33kskNTyO9ebp?=
 =?us-ascii?Q?Z40/0wTxrAV2MrrFuirscRQKO9hAs9qKtmhHBrzTeQG7UI3op0ggkvD28x0O?=
 =?us-ascii?Q?L3qSr0NmjbHI7fmCDR2js7xRJxe8m2BIfy7Z9ZrCixKC5+GvEmkzi7C8tnHa?=
 =?us-ascii?Q?lsnVewBgQ7iPz2Zn/KYDcu60RC93ud0HDftOWvjSsMgFAvWxsWONkx9Q+r6u?=
 =?us-ascii?Q?JLNPufSnY6vAwtbgkgufkVGyDvuM9Lxrg3k+eqrGswin0j3KseukBXAN+/ts?=
 =?us-ascii?Q?+7Qo5CplD71cxR+I3sJUapDDLg9r61D/J+hS3FlbV7JCNKgNP3Ngk6BW8pOa?=
 =?us-ascii?Q?crcuwMsRpoyF3zY4KVWNyOWakEnE/Sm0mvl7/cq+K8ClytxGwN6fF2uoHE1u?=
 =?us-ascii?Q?xIeL4UEaNks+95ugHuohw+PD+czfVWTcJRBOUxUFk0c3/xaMX+OmiZ1/jGjt?=
 =?us-ascii?Q?k8tGTMuawl5oy9Kz7uvkOCfFYryV30D9gc5zq5zm9xNSveE7S/l+YbWEcpMH?=
 =?us-ascii?Q?xTBRGwf61uq0LqpDVqv6Q318sWQFuX6cmAf62KGZJFxhNIVijF0JnCawtXU2?=
 =?us-ascii?Q?PDaPN+DqHe9oIYc7xNUetkczE4QsxBIfs2+JobPCx1dSHOEL84eI5wY+G69z?=
 =?us-ascii?Q?CbnJ1BMJQRblqxcbdfLNCUI0knj6H7XRFHpgbuzIOJ3iDAoUEDEirQ76JY6K?=
 =?us-ascii?Q?cdHQps7tz99Ybz5kyGKZRo87eG1e9eymC8GSnJNvXUFd+mXpjnmRU0sJXcqa?=
 =?us-ascii?Q?b0WgsiLqAqCd6flwj5omtSaEuqz74XtY6FwIBGzSxBw98mF+vU5nJIn5IJEp?=
 =?us-ascii?Q?j+jR81Sz+WryoGtXeM9xioZdAhVtVmLbjTB0jxMdZOqTFVSy6oi4eLWfHHUA?=
 =?us-ascii?Q?LQ6+tnWFWnR7PJSprmzgt/jNw+fD3RSR2Y7oh4BLyU5TEkgOQA9kut7MalnC?=
 =?us-ascii?Q?z5yebtBET1YZrVY8x8jHpxr7X+zL2D0mab9xcbMV8RH+17M4wNMGkN1Adeqx?=
 =?us-ascii?Q?BFkRqkyxaZK0rZKLnuePADWd7QBgthbPQ1GAIhu+fy+rkEFOiVN8pCTDzBbn?=
 =?us-ascii?Q?bxE2fiX0qQcHijd3m1tvA12sbu7nv3k1UrCqqWoHjN9aEyxCxvkmLkIpkH7a?=
 =?us-ascii?Q?G2j7GIMcH7Mk0q6+EWQ/mhAdcdBI6mXx1j9tMNbRUX2HiXdFhSUufsRzBQBF?=
 =?us-ascii?Q?h0XHh1nAu6CABjFUVD5pWGWD8pa1FrWGqdBIxN1JXkq+R+Wz3VhdxpKCXVvO?=
 =?us-ascii?Q?AXOrS5SMgw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR84MB1983.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fff412-e59c-43b2-df7e-08da4f68125a
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KR4QX2ChuHIvMnrmv3ldSnILyIGmjD/lznNfLJjcViOvxSgdYkAWLGolLJaLK2mh9QPBz0FiZm33+3XKJw8PiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR84MB3041
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: UqYZQHwsNj1VT0ID64hnhlYHG7UgTOF6
X-Proofpoint-ORIG-GUID: UqYZQHwsNj1VT0ID64hnhlYHG7UgTOF6
X-HPE-SCL: -1
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
From: "V S, Nagendra via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "V S, Nagendra" <nagendra.vs@hpe.com>
Cc: "V S, Nagendra" <nagendra.vs@hpe.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,
Couple of months ago Microsoft released notification for CVE-2022-26809. Wo=
uld Samba be effect by this CVE?
The CVE score is 9.8. With very little information in the public notificati=
on, couldn't tell with certainty if the CVE is relevant.=20

Thanks & Regards
Nagendra.V.S=20

