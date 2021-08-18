Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF133EF835
	for <lists+samba-technical@lfdr.de>; Wed, 18 Aug 2021 04:47:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RWmXHWwVFrhlQDHC2rVDGYKlpIeA9JdQ6DniyzAK9as=; b=dYHKeS7gBhcW7dSMMg7T1SBUIb
	ibP3e+1AGUza7KX13ltX1Sx7v6tMAFXJyd7XMHz6FzeH/+HUSJj9oez3yVkbpKjD7IoerfoCzaUt6
	FNujhrbejWQs7nC0hg8eFaj18pnYKq6RB2zK8iBNpERSma+0VcHFCgmMijXodxyetY3hIH4B1UKyL
	j+ONYqFHxrFyAJ/kIGH3ggIkN4Isv3/6OjXajCFn0uPaHKEpuoilWg374JLKK9uv6cqRDveak85NW
	9PhuMGtm05cFV1Yri3KQDQ8HQI2QXE2FaZnViIc5ttuGhItMekDVasviQGDn7/bBdraldTEy5hV/S
	zUb49K3w==;
Received: from ip6-localhost ([::1]:56864 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mGBbV-007El3-M4; Wed, 18 Aug 2021 02:46:57 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:44907) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mGBbO-007EjS-Fu
 for samba-technical@lists.samba.org; Wed, 18 Aug 2021 02:46:53 +0000
Received: by mail-lj1-x22d.google.com with SMTP id s3so2227826ljp.11
 for <samba-technical@lists.samba.org>; Tue, 17 Aug 2021 19:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RWmXHWwVFrhlQDHC2rVDGYKlpIeA9JdQ6DniyzAK9as=;
 b=qh1RLH0Gd1nVywJwS084M5nIdCuU3fLrE9me78hJx6YJWUywAhES+Rv22p+/SPc1fL
 9o4aeQ5FiuDpY9zA9fe7S7dVA4fZUyI0E4Ck5FCqY8OVxp4fGUDqm72VfRFfCvL7da0s
 4gfx8Sp6sXTCSvkI+kKDtqnennbd/VEodL+hFPm8gJTXqV7kaQYtgFavrFzglcF1/0lP
 6wjk56Z64KV378ezVD85SjvFX3TL1C1oxgjDzi6C/yhxLPewDD/qTijgJGHcgkvlRVOg
 J8Aqjwzc0qVGN8vltM4wiET4xJtYKs6RgUEE+GaZ8Dgkuw0j2UafSoX7quwlrC18yH/I
 qF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RWmXHWwVFrhlQDHC2rVDGYKlpIeA9JdQ6DniyzAK9as=;
 b=DSe8Z/Kxm64FRReFOoX63PD/mHvt74nbXvHBCTwX6p87Qg5Bacluhk1nuPYIs5yksm
 hbrWvReDqUNq2YLrHIjmN3sUMgMpgo48t8sheu8ZPVS/RQ13vJY4CeoY20H8K9Ho6xGV
 fjYGsiVd01xUhOgmQu749eMn28rvs8v4DMeQ8jg2JMm6Zw+vuP94jBSsRHKgaIDpR5b2
 DUflpVpFRbTcaUkt7/CkDGElpJwurU7krhfM0AGVCQuxr4pVhXkUiGJ61jdSvumdmUvk
 KM1iLdfvVqIbhCB/lgkIUOwzEfe6vQh+Q48YgdQEKrhevn1vGBWkLz+zCUklcAdUbge0
 LjNA==
X-Gm-Message-State: AOAM532rM6bgoowtlQNlcFwPuCqye/axZ27YPOcQfdYvddrWlzbEqo/0
 1axxVt2DgceVJs9cICOWgoA7JSFjt9cw8aaV7wI=
X-Google-Smtp-Source: ABdhPJwslGU/+xPwEkW6sdIpppodrm2AblhgBsp9WtZcWZkLIovt/JPSv6Jr/pVskQeBDBGbAgTovI27ptCXrwwcQdc=
X-Received: by 2002:a2e:a884:: with SMTP id m4mr5841362ljq.406.1629254809157; 
 Tue, 17 Aug 2021 19:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210817102709.15046-1-len.baker@gmx.com> <87im03h9zb.fsf@cjr.nz>
In-Reply-To: <87im03h9zb.fsf@cjr.nz>
Date: Tue, 17 Aug 2021 21:46:38 -0500
Message-ID: <CAH2r5mtKsjPesR6yBTO8RB=BFYc5Cb23OA_gEQyWMNrORXdavg@mail.gmail.com>
Subject: Re: [PATCH] CIFS: Fix a potencially linear read overflow
To: Paulo Alcantara <pc@cjr.nz>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Suresh Jayaraman <sjayaraman@suse.de>,
 samba-technical <samba-technical@lists.samba.org>,
 Jeff Layton <jlayton@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Steve French <sfrench@samba.org>, Len Baker <len.baker@gmx.com>,
 linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next pending testing

On Tue, Aug 17, 2021 at 7:29 PM Paulo Alcantara <pc@cjr.nz> wrote:
>
> Len Baker <len.baker@gmx.com> writes:
>
> > strlcpy() reads the entire source buffer first. This read may exceed the
> > destination size limit. This is both inefficient and can lead to linear
> > read overflows if a source string is not NUL-terminated.
> >
> > Also, the strnlen() call does not avoid the read overflow in the strlcpy
> > function when a not NUL-terminated string is passed.
> >
> > So, replace this block by a call to kstrndup() that avoids this type of
> > overflow and does the same.
> >
> > Fixes: 066ce6899484d ("cifs: rename cifs_strlcpy_to_host and make it use new functions")
> > Signed-off-by: Len Baker <len.baker@gmx.com>
> > ---
> >  fs/cifs/cifs_unicode.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
>
> Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>



-- 
Thanks,

Steve

