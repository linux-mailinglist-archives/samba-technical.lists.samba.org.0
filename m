Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E4460127
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jul 2019 08:49:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6onz8LM08xzgYAU4WDY8Cu22/xzugttkLSdM5vZHXTs=; b=57qI/0a15ufBjYkGB5opwwVT6t
	dvADQ7HdOia8Pz0hZSDVr4ZsIukRY8vtpbqseFMqfNyE/wu2wQGq4EhPG8s6+UHsXH5BgHYi3e9fY
	JLeycFCXkZ7wDFNKyG2OZ+lZFNhXzmJ9B6wXTPggZhanXmAHfmm9jbCyxFp8Zg+mlzGuo4KqaR13u
	m6RiV3hNFW/BW1RtFVB734VpXXxYwFCxhWV1KIRQhpIV/uvF3tB2nnKwQn245YlDA+J2lddSU5LDq
	nQzRwL2rgrTVJBT6c2PoTb4TLqfsclO/+CSmwh0UaiOo0MU2hD0T1gn1f5dY6yaFCXxatyH/qGpPu
	dXuOJjbw==;
Received: from localhost ([::1]:24840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hjI2L-005I2u-Tl; Fri, 05 Jul 2019 06:49:38 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38106) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hjI2D-005I23-A0
 for samba-technical@lists.samba.org; Fri, 05 Jul 2019 06:49:33 +0000
Received: by mail-ot1-x342.google.com with SMTP id d17so8079083oth.5
 for <samba-technical@lists.samba.org>; Thu, 04 Jul 2019 23:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6onz8LM08xzgYAU4WDY8Cu22/xzugttkLSdM5vZHXTs=;
 b=QhhUkAGG/WlvSMoIFaiVfXf3PIKFnWrpxvGK3jr02hVKQ+KaSXwiOQNttptuEBYSUW
 tvI7OPS9u9db/SRvXaD21CQzNxrygadhljd/hNZwJ+GfZ1xxaJbXP1hG6le6DdEyvp+V
 S5/juLKQzIyzS9T/wM3XMW99LL7f4RJWzEPROjgEhx/hNOie76dR7NDWEk80iTGkc7Te
 l08qjrGX/BFnI45XwSq7o4K8Ba0IO6r8F6pLdhdvcwGC15otErpXP3CVXCAaeUdteWF8
 QMKK1Bi4gnxi4CFvJtFALzg0W+JJCmwVsUslNt0gKBg9qBjSIRWwFNfkrFZjrp99czWX
 hlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6onz8LM08xzgYAU4WDY8Cu22/xzugttkLSdM5vZHXTs=;
 b=fvJyafwhF+LonlpuCjiDOQuJ8ZtB1HXRyhRL0fe1zQwge7Wh2i8CrOKC7425x6atV6
 o4cetX7Z4Thu1z6eO3i9i7DNHxBPURcnqa1COjl9H8kv78RQnEUb3Q7h9t2GNnWnGSvt
 dEzLNEaN11IMWqof/WHDjX9VAAJdx9N6EkvoDoQwahdMuEtK5tjbU/MoR6I9eCbCtLoS
 vzDwIJjrOpSuiPOlBvT6R++4hN6/VCLmNv0hqrJRE2L8LtR+oo8JuJYsUxuoWYGM6OUe
 TR6rDSNIXmJUgv2p+qsWCwtFQ4ZMjz4FTCn2V5iolKgrpbmzeJ5TiHxBMt/5Ajmm5uKO
 nkcg==
X-Gm-Message-State: APjAAAUOrZAEVpIiAeRkscLzjd6YsDInQro/YWBquScyxgTNvd6Rq1yd
 V85PL7HZJIsmAu29d95XJDjNCMOfVERuE3/38U7QFw==
X-Google-Smtp-Source: APXvYqyKVysfHP0rofecodphiCyXtO9NoR3SPhnQ+G3Fa6pXBc1kXtEMdefcTW9tK8MlEUINdh82oC1zktl7i5kL3dI=
X-Received: by 2002:a9d:1909:: with SMTP id j9mr1658884ota.139.1562309364015; 
 Thu, 04 Jul 2019 23:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190705141436.6dada72f@martins.ozlabs.org>
 <1562301892.12681.43.camel@samba.org>
In-Reply-To: <1562301892.12681.43.camel@samba.org>
Date: Fri, 5 Jul 2019 16:49:12 +1000
Message-ID: <CAJ+X7mSh+AWCKF5Sc7eEoJa76EO6C32wRJ_8bsSLrQxfMf2fqw@mail.gmail.com>
Subject: Re: [PATCH] WHATSNEW: Add CTDB updates for 4.11
To: Andrew Bartlett <abartlet@samba.org>
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

On Fri, Jul 5, 2019 at 2:45 PM Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Fri, 2019-07-05 at 14:14 +1000, Martin Schwenke via samba-technical
> wrote:
> > Please review and maybe push...
> >
> > peace & happiness,
> > martin
>
> Probably best to title it
>
> CTDB Changes
> ============
>
> I've kind of changed the heading structure this year because there were
> so many sub-tasks under the 100,000 user AD thing, so we don't want
> this to seem part of that.
>
> Otherwise looks good.
>
> Reviewed-by: Andrew Bartlett <abartlet@samba.org>

Pushed to autobuild.

Amitay.

