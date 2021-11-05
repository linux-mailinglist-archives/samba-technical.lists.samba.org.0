Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C2844658C
	for <lists+samba-technical@lfdr.de>; Fri,  5 Nov 2021 16:15:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zugzYJDO6636zQHTpOAXpPiZbZqyNQJrFAZ60Jh8Gpw=; b=mL3NLR6hmqAwP6Go+bU91vx9cW
	1dqsQnO620M/0h0YNV4WxYJ4wjpC+4aklTXlqyA6aMDFa4V1IUptw/szn4SpgX4W8/emv+O4KCt3e
	ATrwr+p9zLqGETD1vIBWg2o5Fwg+g3Xt1ADBeWNNIqr+hj5KOXCoXY463OV6iZTVrckZ97pZaKmpY
	NXhO6eo+FbpFCN1QGyn0+oC0/uHG+edtgcszBlWoydUJwQWkDKmHlH4IWKZO5pH2YuA6h92rjiTju
	sRl1tk9qhF0KwUx1WHEPsRFUz02xxGb59FbUZaIbTHYssyfu3+yLtZCDornxsD4O0J34/BHswuG/v
	aI5pSIJA==;
Received: from ip6-localhost ([::1]:64514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mj0va-008JSJ-Qw; Fri, 05 Nov 2021 15:14:51 +0000
Received: from mail-bn8nam11olkn20801.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::801]:17888
 helo=NAM11-BN8-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mj0vU-008JRu-Mk
 for samba-technical@lists.samba.org; Fri, 05 Nov 2021 15:14:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVEBSvIc6VpULAAWX+HkAPWbRRnxdj2s3yjgQw/7I0jDE9oqLSfWv0abj13RRYLIr5usprG75vuY71wmEoaWyVA334HiBimgHBTcHed7KnYdyegKWdMk3sAORKIKpEmaBxTyVy19tILMYqUKMPsYtbpwwuzUSMYbjrNan/GnYll2g4jCjdKVIEht3dudnhBgV+KZNWSyQgVX6YEC7FcVYe3haAtrsGX8K33jodgu3+a8gCmK2YgihXgCDS16EL+fc6KRjtb8wYphFSTRuZZ3Q0hTlnqwf/+WzBxJJw8KuJx+5u6CC0GLI2vk3s5wO9xfy3T5eIw3jwcl/TudVtqiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4c+EFFP7N70HZNPV4JZ7qnvRgiF/hgHM+ONeRlPjY8=;
 b=BG2ORs8x3wuYuf9H2vEx/KBV0jtG7SEHtUAwuIQfo7ZSgy2nGxaeOG8f3iUQ99XI0BIMWKtMiYNsre+FuP7zc4ViGollL/IVikolTzjP8xNBs3VThmQK0kiYFPmIWUfzhpG32/D+p7Ngo1TKsNHXQQcysLNMEwiiBmAYshDx2exiCM8e7caBCzpvh04sO3BDxYDsWnMnl1K9o8SF8FlSGQufamUEcyi8kmc0Ur+Wi105TUb4TaW2w4oSSy78P4r40pjAADiIof9pDn2tCVmJmHb7B7VRA4XaAZTsI+2/aiXb0Gex5wcZn4r3ScLQkuZIPyG6wo7iDS405tJCz5SIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4c+EFFP7N70HZNPV4JZ7qnvRgiF/hgHM+ONeRlPjY8=;
 b=O+nQwti8vNCxCfDhR1mR1mh/5vjuAh2KNS3Q5FapTi2pdVKur+MPGIN92tsCeVF93eGf1od0RkNTQeHYt3MijrzwJOpDfjnhlwkk5p8GFMIgXZNsL7m5D63p0CHPUpIJD6ck6RudRrOgQiAZ2YRt2bn/03+6DhK45TrnQnHLb91sD17gSQ8wMddXaHyZ6NgMk7sQpGn2ArP3Vd7YcKLMFKDgFzxBsZUmsdaqRAjMouzoHArbvQBINNmCFgfPhAdM9qF2i1VtdGhTmXGoqvIv7gY7ZtjHonFvzObxvqjHDUF6S86aLHCr2SpqLirZ3QQCnhSyXX2eawxrwbJK4kKBPA==
