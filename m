Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C98AE5FFE6
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jul 2019 06:05:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Atg3ZUUGSmFzXRHXhXeCLvjvz10NhGUiGe+LIgo6YS0=; b=xgkV5HZkj/7J4mNXn2y/Ht1QFr
	/5cUyc2WFKwscQCV2mCS0E7OjqnBz1yFmHuTyPy42GXLfq0biXlHaXhPGMcV5PY+q6oPyuEk9v7jE
	RwgeMPv1Vchw965h1JZIDPTD3qJLVzs87umMbp2h6RX4aZgQ8aO8FA43lu6DAxyMLMHxDJYu0qCwV
	Jdk+IhiwMqSoZ27oG085a0xhdmO6Ej5rnoHIayvdu//HqGbeg8LvRAuFBFdiBYwCM2QBN9QziAZ2u
	r8yau6fQs/ZSpY99b+0F5R09DzKePA0mfvzjKUprBvSLfQgZQQ43o9U2xH7WWXfVT7J8e8c/4y3Wp
	X87Tpekw==;
Received: from localhost ([::1]:19882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hjFT4-005Gzk-Vs; Fri, 05 Jul 2019 04:05:03 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43884) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hjFT0-005GzQ-5V
 for samba-technical@lists.samba.org; Fri, 05 Jul 2019 04:05:00 +0000
Received: by mail-ot1-x343.google.com with SMTP id q10so7740089otk.10
 for <samba-technical@lists.samba.org>; Thu, 04 Jul 2019 21:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Atg3ZUUGSmFzXRHXhXeCLvjvz10NhGUiGe+LIgo6YS0=;
 b=pkRRsW3Ms1xxB7VYRriW9p1dNvEn0Ytu3gXWs2MCw9juLFVEAA96modwC+V2PyUlkw
 hUm6e0zA6WTgme2Zt3Q7bARSySqXLbli0WEt7kVtpNba/0SlaR8CCphl1dMRt3llLUB5
 /cMQv/9awbS2evOs2ebnxpq3myrc6CfyfzeIModE2S/ZQp0C6zAm+QG+JZvpY/HJmkBK
 G12fNFjpeRJdv6awQaOfeV8iLw8LJGUYnGATbE5gx28dyDTXhBy2YzUaSiGDW/V1QOpP
 ZLaZ4b6o9VEzgicwYbKfpG25e2ETTCGe32KdyEF0Io/ktxbuT6DDV0uQTGLCIFrGP0QY
 kX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Atg3ZUUGSmFzXRHXhXeCLvjvz10NhGUiGe+LIgo6YS0=;
 b=cSGIVuDtUotJQMRO80en2uHlgM7PEwxoyM3bxm1+6Veu2GifpJ0dAnPNm6QIJsTbFn
 RIZGSOIHREGoK9SYkkFdfuULqMJeBjVrWYzvz39psD6cb+BnGtzZNUAj8Ne2AKw0ceJT
 SKQZcWfVsxPIYyyhEDKL45hhFAziXrcFT9wVaL5Y8FC/8oH7tdkYQql2roRE2nh5PQMT
 iUZodZS5zo3Chhq9/Lt4960GrvKFylb9sLf9cbFYfuQO24fKaQNzneLzZ89tNO9jWeAM
 F7UC/IwnUb3YLBiG0X5fSqy95nnD0lRwRgdjywKoSg+a/b1CcgNpq5UcfGXJbyhZNpem
 /kJw==
X-Gm-Message-State: APjAAAWyYxfnP9SPPTyRvzs13nv6dzwO4GEMDSQmP2OeBfeVEfyQpRY9
 2zdL9z2tAH5qfWOQha00ZLmb9Hy+hPT/GTJy1A4nHw==
X-Google-Smtp-Source: APXvYqyeQ75JD/1MYUf3x3e84TMNNyI+LBXRdQKhaNpXm7KOdxgNQ5WJKrFGdIJQGFbtr1dLRbSJO8E22KuYsosOFLA=
X-Received: by 2002:a9d:73cd:: with SMTP id m13mr1052186otk.43.1562299495038; 
 Thu, 04 Jul 2019 21:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190701171437.337d5c2f@martins.ozlabs.org>
In-Reply-To: <20190701171437.337d5c2f@martins.ozlabs.org>
Date: Fri, 5 Jul 2019 14:04:43 +1000
Message-ID: <CAJ+X7mQKjxeCTpSLH0K+v0DKyQuRZD800hVL=cUZyMXOpt-OwQ@mail.gmail.com>
Subject: Re: [PATCH] CTDB csbuild fixups
To: Martin Schwenke <martin@meltin.net>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jul 1, 2019 at 5:16 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Lots of csbuild-related CTDB fixups.
>
> This is also GitLab merge request:
>
>   https://gitlab.com/samba-team/samba/merge_requests/578
>
> with CI pipeline:
>
>   https://gitlab.com/samba-team/devel/samba/pipelines/68715416
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

