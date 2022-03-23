Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 802514E5B40
	for <lists+samba-technical@lfdr.de>; Wed, 23 Mar 2022 23:27:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ufplusdYbOSd05RTKyHpUwYgkRYF76dHb98jEuKyVJ8=; b=uCSxjZdnepK7qN7Ho9M0GqXvk0
	U4xep2Sigydt3B30JmGvey7ZdJxmxCk73h2k/U7Wa/h4Nclfc5umUySi/3Vr3MydYKq0vSuv0Ze4k
	MG9TaxEpfIifrf7C1LZ2O2u0WwCiRpJREae/ks2YU9dn4AhxER13VUAYdBMsQ5M94NIiKl/N3xbVH
	EIX0MZn/cmpxzcuOjmu0AXPLi135XqmT5qS3XFq8HDLvBrcmkccC8GlyWRayBqXsJ2lSPCH0LaFOh
	2L34aAp6WvFas2VXpWgXj9PFzNgh0qB6VIc8T/vRbQU4p1ihLiGWRkJyxz9TeZfDmZNQjjOtlGisM
	9DHwQdwQ==;
Received: from ip6-localhost ([::1]:63220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nX9Rt-004gTa-2P; Wed, 23 Mar 2022 22:27:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37814) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nX9Ro-004gTR-13
 for samba-technical@lists.samba.org; Wed, 23 Mar 2022 22:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ufplusdYbOSd05RTKyHpUwYgkRYF76dHb98jEuKyVJ8=; b=tuAkvNavHDDmz/offNUZB8MB9w
 1WHSABC5RqtbFjZ6Wn0kOj6Cc7V1ouNyzRPTm8f7ddqSvnqxevRekWvvX+Sw2HI1xm+TqnAWkGgvM
 dozM1wNO7d1bsJQYwlT/FNUfh6Fkg3VYqK0Ga4u5wsLIUlQ9ImccrUHHL5TKyYAklrneCCrTykyk4
 RKrI0vGJO95bIT96XuDpFQcIrgi14EVNPiyQ1FmpImJH+xvdvHB4uJh7RfRNAltKc8eJQPv1G0M3t
 S90W6bKrGMUK2qJUWiOtQIwiajyguJy+8PD4vbmP2QQROgWevebVEkiDLDQVMLXpbZZJWgIkeLauU
 r4r8KftiU0Wk+xck4sz3L9GIkpTCT163XHcHAIV1/18FfGbkOgRmUzjL2TSCbzT4gypGiU7fElKBK
 6JjATZNAJZ6UEBv/nXwXiMhD6xOzdvikuosDS9WpA6UT6uQTWmm6+cIoVBvjAwDn7UxwUSqYkfx2L
 Sp93I210oQ4yTpo1srazDUGp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nX9Rm-0037Ra-EW; Wed, 23 Mar 2022 22:27:19 +0000
Message-ID: <007c551a46cbad5f4e8179c156ce647891f519d5.camel@samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token
To: capricorn cap <cool_capricorn80@hotmail.com>, 
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Date: Thu, 24 Mar 2022 11:27:14 +1300
In-Reply-To: <HE1PR06MB31488952C3D608E9374C7FC6EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
References: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <be695e607739913e530fb1c8a0ccc191ea8eefe0.camel@samba.org>
 <HE1PR06MB31488952C3D608E9374C7FC6EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2022-03-23 at 22:17 +0000, capricorn cap via samba-technical
wrote:
> Hi!
> 
> 
> 
> We have plane to upgrade but it will take some time and we have to
> fix this Samba quickly.

In that case, can you describe what changed to break it?

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