Received: from CO1PR19MB5109.namprd19.prod.outlook.com (2603:10b6:303:d4::13)
 by MW3PR19MB4250.namprd19.prod.outlook.com (2603:10b6:303:46::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 15:14:28 +0000
Received: from CO1PR19MB5109.namprd19.prod.outlook.com
 ([fe80::8cfc:9cda:1339:c896]) by CO1PR19MB5109.namprd19.prod.outlook.com
 ([fe80::8cfc:9cda:1339:c896%9]) with mapi id 15.20.4649.018; Fri, 5 Nov 2021
 15:14:28 +0000
To: Alexander Bokovoy <ab@samba.org>, Andrew Walker <awalker@ixsystems.com>
Subject: Re: Multiple idmap servers for failover
Thread-Topic: Multiple idmap servers for failover
Thread-Index: AQHX0Z/ulBNLmKQidkGozsuPatyMjqvznwEAgAACPA+AAAE3gIABIT6AgABIpEY=
Date: Fri, 5 Nov 2021 15:14:28 +0000
Message-ID: <CO1PR19MB510964ED6C3CFCADBCCBD3BDD48E9@CO1PR19MB5109.namprd19.prod.outlook.com>
References: <CO1PR19MB5109D90918F5592C8891A0D3D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
 <6a03d46f09f838450185552da856c4673dc5e9b3.camel@samba.org>
 <CO1PR19MB51099709E2B9AB18701C1800D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
 <CAB5c7xp28HinVF0Z2TFvMa5O0r7q0S6fbNBWjwN-OxTj6DvzoQ@mail.gmail.com>
 <YYUNV1B80LOATS/r@pinega.vda.li>
In-Reply-To: <YYUNV1B80LOATS/r@pinega.vda.li>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 79d97d41-b000-c836-496e-779843d98eef
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [RVE7Eiqt6lV8u7SfPNfjtyi1DszWtVIt]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8cd3b2a-1732-4113-fdf6-08d9a06ef611
x-ms-traffictypediagnostic: MW3PR19MB4250:
x-microsoft-antispam-message-info: Dw995nEvJyMt+2ETgZuVgDYoh4MGk+e49rfR3MHjBuLr4RgQwIjxXXNtfYu6pquUnmICd0XrOeCQj2jFn0Brj8PMy9/u+qIuF3yf5m9dBfAp93zoVXnG1QcXibrL90iY4TNC9oCHp1emS6opSXFw/W5nhhOTP8m1H6kMeYuw1ojkmqsQz1O0ozz37ubFj9VnEGdHxXQLXPbN95BEJ2X+eYH4x8bk2zLyuOKV4ssZkjbi16diXw4eakw8bhyhlfaXjXoiJ7spQssvoJBXT7bENwS0BwIULCGhLBGcs6Fr9rbfIy3NV0o3+bR0art6PUSyZceyaZuO7rsNeu1Nohqp7di57DFdp97tk0jdtfQBJ4U50rVMxB5VnubgRItjFWxVjNKbc0msOrJEfi6zQaxFxlUyWzzclxO15oCxEPr+Dgdwm0Ffsj6jkARvDmL0Ki6wARPCy1bOkfXmvkGsWCcTvHTWNSw8VIrVHqCt9wGRUbxh5edwkeOElP1BIyEvL4ob1LW3sES1KIlDzuaT1NzzMM/qLUif6IlN+3JnZnFP8e4=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: j3U6xhnflbzdmeLu2Tb60xVAsM8wBa+7fU+eDfGlVapxvXwAnO990EQlt5P0N9duDud6GHFy2kVGRaeK/NgbhQNooy+9fCuhzY6n7yHjkP27cx756/vQUDIuaaNzqo8ZAu2G6YksDehoEVnqXH9yWG54BvJWc+So1ROViD1FUDAoS+0zF/NA8LkROT5ogkLRkw1Ihr28+oRPubsDYYQE4gAOmeDsUPNHOC6QU6wxOeh2VqX9EsifVgqzRoB4we98ikFz0Lp3Vi7UXXh5mLTGMw9wD57eomLd43WPLIEDEk9q8BRGwo9+N0NcmJOIupuQxqKHuUOMm+lyOYuVdmM2oWNPqCg57SUcHjlcOApVWJKEhjzv1v4gSQxfgLxanLLkQQKcaPsud9aTyES0dUpqJYpAXPjfJWgL5cRkVTLfYRAN4m/+k23W6rtYpABFmX2TUE6r2feTp5OKVnT+cROeD+iDcd6v5rwswROEtsqu2zVW827Q4xL23t/LcDUksugmwYlZme8JdikqSig/q+ykZaZTpsVbml8YeDhBM54vS3xfmCtzQFSpn+sK5KhqdMr3W2EdNFYRQH3qDdWkbuTmxxzNhKGxptZ+ZEaMDgeklmrp4qpldvJiX9ZeV0qA3DbH14Mq4VyxGsoTDMXaUi3XpfOfjxgDFeIxGBhRe6Ku9bp47B+VVtWKSJ/jgM5p5lT3pJYJr5dHnCSvGDz2P9xWyQ==
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-8efcd.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR19MB5109.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cd3b2a-1732-4113-fdf6-08d9a06ef611
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4250
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7eae::801
 (mail-bn8nam11olkn20801.outbound.protection.outlook.com) incorrectly
 presented itself as NAM11-BN8-obe.outbound.protection.outlook.com
Content-Type: text/plain; charset="iso-2022-jp"
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



________________________________
From: Alexander Bokovoy <ab@samba.org>
Sent: Friday, November 5, 2021 6:54 AM
To: Andrew Walker <awalker@ixsystems.com>
Cc: Michael Starling <mlstarling31@hotmail.com>; samba-technical@lists.samb=
a.org <samba-technical@lists.samba.org>
Subject: Re: Multiple idmap servers for failover

On to, 04 marras 2021, Andrew Walker via samba-technical wrote:
> On Thu, Nov 4, 2021 at 1:36 PM Michael Starling via samba-technical <
> samba-technical@lists.samba.org> wrote:
>
> >
> >
> > ________________________________
> > From: samba-technical <samba-technical-bounces@lists.samba.org> on beha=
lf
> > of Rowland Penny via samba-technical <samba-technical@lists.samba.org>
> > Sent: Thursday, November 4, 2021 1:26 PM
> > To: samba-technical@lists.samba.org <samba-technical@lists.samba.org>
> > Subject: Re: Multiple idmap servers for failover
> >
> > On Thu, 2021-11-04 at 17:18 +0000, Michael Starling via samba-technical
> > wrote:
> > > Hello.
> > >
> > > I would like to specify multiple OpenLDAP server backends for the
> > > ldap_url option. Is this possible as I don't see any examples showing
> > > the format?
> > >
> >
> > That could be because they rely on SMBv1 and Samba is trying to remove
> > it.
> >
> > Can I ask why you are not considering upgrading to Samba AD, it is
> > extremely easy to have multiple DC's
> >
> > Rowland
> >
> > Hi Rowland.
> >
> > This is a legacy installation and they aren't interested in upgrading.
> >
> > So this is not possible?
> >
> >
> IIRC, this particular idmap backend uses source3/lib/smbldap and so in
> typical cases ldap_url gets passed more-or-less directly to
> ldap_initialize() from libldap (with same formatting conventions).

Correct, here is an excerpt from ldap_initialize manual page:

       ldap_initialize() acts like ldap_init(), but it returns an
       integer indicating either success or the failure reason, and it
       allows to specify details for the connection in the schema
       portion of the URI.  The uri parameter may be a comma-  or
       whitespace-separated  list  of URIs containing only the schema,
       the host, and the port fields.  Apart from ldap, other
       (non-standard) recognized values of the schema field are ldaps
       (LDAP over TLS), ldapi (LDAP over IPC), and cldap (connec=1B$B!>=1B(=
B
       tionless LDAP).  If other fields are present, the behavior is
       undefined.

So, using something like

 ldap_url =3D  ldaps://host1.example.test,ldaps://host2.example.test,ldaps:=
//host3.example.test

would probably work.

--
/ Alexander Bokovoy


Thank you.
