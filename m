Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 214A723F68A
	for <lists+samba-technical@lfdr.de>; Sat,  8 Aug 2020 07:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=yLEvZO1v1S2VqhuPTYa/k2Z6DtDBc9c0GDOoQRi7dgw=; b=jpe5ebrB6PViKJYaDSonit+/5h
	gqe1GonQTzdsIIqnrQr1iap55ItfcpDWwdjdHKfxfz/AJHtX7J90fS44DJCzdhJjXNrkUTtYHSqWV
	gQsa7tVtbwtaU1Ja+5xAA7BZnhvnuqHuV/l2Y+bpHoVyaszs/CK3sH6UzEQ/VOlKNI6+hVbpLbkpV
	GGSxrAgkF8QyT66d4vVp1BhxVctOfMUlblBFldbMRw3AI/aegK8IVMiJo5ByQ07+dSHdwklDcO/Gq
	GR27nKe4SDILzohqbZapDpx77/sfRqSAE17wLPgCuXOXjNnP6P2nVjZbo1ahwoIoBjiqKmJDfGLRi
	/8JXIPDw==;
Received: from localhost ([::1]:45064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k4HGu-00Ct6i-Rj; Sat, 08 Aug 2020 05:19:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15796) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4HGo-00Ct6b-Lg
 for samba-technical@lists.samba.org; Sat, 08 Aug 2020 05:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=yLEvZO1v1S2VqhuPTYa/k2Z6DtDBc9c0GDOoQRi7dgw=; b=XQVOdb9bswdjLlkxRRDuZy+DL7
 bYzTdsu95GOfnRohdyAabqz2GDEzLvqL99FYS6DQrUxg9G7WKt+yOH61p23AzG24Xno/+WXxu9/KQ
 N1iSvrSp3PonFQDhKWjnLMMZQ4yS9af9Z8Df+hLUuDdTcjDo0+kTe1yksScPYAoDkn5neYqwAGRPO
 3fxCNltZ8Qpbv1DcTYyb7nJuU6skN5GLaeQUbh71yyyFi54Kc3zYKGSUIP9EEtvBqIijWyPlzZjSZ
 HRfBvz916+V8ESZB1IWr2mzrPkhYJh3MDEup9zdcHbIgbyics0oaO80SASu5mAT0cdF1D9gxvEI7N
 5LNlSwZZ02mJA5e0F1XiFo0u+BbaxRjAAxTZHnjQSelABZHiU7+H4mQ/w62E53YTAlSKiyNtHnowm
 y0P4fTYuY+JEk8mzlLTiHXqGQDCdM/wJ8SO5zCRZcJEgaerY+f1m10o+zdoT6XLZhM1Znx2kXFgrt
 rGWwnSizJVrw84MZ5tJ7VqUm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4HGm-0002PW-CW; Sat, 08 Aug 2020 05:19:48 +0000
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
Subject: Re: Deprecate SMBv1 options and NT4-like domains for Samba 4.13?
Date: Sat, 08 Aug 2020 07:19:46 +0200
Message-ID: <11880659.O9o76ZdvQC@krikkit>
In-Reply-To: <b9b6de10f01ad24305ade2a88f3581acec937f8b.camel@samba.org>
References: <efd53968d989fa5b909d5b23df58b171410970db.camel@samba.org>
 <20200729190254.GA10865@jeremy-acer>
 <b9b6de10f01ad24305ade2a88f3581acec937f8b.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Saturday, 8 August 2020 00:42:38 CEST Andrew Bartlett via samba-technical 
wrote:
> On Wed, 2020-07-29 at 12:02 -0700, Jeremy Allison via samba-technical
> 
> wrote:
> > On Wed, Jul 01, 2020 at 03:19:19PM +1200, Andrew Bartlett via samba-
> > 
> > technical wrote:
> > > So I present to you this MR:
> > > 
> > > https://gitlab.com/samba-team/samba/-/merge_requests/1398
> > > 
> > > Parameter
> > > Name                     Description                Default
> > > --------------                     -----------                -----
> > > -
> > > domain logons                      Deprecated                 no
> > > raw NTLMv2 auth                    Deprecated                 no
> > > client plaintext auth              Deprecated                 no
> > > client NTLMv2 auth                 Deprecated                 yes
> > > client lanman auth                 Deprecated                 no
> > > client use spnego                  Deprecated                 yes
> > > 
> > > If I get time I also hope to fold the only-used-by-attackers LMv2
> > > into
> > > "raw NTLMv2 auth", so we can remove both in 4.14.
> > 
> > Sorry for the delay, just catching up on old stuff
> > in my inbox :-).
> > 
> > That looks good to me ! It's really good to start
> > marking obsolete stuff as, well, obsolete :-).
> > 
> > Anyone else got comments ?
> 
> Can I get some further consensus here?  I would really like to merge my
> branch once I add the last required test, but I don't want to blindside
> anyone.

I'm fine with deprecating them. But we can't remove them in 4.14. We need more 
time to communicate that in the Linux Enterprise world so that customers have 
time to find a solution to migrate too.


	Andreas



