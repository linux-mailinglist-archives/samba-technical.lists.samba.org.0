Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 94576366341
	for <lists+samba-technical@lfdr.de>; Wed, 21 Apr 2021 03:00:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bi+NVF+b85frR/gafIEV8CQcBXGttFPONxVia3fskBY=; b=mbYkXQPFN8vp5VFc4TeGndnpU6
	aN4TXfq+zlg08iGdh6Yqygt02F8xcrqDD5Ci+QG7x3oy5T7rUG9K6oW5R+g5u9wUzZwWL+KXivKoj
	CPfjd+XFhZ4BrCO1Fh+2xN+HdnUbWsM3W2w1nPXIs4yBL3m1kIb3YQ+GYeUEqP3vR7D42Yj+1hrua
	RLQLk0havAMtjz7BDBK/ZNzWj6weC/5LvsekHNPavxoyQeWNGWoyVyqcpBzjTm9V32RKAuJfQPle3
	dvd+dYGlcmf1HIWaaS7f2+cw9Ajk9mtX9S/Ex6/VrDLuAsnObKtjBmj+Yp3V4bYdFCHNrpoT9rD1o
	jFiZa8lA==;
Received: from ip6-localhost ([::1]:40698 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lZ1DL-00Br4r-Vo; Wed, 21 Apr 2021 00:59:36 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:42863) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lZ1DE-00Br4k-Hl
 for samba-technical@lists.samba.org; Wed, 21 Apr 2021 00:59:32 +0000
Received: by mail-lf1-x136.google.com with SMTP id d27so7438026lfv.9
 for <samba-technical@lists.samba.org>; Tue, 20 Apr 2021 17:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bi+NVF+b85frR/gafIEV8CQcBXGttFPONxVia3fskBY=;
 b=cDr2jGbTLsr2CLnD8KNR3f+5t4BAMOhsUJLod4SWWEKaY9KXHPLtnyOj+2jMU9vgkd
 WUImq0nEYsL93wuwCm5T2+dTJmpaAJNI6zOQKqgPIWZLrJf8uOMOP5rQKeqSxb1uWpeF
 WAs3Zf8lXIg+3PXbrSaTiGADt/jBSoydc5RJglgQjVr39B8ecvzKxD+mtFwL+hAwZgU0
 svlGm6bnyL6SubO9gzKO0auYhNVFYwrzEd0lyx+Hv50mu7wOXyJgw6aA+hqITbWyd32m
 zysA5hvtl8sGB+aYHKXXupmJYUY9+SJ01yKnezZKOQ/jqzYBFqEVbq8MNyRBctD/0K+D
 SzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bi+NVF+b85frR/gafIEV8CQcBXGttFPONxVia3fskBY=;
 b=Cznevwstioz766RWUWWMPQDtFvo5wtWBMEV6rGchadpCXdiAyt3nEu2O0T2803LCAm
 X/McstVb4zn/BCuaECBe48t9yXglo0iu4/MaQqHUrqSm4fKOZ46NHkR6ai/QPiKnalci
 l1OUlxTL9w2iWx23KtG6emQ1VkRII9t1WiOg2XC8VVeIp98/d56OPpwDpzGAxakgafaw
 gSoU3BIXiVYvYiPbzmr0cUY0bF4sm7iew0yF6WGnj8rOGqTv93kiksOLcM3ztGjLJqFq
 HPGbFgyEXFvlcDu+LABPCwwKPhN2DfiskcepaMm6PDbdN1k5BGKA3+EIyXvTWnU8jbeO
 g3kw==
X-Gm-Message-State: AOAM5314xBHV9WXH8+OOiVQiKqsqFraZGgFujb/FBDk5sa14VS9GPx0A
 8Y//KxsHveVU+Bc5hNacN1XOo7jasupitVbgukXxdAEO
X-Google-Smtp-Source: ABdhPJwNgRDBacI6xHLH/PNUkKM3hCbutnOGUS7fvYTmYe2jK32bXmJs34KsNEGjTkgpyffvp0foORF8CEiRBfhs1ek=
X-Received: by 2002:a05:6512:131c:: with SMTP id
 x28mr17706245lfu.638.1618966766415; 
 Tue, 20 Apr 2021 17:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAD0Ztp1y=WFbe3k=JxxbTC55O9YOhmJL2GAatHc8denZ+15h=Q@mail.gmail.com>
 <20210420195550.GA1140396@jeremy-acer>
In-Reply-To: <20210420195550.GA1140396@jeremy-acer>
Date: Tue, 20 Apr 2021 20:59:14 -0400
Message-ID: <CAD0Ztp1vRwLys9cFwiWsLj9Lnu1qDNKnQKa1eDxn3A=+_bGCMw@mail.gmail.com>
Subject: Re: [PATCH] Fix sigsegv in check_stream in smbtorture smb2.streams.io
To: Jeremy Allison <jra@samba.org>
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
From: Gordon Ross via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gordon Ross <gordon.w.ross@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

That's fine too.  Thanks.

On Tue, Apr 20, 2021 at 3:55 PM Jeremy Allison <jra@samba.org> wrote:
>
> On Tue, Apr 20, 2021 at 03:36:28PM -0400, Gordon Ross via samba-technical wrote:
> >Not 100% sure this is still a defect on master, but it was fairly recently.
> >
> >If any stream create fails during smb2.streams.io
> >the test dies with a sigsegv in torture_comment
> >
> >torture_comment calls need a struct torture_context arg,
> >not its mem_ctx child.  Use talloc_parent().  Also
> >need to call torture_result somewhere on failure.
>
> Thanks Gordon ! Probably better to pass down
> an extra struct torture_context *tctx parameter
> to check_stream() rather than relying on talloc_parent()
> to assume it's a tctx.
>
> If I make those changes are you OK with your
> "Signed-off-by: Gordon Ross <gordon.ross@tintri.com>"
> being added ?
>
> Cheers,
>
> Jeremy.

