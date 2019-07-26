Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 914D775CFE
	for <lists+samba-technical@lfdr.de>; Fri, 26 Jul 2019 04:29:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CR+3mKC6imfrrXnQeUJ37clqEvDIxahdQxfQ3QtTXIg=; b=jwoPxU+rYkp2WQwIt8mBFOYG7z
	0hpLazeePaMo8sqrVMMJ9nlJqSi24prC3mp1v58UEYkJVo+X9P64RCdkPU7Fi3jvfrq0nuiMuZ1jB
	4DtUi/urI49kuCjx6jLIX0O+ybXLxtMHSDreKSB5h2dYqWgGyXq/R/RSSMpoZfiwqUPPION30vmEx
	IolKZOXyo+4IvMr5AKQNOu4n+1W3ldHLMEAQJBENN3OaagWuDdltVsmVQtUuMZV5h8NZjytNp63hF
	YrA2R6i+AG6H38X5dF4MwDZSXn/R5fQaYF+V7lmXvynyLnN/VXhgbR2gDsCuE64WT+RWNhGIoR0rR
	CeJjl9KA==;
Received: from localhost ([::1]:49096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqpyz-000P03-Mr; Fri, 26 Jul 2019 02:29:21 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:38965) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqpyv-000Ozw-A5
 for samba-technical@lists.samba.org; Fri, 26 Jul 2019 02:29:19 +0000
Received: by mail-oi1-x234.google.com with SMTP id m202so39210786oig.6
 for <samba-technical@lists.samba.org>; Thu, 25 Jul 2019 19:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CR+3mKC6imfrrXnQeUJ37clqEvDIxahdQxfQ3QtTXIg=;
 b=OwUp3orrJfLejtJGHz+Wzo2babgZ2XksrR8WHowURJLNRYgPnWhg+tqg2UGJ9bAAVY
 UYxjhy2d4Wnv2ZBamK/rS73WDxwrbM3Wa90pzmVV7FXgTXdWqez98P+lVono3L4wjEUl
 LiAG9ddscvZqDegTwSTEYJMk/OmU64GNDH9/vLFgZ920/CeujM2c9SgKfWbMxTjFkrw+
 H98EVEYeJDu7MAUs+BPnknCin204vZ42GV6fTTPlad8Dcxj+FH3PJ19ibhnr4HuKBKZh
 xZtdLrePlo1xsIHmtubH1Qdpi2zIn5bibKpKq9MSv+CXagHH3PboKMGEbveFCtiCOEN4
 GqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CR+3mKC6imfrrXnQeUJ37clqEvDIxahdQxfQ3QtTXIg=;
 b=cFxZkdJaPXcqQf/brw/Wm5m/4F8UsfA6fshuN5Hy5UMx4X11pz8VJgXAas3si/0Wfj
 rDGDGuaeh6MH8pM5MzVvS5PWzt0ixAS9DqMQan3IL0fDTXYCeKgYzkINgwa2dG9zlfJM
 F/S4vdBr9qsEIfmx/I01UAT//bzpjEzxzPxcDI/aFl5kjiosDU5mmZ+wcrLSDH5EaIpy
 pWxH/0ACDLeHv3rjIWRV12ePnT16cU8AQ49ft+hVhLgGY7smLWefVBlCGuUR2iCL2dc6
 g4aJjdnKuGmlmTbhNvTxmQrP8nqwbee/pfCKsW42gBE0sQJMcMIkzudigeBBYTHeRjhk
 XgYg==
X-Gm-Message-State: APjAAAUKEgK9gfUBdMmTBMqVgM1JlRMIaM4/edJPzt+JO8M84ZvBpxwF
 Tb+sk6e+DrDj5qCVOUxZ9iPZKEqS39Lg++SLTJk=
X-Google-Smtp-Source: APXvYqx0hXdocYaOuR3aShJkxfVFbftCIYWrXj4ORK92f2z2wGlvzBsNHgp7SnYczeRSdesTKDSNL6gIg+onF3oEubk=
X-Received: by 2002:a05:6808:298:: with SMTP id
 z24mr46752721oic.177.1564108155079; 
 Thu, 25 Jul 2019 19:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190725160043.7da57188@martins.ozlabs.org>
In-Reply-To: <20190725160043.7da57188@martins.ozlabs.org>
Date: Fri, 26 Jul 2019 12:29:04 +1000
Message-ID: <CAJ+X7mSpJfkMmvSbucA=WURLK6PDb9X8KJJ+Wm6fH5HL2DmX3A@mail.gmail.com>
Subject: Re: [PATCH] Improve CTDB recovery master logging
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

On Thu, Jul 25, 2019 at 4:01 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Improves logging in 2 ways:
>
> * Logs a clear message at the end of elections saying which node is
>   master
>
> * If the recovery lock is not set then periodically log details if the
>   cluster is incomplete: master, incomplete duration, number of
>   connected nodes
>
> CI pipeline running here:
>
>   https://gitlab.com/samba-team/devel/samba/pipelines/72839662
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

