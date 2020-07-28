Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FAA23072F
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jul 2020 12:03:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=fUcHCs8oWBfz29nIrEvOGFVV4+2g8NvMd2abcgNWgkw=; b=YmTDs5sBSc2ji7IY2OOV6Jn2C0
	mhGn04uv6FIw/wsmEy9nAjPRN2NRih9JdtlbNoaSVOesQOudsN4Pr+p/yK2+cpwBVdmXBRUWys+ck
	CKb1eOUZofh9vH3H9uxqZJmsC9B449vCfnMjvcWMQbvgdWEpeBcsdh68lqMJZvdJhqFTIlosRpA10
	dfWjDIHCNs8AZO6VhvRY+fqo72aMNeOu5YuWc5W3uhyMfuR5zO8vyTTLXOfHBMcYPfz/9QCVBPT0P
	cTqonQTYhBbBfOUJWOpvELij4vqrOmCrj7KeCOcVSuLB+lfeMmCHYBRXa8uz7AWmRcV35J2HjcZAJ
	X9Xq7sHQ==;
Received: from localhost ([::1]:57808 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k0MRY-00A7xK-Me; Tue, 28 Jul 2020 10:02:44 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:36437) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k0MRS-00A7xD-8S
 for samba-technical@lists.samba.org; Tue, 28 Jul 2020 10:02:40 +0000
Received: by mail-qk1-x72e.google.com with SMTP id g26so18092400qka.3
 for <samba-technical@lists.samba.org>; Tue, 28 Jul 2020 03:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fUcHCs8oWBfz29nIrEvOGFVV4+2g8NvMd2abcgNWgkw=;
 b=nPB1x43KX1+6uzlN18NKx4RoIXf9J9HfPkmKsW4KMu3qp4B8ZYu3v6nwm84/P7KXH8
 OCHoA8wk2NjWqgLLyzqQN/ec1eIRKcvOMQeSNxLiRw1MFg2i1wMyYgsuO42+NsDfY2EU
 N/MaAPE0ZqeiqpwSuKjYR3EcMbxrC+STbiub26Z6AI5Ctv8kLeFaIxdpzVDDTaeRW5bE
 ZjaSgAv2+qbYU3Kh9ttTEHvLY7ScqVw2SVGGmdtu0k+/IA70hlQyyS7q3Ae62Ng8Us3L
 cveUgiQrSfbOdC6o4V3FRyd7u4p8DQ7APtPwo0Li3jBoWwP0M/mvd09rD3qowuhz31x6
 1y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fUcHCs8oWBfz29nIrEvOGFVV4+2g8NvMd2abcgNWgkw=;
 b=EjNZAEzvc02bRJTgdrnl+QtvubZmbmYpNNZf57gabNtehB/ZDSqBPoUFhzHLzTMPhh
 f7yNqPR6N7Z+csiKSJqMA4CJCuYnaAif8PxaMXwoXucKHLWnvC6T5mp8aIfT9KhRgZ0F
 fJEhMh+eTEzqAKT/fe7Go5iYzSiOK1+3ktvdvHUvmhyBAcnnTPAluiBPDHvJm4mO2aNo
 sk7Yxc4ngtXuauGBBfiWgMlJj+ATg+pXyqkAdCJ9kYfPGwoDp5YSAg0c0ph/d91uvAgF
 i+ptBYmFiQOGDlFKOUZEWENKeqyF+xFh4BWQEuzt5rLnM98Dy962ywiUhS+wWNoPXHER
 DS2Q==
X-Gm-Message-State: AOAM531jME3WnNYUzUCVqBFIAcBd6sjsbcNWWeHzplockxHPtChZZBep
 OseEETEwNXzfaPv1pwYXkJKDaqjmv8XPEznlr72uVABtLmA=
X-Google-Smtp-Source: ABdhPJxMr1+XUsed/4WWOFaALO4K8of4AfYiewCeJlqexCj+cUmKGQQg2A7qjXqqSQnY6UZsJTeBQsAeBb8Wt/YOcXQ=
X-Received: by 2002:a37:b1c4:: with SMTP id
 a187mr17395116qkf.460.1595930556287; 
 Tue, 28 Jul 2020 03:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <!&!AAAAAAAAAAAuAAAAAAAAANGsRTVhQVFCrPuEPBc7FtYBANlTnCJhprtFudq2LHCBs8EBACQA//8AABAAAAD+l0Co+DASSaajg/eQiKKrAQAAAAA=@prawda.net.pl>
 <CAC-fF8STW7otKinVGG_w9Ut17qODzD0KaxK+P7VDDZbJz2G6ew@mail.gmail.com>
 <05853c98-f6a0-5f71-26a2-b4eee9f8dba4@samba.org>
 <69868d2b-4365-ad14-7238-0b92de9309e9@samba.org>
In-Reply-To: <69868d2b-4365-ad14-7238-0b92de9309e9@samba.org>
Date: Tue, 28 Jul 2020 12:02:24 +0200
Message-ID: <CAC-fF8RdmaiUKFu6hzjfOow9pHMe9ZdPE99pdCNvn5AG895FUw@mail.gmail.com>
Subject: Re: Samba migrate from ver 4.11.11 to 4.12.5
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 admin@prawda.net.pl
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi metze,

On Tue, Jul 28, 2020 at 9:33 AM Stefan Metzmacher <metze@samba.org> wrote:
>
> Am 28.07.20 um 09:28 schrieb Stefan Metzmacher via samba-technical:
> > Am 28.07.20 um 09:21 schrieb Isaac Boukris via samba-technical:
> >>
> >> Try resetting the server secret and regenerate its keytab (ldap/debian).
> >
> > No, I don't think that's useful.
> > Adjusting msDS-SupportedEncryptionTypes for debian.prawda.local from 31
> > to 28 should help.
> >
> > @Isaac didn't we had a fix and a bug report for the problem already?
>
> Found it here:
> https://bugzilla.samba.org/show_bug.cgi?id=14354
>
> @Isaac should we just push the patch I attached to the bug report
> in order to have the regression fixed in master and 4.12?

I noticed that I changed your patch in my branch to address my comment
(#8) in the bug, do you think it is correct?

I've turned my branch into wip MR for master:
https://gitlab.com/samba-team/samba/-/merge_requests/1482

