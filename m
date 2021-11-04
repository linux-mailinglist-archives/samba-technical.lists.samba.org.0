Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C65445898
	for <lists+samba-technical@lfdr.de>; Thu,  4 Nov 2021 18:36:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=8aqCMYov4LKDtQf5yRY4crrHzXkWtTNE5gDUGxmefOA=; b=ARbninuYFmCxm/l7owIsVL4M1V
	eAXUsuOZ6dg5ONwyzWEVc4QlW773z4SiVKQ68SeYXm26F1XEuQPfBsUGHWOWw/rS1Xl65dfe9lB8r
	qHqbjtRSC9oYjwAB2VqeDaIWctGpThhOpi6lQOVEczGNMlpUc593oqNpxd2c9Pf/WsJ1anDU8QvE9
	BN5HrHt69bmM6JhbN3kcA95q3IX+j5TXDt65knCTwHhR2alp+mL5XlelDGj4dTIpn2Kce407+kMaw
	krq3GPiP6366hJzk3SumAmJO8FPgrsct+RRF1eDMUpBZyiu/fqZWzXjVypFtErpuRU9nyF/w90DXt
	tZxckJpw==;
Received: from ip6-localhost ([::1]:22922 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1migeq-007gFY-2A; Thu, 04 Nov 2021 17:36:12 +0000
Received: from mail-mw2nam12olkn2058.outbound.protection.outlook.com
 ([40.92.23.58]:7937 helo=NAM12-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1migej-007gFN-BY
 for samba-technical@lists.samba.org; Thu, 04 Nov 2021 17:36:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAJzb9C9CbZDwzNbTmuSSYtkxOlONiPhfegPkPS3Bq3zr0scmaMHo+yU1a34WnubcP4Vsv2QaqG5SNmrgF76ohHPAKsKQBZgHopBTNlO3JBSlBqja5euUrmolkrOQ5c6GvutQx5e+yDcAE1lcXOC/gT/3Xd+yC6cVT++sIf9HvnnfaKanhAVuqyJzRLY62q0COY7ekQbIwoaSFZYt3CgQweTFLCkmVO7RWMSxwV6VvFxdu0pjDvS2KjG7UDU+5zRwcf2LXu7FE26PyR7CnztT6CYNloYyLIyXlaKCZ2COJcjJH23CCUJUIiZY5y/IgWx42jpAVM13QgS6U1PegBN1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPxRQx5VdzHpjW5Nj9g+is2shaltOIHZVNpchUnHaAE=;
 b=BTkrqsvy4tAF0MYrknrrgOoji3DiI/3Y3ye2YDQIvPdSD6MwOiAV6HMUUkmc/U2r16jffDZk1N+T7TZypD1NNuoVZkWGVJ0uw5PqYKfUQRj8gSNJQs3oAAZKuo91cbQdthvAnJFHlyQ0eSinhwsXc+wtDbXFx2J4mhL2psz42NEol+klMV4FX/KjPyDbQyHos5E6FK4160UskI6cWYDrln4XzXVy1HPpM+ZaY3D3AjUJqMyTM1LsOK9MFQ+g5AZqs2I1hZ6GQQP2g65YKltcN3N5GfyfFzcCCzKUMkQVtvnb40LOZqXsIaCiblna6Jn7VQsH0v9rCAi3SqtSWuRb1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPxRQx5VdzHpjW5Nj9g+is2shaltOIHZVNpchUnHaAE=;
 b=fYSKw68pDJxv9Fhxw/zDrQtWsjqlf7DgY+ukFgpl1xLpK+PShyU1JVQEZfocY3D1rvdtmRlSW4uHQ2g2ljWoONL52DtICPlB6V25BMKFycZvKmf7cwC34EmiDUD+cqKMQhY/Y6f+Ao7uBx3ipj12Uf+u4kJqbwu9k1bSDykUZBMIHmlMbHEHPVDInIC+HBa0KfLnTFQ2lZYRM2fyp18S0gHdQOabTHGdNTc2RjgoeW5Wcflg8Gtyvh3BinPrzScPuCxovQwIcECyU+LbQK5Jn/koRusVAUdJGw6AVJaEtxJKDFwTIHjQ3AUZebwYePwyltHKqMcuMx6gvWrLfweZaw==
Received: from CO1PR19MB5109.namprd19.prod.outlook.com (2603:10b6:303:d4::13)
 by MWHPR19MB1024.namprd19.prod.outlook.com (2603:10b6:300:a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.19; Thu, 4 Nov
 2021 17:35:48 +0000
Received: from CO1PR19MB5109.namprd19.prod.outlook.com
 ([fe80::8cfc:9cda:1339:c896]) by CO1PR19MB5109.namprd19.prod.outlook.com
 ([fe80::8cfc:9cda:1339:c896%9]) with mapi id 15.20.4649.018; Thu, 4 Nov 2021
 17:35:48 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Rowland Penny <rpenny@samba.org>
Subject: Re: Multiple idmap servers for failover
Thread-Topic: Multiple idmap servers for failover
Thread-Index: AQHX0Z/ulBNLmKQidkGozsuPatyMjqvznwEAgAACPA8=
Date: Thu, 4 Nov 2021 17:35:48 +0000
Message-ID: <CO1PR19MB51099709E2B9AB18701C1800D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
References: <CO1PR19MB5109D90918F5592C8891A0D3D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
 <6a03d46f09f838450185552da856c4673dc5e9b3.camel@samba.org>
In-Reply-To: <6a03d46f09f838450185552da856c4673dc5e9b3.camel@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 27d82185-f4b2-553b-2836-8db2bff49ad8
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [6/BAYhuYpeA3SRG2CZsWzvBWgGOtUb43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a5b723e-b35e-41b4-1d25-08d99fb98a35
x-ms-traffictypediagnostic: MWHPR19MB1024:
x-microsoft-antispam-message-info: GRXXvUvMG1zuZYRCZqOoM5RKddwuzpPKSHk4EaJ8IIafgWpz7BWiE9HtG7lp1KNnheQFjRgzvRLhu3Nsiq3seaH+vn/fkJ04BEMW+/mRgoaRnrDK4rG5Y8EuzZ9d8/2RoJD9RcXGsWvIeqAEJKYZtVRuM1PKuxORC7NkQQpinKhprR0n53Lm9EkAZD0lNNVYPvQdvoxRCQ1YImCok2N65hNmXtdJoHclw8DeawvMctSjzs/XP+8poLRAk4n0t5BGKNTGBHZUYp/NyE58op27LKiH1ChX0FipCYD7X57hqPHCwysMWLAJ2JeisI3vlfnHS4oJwsm1WA402ngZXb48u3p331/q97gx5LEkwAXAhYmt3BGsTfNESJTT2oVc+7GsADdKERppE0cULS5ZlGt3/C1bOveFyepiVrLqnADaLUh9Jyz6sldWju0/aieD8sEwXzbk+dZWlqud2h9VKozIeySbvy2NCxT6QpS7uJMrmHQpc6xP0iNSzh5AkL0gpWE7hv9vO1+BGd3eAZnqzfu++1w0WzGikhPeNf95lF75yzU=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: zx7IyP/WY5qhQISEY8GTqzJZIEZ7j888h/heZVEIFRyDXB2GPupu6JqRMvMmWjWkFZe1QG2xo6bbUfSgXWjKffutVJ8ICUILhgb4QsK1YBBs3TPQk7agenuDVzkoDfXShP1zdAoJVkvEfEBwHPZFs5fc2tv7s1LJAwK9kxqOMB3NO7UVSxhUSKoJTFeQzeHpWE1xuCEp89J2yAc/oKDcaKwkLr9s/0K06PSmQGWDV+i92MC2pfal+XbGjGb1P3DcjLNe+6ib+fM22mJU89DYGNHwYLnRvo7VmgCIcchzw9AEgLiwzJGWnGNGy+u3mknLnd1xv+PPcLnj677NvOlftA47Pot9kqD9UFN9+EprG3VFSF8Q8HaatrpLhFqnAfGIZFSm1YjFGP2/QswkBYOFCBQDSYCR7t3IMLnzunkUg28cO4X4F3E7IKtZvkPRJXyxcd6hFlR/SD3QnUoe1sbuF0JepQG4ASeh2rj2rRWzZvOttdOD6KMjIjzdW+lzmqNbMirQYxhc2Fphb2hxSkMDP6rK9PfzHEkUcATqsR+xlmQd/Pqq6Z87pPPOBbJwCN3edbTGZLHhYyWH+BHG9JVA5EZ4RqpdgrnEsC4Kyri9PjXpAGSC2JNr3BXT8u+qRx1KMwd+Cuw1/aZcooTVwH62pmKWTw/0K8aUbrZxw92rUEx8EDHns4/l8J13QvgyfAqhoIr+P99V1NydzloMjDPSRw==
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-8efcd.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR19MB5109.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5b723e-b35e-41b4-1d25-08d99fb98a35
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR19MB1024
X-Warn: EHLO/HELO not verified: Remote host 40.92.23.58
 (mail-mw2nam12olkn2058.outbound.protection.outlook.com) incorrectly presented
 itself as NAM12-MW2-obe.outbound.protection.outlook.com
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



________________________________
From: samba-technical <samba-technical-bounces@lists.samba.org> on behalf o=
f Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Sent: Thursday, November 4, 2021 1:26 PM
To: samba-technical@lists.samba.org <samba-technical@lists.samba.org>
Subject: Re: Multiple idmap servers for failover

On Thu, 2021-11-04 at 17:18 +0000, Michael Starling via samba-technical
wrote:
> Hello.
>
> I would like to specify multiple OpenLDAP server backends for the
> ldap_url option. Is this possible as I don't see any examples showing
> the format?
>

That could be because they rely on SMBv1 and Samba is trying to remove
it.

Can I ask why you are not considering upgrading to Samba AD, it is
extremely easy to have multiple DC's

Rowland

Hi Rowland.

This is a legacy installation and they aren't interested in upgrading.

So this is not possible?

