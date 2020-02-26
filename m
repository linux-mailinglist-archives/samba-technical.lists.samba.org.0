Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 592B3170511
	for <lists+samba-technical@lfdr.de>; Wed, 26 Feb 2020 17:59:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=+mjpoGRs2HVw1iIh0gm1q1r1c5vkhfAX83Fjfoc/Kwo=; b=tfK6JTanmqdVNryquHqWalX4H0
	ybaJULgSgzrshhPU3+dekiIvKn1LXVkt0JQz/W3io3tOOYLNQIFpFG/ps4A6SXi+eEk5uwDqJ9xH6
	7KnGbHph7MWmR7AIsqlXuXKO9HLTtnGfeaIfOYbCoH61SFz1fLyldTGtbHW+kFZD3ZPTbWY67YwEI
	/1FhioXQzmkXHGzFXGjJwkMprugN16vJ7f5iN0WVbenPyg8VYoeOIN1UOU3Z8gPKKpjVeTh1S+HGM
	skVqlDmXkBHNDzpQ8zfoUENNcT2pBOmXDMWVimupm0+cFFVbnG2+CnOfklBNoH4rf/2tBKXswSx9t
	L/xJ4rkg==;
Received: from localhost ([::1]:22868 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j701J-00BpnR-V6; Wed, 26 Feb 2020 16:58:50 +0000
Received: from bex-173-206-187-6.static.tor.primus.ca ([173.206.187.6]:21157
 helo=mail.cord3inc.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1j701F-00BpnK-0c
 for samba-technical@lists.samba.org; Wed, 26 Feb 2020 16:58:47 +0000
Received: from Cord3-EX-2.Cord3Inc.com (10.15.60.53) by
 Cord3-EX-2.Cord3Inc.com (10.15.60.53) with Microsoft SMTP Server (TLS) id
 15.0.1347.2; Wed, 26 Feb 2020 11:43:22 -0500
Received: from Cord3-EX-2.Cord3Inc.com ([fe80::78a8:bf:478d:fa71]) by
 Cord3-EX-2.Cord3Inc.com ([fe80::78a8:bf:478d:fa71%12]) with mapi id
 15.00.1347.000; Wed, 26 Feb 2020 11:43:22 -0500
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: re: Writing a Windows Explorer plugin that uses a Vendor Specific
 FSCTL to access extra metadata about files from Samba
Thread-Topic: Writing a Windows Explorer plugin that uses a Vendor Specific
 FSCTL to access extra metadata about files from Samba
Thread-Index: AQHV7MOTfyqpRSHxbEGGZ3fyMocX+g==
Date: Wed, 26 Feb 2020 16:43:22 +0000
Message-ID: <1582735404048.59085@Cord3Inc.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [174.114.52.125]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
From: Dan Seguin via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dan Seguin <dan.seguin@Cord3Inc.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/25/19 11:53 AM, Richard Sharpe via samba-technical wrote:=0A=
> Hi folks,=0A=
> =0A=
> Over the last few weeks, as a part-time activity, I have been writing=0A=
> a Windows Explorer plugin that uses a Vendor Specific FSCTL to=0A=
> communicate with a Samba VFS module to retrieve some of the plethora=0A=
> of extra metadata we have in our file system.=0A=
> =0A=
> It also allows us to set some of that metadata as well.=0A=
> =0A=
> Since knowing that something can be done is often the most important=0A=
> step in doing that thing, I thought I would mention it.=0A=
> =0A=
> I hope to find the time to provide a tutorial on this subject as well,=0A=
> probably on the Samba Wiki.=0A=
=0A=
Hi Richard,=0A=
=0A=
Wasn't sure if I should ask this on the samba technical list or not, but di=
d you get something like this going?=0A=
=0A=
Dan=0A=

