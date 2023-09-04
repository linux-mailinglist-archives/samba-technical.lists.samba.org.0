Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B7F791725
	for <lists+samba-technical@lfdr.de>; Mon,  4 Sep 2023 14:34:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=QLXDkBEi8J5ukx5jTRgGREn3XqImkVdH2yjFhj0g0Ko=; b=VVTTSgMUmeyI9wXQUsXL7flaJJ
	pFg0E2j0ozW+pVkbPKE4DsRyFssikXYyXE3g4BfmaTFs+1AXt7iLFMyH/atFY1ak5VpEhlAK4Q2sN
	dX7MzSWr3vI0iNnIHL0/Zalj9fjzcG01p5bxCYWlMW6UltV7l8zRBZhpC90bAdgAcRedwyHjRl3ct
	QPv6uNCS6FmquIeRl1XyY3Y9g8o9Y0pVnWQMDW0GcicZ8AIjdSNKtoovcQE3rR3W3hST691XcZrGm
	OHm7jCZBgTFReO7kGGD6H3fhKqOyGh4rNgyLrA1RbBT4JsVxCzg8IJuGtN0KwH0j53JY9Dr7IU++Y
	GQeAozOw==;
Received: from ip6-localhost ([::1]:24740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qd8lr-000L4c-Rl; Mon, 04 Sep 2023 12:33:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qd8li-000L4T-HD
 for samba-technical@lists.samba.org; Mon, 04 Sep 2023 12:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=QLXDkBEi8J5ukx5jTRgGREn3XqImkVdH2yjFhj0g0Ko=; b=qy2rIBE7T3AhD3AU1HrdXw8Yse
 1SZBhvOSO4PbreS5yF+Xg3cLNJBaHuIlLW4UA+pKRtabm2znraLf9II2LhS+/NeIULtoQagWoULqf
 l0jWQMagDLUmiYlSWPOPWcn6u+tgIQzQRTZKc02KiEh4Moe5JV2AB3FAJ+eaAMt34en9olDV/YgIJ
 s9Ymt/uL8XYMO3zolA5/SVSaNCbn6cMNUXxpWuS0WJ2chMsJVCXt0qp4NDH2KNK5wnMJauJtqrYOf
 F2Q/xm+1ozPHuvApSVXSYF89E3xYqV1RArvi7CK73o/tBOmgY1z98Drs0yaENaJHoWH9Q6h2XiG+C
 uRQYHgf5SQNPPBUDP+fgJcc1KbP/wU3plr/8M6L75D5w8baAVKNAdLQ0PgeznRDzBSl4K/QontVPj
 y23dFt5hCLL0OM25ye1G4nqj525rA5dlvL1EqXhXhc58rRHQljq8EGbrsEubr5FSJ1I0YvD6O2DV1
 jiTlunrcRXlMjtp4ZJSybkNQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qd8le-00BiCx-0O; Mon, 04 Sep 2023 12:33:24 +0000
To: samba-technical@lists.samba.org
Subject: Re: `allow trusted domains = no` and `Unix Users`
Date: Mon, 04 Sep 2023 14:33:21 +0200
Message-ID: <2308461.ElGaqSPkdT@magrathea>
In-Reply-To: <20230904103811.58a0c060@devstation.samdom.example.com>
References: <2306152.ElGaqSPkdT@magrathea>
 <20230904103811.58a0c060@devstation.samdom.example.com>
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
Cc: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 4 September 2023 11:38:11 CEST Rowland Penny via samba-technical 
wrote:
> On Mon, 04 Sep 2023 11:07:10 +0200
> Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
> 
> wrote:
> > Hello,
> > 
> > I have a user who set `allow trusted domains = no` in his smb.conf.
> > He also set `force user = localuser` on a share. However he is not
> > able to connect to the local share:
> > 
> > [2023/07/27 12:31:43.434346,  3, pid=1019460, effective(0, 0),
> > real(0, 0)] ../../source3/lib/util_names.c:84(is_allowed_domain)
> > 
> >   is_allowed_domain: Not trusted domain 'UNIX USER'
> > 
> > [2023/07/27 12:31:43.434350,  3, pid=1019460, effective(0, 0),
> > real(0, 0),
> > class=auth] ../../source3/auth/auth_util.c:492(create_local_token)
> > create_local_token: Authentication failed for user [cortexuser] from
> > firewalled domain [UNIX USER]
> > 
> > The change was introduced by df5fe2d835169161d3930acf1e9c750dd2bc64b6
> > 
> > Is it by intention that local unix users fall into the "trusted
> > domain" category or is this a bug?
> > 
> > 
> > Best regards
> > 
> > 	Andreas
> 
> Stop me if I am wrong, but doesn't 'allow trusted domains = no' mean
> that you only trust the domain that the computer is part of, so local
> users will not be part of that domain.

local users are not part of any domain as they are local to the machine. 
However you can map domain users to local users.

The allow trusted domains documentation says:

If it is set to no, then attempts to connect to a resource from a domain or       
workgroup other than the one which smbd is running in will fail, even if that 
domain is trusted by the remote server doing the authentication.
 
'Unix Users' is a special domain for local users and smbd is running in that 
domain too. It is a local domain.

> Also, as I understand it, if you are trying to connect to the share as
> a local user that the domain knows nothing about, you will be denied access,
> but if you connect to the share as a known user and 'force user =
> localuser' is in the share, then everything would end up belonging to
> 'localuser'

You do not connect as a local user, you do connect as a domain user however 
all share operations will happen under the user you specify with "focre user". 


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



