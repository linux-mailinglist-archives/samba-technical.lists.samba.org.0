Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2E44E5B43
	for <lists+samba-technical@lfdr.de>; Wed, 23 Mar 2022 23:32:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=fKBJLywRLJTjJJua5iE6TZ9gjVZMsL58ITxw14CNXc0=; b=S5yA4xDeVQ2y0/E7OnTUXSdT9F
	FmAwPRqUFUE2tOuMjDhom7Aqb90jTCuOCD2xhZ+oeuWg55siA3pfD2GuGK/ZI7fR3GbbP7ktzrCpe
	PJBqUQYRkOnGOenAw3FshpbLklj0mpie1FUAIaHkj/GCeCArJqkSL5FNQhQiMrWiKjWEr4ldDiQY2
	I/L6m0B0OOT5l/83ra4gbJI7w93U5A0OchUguIcBTmNqCUzUxSoY2eJaPxFjdmz4xWecdcKaOvPKx
	I1h3/8FlvhsEZ7lKtgYPdcHpOM67TyxnpAkicEl0+Idcvbbw49KpTvv/zdnIzJ9sgzsC5QH8Hq1uF
	K/Cz3xIA==;
Received: from ip6-localhost ([::1]:63880 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nX9Wm-004gm0-Ms; Wed, 23 Mar 2022 22:32:28 +0000
Received: from mail-vi1eur05olkn2073.outbound.protection.outlook.com
 ([40.92.90.73]:31712 helo=EUR05-VI1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nX9Wh-004glr-Ab
 for samba-technical@lists.samba.org; Wed, 23 Mar 2022 22:32:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8uHFkr2blJcTQU9vN1pSWrto7WfZ6DakfHea63BFZS1O8+68t+JIezpDC9P+6DN1Al4W3bVHTuNRYbsWahKs8XEg2DZs26AFFSmU2iXtXQe0Kha/I0bWExlNKvwNS0EETtlrjdjuKKUrTMReTMtpDJZLrMBA0bMkikRUoiQn7qV9VwwgIeTrwKyqQZhxEem7oJmKdj0jspPXbiSnPQOS94bUjRa4Ux1NDu1ovNw+1aUKRajXo2wSzbRO9sjfbqyETbsvfqGaTFvY0hYi9kRfCU0IW/r+eEp489GddFVVKiC8S98XTZI0bMO6hW1CJpXVQW12BSE4IwhUg7treRfnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNxnzWUOgmd5lIh46aiF9s0Xc9D9Y4mXjPKDMgDWENk=;
 b=Q/a70SFGDrD4ylXlvytGVXwo/64eRjhuobw8Oq/sdgt5QUd0i52uiWv4SmATWqfzVRZ7DE5aJTjVvwJnrwyIzUm1yGxQsNxVyLzlQ0MZiHnEuMgNcchIW0yIdktyamzTu5fNDHFdep9mJRslA3oTeMAv83EsWVW1eYlzuR3oMKas2Nd3hNlq4pBvIIsmueKKpDU42If4Dy3k99C8jlasvQ3+OGhex+8pSzXp2TggH33xnENwJ2QZph/nDNqF824OZ5zZKqKHwnXN16g3NVRoxWMSKoeh1xBpGQhyPAfb0E9UD6mF7TnKGHYlKrf1SP3VJwBgEDwGuBRc1Al7eENcuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNxnzWUOgmd5lIh46aiF9s0Xc9D9Y4mXjPKDMgDWENk=;
 b=Jff9dozfmzZFjnP+ubmNrYAT4csv3qyksdImB1a5gIBxBOwmJJvgEKfQ74Q95wxbAu5KRXwg0gUP1vUYFuQXgkBrOVrHYqE1nJJDn3+vt92mTcEPNC/hG6j8K5GQYvrIaqQ8ag0DbqtUD0cKMR3Areph/Up1OWhmjIHKCGCdEjN4oe8MHioGhhuEn+tDpj2BimJBvSiqnS6phJ4L6e3Gv6Oqu03dkLAl+nMR/lqJgDHxXkt/7f/EaroPCBDAhP2jNNgzM8FirYCGGaO5KZe/nbKwCKYpMhIEQkbtMdq+dOHm+9z3/HxRWvoDSIhFXqpEuKgeIXXS5Bo3JwhfmfTllQ==
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com (2603:10a6:7:1b::19) by
 VI1PR06MB5632.eurprd06.prod.outlook.com (2603:10a6:803:cf::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.17; Wed, 23 Mar 2022 22:32:11 +0000
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd]) by HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd%6]) with mapi id 15.20.5102.018; Wed, 23 Mar 2022
 22:32:11 +0000
