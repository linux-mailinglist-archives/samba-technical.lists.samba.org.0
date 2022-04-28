Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B13512E03
	for <lists+samba-technical@lfdr.de>; Thu, 28 Apr 2022 10:15:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GBHkiCIv6BTAnE6jAK5kLHQ7tL5otFHKDvStheTyF9c=; b=Wj/Y6NeIrwe3Wu0htilo0kZ0tp
	GjRqLWTi7p+QfBqEzO9ehMQN7lc+vrS+eVuyrx64xTMVOHjc14L0U4vqYbcwy/zdzg7SHXaFzEyvR
	9ri3b5M4fK/1u/iyLx8K4o/6NxvXsE4FMwvkLASM3T6fokpIPczFkkggdemAQm8mpsAQRkexlC0m/
	+T0ovvZgUl1hFViSNDqktoiVTHOoQ8jiC7e/xUxWnF/NX6fgBmFRlbOW02Cb6Iroxhzak7QpPSYqY
	jojf/eqonuthpzwOoyvJyO300NbvZFagHxM2BHyuHUBpw1JS3S8CW3TF6nLNjr481p4eXLo0La4jN
	mGfp3tJQ==;
Received: from ip6-localhost ([::1]:33260 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1njzIE-002zwo-W8; Thu, 28 Apr 2022 08:14:31 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31]:36646) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1njzI9-002zwf-Px
 for samba-technical@lists.samba.org; Thu, 28 Apr 2022 08:14:28 +0000
Received: by mail-vk1-xa31.google.com with SMTP id h144so1578241vkh.3
 for <samba-technical@lists.samba.org>; Thu, 28 Apr 2022 01:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GBHkiCIv6BTAnE6jAK5kLHQ7tL5otFHKDvStheTyF9c=;
 b=HobPYVrGJOMyaCX+MJTFG7T6wGok/Rlz0qzjisv/Nj0wRIAD6Yb2XGeYyJnwIucv7m
 C3Vh1ywBh6ihgmLeDCyUVjoXARQySwChrtb3vSyIM63rssoON3OLVCaHfIbF9EaCtbNg
 p9fO+JtksP0FkyHpIYHwBUleaTxEAb8IVUkQvH9qVlUTaGtnBtRzQ7dyaTg0z/h3mYP5
 Mz4pTmtjkyqsmIlWAsbquok/iEkr2to9xjP6WeoL/MvTpIzbaZFTTM85Y6jBbLe/oVwB
 YC7aZ+I26XGweD/UMykc90P8Srf1DW1p2vk4iNNxA849j2Un9cKKan8qrUmnvXVEwW3g
 EQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GBHkiCIv6BTAnE6jAK5kLHQ7tL5otFHKDvStheTyF9c=;
 b=AicSL2ezsweKbBrwiaQFdT9FKv/jRLwu06fYzdJLTJAU9xChB94a6WZ9goph1jMF+R
 0tGzlz7wpAYxG/TY99vY6gNXIUbp70SBGqafN/WyLVZxGSomAaUShmZLNy3sixIGaXYV
 blRed/sP6m+r1bNx1jGTAVh5oLKA7v7fFRWzboNTFDNmFoJh24nGHBBO48KtuH/J12fS
 vKabKUrUI0wN7CfaUM/Gq4ffXk8j/HCQQMlyb7+CndCGw3uIYfBa8Rp6c9UE7qdtilIX
 S3XJe+Xmz+Cpc+SmseZ4HCsNgmLZldD6NM+yXc68Lv8IJhf593+P5ezFrotpo7/aMz6w
 SfNA==
X-Gm-Message-State: AOAM532GlSQHXsjCkDcVswNoFUQ6NFAn4HJLdHIt/3LQK6tdHGarHMCD
 L/hEbn7lS+RPloVbnDuYNmZUglRuQoICPyAJGvo=
X-Google-Smtp-Source: ABdhPJzr3GM0/9+xklXIyWu/5tOnaLSmEMUFc3Hc8gVUawVm0oZw6nKbWSlP2VxF0NKkto8YXH7KoDBvqIt/cJ3W0jI=
X-Received: by 2002:a1f:ac95:0:b0:345:2ade:e54b with SMTP id
 v143-20020a1fac95000000b003452adee54bmr10168943vke.3.1651133659129; Thu, 28
 Apr 2022 01:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAB5c7xrKB52rmAP9qPFxzjtCcBLvGsGiUn_ODz7QwQwrJ15o0A@mail.gmail.com>
In-Reply-To: <CAB5c7xrKB52rmAP9qPFxzjtCcBLvGsGiUn_ODz7QwQwrJ15o0A@mail.gmail.com>
Date: Thu, 28 Apr 2022 18:14:07 +1000
Message-ID: <CAJ+X7mTv5xR0J5e7OxLzhsnbHuB0wuECwL9Zn7pS+gu3LL2mBw@mail.gmail.com>
Subject: Re: ctdb client python bindings
To: Andrew Walker <awalker@ixsystems.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

On Thu, Apr 28, 2022 at 3:27 AM Andrew Walker via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hey all,
>
> I threw together some quick python bindings for a ctdb client. WIP, but any
> feedback would be appreciated (either in-list or direct email to this
> address).
>
> I've currently thrown together
>
> https://gitlab.com/samba-team/devel/samba/-/commits/anodos325-ctdb_python_bindings
>
> below are some basic operations
> * initializing client
> * getting cluster status
> * creating a new persistent ctdb file (if that's your thing)
> * listing current nodes
> * getting pnn0 object and printing its current status

I appreciate the efforts to implement python bindings for ctdb client
interfaces.  However, I fail to understand the motivation behind this
work.  Is there a requirement from some applications to have a python
interface to CTDB?  Or do you have some other plans?

In the past, Martin and I had considered developing python bindings
for client interfaces.  The motivation there was to rewrite the ctdb
tool in python. However, we never got around to doing that.

Without a good motivation for python bindings to ctdb,  I would be
reluctant to add more code to CTDB that needs to be maintained
unnecessarily.

Amitay.

