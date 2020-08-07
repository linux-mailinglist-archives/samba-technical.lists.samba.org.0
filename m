Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAA423F4E9
	for <lists+samba-technical@lfdr.de>; Sat,  8 Aug 2020 00:38:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=c/iqIGTWzaJuf0cwe9QPzttPlf2SWsx+O3BUgDFruGw=; b=zd2zXTw2pkicZ4czDU8RfklRdI
	oToJKhjoYOukelpOYniyY+gR9s7naZHvr9y1ZSY9xFxqhDivRj1Wq+Wi+zPiynqhgLo2LUw5L61Hg
	FMZzsxGXNPkaEQuF8mgbWX47qyzfK0RDg/2jBHkNpLCqgeO3W1JnbzKkLtkaU9JSYgGBRNnlEINVy
	Rqq0pQriIQreReP9nlQY9F0TdUMFdQdp1pYqJdBHwyldvldF4aVlxm77UnlczmSm3PcO0JbSIUV7R
	eyqoYUR1OK6wCzRQjUeExIPY16sm1wwKqrzBKhwVRl+nHdZsDNuvy6T/mE21BxBI1AY6HzpTpixRM
	XbbyzlNg==;
Received: from localhost ([::1]:41774 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k4B09-00Crk6-F5; Fri, 07 Aug 2020 22:38:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35426) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4Azw-00Crjz-LE
 for samba-technical@lists.samba.org; Fri, 07 Aug 2020 22:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=c/iqIGTWzaJuf0cwe9QPzttPlf2SWsx+O3BUgDFruGw=; b=MO+TrHcA2lWpeoMlTYmTKIdBIS
 unAPT+01jzmIOS11Kl++ELiS/ExOi48C95yXYZ4ZPso9+SLrohmJZBjiWv8LMQqaHpi0l5QOS+rAo
 JyvrG2egf0NnUgY/PZBPljWENal92c8XIRKcDhGTPKvSbxlj8DKy1Qhw0sIJFY8nnruSpcWiggeQM
 vJTR3On++xxScGt4Tx2QRNkfa7xMXej7wCF65Yo/gAkvgYl74Kb7uco/qis23elkFdONqw1ycX0Wv
 wEd3nA2uIHAVIY2Bb/7QsdCXKFl/sr64+mCu8VUzFiewgkzA4ZOoKAyn0aRKBSZUMc7zDT6BKPN0Q
 sDKgxHQuzo6Cnaqrh0y0V6Ekd3maZ+zLwUkrL46kXSmBs8O5tH8azTGiDwYTMB7grrhP2vANa5gxC
 o9LG1tr4cH+vTz0rrQrjlVFIa6w1DuGXD3DVn2pTAHDGBXwdkCTS8FY1WxC0F9+9H5pE4XurFUV7b
 50G7gWFBO8d/n1HAvTxsf0YN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4Azt-0000JD-9L; Fri, 07 Aug 2020 22:37:58 +0000
Message-ID: <ac3d0ab7625af4d2c434a8692b27eebb8a156e5e.camel@samba.org>
Subject: Re: The way to using s4u2self in winbindd
To: Stefan Metzmacher <metze@samba.org>, Samba Technical
 <samba-technical@lists.samba.org>
Date: Sat, 08 Aug 2020 10:37:48 +1200
In-Reply-To: <b643061e-177f-727a-542f-54ed3c1c358f@samba.org>
References: <b643061e-177f-727a-542f-54ed3c1c358f@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-08-07 at 14:17 +0200, Stefan Metzmacher via samba-
technical wrote:
> Hi,
> 
> This is an overview over the remaining tasks to make of of S4U2self
> in Samba's winbindd, which would work also via domain trusts.
> 
> Given the recent discussion regarding our LDAP libraries, I'd like to
> get some feedback regarding my roadmap. No promises that I'll work on
> these items in near future, but it would be good to get NACKs as
> early
> as possible.

Thanks for the roadmap.  This is a vision I can support and I
particularly support spelling out clearly a plan in advance.  

I still also have hopes to work on parts of that roadmap and if I get
the time I'll certainly let you know so we don't double up.

In particular I did mention I (Catalyst really) has a small amount of
time allocated for the testing parts, no more than a week full time
really.  My plan was to put that into some of the tests that manually
re-encode the outgoing packet in the krb5.kdc.canon.

But neither do I want to duplicate the work you already have in 

https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/master-krb5-testing

I know I've been working with you for ages, but I still don't have
confidence on how to approach collaborating on your WIP branches.  I
just get overwhelmed with a sea of (often reverted) patches with commit
messages that mean far more to you than me, and naturally missing the
Signed-off-by because they are unfinished. 

How, given this and the time constraints, can I/we usefully contribute?

It is better to just build on master a few more tests (eg add to
simple_tests) or can you give me a roadmap to your branch for some
small aspect that can be carved off and finished?  (And if so, any
guidelines on how to work with your commits)?

Thanks!

Andrew Bartlett 
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




