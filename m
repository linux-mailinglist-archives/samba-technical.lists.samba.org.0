Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD8949C251
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jan 2022 04:51:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=sLXVAjHF9kwYQNrKBgeYr1g/ZmuPUxAIJNo6bjiOauc=; b=tuZF5yMMU6DiA+a8/hQeFAWqoS
	XpmYx3xapotB48BeZA+y48ujjufLgDcliggPzbMg3Cu9n1h3OQ4h+EoXAwFG260Lo18B1THMAIH/4
	PNMNk9kMh1fxouRi5oo7Ht48d/gTh5BuorQqh4QE8S74/C6tZWazNxaytU+klSkwDVaxOvG7ENOc1
	OzwZOxO5QlEXu/3rCyBDSLtVFJzGUsGA8Qfc6sVCWMlmAqbpFIWa+kgjd7LZYYNDHND5AACuIZGrp
	mEIOfSIpLic8qCOEicYkElBmdhERnZd2SBAQQ5bXBmbFVJCzc+ZuTER2uB5Vl235REnY9Xlgzas2K
	f6lxIUuA==;
Received: from ip6-localhost ([::1]:20132 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nCZKN-000oD0-Q3; Wed, 26 Jan 2022 03:50:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48340) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nCZKI-000oCm-M5; Wed, 26 Jan 2022 03:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=sLXVAjHF9kwYQNrKBgeYr1g/ZmuPUxAIJNo6bjiOauc=; b=0/Ghi8HajTlmWWHO8G1q/GNchT
 f/+rptn/WBoNnF+fGq9Hxm+LkizTsA2MhFhHqgL5V0oMfbkZ0d5wFGKRZLJQCTLIGp5V8/fI1actW
 eGtqU2ylPXS1Ijzel6yPVXjGsdR6Kg2/CTIOxfyENOOGbgYgGtsuCyG44tOVcOdCYDXcQsIh6GsTv
 264R+UrrLCgE04ykgvP2mVqi+lSPcAuzHi8KcwlgXB0gkPEFb1VW0hRPNkJabStKGq9eE0HkTUYpw
 w3ywjQnYoRRaL2xr8zrizU70A+RuIybHzSMTpi1f+9bitR+O6tmDW+sc+3a3/DCixp/QS+oX/VZ/V
 yoA87e4wXd6ocDM9tf6xBYvxKCfa71XOMpYWoGghh+6g0KaMmqWRbSjZmqmTHksvR7ZewyamepMEF
 JWuK3lO1XIHx5q9+Jn6nZ37t+UysSgkh2BZiOr3IwSbbcyuL1yKXUVy0Juw3p8meYfd6iCS4YhdpA
 iWw+bU+IzKMe7V4kQLcJV1TJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nCZKG-000cIc-Ew; Wed, 26 Jan 2022 03:50:29 +0000
Message-ID: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
Subject: Remove LanMan auth from the AD DC and possibly file server?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 26 Jan 2022 16:50:25 +1300
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
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I'm looking to add a mode to Samba without the NT Hash (for normal
users, NETLOGON is stuck using it for the secure channel).

In doing that I have to change the codepaths around password hash
storage, and it would be simpler if I could first remove lanman auth
(set and check) from the AD DC first.

It just makes no sense in 2022.

As a stretch goal, if I or someone else got bored/stuck-in-lockdown or
such, it might be great to be consistent to remove it from the whole
server codebase.  

The parameter 'lanman auth' has been deprecated for some time now.  

My feeling is that for the Win9X and OS/2 irrilplacable industrial
equipment case, that guest authentication would suffice, combined with
'force user' and 'hosts allow' for 'security'.

What do folks think?

This would be for Samba 4.17.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






