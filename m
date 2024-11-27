Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEE79DA4BE
	for <lists+samba-technical@lfdr.de>; Wed, 27 Nov 2024 10:26:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=lVnUAO+Gotd4JGypBQSz3h24e622tVop2j8QWEpWv3c=; b=bzITiZvzEJVFYSLKtiJXTWGjlo
	gx75uIrpqD2faGk41L6z0wQhfJmTx0h6E0M/iTIQUf7+/X3MyMOb33QUnJpTv4uljVaVU168FoOne
	vGSS781ihvmC35dx3LnoDIa/bI5GdDa5mR2ahI7gZxNtdHo978aEcZo1lr4NgGdm1X76ss7EQ2luR
	rHr5IKhKoqFRhmcdMhPRtsL+rikNusx+kxFjyi0u31oTF2c3fpty4Povgktl1VehtVQbIgU5DiLhj
	ekxCtcOsUWrDKw4TrNQCrWppxyLmL8MmYN7UH+nBaMxEhDFeUj6KoTid3L0sDXlXdAvuTSpmlJWL8
	Ur7NcdOA==;
Received: from ip6-localhost ([::1]:23786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tGEIy-000xPL-OO; Wed, 27 Nov 2024 09:25:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25222) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tGEIq-000xPE-Mm
 for samba-technical@lists.samba.org; Wed, 27 Nov 2024 09:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=lVnUAO+Gotd4JGypBQSz3h24e622tVop2j8QWEpWv3c=; b=YZIlu3SerOF7IBZK4oGnodk6PT
 5yptA+ej/kPxePawr/6T+tn6ImwY0WWif0N9rhu5BwOSbEr5jagftLIQAqhrseJdsQe5ijEC1pWyh
 XcJTxVUWEImoFi/QL9J94Xuh6Dmhkr3w2X2+8Vk82w+B1vaCDJPzzfvCHZR+AJFB42mluvCFdrblt
 lZHuW6y+QG291z1SfhVJXAbOOO+s6ia8R6I8xdgH9ko2zKYFX9VlF19dT9DzcB0yJ+rlJ7R0TXLov
 +URoWbXnp8TskXxk4ld5cqLg21495hEbOUW/KPut7Kp6NUmM24Ke8YK0G2lNfgJmlDPCWxAPAyU4n
 Zglw2sMVsGJ4s0yU3FWdymEZ+8VKiXpYy6FB0RiuzpuQePlZbyrFGg0NPUQKktlxcCJ7S+fD64c8V
 lHJbrmllf88u/zaGbgEZUCj5BErKCDOL6+EWj7EuLMI1QwlW5GWRsO/OigsyxpSe1kgqLFPsSn2+q
 AAaK6EPWJg9KeZ2VSOaT/OOZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tGEIo-001gJP-30; Wed, 27 Nov 2024 09:25:43 +0000
Message-ID: <73535b3d7f205b4dd52a18a04ec8af0b4b547329.camel@samba.org>
Subject: Re: missing rpath [was: building bundled talloc/tevent/tdb libs out
 of main samba sources]
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
Date: Wed, 27 Nov 2024 22:25:39 +1300
In-Reply-To: <01fd1b4b-41f0-4248-b3a2-e3842bc22a78@tls.msk.ru>
References: <d033ddfb-9e93-4bdf-8cbb-ec8d0ace7702@tls.msk.ru>
 <f6a0c35c4b22bfc273b812fabdaa65e80991c3b5.camel@samba.org>
 <548706c7-22f9-4715-8fb9-90aed04b8c54@tls.msk.ru>
 <71cfea1803e9e86dad4734dc28ea992e4d74db80.camel@samba.org>
 <01fd1b4b-41f0-4248-b3a2-e3842bc22a78@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2024-11-27 at 09:04 +0300, Michael Tokarev wrote:
>=20
> FWIW, I already submitted another similar fix for a missing
> dependency, - it's in my (largeish) MR which is stalled due
> to another issue somewhere in wafsamba/wscripts which I'm
> having hard time to debug - probably I should drop that one
> change from the MR and keep it debian-only for now.

A well used approach in Samba is to have a tree, which you can have in
the shared devel repo and get CI on, and then to split off patches that
you are pretty sure will get a positive review and pass tests a few at
at time into a MR. =C2=A0Because we mostly tend to accept/reject a whole MR=
,
that gets things moving. =C2=A0Then submit another, possibly in parallel
while you wait (eg !3 depends on !2).=C2=A0

Certainly folks generally find that momentum of small sets of changes
drip-fed is better than large sets that stall.

Andrew Bartlett

--=20
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


