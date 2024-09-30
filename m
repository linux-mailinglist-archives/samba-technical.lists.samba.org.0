Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A7F989E29
	for <lists+samba-technical@lfdr.de>; Mon, 30 Sep 2024 11:28:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=cd1J6u2d7PqjJZzXdH+gV+yVmMw2F/JX7ker8C1RfZA=; b=zyBGqbI1urA6wdUr1fjGF6WBe1
	crxExebnz4Akp1y3+kjkYhnOwxe5m4A6bN6fJ54a4lZNxOZbeNNUW9X0HGxFOljZxpktjOm/YqRMP
	3ozeSwlSWPBrypC5ePwc1arZ9JTwURyVhGTgZWpqe/5dfmSVoGZIg37w4K8ddcfhltAFlbLdYSfsK
	SDQe8Vjl/3qZ9gqSA3xG93nc4qIzW0GOqb01YT2aqjR648AhNfLqjoQGUxY91lHf6zdqBuqbO067U
	KEb/jTYpyhMozHrK17bt66Mw97n7utwXpl3UhT1jqO0QZ6GUzXQ1oKK8HEfxLq3nu7tld/p5JtDhv
	f1seGULQ==;
Received: from ip6-localhost ([::1]:19500 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1svChW-000t7p-VE; Mon, 30 Sep 2024 09:28:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52274) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svChT-000t7i-4V
 for samba-technical@lists.samba.org; Mon, 30 Sep 2024 09:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=cd1J6u2d7PqjJZzXdH+gV+yVmMw2F/JX7ker8C1RfZA=; b=Ah5HBginI3v3/8TWNAhNxJFmBB
 B03KgZ1rJpNW4B7/7F4LqU3GUZBm6fugisLyQiy1ykMpBmWeDaxOrexnP/veav68/Qyr4eqTcN+AU
 5kf97gogxb137iol2aaqZQNWbITfvUmVcjZqHETU9v1iKg3u0WV5ETUi+sx7rt8oFAxNCLA+KzQCb
 sbsOPmDeL9q/AGEP9Nh+hqsuXkptHpR9SiePLkJ0oPvSxcF30T+20H0NjUVtdqK4HafcN6xUhXxyg
 VhG1KBnxH/rpcARB58mKY7bBjpoF916BqT4ExvTYHVxNkwr4KiEg5OGzm7j43RRraQzgvJzJi5brk
 RNGy1E5Uu5iVG7mGRvtZgrcNRRUR9wgOQgkprPsnJPgweKa2NVt0DPbd947VC5YD78s+956N0Qe0y
 C6DMSdjdoM5Ed+bMzu7sOIeCedYYRSjLqRuf33Fjz2vHjWIORMVIoh0vS4mYOQYqgj/ZUz/HyCwth
 OH2l7tUA/5c14V7TBDsfAJcv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svChS-002gmW-1G for samba-technical@lists.samba.org;
 Mon, 30 Sep 2024 09:28:14 +0000
Date: Mon, 30 Sep 2024 10:28:12 +0100
To: samba-technical@lists.samba.org
Subject: Re: Consultation on password synchronization between ubuntu 22.04
 system user password and samba user
Message-ID: <20240930102812.218a3567@devstation.samdom.example.com>
In-Reply-To: <202409301707160229725@139.com>
References: <202409300141333173631@139.com>
	<202409301707160229725@139.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 30 Sep 2024 17:07:16 +0800
15051810258--- via samba-technical <samba-technical@lists.samba.org>
wrote:

> Hello, everyone
>=20
> How to automatically update the password of a samba user after
> changing the password of a common user in the ubuntu system=EF=BC=9F I use
> openldap as the backend database. The password of the samba user is
> automatically updated after the password is changed by running the
> passwd command
>=20
> Can you guide me? Thank you
>=20
> Operating system: ubuntu 22.04
> samba's version: 4.15
> openldap: 2.6.18
>

This isn't really the place to ask such questions, you should have
asked on the samba mailing list, but:

You could try adding 'ldap passwd sync =3D yes' to your smb.conf file.

I should also point out that your setup will require you to use SMBv1,
which is very insecure and Samba is working to remove it. I would
suggest you upgrade your old NT4-style domain to an AD domain.

Rowland
=20

