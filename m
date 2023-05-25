Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C55710917
	for <lists+samba-technical@lfdr.de>; Thu, 25 May 2023 11:40:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=2eScKpZxoXDh3xxTRAiQLkkHyVvDSOCYqzTERqwCI/M=; b=0WmFNDvn5y9O/6WZUhs7OKk0b7
	rjkYaA6mcrFDZT9At65LINhYSU0b+dFINTwr+LphramJZMqQqDYY41fiTRBldFyEyLdYh2+0Hf1QK
	j8NrhLQ/QRhp4Who6s22IGXshqN8UXXC7lDyoUMsBUxxEjtgwVQmr2W+r1JbpIQ+22ubDYciZMBsH
	7vXddqr8o+5S3ZLKmRBlZ4dWC4keWs0wZzGAan1OCLlxt5W7939EnAj7LQTQzWKDRLQDbapVkYXt7
	pJ4e7Ko60+FGi54nOEi7kYH83mFLqSZF2A79xunS+pza5csCuXT31mecEna+BSv8BxL4x+Ufohi4k
	0qf0QWcA==;
Received: from ip6-localhost ([::1]:47612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q27R8-00C8Qk-Vo; Thu, 25 May 2023 09:39:11 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:40965) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q27R4-00C8Qb-DG
 for samba-technical@lists.samba.org; Thu, 25 May 2023 09:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sernet.de; 
 s=20210621-rsa;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2eScKpZxoXDh3xxTRAiQLkkHyVvDSOCYqzTERqwCI/M=; b=njka6TQCM8Syu4Uzn6ctWK/kVQ
 J+JRtKroCV9NPEh8jgkCW5/KNmgpB2e9IbVvAp9YufwAcpHulT39zFOwtAy7EAs5BbklxyhxnH60K
 zIq9QK0DUqB40c1S+oUJlOQbCfu4Xw5ma84iJUabzDpdrhNLBXyHBr5ARfOZJs/+5DszuQvTFNAot
 Q4kYYoaKtFwYyzvwClGUpwmlvN+/EHGY3UAX0CmoemqAp61VBsQdd+ZojUutyBmoG8RxttZqNj7oT
 kELNmk8JLHshrtVEOj7b6tE4PQZEbeprk7ICIPUnprRgPbYqj4CM+SrsQYP7vBx1HAACqJJMPMNsL
 OFPFloxw==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sernet.de; s=20210621-ed25519; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2eScKpZxoXDh3xxTRAiQLkkHyVvDSOCYqzTERqwCI/M=; b=GqBjzHDm9IjhH5AXW0rRGVt2qO
 cxkJNjtRxhAC0PWT/IQpvvFjR4Vx2pu5UK6J8c9UbX/0hlR31cqNVia67XBg==;
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 id 1q27R0-008LaW-EP; Thu, 25 May 2023 11:39:02 +0200
Received: by intern.sernet.de
 id 1q27R0-004gyJ-3c; Thu, 25 May 2023 11:39:02 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1q27Qy-0019If-G9; Thu, 25 May 2023 11:39:00 +0200
Date: Thu, 25 May 2023 11:39:00 +0200
To: Jeremy Allison <jra@samba.org>
Subject: Re: Displaying streams as xattrs
Message-ID: <20230525093900.GA261009@sernet.de>
Mail-Followup-To: Jeremy Allison <jra@samba.org>,
 Steve French <smfrench@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2023-05-22 at 09:21 -0700 Jeremy Allison via samba-technical sent off:
> On Mon, May 22, 2023 at 01:39:50AM -0500, Steve French wrote:
> > On Sun, May 21, 2023 at 11:33 PM ronnie sahlberg
> > <ronniesahlberg@gmail.com> wrote:
> > > 
> > > A problem  we have with xattrs today is that we use EAs and these are
> > > case insensitive.
> > > Even worse I think windows may also convert the names to uppercase :-(
> > > And there is no way to change it in the registry :-(
> > 
> > But for alternate data streams if we allowed them to be retrieved via xattrs,
> > would case sensitivity matter?  Alternate data streams IIRC are already
> > case preserving.   Presumably the more common case is for a Linux user
> > to read (or backup) an existing alternate data stream (which are usually
> > created by Windows so case sensitivity would not be relevant).
> 
> Warning Will Robinson ! Mixing ADS and xattrs on the client side is a receipe for
> confusion and disaster IMHO.
> 
> They really are different things. No good will come of trying to mix
> the two into one client namespace.
> 

just took a look at how the ntfs-3g module is handling this. It was an option
streams_interface=value, which allows "windows", which means that the
alternative data streams are accessable as-is like in Windows, with ":" being
the separator. This might be a nice option for cifsfs also. That option would
just be usable if no posix extensions are enabled of course.

Björn

