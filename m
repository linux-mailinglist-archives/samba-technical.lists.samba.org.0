Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9F295CF9
	for <lists+samba-technical@lfdr.de>; Tue, 20 Aug 2019 13:13:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=X1foA22ccTKicBkskgwosvttAEG21c/FNc3vtgyz1Y4=; b=cht/nfEt6HrO7gqUfTb9SA7Pcm
	bxwKyy8kmE5VNi0WitD+xXXY7xPiSxEVsYm/cn6uUgB6xktVlvzaIpUGhHUJZqJyh776i1t5bdfk6
	CLdpjA5lCG47SZUz3DpfYFPg7BFyQImzeDSRFUYpeJs1e8aXDXkqJjUZ2Ae0qr35qMozrxpV7wFEL
	ABrmtp5OmdkdgjAL+OftCngPn0MvChTXTxj+cdh/Bn4dREfJMUUz83+3nwVU6Z7Te2ZWYjn7lk7ta
	Y3SBiq+6H0SanfMkMvXdlbnnqvisgYrhedY1U/yVpbUXavI9ioqeAgoWnCpCTuuhBOfVqEUFKldvA
	3zniDPgg==;
Received: from localhost ([::1]:57114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i024Y-007DuA-Vf; Tue, 20 Aug 2019 11:13:07 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:38685) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i024T-007Du3-TP
 for samba-technical@lists.samba.org; Tue, 20 Aug 2019 11:13:04 +0000
Received: by mail-ua1-x933.google.com with SMTP id g13so1803319uap.5
 for <samba-technical@lists.samba.org>; Tue, 20 Aug 2019 04:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X1foA22ccTKicBkskgwosvttAEG21c/FNc3vtgyz1Y4=;
 b=FsZLqWo8bkeYHR0ll4082O8jd50tNZSrAIkMACHKWDKiAdAusS6TZtLPPeqOT+SjIp
 jYuH9p00oEmS68lEbTzbCgsjUQwBsqum7q7JbMqaez1THuu/CkuGJOa3cBQL3a7zo6wf
 yogK8SUHUS1phZ6IGGVzCE6G344+nvK6rSzfPsjL7QBAgo/7Gw+Q6A5UqtC7UkVWSQbP
 vlPdzEocp5diFSlCHtePaz8LFTkSPKaB0l3UmSjZ9Hh2AT/qtjr+C3iY8FLpLnA609Cr
 sQwKFUZfXSzDMHJdwHJEvdt9A17xDjiq5TDnao/P8+xQbYu3byz376CbEYbplpyNXs6L
 6wjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X1foA22ccTKicBkskgwosvttAEG21c/FNc3vtgyz1Y4=;
 b=o/L53fduC8bhW5JZGUga5xvYRfLD9ancxv1IMI7SJbGGTQU/3J84foxM9qcb4z/9Zf
 Md9o8zn1VSdXNFPrnWyi2CYFvKsJjWRcZhylmmGPPAtRumHn4A5eOkpQgfwImhzEMlIG
 JLoO+t/8KTzkrbb2EZp32/NQJrHOkIVEqQXAIsyQaBLEDEQoMQNkT31dI/hh7nKgGVfo
 YQGxq74FPS+gCnJxcWLd+gkbiE1DJH0ZeC9ju3SO4Z9DeXumpMhVTc4aqH2ni1R/aT/E
 h9XbPPGJhbVh9NZclxYEOb1D7v2aVnVM/3XAawgT4asD6lrK4yvmANFGjnp+oWPFLIz+
 T/cQ==
X-Gm-Message-State: APjAAAWRA1PvwrqAEmvJ9hpbX3h7GOP5J3fHqTVn1kZtZUZGNXkOteC3
 Hd9B1llVHQdNBmIt8rzDtLtlhzMHOkympDVb1Xa2/A==
X-Google-Smtp-Source: APXvYqxKDcZp5rYGDITBh+ydeK2kw3wG7ghSQIPsAPzZhrU7o3pb9XpINkccUKkG0jKY4m1VSwjUlDacHeZQaTC9C/I=
X-Received: by 2002:a9f:31cb:: with SMTP id w11mr7954584uad.40.1566299579773; 
 Tue, 20 Aug 2019 04:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <81b761b3-676b-b3f1-1fc8-589f744b2c2b@samba.org>
 <5f29fb14-11b6-3f86-3804-6ea7020b4573@samba.org>
In-Reply-To: <5f29fb14-11b6-3f86-3804-6ea7020b4573@samba.org>
Date: Tue, 20 Aug 2019 07:12:48 -0400
Message-ID: <CAOCN9rziEX8YKiYA+GCdzcKjzvomW2Dt9y=RGO5_UD+xt8DBhQ@mail.gmail.com>
Subject: Re: [Release Planning 4.11] Delaying 4.11.0rc2
To: Karolin Seeger <kseeger@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 20, 2019 at 6:39 AM Karolin Seeger via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi,
>
> Am 06.08.19 um 12:55 schrieb Karolin Seeger via samba-technical:
> > Samba 4.11.0rc2 will be delayed, because library releases are needed first.
>
> as the proper fix is not available yet and I have no idea when it will
> be available, I would like to propose to ship RC2 tomorrow (after the
> ldb release) without addressing this issues at this point.
>
> Any objections?
>
> Cheers,
> Karolin
>
> --
> Karolin Seeger                  https://samba.org/~kseeger/
> Release Manager Samba Team      https://samba.org
> Team Lead Samba SerNet          https://sernet.de

Only that Samba 4.11.0rc1 depended on tdb >= 1.4.1, and I've not seen
that published or a tdb-1.4.1rc1. It's slowed me down from testing the
new samba 4.11 candidates.

