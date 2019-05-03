Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2817E1289A
	for <lists+samba-technical@lfdr.de>; Fri,  3 May 2019 09:19:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=cL3njbjsqn0wQ4JvI64DSZC9RNVURL3e3pmkie7u8o4=; b=Z+w4w0vMAt470QEcY8OoSaoc+L
	RXTThHEBAapth++NFO+5+qJWWnZEwAwPp/s19Zvby/CYFjASfTp9UI9VxiLPyzIJdIY/V+FK0S6HU
	t8MONMR1vG0wQZBy0aN7s0A4U67oKt9fJYz6YOvBsMMKKOHm4xWHIWS2Y2kJl+jYBNvebMh1YkWqy
	lo9spjjfPB+AR4hqXiIHFsTEvyyfmu/ndemxx6AVHUe9m9HXZHfcnvIy9Ly3xADkUUxDGhoslTLgW
	al1jVluvDEWlofcp4Zfx9y2Vck6Xq4T/MMXro+P/ae7InAK5gTGC3BPJjDXqfDnU6uhKyGf4ckxRr
	XxL6KjlQ==;
Received: from localhost ([::1]:23020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMSTC-002BLp-Ln; Fri, 03 May 2019 07:18:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:42458) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMST7-002BLi-Bx
 for samba-technical@lists.samba.org; Fri, 03 May 2019 07:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=cL3njbjsqn0wQ4JvI64DSZC9RNVURL3e3pmkie7u8o4=; b=RRX3fV3sOccZ0o6mfhfTQ2GGHB
 dZ1ft+QUn321VbIZfUS5F3SOl4ymtzNBYHuJkAcpNHIzxJPsbm4uvKSBriTWkovAZGTYT/5bNrzb1
 b2RvuXMVIV63B08ljm95bjuYA90PgX7J94wYeYJS5aZDXc4RAsrLrvhMLPwI0USX+YFQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMST4-0006gV-PZ; Fri, 03 May 2019 07:18:51 +0000
Message-ID: <1556867924.2951.44.camel@samba.org>
Subject: Re: [PROPOSAL] Release ldb with Samba on the 6-montly release cycle
To: Alexander Bokovoy <ab@samba.org>
Date: Fri, 03 May 2019 19:18:44 +1200
In-Reply-To: <20190503065538.GA5460@onega.vda.li>
References: <1554694013.25595.6.camel@samba.org>
 <1554971819.4812.88.camel@samba.org>
 <3375324.H8Nz3ShdPD@magrathea.fritz.box>
 <1555011274.4812.106.camel@samba.org>
 <c06c2c6c113c64ddbd4974c8ca14355e94bd044a.camel@samba.org>
 <1556509193.25595.71.camel@samba.org>
 <b04df37b39526bedddcb95992542026836835038.camel@samba.org>
 <1556822561.2951.25.camel@samba.org> <20190503065538.GA5460@onega.vda.li>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: Simo <simo@samba.org>, Andreas Schneider <asn@samba.org>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2019-05-03 at 09:55 +0300, Alexander Bokovoy wrote:
> 
> Basically, my personal opinion is that this situation is pushing more
> unjustified work into hands of our downstream consumers (vendors).
> I'm
> not talking about it on behalf of my employer, it is purely my own
> opinion, but I can see this an additional overhead for some.

So, perhaps this is a useful approach.  

First, stop tagging ldb versions in master. 

Second, merge MR 374 (which leaves the ability to produce tarballs, and
tests this in autobuild, but aligns the version numbers)

https://gitlab.com/samba-team/samba/merge_requests/374

Third, stop producing ldb tarballs in the release process.

I'm not convinced such downstream consumers that have the needs you
indicate above exist, but you suggest they do and I'm not sure we have
a good way to tell.   So perhaps they do and are forced into such
burdens, then I'm sure they will ask and we will know for sure. 

In that case either they can either run 'make dist' themselves or we
can, knowing they really exist.

How does that sound?

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




