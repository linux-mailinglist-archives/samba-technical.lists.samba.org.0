Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BADF23250A
	for <lists+samba-technical@lfdr.de>; Wed, 29 Jul 2020 21:04:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/Z/Ko8tCmAAfLKTWSy4iMI85TVzF5RLBRfmPjWEDqL0=; b=lf4UfmKxkQiuuS5KHvP8cr5DIh
	0mWzPtgec6e1CbfrM7uc33y6Vd2qg5EoWrMb3+gOU6yhPaLKOPXoFvFjS2oAiJs7dU3pXaYbly+aZ
	TQHvsu1PY6Sj2KRRkltxcdiQwMRk7EvrFDlE+e8eLQOCl4uHczVcmfJhHcEQqrvvOn6wp49sFP6eD
	KEeR6w4Y283278Nq1xUPxjzqtGRwNrlIM/CjexRI361YjzYX4wn5QB/BZSBPhqklcQ6vr93AJvEmq
	etuqXDvh/6y0d61O8nUzIWkMuTjqKmHC5XLE39HzBFacB/2u8q2IMc0NqeXWr/+NdJCdbdgvEg5D+
	BSoaJ4Rg==;
Received: from localhost ([::1]:36842 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k0rM4-00AFNh-Px; Wed, 29 Jul 2020 19:03:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k0rLy-00AFNa-Em
 for samba-technical@lists.samba.org; Wed, 29 Jul 2020 19:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=/Z/Ko8tCmAAfLKTWSy4iMI85TVzF5RLBRfmPjWEDqL0=; b=YlRyqcEr4LWTN0ytS0U0LoxDN4
 CtWJZ/D6IfpMSttI5JNmrenFhf2PGJ50Gm7Au8tWSWeY4NtllGNLW+dkcv7VVXw1bgRqcohMbrzAn
 6U2IiTu0tZ2umA46UU6yluzBytsWXh+R5gTpNLAyRGwySGOfi4459rjKCLsTEZUuoxl4ObLHgiJtx
 c/NBLNTAx6jAUiLMEGajwtPaI5GyarMddOvKN99/f2KAlrepcZFM7wUty5kGeuIvnfqd/CgV18MyD
 A0fklEghCgtNe1zM3GNCzPmJJI2nBbWYqbYDvBMMK9g6QnL5tGDivY0SOx8N2onFRzQ3RfAecjgA6
 g2blOVKsemYm9Dfd0BShhymJwLSgUc+DcI0HMX2tOvIr8yn3A7AG2InSD+HA5xJucQ8VoqJrsnjTE
 HXN5gf545kMaeyEbVUfua4ESNibtF8I0skTcJ3evIQ2JvOfbnLQaSljM3ZofIpdONVy5OCVo0pb9S
 vzNwVR7dUCDbbMrrAKpyyfhV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k0rLx-00039x-2h; Wed, 29 Jul 2020 19:03:01 +0000
Date: Wed, 29 Jul 2020 12:02:54 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Deprecate SMBv1 options and NT4-like domains for Samba 4.13?
Message-ID: <20200729190254.GA10865@jeremy-acer>
References: <efd53968d989fa5b909d5b23df58b171410970db.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efd53968d989fa5b909d5b23df58b171410970db.camel@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jul 01, 2020 at 03:19:19PM +1200, Andrew Bartlett via samba-technical wrote:
> Samba 4.13 freezes soon, so I wanted to again propose adding things to
> the deprecated list.
> 
> Yes, we add things to this list far faster then we remove the options,
> but the job for anyone wishing to remove features starts with this
> point, marking and announcing to our users that we are not going to
> keep every Samba option and feature forever.
> 
> So I present to you this MR:
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/1398
> 
> No code is removed of course, and of course we are not going to remove
> code that FreeIPA needs, but even in between all that I think this is
> worth doing.
> 
> (pdb_ldap is not impacted, I've dropped those references compared to my
> earlier MR)
> 
> Parameter Name                     Description                Default
> --------------                     -----------                ------
> domain logons                      Deprecated                 no
> raw NTLMv2 auth                    Deprecated                 no
> client plaintext auth              Deprecated                 no
> client NTLMv2 auth                 Deprecated                 yes
> client lanman auth                 Deprecated                 no
> client use spnego                  Deprecated                 yes
> 
> If I get time I also hope to fold the only-used-by-attackers LMv2 into
> "raw NTLMv2 auth", so we can remove both in 4.14.

Sorry for the delay, just catching up on old stuff
in my inbox :-).

That looks good to me ! It's really good to start
marking obsolete stuff as, well, obsolete :-).

Anyone else got comments ?

