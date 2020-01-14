Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB8F13B42E
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 22:21:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=y5JHAsl5VsyZUAPe8sBroUPsLoqmylEH1skKQfyBvDw=; b=zCF/NQxHrSKdF5D8sp4fnKrgye
	4iPGA+5C31lPJNk8ro9yRqTc1Ke5lanMUnMdUU3DvI/uNAU00Iq4KvhLYXemuotakD6k+LtFw7GNb
	q8gSmjM87LdxNWqsGu76/4RC20mJi3bkl5Q26HSVyhicGX7rlt0AuzlpaXR3UV1RaErlElOzlxZUc
	mwz6vLD4eAP2yq7Hd+45Mpm03ziIhxjRtHEw6V2U6QiWMKpQFBaCYIHsSGxCB3kJE5b+HDe+kpTuK
	QvfPh82w5YL8IIYZ7uDHqtCxt6A7LtHxvjYxa5/nVv2Vtl5fkTqiGJupXzXenoCruZASjNEmJ5jvW
	ZVnniGeQ==;
Received: from localhost ([::1]:61444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irTcX-003RBW-C4; Tue, 14 Jan 2020 21:21:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53782) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irTcQ-003RBK-Hp; Tue, 14 Jan 2020 21:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=y5JHAsl5VsyZUAPe8sBroUPsLoqmylEH1skKQfyBvDw=; b=jhXy7DPcxijw7xUIDBEmVflpd3
 huDfhADcvmku2MbzvqagVRCZSxPCIvcsjQFQLeoTj+o1Sy/0hmhgoDmnX4lEt973Xld9zhMksZ3WA
 CWnJ8zV1vu2I0M5g6aRy8dily4Ee95g7+9mKJOy5dDgvSs07s46mONxZlrs9hl3lotBzPvYVh2Yyd
 mhGkT4WuLKiIX27U+2lL1UYJDtDtJ3V1E6OvsIy6IpGKfS0O7vbDb9IuUfFZ+Egv30ZL1tD5LcShN
 dBoXa3qmmqmWBJWXmaSdlChMI+UQ6vhW51shoqhQt+oJfYK7UGglfOxozLRR2VQulD9SH1VQCOlxC
 fUi6dPdMQJIlHApSMwZMiOxWe+t4bFyISvzJsudJtiQk7pyPaY+CYJkpFyGNmIqxFxnk88BH/q4RF
 a90cMayF1e1PbvxaTTq7Jw7iI3Y1D0IiOohMLR4bnyMXFcnbnprPBn2vanTbfh5+LUOG+1wFseERs
 j99h/PkeXvjCtA6Dp960PbNY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irTcP-0006ZU-9z; Tue, 14 Jan 2020 21:20:58 +0000
Message-ID: <522f151ee69bccc69cd7d609e1d34b70fc5de9b3.camel@samba.org>
Subject: Re: Samba at linux.conf.au 2020:  Why are we still in the 1980s for
 authentication?
To: Jeremy Allison <jra@samba.org>
Date: Wed, 15 Jan 2020 07:20:54 +1000
In-Reply-To: <20200114203458.GA217935@jra4>
References: <6467e06e362311231f9bf51490f1439c9f0b5ebb.camel@samba.org>
 <20200114203458.GA217935@jra4>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
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
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-01-14 at 12:34 -0800, Jeremy Allison wrote:
> On Tue, Jan 14, 2020 at 08:56:27PM +1000, Andrew Bartlett via samba-technical wrote:
> > My presentation video at linux.conf.au is now available:
> > 
> > https://www.youtube.com/watch?v=D5hl0fqA0Bc
> > 
> > https://sysadmin.miniconf.org/presentations20.html#140
> > 
> > https://sysadmin.miniconf.org/2020/lca2020-andrew_bartlett-samba_2020_why_are_we_still_in_the_1980s_for_auth.pdf
> > 
> > https://twitter.com/NextDayVideo/status/1216938358779203584
> 
> Great talk Andrew ! Congratulations, and well done !
> 
Thanks Jeremy!

BTW, for those in the Samba community at linux.conf.au please so find
me for a chat.  I love talking to Samba users in person.  I brought a
weeks's supply of Red Catalyst and blue 'Canberra' Hawaiian shirts so I
should be easy to find.

Finally, I did finish that talk with a plug for the Software Freedom
Conservancy.  If you can support the organisation that provides Samba a
solid legal home, then please join me in doing so: 
https://sfconservancy.org/supporter/

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



