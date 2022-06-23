Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E355736A
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jun 2022 09:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=CGlsODOMgOcfnv4vCIGwDYr+qWmDXTQQ+1Rwy5ehiRA=; b=UsOPaia49ASj9jdf7LAH9qvuNw
	lL4X67AI1MKpHXIwBpOP6IWdXm7T7ZDKl7tskbgaHL0bHojJYuLKVetA91PXDrOa2fgHufn6tO1ZL
	As6bNlbK+a7QGam9W4dP2bc2Np7Rb8JGfndvhWwF1GWrNwgJvcIy+1ka+zcp1awh7ikP2gtl096Bf
	wRwiuhLos0UF89BlpDcu4SqE34x5o5oG4Wo/5jeaaLRWaXfhh1pk6KK5W+H/Weihrjn6ij+SJCcun
	Z3ny8OakX3t60JqqujUgSO0xFMxlwQ77khVdJTDE5aXBZrep1+EyU/FGDCz4ZOjXOqsZVneWmXEiD
	iBm6cSIw==;
Received: from ip6-localhost ([::1]:22492 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o4GoU-00CILq-Ue; Thu, 23 Jun 2022 06:59:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20480) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o4GoB-00CILh-3k
 for samba-technical@lists.samba.org; Thu, 23 Jun 2022 06:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=CGlsODOMgOcfnv4vCIGwDYr+qWmDXTQQ+1Rwy5ehiRA=; b=jNsdOiZKF2plNAmAVRuMjh/5Z6
 hLMxhWbblAGZYkmdBT5mS0idIehdEvzm06xk6rkX09ee484/TfuZYAcBTBwYqjypqIACcfZfOya9a
 HTb+jVOOD5Zv8x/1RCJD96yJFlX94+XtmB8XVPvIuqx2X3afElNXQCW4CWlmXMt8loLpU3J7GTxyb
 tRrFejWiZicAukcK/WISuk+TXkjNs7skkoXC0hk/La52nFW7UmU7UT2Z41aGYkXOjnP1xXkZbmoOu
 Q0km9/pka5hFT7KzTrj3rfsM6Xt3HGpz6URlCBe/2s4B1MFDGh2XOL8xXso6BekAEtRnRweO6JoEn
 lSywREb78VwTH/JGfpmSNH+x8l3fMUMf8y6GMbgSMLv8eKmVr9Z3V3J+VcbiWRTSh+e88mCQexN0C
 mC0c+tAR2pjFQv6UO9OLWrpqx09aVNgplCLgmUhzbNhQbUu9wAoYOqibdKGP5Emyt+GE+/PCE8Rzj
 +KIRTeEOaqHhKH3SjjSqxwfr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1o4Go0-001E5A-OZ; Thu, 23 Jun 2022 06:59:09 +0000
Message-ID: <9175231eefdb5340a351f83aba7ba151ce47ae1d.camel@samba.org>
Subject: Re: [SCM] Samba Shared Repository - branch master updated
To: samba-technical@lists.samba.org
Date: Thu, 23 Jun 2022 18:59:02 +1200
In-Reply-To: <5fa9ff82-5d33-bd90-fbb3-9ca81684defc@miami.edu>
References: <E1o43SU-00CrjB-5H@hrx0.samba.org>
 <5fa9ff82-5d33-bd90-fbb3-9ca81684defc@miami.edu>
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

Thanks so much, I'll fix that.  Are you happy for me to put your name
and e-mail in the commit message?

(or I can do just name, or link to this in the archives)

Thanks,

Andrew

On Wed, 2022-06-22 at 16:53 +0000, Brown, James William wrote:
> The delete should be "rm -f build/DTD/samba.build.pathconfig" to
> match 
> other uses.
> 
> On 6/22/2022 12:44 PM, Andreas Schneider wrote:
> > diff --git a/docs-xml/Makefile b/docs-xml/Makefile
> > index c614097f6c0..ae50b14d79a 100644
> > --- a/docs-xml/Makefile
> > +++ b/docs-xml/Makefile
> > @@ -17,7 +17,7 @@ DBLATEX_OPTIONS = -p xslt/latex.xsl -i xslt/latex
> > 
> >   DATETIME := $(shell date +%Y%m%d%H%M%S)
> > 
> > -XSLTPROC_DEPS = build/catalog.xml build/DTD/samba.build.version
> > +XSLTPROC_DEPS = build/catalog.xml build/DTD/samba.build.version
> > build/DTD/samba.build.pathconfig
> > 
> >   ifeq ($(PROFILE), Y)
> >   XSLTPROC += --profile --load-trace --timing
> > @@ -57,6 +57,7 @@ clean::
> >          rm -f xslt/figures/*pdf
> >          rm -f $(SMBDOTCONFDOC)/parameters.*.xml
> >          rm -f build/catalog.xml
> > +       rm -f DTD/samba.build.pathconfig
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


