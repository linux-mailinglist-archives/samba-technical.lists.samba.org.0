Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D0A691876
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 07:20:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kga8PlcRDisciyRqHoCQoNBu+s/kJvfPl5WAaMR4SBc=; b=FvM98+/Mfts8LaxXZTxk9WhZ2t
	79qSeNZYk9wEmtz/PfsVJfrlD+Ge33G1aZPvRmzWt6lzM5p8s4/wFEVXD+xwMoIu4mhV1tfw9G53R
	osjdAWQoeTZic2cr5BEtNyND1M1rwqzxtz0ob0+5lg2L1DYLvb74HFfJQUwfhQppYPWcHQhzoZG2l
	Y+Kbww2e8+FmoD9ifDuRF8qD1hPhZggc7+55bvQ41buzhdAV3zjow+Qy00qsRWJ0A4ZEn/ljkFmyE
	iyLJRwaFOo5rJRpr0fz4K8NBUbZ2D7seAG13MJe8m1Now3Z2CbT6aIzjdEXuW/68VYP/0PzlxnSOG
	EIG66zvA==;
Received: from ip6-localhost ([::1]:20680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQMlR-00AeWO-Dt; Fri, 10 Feb 2023 06:20:05 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45663) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQMlL-00AeWF-0I
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 06:20:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id f6so5438419pln.12
 for <samba-technical@lists.samba.org>; Thu, 09 Feb 2023 22:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kga8PlcRDisciyRqHoCQoNBu+s/kJvfPl5WAaMR4SBc=;
 b=pmIdiQ7OrMv8cFCxYuTQKeyIxI8j04SEobb6FD43K6NQcqsXoS4EPLc/dH8GBnq/rM
 4sHI2wTBOUpXKSVAcl38Q0sFhG/exhHIP9L97XbgXI6Moql6YdzlTP/vRrYGt929wIbF
 VCTCqOKkhhuXVtEohIeZgqQbca+MgX+OLU6E0Zp/0/JinGuksZxYuyzniJPPt9BB2dSA
 LuXPXn6DW1VfEIQr8Wx9K1/rZNtN8I3HpdwRpNEi/JDiS0HDdwDpx2CritrttnASR7XO
 cX2PvY4tEPec68rIE+ba6y381Qjj3e2o4OB59Czi8Dm/l62rKq9uIhFC3VheZAsNRNla
 gByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kga8PlcRDisciyRqHoCQoNBu+s/kJvfPl5WAaMR4SBc=;
 b=uAIRBcjc1O9DWvGO3B9yy6Dn+lqoeqYmMLqDfzS+aZVi654ik8NnJReKeZ9ydBTijX
 FZgOwVsUO1259iBGKIT6hi7lVpfkpaXHSAR6tMc4uGPgFk/YXyaD9z3qD+lnEtQuCVNJ
 ykvSvpPYAA+2Mcz1T3GiyhmZBIvaKXsCpqIIh0iyoaXwLDUdTGLji4QWB0AFi5CC65RD
 qcVTur80lhICGVvjxGO3s5CMvEOdZzIVtNSHpY6+4mcFoCuX4OYXtDomHUomNg3i3lkQ
 K0AHSPCBSpi7iXJ9soRZbITXfwdn3WyLrANeH27f6kktpSq1wqghlPmXRCNdy9nxccr2
 f07Q==
X-Gm-Message-State: AO0yUKXay9T/cOPrHzX5YjJMFmIoVNc4pML57796ngXY3vxPa5Cx8gJR
 XFUIDjEgwZfvCix48gONL3I4kg==
X-Google-Smtp-Source: AK7set/1qKPP7YSjZyU4HyGUtRuQ9CA6VnTp9bvbI4frWqqD/KfHtUjrKdIX8t5GdJIgU6K6mSmHSA==
X-Received: by 2002:a05:6a20:4403:b0:bf:e16:f3f with SMTP id
 ce3-20020a056a20440300b000bf0e160f3fmr19178860pzb.33.1676009996396; 
 Thu, 09 Feb 2023 22:19:56 -0800 (PST)
Received: from dread.disaster.area (pa49-181-4-128.pa.nsw.optusnet.com.au.
 [49.181.4.128]) by smtp.gmail.com with ESMTPSA id
 e8-20020a63ae48000000b004da425922c6sm2228960pgp.74.2023.02.09.22.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 22:19:56 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pQMlF-00DWjV-Gi; Fri, 10 Feb 2023 17:19:53 +1100
Date: Fri, 10 Feb 2023 17:19:53 +1100
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: copy on write for splice() from file to pipe?
Message-ID: <20230210061953.GC2825702@dread.disaster.area>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
 <CAHk-=wip9xx367bfCV8xaF9Oaw4DZ6edF9Ojv10XoxJ-iUBwhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wip9xx367bfCV8xaF9Oaw4DZ6edF9Ojv10XoxJ-iUBwhA@mail.gmail.com>
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
From: Dave Chinner via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefan Metzmacher <metze@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 09, 2023 at 08:47:07PM -0800, Linus Torvalds wrote:
> On Thu, Feb 9, 2023 at 8:06 PM Dave Chinner <david@fromorbit.com> wrote:
> >>
> > So while I was pondering the complexity of this and watching a great
> > big shiny rocket create lots of heat, light and noise, it occurred
> > to me that we already have a mechanism for preventing page cache
> > data from being changed while the folios are under IO:
> > SB_I_STABLE_WRITES and folio_wait_stable().
> 
> No, Dave. Not at all.
> 
> Stop and think.

I have.

> splice() is not some "while under IO" thing. It's *UNBOUNDED*.

Splice has two sides - a source where we splice to the transport
pipe, then a destination where we splice pages from the transport
pipe. For better or worse, time in the transport pipe is unbounded,
but that does not mean the srouce or destination have unbound
processing times.

However, transport times being unbound are largely irrelevant, and
miss the fact that the application does not require pages in transit
to be stable.

The application we are talking about here is file -> pipe -> network
stack for zero copy sending of static file data and the problem is
that the file pages are not stable whilst they are under IO in the
network stack.

IOWs, the application does not care if the data changes whilst they
are in transport attached to the pipe - it only cares that the
contents are stable once they have been delivered and are now wholly
owned by the network stack IO path so that the OTW encodings
(checksum, encryption, whatever) done within the network IO path
don't get compromised.

i.e. the file pages only need to be stable whilst the network stack
IO path checksums and DMAs the data to the network hardware.

That's exactly the same IO context that the block device stack
requires the page contents  to be stable - across parity/checksum
calculations and the subsequent DMA transfers to the storage
hardware.

I'm suggesting that the page should only need to be held stable
whilst it is under IO, whether that IO is in the network stack via
skbs or in the block device stack via bios.  Both network and block
IO are bounded by fixed time limits, both IO paths typically only
need pages held stable for a few milliseconds at a time, and both
have worst case IO times in error situations are typically bound at
a few minutes.

IOWs, splice is a complete misdirection here - it doesn't need to
know a thing about stable data requirements at all. It's the
destination processing that requires stable data, not the transport
mechanism.

Hence if we have a generic mechanism that the network stack can use
to detect a file backed page and mark it needing to be stable whilst
the network stack is doing IO on it, everything on the filesystem
side should just work like it does for pages under IO in the block
device stack...

Indeed, I suspect that a filesystem -> pipe -> filesystem zero copy
path via splice probably also needs stable source pages for some
filesystems, in which case we need exactly the same mechanism as
we need for stable pages in the network stack zero copy splice
destiantion path....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

