Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 490EC4A37BE
	for <lists+samba-technical@lfdr.de>; Sun, 30 Jan 2022 17:43:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Y8kQhyHKWwKvU1+l4pBIc2e/gOdBRi1O8po3kVFy830=; b=yQVZVilULwqLUFU1tv6HYZ6FGu
	38bO9Wh8kNNxoj06KpJVHUQoWTSPlElLBbWmhY5BQXzgowMDquIJutn5MBtcYYf0cKqX/GCu/tM+m
	R4GrvDEOCJsrVly6LJlCAH9hYqbpTgvAC2ZtSgH9Uj1cX3g3VUwsw2F3cgu3cpWUgcH/GX+dmyHUK
	cTLvfljVl+m3V2WA5fYvLEcQ3uY/qTfzOqe3WFB758Y97/Yw3jGdWI/3We3TWuan78wUlLnR8+1F8
	0vShpT+eyqoEwWniwuUOpEXb2sNbxg/5IBxEhMUrE4XYs1I34Mg38WQ2T8IDbAH6qhREROoxeWng2
	AI5G4aBg==;
Received: from ip6-localhost ([::1]:34832 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nEDH9-002V4c-OJ; Sun, 30 Jan 2022 16:42:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48504) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nEDH4-002V4T-Jm
 for samba-technical@lists.samba.org; Sun, 30 Jan 2022 16:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Y8kQhyHKWwKvU1+l4pBIc2e/gOdBRi1O8po3kVFy830=; b=Gl7b9trYcIGP14FsJfWsNiEqjn
 almzCp2CoEV2W0wUU7e+jSEu73QYkkSMR+wNlrHIB5CndKbrUtWC3A6p0LRXdX8Nq0wsT7MPVA15I
 R9UIC9XSiIo20iPJwr28YJ1NHsTbiNMUncb9lldsiFFiqHpbBbx0mThA1RJQG7Ao7rNTw0NJ5Kqln
 R0feLKRVssyMSHLVCh9RUKAeXREDR0ZOnV5W0kPFHLA5CiZo9D7dseh0+GJMIy38pErgzRzdSfg6o
 5JxUsxGtlAt+4xoDneiCJPSEYXegyyliU+9FwcoVawtxc6dQ4QFpIEtJcJviWHE6PJpjiJwyB2Btu
 knzkaiTuqAWL0UMPEdHsUTrvW3Bviv+OZt8zAnFwNzxhJ8WT7ByKH76JSd9YyEM42jhE6CgvXMcK/
 Ik05D4jGxJPZ162Vc9es9katoKsZXLYPahMtpsJV944U3T7f/baOcuig9FPlCVWxZRzorasXeBCTo
 Zy5CEF1SjeV7dmf1jSc0Z8Yr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nEDH2-001NzV-P7; Sun, 30 Jan 2022 16:41:56 +0000
To: Stefan Kania <stefan@kania-online.de>, samba-technical@lists.samba.org
Subject: Re: Microsoft Enforcement Mode
Date: Sun, 30 Jan 2022 17:41:55 +0100
Message-ID: <4510140.vXUDI8C0e8@krikkit>
In-Reply-To: <d235f497057f4188e9ea447477c32e6e0d66469e.camel@samba.org>
References: <cc895930-b174-0371-c4c5-807bc06e34aa@kania-online.de>
 <d235f497057f4188e9ea447477c32e6e0d66469e.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: David Mulder <dmulder@samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sunday, 30 January 2022 08:47:50 CET Andrew Bartlett via samba-technical 
wrote:
> On Sat, 2022-01-29 at 11:41 +0100, Stefan Kania via samba-technical
> 
> wrote:
> > I just read, that Microsoft uses a new Enforcement Mode on all MS DCs to
> > protect the DC against CVE-2021-42287 and CVE-2021-42278. The
> > Enforcement Mode can be deactivated until June, then MS will force it on
> > all DCs.
> > But with this mode active it's no longer possible to join a Linux-Client
> > to a MS-Domain. I could not find out if this will affect Samba or only
> > SSSD. If it affect Samba will it affect all Samba-version?
> 
> This isn't something that I expected to fail/change based on the
> intensive discussions I had with Microsoft during development, so I
> think this is an unintentional regression.
> 
> David Mulder is chasing this down via the protocols team.
> 
> Samba sets passwords via LDAP typically during the join, so isn't as
> impacted compared with the tools around sssd (adcli), as I understand
> it.

It is relatively new that we set passwords over ldap. We used DCERPC before. I 
think adcli is also just using LDAP.




