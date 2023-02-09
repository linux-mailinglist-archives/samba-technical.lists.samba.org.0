Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C94691190
	for <lists+samba-technical@lfdr.de>; Thu,  9 Feb 2023 20:49:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=uyyumaK9xIPRojo79Q77XEBPKCDiPO3uA+JJHpfAEgA=; b=n/AplzlLzf9v7JtAh24c0G9DIZ
	VsHeGCAOQ9+W2vEjPWTiF+MZZ7cxhUeNrlsVuqW3u2FvAxQJ1aCQyrzqWTM+bZkKPLx5m9cLGE38J
	Q3nU3yY2X7+QaOOwcQm+WUinXxqML3wca6u1mUGrs5SvZlJ61njukxeazFnqnklOuEofh//F8VTrc
	bPGwRKADRXTuu8d9/gUKzgZKmDBSEQV7kBx+DyflE3/WMiTnGsHosmaHtDYbWVFYpIBNt8T6VQRPZ
	XRucw3xLj6pmimRvehlwOCvBDoClQoh20XD13eAU+3KwmGr46rvz/LXxvjyPmnWzDNOCG/g+s4sDs
	/PNxpLTA==;
Received: from ip6-localhost ([::1]:63042 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQCuh-00AWtV-CR; Thu, 09 Feb 2023 19:48:59 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35748) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQCuc-00AWtM-IN
 for samba-technical@lists.samba.org; Thu, 09 Feb 2023 19:48:56 +0000
Received: by mail-ej1-x635.google.com with SMTP id qw12so9777014ejc.2
 for <samba-technical@lists.samba.org>; Thu, 09 Feb 2023 11:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uyyumaK9xIPRojo79Q77XEBPKCDiPO3uA+JJHpfAEgA=;
 b=AZFy9HZ53vfM3YDTX4dK7I32YlhT5/F/iQr2XxE+3tLHv580MbFNKnKBzBpuoX/slw
 PjfvwT6grUZ3pOe8wLygEzYEtv1brf6zchhh0beA9epwiFJouS5D4FAEx9mHBiCSfa2n
 6Hcp/yvPEzTW8cxxyAYGalExsZQLzgObV3DpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uyyumaK9xIPRojo79Q77XEBPKCDiPO3uA+JJHpfAEgA=;
 b=V8PLohrqlm2kPOa3DNtogRVC9w/+T8qNL3sVHaB1c19U3BWf7e2LsiBkY+tWF/f9fy
 8nyX7Gbrkbvg8QZfvKj3q6zKIp7Qfq1Suq65GFvz1HBDL2An1hsDD+gtP3/cJaZGGL7H
 /2FfLfzEiS9lE4d/GVrPwNUal0UZ1pyaYsHRZhy78womkCZu3hUE1FIlKVFrQO+TMYFa
 nj7HrYs0J2wEQshEiEkxuOpAVKhk2zau1VSgxfBM+5Q07s1TvYhUttZMCZx+xIjRJ3j2
 Kuc3DfCyG3FCUWWa8zwlrg+ZR8dezsNR7pI+I2C2M/lYOyivyReI3hLfoQuN3aZ/iF3y
 pc6w==
X-Gm-Message-State: AO0yUKVBk9f2J96apG7RXbRgGd3DQVc/P9s7iXiBD8FeKyBjySDbioKp
 zIQ2Q8Rsgilw9qUBz5vP+VWsflOgMPOoUj2IfGI=
X-Google-Smtp-Source: AK7set9LeOiCPNbTzHiOQpK3/Cm4TqdHiAVQGjXyKIpHcTxreYyRDmVxD/ZUA7fx11vexBGuo0TgdA==
X-Received: by 2002:a17:906:c1d1:b0:878:8009:2177 with SMTP id
 bw17-20020a170906c1d100b0087880092177mr13008969ejb.53.1675972133116; 
 Thu, 09 Feb 2023 11:48:53 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 se26-20020a170906ce5a00b0086621d9d9b0sm1263669ejb.81.2023.02.09.11.48.52
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 11:48:52 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id gr7so9748161ejb.5
 for <samba-technical@lists.samba.org>; Thu, 09 Feb 2023 11:48:52 -0800 (PST)
X-Received: by 2002:a17:906:4e46:b0:87a:7098:ca09 with SMTP id
 g6-20020a1709064e4600b0087a7098ca09mr2452063ejw.78.1675972132059; Thu, 09 Feb
 2023 11:48:52 -0800 (PST)
MIME-Version: 1.0
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <f6c6d42e-337a-bbab-0d36-cfcc915d26c6@samba.org>
 <CAHk-=widtNT9y-9uGMnAgyR0kzyo0XjTkExSMoGpbZgeU=+vng@mail.gmail.com>
In-Reply-To: <CAHk-=widtNT9y-9uGMnAgyR0kzyo0XjTkExSMoGpbZgeU=+vng@mail.gmail.com>
Date: Thu, 9 Feb 2023 11:48:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=whprvcY=KRh15uqtmVqR2rL-H1yN6RaswHiWPsGHDqsSQ@mail.gmail.com>
Message-ID: <CAHk-=whprvcY=KRh15uqtmVqR2rL-H1yN6RaswHiWPsGHDqsSQ@mail.gmail.com>
Subject: Re: copy on write for splice() from file to pipe?
To: Stefan Metzmacher <metze@samba.org>
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
From: Linus Torvalds via samba-technical <samba-technical@lists.samba.org>
Reply-To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 9, 2023 at 11:36 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I guarantee that you will only slow things down with some odd async_memcpy.

Extended note: even if the copies themselves would then be done
concurrently with other work (so "not faster, but more parallel"), the
synchronization required at the end would then end up being costly
enough to eat up any possible win. Plus  you'd still end up with a
fundamental problem of "what if the data changes in the meantime".

And that's ignoring all the practical problems of actually starting
the async copy, which traditionally requires virtual to physical
translations (where "physical" is whatever the DMA address space is).

So I don't think there are any actual real cases of async memory copy
engines being even _remotely_ better than memcpy outside of
microcontrollers (and historical computers before caches - people may
still remember things like the Amiga blitter fondly).

Again, the exception ends up being if you can actually use real DMA to
not do a memory copy, but to transfer data directly to or from the
device. That's in some way what 'splice()' is designed to allow you to
do, but exactly by the pipe part ending up being the "conceptual
buffer" for the zero-copy pages.

So this is exactly *why* splicing from a file all the way to the
network will then show any file changes that have happened in between
that "splice started" and "network card got the data". You're supposed
to use splice only when you can guarantee the data stability (or,
alternatively, when you simply don't care about the data stability,
and getting the changed data is perfectly fine).

            Linus