To: Andrew Bartlett <abartlet@samba.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token
Thread-Topic: getpwuid(13891) failed Failed to finalize nt token
Thread-Index: AQHYPv5LdU7dCTO6eUOwRvAfLDRLZazNgfAAgAAHr80=
Date: Wed, 23 Mar 2022 22:32:11 +0000
Message-ID: <HE1PR06MB314880DFF2E2EC26F3B9A5DBEE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
References: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <aa7f95e04eaab625d7839c5204bc3283ded73984.camel@samba.org>
In-Reply-To: <aa7f95e04eaab625d7839c5204bc3283ded73984.camel@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [mXq0cFo9+MJlg08DjbtfJNJPIohU6cAR]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4507d8e9-b802-4cf9-984a-08da0d1cf924
x-ms-traffictypediagnostic: VI1PR06MB5632:EE_
x-microsoft-antispam-message-info: +vJ+RcVXF9YAETHgiNoeCYE4Rr982iG8/sOwsbQx8XhX5pa02UAjvsP5qCGXctC6JKCiKFzoC0teUfIh0CAknMFyWbtCxTa/B8YLjJh9T8kLKVBS3/Zkeo9j8WHe6lbE7YcDctjbVQ9PO164G2/XgsFCejF2kJJqTSitzGKB39IYDea+6asVZydlBTlMsMn3XEdk3pgLDxQ2XDkikIDC0h0p3Fh30+zd3kSBE0Xy60/5CTSBCvx7liBiRu1svyy6kkPJ/wnTZZSaZ8EWhW675vrI2jZZl7mzSaRbKfAUNqsRgoKhD2QybEH92L4B3tRERMlER9+BYQ7v24S3YXd0A6fJERLWAXkQ1P3CYW8e+ZZ1AXUa/XPU/P3N5FP0aRQ7Ir3Vr03TNkldTMjLbAZg2uMrdKV7t8bx7BWG35KFcmZojsdOeWEK1AXlNl1zUGRo0V0KPYdaa66KS6s5f1+3upFEQaGtDqsiuJRrUJ2D2uc69iCgTH+kXYWhDxiNVPz66WnUttYEsGCrGIsy8un9kSiHgxBONGzrAO165/GFg7Pxfdi6JBeM8rW9D14fLmVjmzqp/HHmExmdN48791nyAeY0caeJHlnPl77BqIiucuwwcA15yYxCAEnDHyqH2RVp
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BTHuMsRriTunPnW0j8bWjHaztO29rDUl5M3q+Z8j6X/+Av4Gvxgjbz0mw8?=
 =?iso-8859-1?Q?rnLGYLF2pmf70Ds9tOv8Rq+kRw/M21/EHAybPx1K1tlGXX1QE02BqFGpqS?=
 =?iso-8859-1?Q?dqeCtz00WRhjqb55n45MPh6QmOz0JEXeYKwI6adqUJSxIZ9C7QXujKsHrk?=
 =?iso-8859-1?Q?BYm/JHDs0TPmh7uNgp4hs9ZaSQgdDoR9oexyiOcTu6Wzuk4kvL7mcE20LV?=
 =?iso-8859-1?Q?v8kfjQWCIq1eAjUDinlnjjd/ptxKKJCz9jzla/SF4RPFigqa/1fBE4SOUR?=
 =?iso-8859-1?Q?Wn4pYkZAhlBzxHLRev9+DEdODMJm78bbxXvngt8cWYcduTPRuYu/BektQA?=
 =?iso-8859-1?Q?Acq6EOpokex34icDg5vrl+6nA993ZnIfghibr7r3eKAHDfuOneyxkakPf/?=
 =?iso-8859-1?Q?mBSWtqytt4YQRbtjU1gaGWVwYQGPjULgKtA0ctCLJpfZ4O8L2xp3YXBAiA?=
 =?iso-8859-1?Q?Hxv2KZ4aJSWLqMX1DOhX+ZOxrCXVie6NflN3pwzzaLTTQgks8ECBxOuw46?=
 =?iso-8859-1?Q?X8JBl2hMyvygbj1UBFjhaIx9PtokWKesRS/mZmOTZS2Q0SePLHyjZtgwga?=
 =?iso-8859-1?Q?qt2Tb7BZZ+nmRIvSiegfbLvsnHBBUPP3SXn0AdJyIXEEpuRXTjLTPL+Mrl?=
 =?iso-8859-1?Q?i2k4dkzLHLzjqY0rAZP3Sf6awmw1viirgXe00iMjQq6i+eo8aZTDZ6qqaI?=
 =?iso-8859-1?Q?Qnsmaw7O6m+eoW597rCRh3Q+sqWqNwa2fIWahl3xXYxr1u0n0JH2G1JRUC?=
 =?iso-8859-1?Q?G8WE+X9wQKPxKo3qqTfEKlJrXPBf4iZt8zuxBkrept53piz6IU87YNrPms?=
 =?iso-8859-1?Q?q/OtlXreVEqU9gLykY00mUNOXI29c9ud/Xp0OAu3iUlN3XdT56lKU7AuqU?=
 =?iso-8859-1?Q?RMheQXwmwMzvV1GMscBuP2fQrbGJVcH1iDeQvm/gdsn3+dWAb9UOp4Kkf0?=
 =?iso-8859-1?Q?+jfqYD6kuiUBmuF+J4wfIKCn5YnZ2JwkiUO1VxCwUM/MfN5M93jX9JYP8h?=
 =?iso-8859-1?Q?6JBrQAW14e35jJfDl3zzqot3to5P7CCzS74En/j+UJd8RuxJJG3SOWQNU6?=
 =?iso-8859-1?Q?Hk7Z4eLt6lzHAn1qOqsW06b/nzfqeewX5iUnHVJsFokS/aRvsizMgM1zmo?=
 =?iso-8859-1?Q?ZD7c4z/Dcx1L1bhCSDj4+qeH00IpdsC90oTfCoC4jIWP84ITrr8VDGDh4L?=
 =?iso-8859-1?Q?Oj+jX35CROOa/Q=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6e454.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR06MB3148.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4507d8e9-b802-4cf9-984a-08da0d1cf924
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB5632
X-Warn: EHLO/HELO not verified: Remote host 40.92.90.73
 (mail-vi1eur05olkn2073.outbound.protection.outlook.com) incorrectly presented
 itself as EUR05-VI1-obe.outbound.protection.outlook.com
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
winbindd , nmb and smb services are running.
do you have any hint for troubleshooting?

We have a plan to upgrade but it will take some time as the server is runni=
ng some more applications as well.

Thanks

________________________________
From: Andrew Bartlett <abartlet@samba.org>
Sent: Wednesday, March 23, 2022 9:50 PM
To: capricorn cap <cool_capricorn80@hotmail.com>; samba-technical@lists.sam=
ba.org <samba-technical@lists.samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token

On Wed, 2022-03-23 at 21:41 +0000, capricorn cap via samba-technical
wrote:
> Hi!
> I have joined  4.5.16-Debian to AD.
> sudo net ads testjoin
> Join is OK
> getent passwd works
> getent group works
>
> But When I try to browse from windows computer then I get popup to
> enter username and password.
> Below is the log message.
>
> Kerberos ticket principal name is [xyz@TP.NUTI.LOCAL]
> SID S-1-5-21-774976744-1476728229-930774774-3891 -> getpwuid(13891)
> failed
> Failed to map kerberos pac to server info (NT_STATUS_UNSUCCESSFUL)
>
> Can anyone help me that what can be the solution to fix this issue.

My guess is that nss_winbindd isn't running, or else there is something
fishy going on with idmap, but either way you are running a very old
version and should run a supported version.

Andrew Bartlett
--
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions

