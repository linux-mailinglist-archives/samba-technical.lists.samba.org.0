Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E713F35CDB3
	for <lists+samba-technical@lfdr.de>; Mon, 12 Apr 2021 18:43:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Fgpd70G3/3AEu/zMKqdCLxmdd2tUJLS9LcCqAji3t3k=; b=p6HcuvGk/nn4j1njuWkDgSKu29
	Qi4V+krMhPKcHJjmEr7DccJYFJzy/j1LrFPXKDr8nRfgxa98uefDjCvRfmAwMso3YiIXp7nngaLl7
	DFA8w807yXS5Qn1xtXSj+DcYaARDgakuEPpmwr//wpYjQc9A2pOT421K45WOgmazV3wBhVNyo2WmW
	5Htr4ATkKtgesrX9WnFiLZGz1AdozUUl+Y8M3OBNIHgR1k2YEXy+jSjn3D7yPmFpTte+QRehJs2Jh
	lclA8fC36bhyCgt85QqL9C4npLF1ckfUYjwx1KxPRq4jwRfdzwzIwmZPJooAbRfMs+EydB7UW0Ucj
	9RXZadxg==;
Received: from ip6-localhost ([::1]:45524 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lVzdl-00B1dL-UB; Mon, 12 Apr 2021 16:42:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44678) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lVzdf-00B1dD-NU
 for samba-technical@lists.samba.org; Mon, 12 Apr 2021 16:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Fgpd70G3/3AEu/zMKqdCLxmdd2tUJLS9LcCqAji3t3k=; b=YtNq23XpFN0weaApU4pIQo86fU
 bP7GZQmskiag/bQvYrCEVwHB7gfxVbCxGsJMp8a7xs6KDJ03dRffsioY32Ya76aINfd3YailT0Q6u
 /SBph4zDSQZmhCKER5GHWZvqt40t0DXXqjrJyX31lAvrhevQejoiqfhfgPRs+FhHmE9ziXpl4lSzh
 fA7pb05TwofBNrh0NP7izDWNittGo3F1Ib/w4YuIkUCufVSGxNYbOn5XPr00Wl9THXBu9eS1Up4DM
 ncO+NY6M3D8n6rqFQEN/XG+cilEoSyCe2+o/SkD0G+jNUFBV1R89tCkNH+lWbYHWsTeY4S0KaZoaB
 DFL+VrWeXl6xY3q1fH4RB/FChCq5Xhle6Dp1M5sVNHgPDzuJUeihPg8oKrMeVS+6LHobpISskTJR6
 jK7sJgifl0wDBmcvGNU/d3AK9TFGgcI5NQZImJYmfKGOHAlc4BnGYgjpSoGXZ/AChbOdKyiyj6MAv
 vLrZsYpLMf9rMBs7Rzq7gWR8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lVzdc-0007Qy-Vu; Mon, 12 Apr 2021 16:42:13 +0000
Message-ID: <b27a75205c2aaa9be2ac0721733d3bc981f9e58c.camel@samba.org>
Subject: Re: Setting up QtCreator for Samba development
To: Igor Chudov <nir@basealt.ru>, Ralph Boehme <slow@samba.org>, 
 =?ISO-8859-1?Q?Aur=E9lien?= Aptel
 <aaptel@suse.com>, samba-technical@lists.samba.org
Date: Tue, 13 Apr 2021 04:42:04 +1200
In-Reply-To: <9ee40c71-dbf5-47b0-7220-c9a69ec8e07e@basealt.ru>
References: <502aedfa-7290-7e9b-11fe-06d2cfe59bb5@basealt.ru>
 <bc0db8d3-f6c5-103d-3193-9f687f94c434@samba.org> <874kgf4xku.fsf@suse.com>
 <732d6001-c29e-5df8-77a3-df8d8b46b4d2@samba.org>
 <16c88278e8ce9e8dd43eab767e633f5f4b0a221c.camel@samba.org>
 <9ee40c71-dbf5-47b0-7220-c9a69ec8e07e@basealt.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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

On Mon, 2021-04-12 at 14:54 +0400, Igor Chudov wrote:
> Hi,
> 
> Here is my .pro file for QtCreator (in attachment). I can share it
> via 
> Merge Request on GitLab.

Thanks.  

If we were to include it in Samba I think we would want to auto-
generate it from the build system, to keep it up to date and ensure it
matches the current system (otherwise things like the python version
are implicitly hard-coded).

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


