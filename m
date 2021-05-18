Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED58E387549
	for <lists+samba-technical@lfdr.de>; Tue, 18 May 2021 11:37:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Cgeicxm5o+uD8sokadMBfVwJ/Hr+5NcN+AwoO158dpE=; b=nAb5NKkl3SIlU8CITszEeJGOaP
	xvmZp9j2gZ8A112vRtiLzm4OJ269OPYXn5BJLcIlsAUmNrXr5aKgAIeNnEnjadlYycPGNOZ5w30qH
	paj99Fps3YSGTUj4ygClqcD59Qssl0i2ddPlRKE/8dq3IURocDS3cQ+61A2dW17g7WM2IsqlL4qmk
	0R3J9uFWCXoJz+bMD0IOWcnCniaR9laNAcdB/1wcryjdKPz9Xm+Kfeg6rY0hJ0n8iNFwP0NcBwxJW
	CVvui2x7OL/oq8KcFa2rGLYRIO64t5qBvmtwqUSnUqYlDb7NQ1P2ONDwTCaeIMLXjJMtjkXoAxb/2
	qVT/BB4w==;
Received: from ip6-localhost ([::1]:56652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1liw9W-001CbC-Hg; Tue, 18 May 2021 09:36:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12094) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1liw9R-001Cb3-OH
 for samba-technical@lists.samba.org; Tue, 18 May 2021 09:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Cgeicxm5o+uD8sokadMBfVwJ/Hr+5NcN+AwoO158dpE=; b=38zI0tUky0m0tG+RG/L6IP+5xb
 N2JnR+rbDANTCJhDT6l6vwBuhH9yRRGMsv2HmJ1VJ4RQdNt9hZ40RMYER5b+THPjuamUm2CkOPux0
 8k9NG+e6Oh26bnNc24oSr2RPhUr48GSGDYqX9JGHMLTRb1cvhMLo6Azs61M9gDzvYfagg6izRWbic
 6CHKGjnPCTmoYwIBKNWEy/xaqRCXc85RZjkCMJOw7CG7BI4mfj6ZY38/foifGgWVvSc+tVRh5TGLo
 W0xdh7Ctozc2AKpzGIRU31VBtwrxfkqMuKX8IDbqj7NKofJt7EcGbAq3Qwvjh+WqM1B7okXq5jSp1
 HrBrKKmtcrg7Or9uFrb2otUuwZX5eLhe2qvj3XZ+UQOUpH4o1fgKQ03cMecWDSKhaKQWZQ43PIm0n
 M0qme7pKkNkp2rgTsUVnQz8a8yDKBxD7VGwB5+XizKRJcpQfnjK5L0T1nT0T46bkC0pho7FV3R7dK
 eKlHhwNW2pv/qByeBzhOuXZu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1liw9Q-0001ct-LF; Tue, 18 May 2021 09:36:32 +0000
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Offline logon flapping in autobuild?
Date: Tue, 18 May 2021 11:36:31 +0200
Message-ID: <2444523.AYHQVFttfo@magrathea>
In-Reply-To: <97407ae87bceb340ed01e5a60f0417810d8ec3f6.camel@samba.org>
References: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
 <1949061.8nGXxLBRy0@magrathea>
 <97407ae87bceb340ed01e5a60f0417810d8ec3f6.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 17 May 2021 21:01:14 CEST Andrew Bartlett wrote:
> On Mon, 2021-05-17 at 10:38 +0200, Andreas Schneider wrote:
> > On Thursday, 13 May 2021 10:17:48 CEST Andrew Bartlett wrote:
> > > My most recent autobuild, with (I hope) unrelated changes, fails
> > > with:
> > > 
> > > [141(1068)/143 at 6m5s]
> > > samba.blackbox.offline_logon(ad_member_offline_logon)
> > > ERROR:
> > > Testsuite[samba.blackbox.offline_logon(ad_member_offline_logon)]
> > > REASON: unable to set up environment ad_member_offline_logon -
> > > exiting
> > > could not obtain winbind interface details:
> > > WBC_ERR_WINBIND_NOT_AVAILABLE
> > > could not obtain winbind domain name!
> > > failed to call wbcPingDc: WBC_ERR_WINBIND_NOT_AVAILABLE
> 
> I got the same failure again re-pushing today.
> 
> > It doesn't really have to do something with the offline logon.
> > winbindd did
> > not start and was failing, the error why it didn't start would be
> > the
> > interesing one. However for this we need the logs
> 
> I tried a --nocleanup build on sn-devel-184 for samba-admem-mit but
> this passed this time, so I'm trying another with all the jobs.

I had similar issues with other tests like idmap when running locally. I 
didn't have time to look into it when I discovered it. Checking now ...


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



