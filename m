Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EA1290E60
	for <lists+samba-technical@lfdr.de>; Sat, 17 Oct 2020 02:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+3ahFXej8BWkyB5mxy4axsOeWTqX/4jXDo046VY1Si0=; b=ths+fOhxyXmY7W+UQDFwFsyVyu
	C41ywak+q07qoLvUg3sLfkykJsVX7OwAmAmmKZPLCj/DNv9cfJUojZKxB+MfbPkpsZQmzP6hhXSta
	mItT8ssfxazTswfBx/oRkVoc4Z4o3x1oNhb66Jii1zQZrTleEJTNQCvkzxg+0cAyX6ePXu/DP9eGI
	2QDnQsAzl8vomRXlfC0ifwEcBPDQ5aoPzfjc1ybPrLldIc6C0wV5Qt+6SZjFHGs826UexLHueq2tb
	6Z0SCtq1V2PRXgafdxS4T5zcQ0KZ+Ek24vAKdEY20ZIjhShWLCteDUG1JQXfrJSdMEzunxr51CEt6
	DUyMb0bQ==;
Received: from ip6-localhost ([::1]:23690 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTaKS-00CTlx-PV; Sat, 17 Oct 2020 00:44:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62016) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTaKM-00CTlp-Fl
 for samba-technical@lists.samba.org; Sat, 17 Oct 2020 00:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=+3ahFXej8BWkyB5mxy4axsOeWTqX/4jXDo046VY1Si0=; b=O7zhoBKTB8xFnhUJzQGGtCRLOt
 hRV5DoKUwBwJjqDXBC+KpT63tvmhWmSPnekizbrf4cEYYTQ8aqIcoHcokO8LwgKsIUuzAV7Ps8vZu
 hpmhZjc41ewbrJ8+5G67ZomURnpJBABM+5kIvoXx7M5p2B6/8vsfwp39cAAz7g40TAapn963Jo135
 wY26jlmw+8ALKsI39lJDaIvciqZxM/stRFoRJRocHyFRvtR6U1Pq441+J0r5/z1AdgLm+h5akY+ho
 RmW07caeS4EsH8PlcceJzi/8Ct3NcRaJrHN1OXnex0i6vnDwSiPvU8ug+VDbOaxmgRDpGO04gZiNL
 0pkv3EvYIVxGjYtQmZeeXX40+ZEaa0eo3IQrWvVU+UPfalz4nzQYRznU8Asx+HX1MPW64klKTE632
 W060HjdDFEItEyIkHmhFGiBvcfczFpYePUJ8fW540krQpXGH1ZwfD+UEWdipFqLwuc4FLz2a/DXjx
 QqHi1ny28FkusVYICnN3JmE9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTaKG-0007gc-O7; Sat, 17 Oct 2020 00:44:01 +0000
Date: Fri, 16 Oct 2020 17:43:57 -0700
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Clarification around the DCO
Message-ID: <20201017004357.GA360279@jeremy-acer>
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
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
Cc: Greg Kroah-Hartman <greg@kroah.com>, Mike Dolan <mike.dolan@gmail.com>,
 samba-technical@lists.samba.org, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 16, 2020 at 04:59:20PM -0700, James Bottomley via samba-technical wrote:
> I noticed the thread you had about Renaming the Samba DCO:
> 
> https://marc.info/?t=160278497300001
> 
> The kernel developers have spent nearly two decades trying to develop
> and refine the DCO process so that any inbound=outbound project can use
> it in place of a more formal signed contributor agreement.  When you
> introduce a novel legal concept like this, the key to getting it to
> work is to have broad unanimity about what you're doing and why ... in
> the case of the DCO this is what the DCO actually says and what Signed-
> off-by: means.  To that end we've invested a lot of effort in trying to
> prevent DCO fragmentation, which is why the licence of the current DCO
> says
> 
>    Everyone is permitted to copy and distribute verbatim copies of this
>    license document, but changing it is not allowed.
> 
> Firstly, in the above thread there was some confusion about who could
> use the name DCO with a lot of other projects being cited.  Every other
> project you referred to is an unmodified DCO user and thus is fully
> entitled to use the name DCO as well ... we encourage this unmodified
> reuse to keep a unitary DCO ecosystem and spread its utility to other
> projects.  However, since Samba modified the DCO, you don't fall into
> this category.
> 
> Secondly, Bradley dug up an older version of the DCO which had this
> licence

Yes, that was the version I originally based ours on.
I thought it was a really good idea :-). I called it
our "DCO" as I just assumed that's what such things
were called.

>    The Developer's Certificate of Origin 1.0 is licensed under a
>    Creative Commons Attribution-ShareAlike 2.5 License. If you modify
>    you must use a name or title distinguishable from "Developer's
>    Certificate of Origin" or "DCO" or any confusingly similar name.

Yeah, I didn't notice that bit :-).

> So if you want to keep your modified version you may, provided you
> endeavor to respect that condition of not having a similar name.

I was a little concerned about the effect that changing
our text might have on people/companies who have already
sent in our text.

I don't want to have to get re-submissions from everyone,
as I hope you can understand.

We provisionally came up with a name of "Samba Developer's Declaration"
which would seem to satify the "different name" criteria.

> We'd also be very interested in bringing Samba back into the
> fold of projects using unmodified DCOs.  We now have 17 years of
> operating experience and for every other modification request (and
> there have been many) we've always found a way to add the needed
> clarity to the licence of the file instead of the DCO, so we really
> think we could help you make this work for Samba as well.  It would be
> really great if we could work together to do this because Samba is the
> last outlier using a modified DCO and with it brought inside the fold
> we'd have a unified front against the various CA/CLA abuses
> corporations try from time to time.

I'm not averse to moving to your "standard" DCO, so
long as it doesn't mean chasing down everyone to
re-submit :-).

Otherwise, renaming ours to "Samba Developer's Declaration"
might seem to work also (with proper (C) attribution
added of course).

Cheers,

Jeremy.

