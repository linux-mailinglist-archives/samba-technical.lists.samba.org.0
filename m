Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA8423F4F0
	for <lists+samba-technical@lfdr.de>; Sat,  8 Aug 2020 00:42:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=43KSO5R5nYEeks8P5HVQEIS5gdDhvwNE6UQ/jlcFVrc=; b=4gYV37PK0FugRusBKdeeUoEAqM
	Z/7ohv5s4S/o3+/bvIQeDTOviNIo+dI35hMDQPyUh+G5Gy3YB1xnAjMlE5Apxe14MzwIUFV9gMbTM
	xmPxVpsu0Pp2z2lNzDvFiriDvhhVwL9+wiJTSgINv2OC4FqOJd6srUanI8OBrVryiXX0fURQf5qMX
	ebJBaPx5RqELUdbo3Gprw8MW7b+FRQrzMIo1OSv3IxDLWzQOSB+5zKhqwQCysZWzRvlLzqK1j8U+P
	k2n1aLlXGYGcvBWW+RZmMq9UqnrvJpYFZLeIxzZUzL+1JYBsgMHqp7vwMsp7IM2vFI7Tduz08XsYk
	4uG5KJVg==;
Received: from localhost ([::1]:42520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k4B4d-00CrqK-85; Fri, 07 Aug 2020 22:42:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36518) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4B4X-00CrqD-7V
 for samba-technical@lists.samba.org; Fri, 07 Aug 2020 22:42:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=43KSO5R5nYEeks8P5HVQEIS5gdDhvwNE6UQ/jlcFVrc=; b=ztb+/JmlGnba7/5JABgQmRxo/s
 knDEAA8phNcp7/AIDHA/u2TV4MGnt5Ub5N2bXDzS7f38RMXL9ncSvSqOhkQk0zN8OqCRCbLu0/Hak
 vf/6h2lCGdWBsRL5MwCIECNp0+owohF1GSEqQLJM/CVVSIdAv1cQhnEX0iH7+Fi/SWSgTw20acHYY
 MfpfZpOiSsiSL5uqUqAK7TU3Ynmh5nQZRD24ukAqkmJjF2u+QD+UVuFbDrXZNOkC5Ax6c1+YjkyIl
 JL2+9ImbRPHMNBnbUZQJ0UrPxBTdImoiqmjys+d0AwjcJpK1VuvTdP8bzywDYL0sN0BsV9CyQGSCi
 ap8vrmkzNhLY4ZJzI/I8wHmlg0pA9aK1N2IC6GdMplcFjqSFvCv+aD0XPpc1W/ujBXH+ICZuCXjsb
 i1xDFTZirE7VCLCNZt33cXjuWT0B/SiBVy2z7KWnFN01X65x3htlwCxiRb1cdBvPMrXkP7Pm62fo6
 1x9bVBD+tgFhOrin0YZ/wYyu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4B4V-0000Lp-TG; Fri, 07 Aug 2020 22:42:44 +0000
Message-ID: <b9b6de10f01ad24305ade2a88f3581acec937f8b.camel@samba.org>
Subject: Re: Deprecate SMBv1 options and NT4-like domains for Samba 4.13?
To: Jeremy Allison <jra@samba.org>
Date: Sat, 08 Aug 2020 10:42:38 +1200
In-Reply-To: <20200729190254.GA10865@jeremy-acer>
References: <efd53968d989fa5b909d5b23df58b171410970db.camel@samba.org>
 <20200729190254.GA10865@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-07-29 at 12:02 -0700, Jeremy Allison via samba-technical
wrote:
> On Wed, Jul 01, 2020 at 03:19:19PM +1200, Andrew Bartlett via samba-
> technical wrote:

> > So I present to you this MR:
> > 
> > https://gitlab.com/samba-team/samba/-/merge_requests/1398

> > Parameter
> > Name                     Description                Default
> > --------------                     -----------                -----
> > -
> > domain logons                      Deprecated                 no
> > raw NTLMv2 auth                    Deprecated                 no
> > client plaintext auth              Deprecated                 no
> > client NTLMv2 auth                 Deprecated                 yes
> > client lanman auth                 Deprecated                 no
> > client use spnego                  Deprecated                 yes
> > 
> > If I get time I also hope to fold the only-used-by-attackers LMv2
> > into
> > "raw NTLMv2 auth", so we can remove both in 4.14.
> 
> Sorry for the delay, just catching up on old stuff
> in my inbox :-).
> 
> That looks good to me ! It's really good to start
> marking obsolete stuff as, well, obsolete :-).
> 
> Anyone else got comments ?

Can I get some further consensus here?  I would really like to merge my
branch once I add the last required test, but I don't want to blindside
anyone.

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




