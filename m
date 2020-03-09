Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D6A17E08E
	for <lists+samba-technical@lfdr.de>; Mon,  9 Mar 2020 13:50:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DRqaGWFeYuQUqnCZNLDAOcNHPoA1HXueqrxYGuQWjfU=; b=hoFK0YgLzdMjkA98Uir7YeHClq
	yQnLCbw0O83VSpNlpTFXwLAnyKcG4run6Lv6WpZk9StZbeqWtZzfLbnsQhZI6+l/7rjp34ZH+ZGjG
	sBfpktdzmh6qUUHtCZ9yXvBbHKWJKXPVZe46cs5UpKBb4lpFk/dznrEQ436WtbrovWlNGh/LYpNdq
	/KzQC3ZUKCoWFfjiBbXCg/ZegipO3LaDc9PSMvU1JJjLOxIl+6KMJa3ffP0+Cd7/E+x8wg5L0qVSP
	elDywNAPmPQh0S5bhG+Vta16zB7yp5+bD7+xAHdvpZZEFe9q58hiGgCheS73h6osVLU4m6zEYw9wI
	/0hjm+Hw==;
Received: from ip6-localhost ([::1]:35594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBHqq-00FUbk-P9; Mon, 09 Mar 2020 12:49:44 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:39482) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBHqh-00FUbd-Vi
 for samba-technical@lists.samba.org; Mon, 09 Mar 2020 12:49:38 +0000
Received: by mail-lj1-x230.google.com with SMTP id f10so9772550ljn.6
 for <samba-technical@lists.samba.org>; Mon, 09 Mar 2020 05:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DRqaGWFeYuQUqnCZNLDAOcNHPoA1HXueqrxYGuQWjfU=;
 b=Q80N8U1dtSbq85uF4R/+AFUKmXguVAh7v5egS29yhJiL+papVIksOHDuyCjoSA88Rr
 4hxkHG15Fjn5yi0xEdjnGVcHA+ejxzoBGD/jqDQSQN5tXueJN1jvSX+htrQW1Cj3Nx4I
 PjZkFBlWLNgsPHShAmF1KySTN71Xe9MMaNpyo/DFm9uuVShkWy4ljU9WHPMO01kg5XLN
 c2nZpd9qXRL/RjpPFNqBcuOXFBzTPIx/piGOycI968ju2y8zIBzhJSd6xR2aGfjQq6FO
 yjJbh3hS+Sd9j3NzTheM4icwiUYSYfa/mOUkZb6cZyNiW1ZKVJmKEkd2OxmrlIsznxHX
 CjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DRqaGWFeYuQUqnCZNLDAOcNHPoA1HXueqrxYGuQWjfU=;
 b=cyS+fCxsH9DvRaFT600mTkdoSEkP5MP9hU0gKRQWf0i5K1DP2QqbKN5D3l27sVyxwZ
 IEVO0/kEM+Nzu/sg0/vkABgBy5yi36B/6FkLH7Q1JvFtFyGAqKt5k1emUzJYEar5bt3d
 h50hykNy8is9cRISArAcrwBW6LThx4kJDZwdd7LVMRbsXsm2wwXUZB+YP9co62hyG78l
 F+zlVN2i0CmMb/udZk1DPszwNCG0zf31R8WORlWA5KHSM37MVlujCXwlTVaXrHdHXDWQ
 ElWHK4clmGqjGqB3FBUZeIV9NXVNTQ2r42aXZVQhmtXPbNfIDf/bof5V3/AHm1rxG+Hx
 hvxQ==
X-Gm-Message-State: ANhLgQ0GbfeK34DAiBekCxBJget+sOnblkiaC+zjsYQDuRiG9SDzyfVH
 rZFk+gpF8xdSQE3TNQwrmASyPxa+nU4LrukWj5T5NQ==
X-Google-Smtp-Source: ADFU+vusS9/notVxNCmPnbKXGESwtj0AvPO2ZuaiAw6Wgc/zzIDFXw1x4qdTcvRnp/NRBJhqtaB96srOAdpP1947enI=
X-Received: by 2002:a2e:8754:: with SMTP id q20mr9909520ljj.158.1583758173843; 
 Mon, 09 Mar 2020 05:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8Tc=3A=fBU5DpstKcg7YxYvi0ugFSBTAGSMz2tp6H1MFA@mail.gmail.com>
 <73341d2e-2a86-a43f-6fa5-dd1473cdef6e@samba.org>
 <5b8bae24-553b-25cf-b942-6d6b2404d8c0@samba.org>
 <CAC-fF8R8hsBuCeGQX99ZVY=C7vuEuCf2L+KNbdGARJorSEzoAA@mail.gmail.com>
 <089d3ced-cf08-5276-daaa-54eb54b87850@samba.org>
 <CAC-fF8Tm3ce4gByhHTgDieMux4ZZX_4DoHcbBP2A7PQT9Nm_wA@mail.gmail.com>
In-Reply-To: <CAC-fF8Tm3ce4gByhHTgDieMux4ZZX_4DoHcbBP2A7PQT9Nm_wA@mail.gmail.com>
Date: Mon, 9 Mar 2020 13:49:22 +0100
Message-ID: <CAC-fF8RnF_iaSbzdMM4An1N76YzYgnMTpO6ZX3WdEP0Yf+KqbA@mail.gmail.com>
Subject: Re: Using vfs_fruit alongside vfs_recycle
To: Ralph Boehme <slow@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Mar 6, 2020 at 3:19 PM Isaac Boukris <iboukris@gmail.com> wrote:
>
> Hi Ralph
>
> On Fri, Mar 6, 2020 at 2:41 PM Ralph Boehme <slow@samba.org> wrote:
> >
> > Am 3/6/20 um 12:48 PM schrieb Isaac Boukris:
> > > https://bugzilla.samba.org/show_bug.cgi?id=14316
> >
> > thanks!
> >
> > May I push the patch with your +1?
>
> The change looks fine, but I'm not so familiar with vfs and the flow
> is unclear to me. I'll look more next week.

Pushed to autobuild.

Thanks!

