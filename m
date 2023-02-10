Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4726918E5
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 07:58:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1U8Y/0tbcD9B+rFGh6iJhmikTGHljyJ4FQw+gensxqM=; b=dLo0x2mMptn1tWhE5+BF6vGRjZ
	rc+/x7tqiE/rbZkTS55MJ9vOhtw+IpRjkoa0jXFXaUPriUPG9upnsD8E7yBXH8H16xied6Pu+Q5mu
	I2Gkh+7YT8XKlj1N3Smu1bijWaz71jCm5uhMgx7zNOmLsB19rQmnKs7Iv8Ky4vnBqM1oj8VHu+JRH
	6+Kl4TGqR9EL7O2thVLL4wEbPd41VS1HGySnJ8rLRHJoJFdDrDkrAOvkT66nWBreOkOkGtMrg8cID
	YtLfJOsegnf6Y8M9o7tDIjeNttO2yCkmsL5Z8ZzK+kp0m4V6gPsfajDxYX5qDgqgCALfxr9ekthXr
	PXRIYiUw==;
Received: from ip6-localhost ([::1]:58020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQNME-00Afvn-0v; Fri, 10 Feb 2023 06:58:06 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46773) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQNM0-00Afve-Vo
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 06:57:55 +0000
Received: by mail-pl1-x629.google.com with SMTP id iz19so4188996plb.13
 for <samba-technical@lists.samba.org>; Thu, 09 Feb 2023 22:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1U8Y/0tbcD9B+rFGh6iJhmikTGHljyJ4FQw+gensxqM=;
 b=4Z1SYdNbd8WuXmbNbPTp5CPsq+GgaHbcr8G8z8Vf2uXbpsOUdr/18311fSoj/DAvdM
 vKD8kJ4v+dlInCvARG32DgUVW8yzfAhNkAyg4PrXHQ8xbnM6qm00vXAjizV3lv9K0Sf/
 yhmZ9myipWzdAp3N3yBHfaKYQ0cJ0ZZ9R3JLCAc8crow8cakcI10UvY9qknPlyW1qW2Z
 DMKFP+tHUhN2tmNEIcIcgczDV7s8cjMmG51ixCnGXX2nvFqjCTjT9YADasror/vi7CU8
 10fPbGPPQUto5nhsZhX9kHLpIDYok04ij/5sDWe8+1g8aQUBeNpw+SaOrYegc5uSMILw
 cGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1U8Y/0tbcD9B+rFGh6iJhmikTGHljyJ4FQw+gensxqM=;
 b=krmrxUG3XAHOE4ErxATnkm9ETVdk0ZrrrVG+RDjGsh22CUEhUxe6Ix/Fd6q5KhJeK+
 WaEU1cyZcrXl2chYvrurer5oNxXBtRysU5TgYImjA1MB31BRf9KNsNGGiFnAZnOfifIm
 9KUpyCPSboPhX0nUWTaNk5usKNS+gKBcvp519GcZyvkKiqswlChVgRAH9jfi6QYhsSOs
 D41OOjUVansU9uQbZi9di2ZiqAi6Rv3TrpL+6WsqPRTQmWxExwOCXUnbTnPVb7qpBjh7
 YAjhmNVW/bdah9TipchbHz1TXg+sucQDCODvS6+R7eEl3Ju9Gj4Z6lksAsrCfjK0zV2p
 m3Ug==
X-Gm-Message-State: AO0yUKWOsET6tQekMbipgz7yaMIEincaRbR0qb7N74yhR65rvJCfS+mB
 C+IBQCQwG6RSrKDqF9SK8UufBA==
X-Google-Smtp-Source: AK7set9t6gqJxoHDZIn5ha1EJDlZJueE1TdlQVqKbhBYcp7XjUdmkxQUWlM78CqsSipLc15u/SU+4w==
X-Received: by 2002:a05:6a21:3613:b0:bc:30aa:8a6d with SMTP id
 yg19-20020a056a21361300b000bc30aa8a6dmr11239502pzb.2.1676012270527; 
 Thu, 09 Feb 2023 22:57:50 -0800 (PST)
Received: from dread.disaster.area (pa49-181-4-128.pa.nsw.optusnet.com.au.
 [49.181.4.128]) by smtp.gmail.com with ESMTPSA id
 i76-20020a636d4f000000b004fb171df68fsm2298927pgc.7.2023.02.09.22.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 22:57:50 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pQNLv-00DXUC-AP; Fri, 10 Feb 2023 17:57:47 +1100
Date: Fri, 10 Feb 2023 17:57:47 +1100
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: copy on write for splice() from file to pipe?
Message-ID: <20230210065747.GD2825702@dread.disaster.area>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
 <Y+XLuYh+kC+4wTRi@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+XLuYh+kC+4wTRi@casper.infradead.org>
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 10, 2023 at 04:44:41AM +0000, Matthew Wilcox wrote:
> On Fri, Feb 10, 2023 at 03:06:26PM +1100, Dave Chinner wrote:
> > So while I was pondering the complexity of this and watching a great
> > big shiny rocket create lots of heat, light and noise, it occurred
> 
> That was kind of fun

:)

> > to me that we already have a mechanism for preventing page cache
> > data from being changed while the folios are under IO:
> > SB_I_STABLE_WRITES and folio_wait_stable().
> 
> I thought about bringing that up, but it's not quite right.  That works
> great for writeback, but it only works for writeback.  We'd need to track
> another per-folio counter ... it'd be like the page pinning kerfuffle,
> only worse. 

Hmmm - I didn't think of that. It needs the counter because the
"stable request" is per folio reference state, not per folio state,
right? And the single flag works for writeback because we can only
have one writeback context in progress at a time?

Yeah, not sure how to deal with that easily.

> And for such a rare thing it seems like a poor use of 32
> bits of per-page state.

Maybe, but zero copy file data -> network send is a pretty common
workload. Web servers, file servers, remote backup programs, etc.
Having files being written whilst others are reading them is not as
common, but that does happen in a wide variety of shared file server
environments.

Regardless, I just had a couple of ideas - it they don't work so be
it.

> Not to mention that you can effectively block
> all writes to a file for an indefinite time by splicing pages to a pipe
> that you then never read from.

No, I wasn't suggesting that we make pages in transit stable - they
only need to be stable while the network stack requires them to be
stable....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

