Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4D170AFCF
	for <lists+samba-technical@lfdr.de>; Sun, 21 May 2023 21:22:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4HXhFRUhp8ATNRE1IY8Xb1FY1Xv4mWGcfTkE+W6AJow=; b=dCDlT5pmkPnQi/rCPPRbBFyP7C
	D8axF9kaaTRGvpZR8IWeVeVfjUtMRo+EiqNNeehFTtqQWLyTdoTdM6eV7Y9m54s1ZO3NF+vzkAFYf
	JqgrAzkgswUcoROnldzAz8xfq0aZU7DqChXyEsrcmOjcx09ZSLUZ0TIfgZGEMwf1oUpZFyalNITr6
	a8f9jA32RbW5zDwWFT9oClme/8VDgbU36G81OeVyT2IKIA0rZi44o6CmIX5uSmudPulSVIfFQMDKD
	T1h4x9J5VfnV2amNdKr8WnIoWfyVb35q+TPsu1rgORsslY/hkRXLAeJMnrtfopzASZIkrUsLgcBtv
	UKD/gpRw==;
Received: from ip6-localhost ([::1]:60348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q0ocl-00B4U7-N9; Sun, 21 May 2023 19:21:47 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:49303) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q0ocd-00B4Tx-Ql
 for samba-technical@lists.samba.org; Sun, 21 May 2023 19:21:44 +0000
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-96fb45a5258so194345566b.2
 for <samba-technical@lists.samba.org>; Sun, 21 May 2023 12:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1684696899; x=1687288899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4HXhFRUhp8ATNRE1IY8Xb1FY1Xv4mWGcfTkE+W6AJow=;
 b=FlJOL0kSaQSagFcyoQXHjq6U1Oj3NFuCf4rBeG+wIBKcLnCmwkfHHR7/ylKiwwmgUB
 TLc6khzqu9tOYOw5MkjKN0WfP49kh+IC8Nl6xfKs9ZHP9oWSkTxPNXB6Ll6GgQWf6cda
 0iGUWZjueBWc1chU0R9IM80mU2TnuAoDHMCak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684696899; x=1687288899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4HXhFRUhp8ATNRE1IY8Xb1FY1Xv4mWGcfTkE+W6AJow=;
 b=Fr7GEdk7B05dypeRI3UIKtBxLD3OUR9S4OKSMWDDeKSBYJkfAKjqVSV+dDx5j6vXOj
 fXx966AIaYYKGpYFffDF2wavgjJXPXZnVuLS/UD/AFdKMIpt6etyKbCzD32cYXbrNd9F
 rTNNjIZKGWy8CCpcbzIlSjvY8a4J4Ttwli3NbtNXkBxzpfJWcfqATPUJRCApAeD7zXGg
 ZxopEXlX54lTNCP/0TEJi3kqrdBebTMLphIB6siicLOAteSO88W29QinZ/gSjdKYGfsS
 jq8ga4vHCUux3N1dmpg99lZCEBuE5TZ6eC8uV6HnKtbNqpzfvbV/mxBeI7tNJ82FfnjY
 aSxA==
X-Gm-Message-State: AC+VfDxdrZAjYikXfefAk5wMl5DSrnraqAkBWeterMarQ0SwIiRu0GIS
 on7HPOAiUy1XM88xnl6ERtoezrJlxDUWHJdIfct8Jg==
X-Google-Smtp-Source: ACHHUZ6G1ZNvB7tEJx/32NqjFfz9PctWW7brCg0k5Ei7GrFo4GrZy8+RKb6zoNrOQrQNPuod34macg==
X-Received: by 2002:a17:906:7f1a:b0:96b:6fb:38d3 with SMTP id
 d26-20020a1709067f1a00b0096b06fb38d3mr5802016ejr.51.1684696898693; 
 Sun, 21 May 2023 12:21:38 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 h14-20020a170906854e00b009534211cc97sm2170864ejy.159.2023.05.21.12.21.37
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 12:21:37 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-510f525e06cso5476607a12.2
 for <samba-technical@lists.samba.org>; Sun, 21 May 2023 12:21:37 -0700 (PDT)
X-Received: by 2002:a05:6402:6d8:b0:50b:fb60:f431 with SMTP id
 n24-20020a05640206d800b0050bfb60f431mr6096635edy.7.1684696897335; Sun, 21 May
 2023 12:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5msxkE5cPJ-nQCAibJ+x+hO7uSLpasGm81i6DknQ8M5zWg@mail.gmail.com>
 <CAHk-=wiStOAKntvgzZ79aA=Xc0Zz7byoBxBW_As5cmn5cgkuoQ@mail.gmail.com>
 <CAH2r5muxwEMA9JpE6ijSbZEByxRmtNSiwcXMbOz+Ojo8_APJUQ@mail.gmail.com>
In-Reply-To: <CAH2r5muxwEMA9JpE6ijSbZEByxRmtNSiwcXMbOz+Ojo8_APJUQ@mail.gmail.com>
Date: Sun, 21 May 2023 12:21:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeuUNo6o6k4y3nQD2mmT5T04ack7i_UOAetmga-4_SbQ@mail.gmail.com>
Message-ID: <CAHk-=wjeuUNo6o6k4y3nQD2mmT5T04ack7i_UOAetmga-4_SbQ@mail.gmail.com>
Subject: Re: [GIT PULL] ksmbd server fixes
To: Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Linus Torvalds via samba-technical <samba-technical@lists.samba.org>
Reply-To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, May 21, 2023 at 12:03=E2=80=AFPM Steve French <smfrench@gmail.com> =
wrote:
>
> I would be happy to do the move (to fs/smb) of the directories and
> update the config soon (seems reasonably low risk) - let me know if you
> want me to send it this week or wait till 6.5-rc

So I think the "do it now or wait until the 6.5 merge window" is
entirely up to you.

We've often intentionally done big renames during the "quiet time"
after the merge window is oven, just because doing them during the
merge window can be somewhat painful with unnecessary conflicts.

I would *not* want to do it during the last week of the release, just
in case there are small details that need to be fixed up, but doing it
now during the rc3/rc4 kind of timeframe is not only fairly quiet, but
also gives us time to find any surprises.

So in that sense, doing it now is likely one of the better times, and
a pure rename should not be risky from a code standpoint.

At the same time, doing it during the merge window isn't *wrong*
either.  Despite the somewhat painful merge with folio changes, I
don't think fs/cifs/ or fs/ksmbd/ normally have a lot of conflicts,
and git does handle rename conflicts fairly well unless there's just
lots of complexity.

So it's really fine either way. The normal kind of "big changes"
should obviously always be merge window things, but pure renames
really are different and are often done outside of the merge window
(the same way I intentionally did the MAINTAINERS re-ordering just
*after* the merge window)

But we don't do renames often enough to have any kind of strict rules
about things like this.

So I think "whenever is most convenient for you" is the thing to aim
for here. This is *not* a "only during merge window" kind of thing.

                 Linus

