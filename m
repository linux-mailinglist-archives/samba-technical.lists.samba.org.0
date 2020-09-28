Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1054427AB85
	for <lists+samba-technical@lfdr.de>; Mon, 28 Sep 2020 12:09:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GGGJeBCzztouarq92s02DLdHwGk+J7Se1gtNJVPsriM=; b=RQFDaHhIkkl37xV2Avu1WZ1C2X
	AUTe2+APrg+FB4OxM9+c/E1g33nMIHojZOVYNPeZR2jZ8AefnFpTcSsgqIO1M+G+pk3pU5kt3Ry+O
	YfhuCjnhKrC21QuR8P5d+igLMx3Yc4zPSdnIzPAC6TOIgd6RUSYX5gPR9FTEMqwBb8a2fsEiU9acZ
	impj6ZKuB9xu/XPOP5f61OSqXh2V/H//jCN8NEc74/SCfeiiKJgOPK74BMRS9F9s3feUhnzpWAwsa
	G2IhEWUD6ncfDh0q/bKe43DvR2dU5VO0B9P+Rtu8bkdfKGSBMgiZ3xLDpCPkhkDSDnn106Od+VBZm
	MSwzIlAQ==;
Received: from ip6-localhost ([::1]:20766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kMq5i-007gL1-US; Mon, 28 Sep 2020 10:09:07 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:46919) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kMq5d-007gKu-3x
 for samba-technical@lists.samba.org; Mon, 28 Sep 2020 10:09:03 +0000
Received: by mail-qk1-x734.google.com with SMTP id f142so378273qke.13
 for <samba-technical@lists.samba.org>; Mon, 28 Sep 2020 03:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GGGJeBCzztouarq92s02DLdHwGk+J7Se1gtNJVPsriM=;
 b=WSgb3AJSfzaDLgTZgBFSxRVWwRaZSDg0U4oGdXhMst/07yRKFsYGAyk3CxFiLEflXz
 8aeQ87/t2HO488+74zIw8QNNrU4HmC7JKnLq0vL+0txKUAYmFwd0WNyBf8+EWPGEWDmx
 F9LTsikLtVZbiw4GHO/7jjdhR6n4TdvW1kL752dCM4GINQOuzWbOB164uXeSxpiVPFn5
 Z5v6/LWu0KooTyJ0SbSWHHQD7qIvwsBHcxvovC6q46sbkh1bzljeLmK1GIWAchY0y3/8
 l2gMxzqaiavCMxPXKPjbOTZsdisueDbr220TVAkLweFDLFgmvdZRdyJtezpBHCjb4ORL
 oKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GGGJeBCzztouarq92s02DLdHwGk+J7Se1gtNJVPsriM=;
 b=FfNDEtOQHOl/VUEaNVS89AMvjlPWLpAVZ8y2ZYBDIU6o/EE4xXuoqg1p3jSlr051pr
 am9rAoFecvAw4SomqIWqlQmBqkXHMMV3Dic90ypGNvvm1bhuwhMPW4ODL7Phst086JV+
 RHefYBCCl6rnN2hRDQ7Z4jq5tejIFmssIENn1J9vzUs4fDJASckj1yD5YIhcDXMu402Z
 NB+JtNSp3C7RiEZbWfL2kOR9WkrwSD7kwkFPFhEsvxqTOxJkHKxCoTGIPntOUWnw/yrE
 Bz+uBity9IXRpdt0uZcYK4MjTwONcQnTKnOOFJjxjm9ZM7hHpK0k5Wv2gVCpqXmovZN5
 fJZA==
X-Gm-Message-State: AOAM532h8HhvshIQvftzyD6mLQUVMLKuEW50Obu00JdxvVNhrD0GryX1
 33GPgcM2yzBZrjs7kd3RK0jHccdZ3fF05vD6dK+f+2IvuHU=
X-Google-Smtp-Source: ABdhPJzS9uGcuzf9uUWyb1VjMEmp1bOZTaF3hG2su+zl0hcl9UUXxnNbUVJQ7SvR8oUmIGe1JL35jV8Y2xi4Dw4ByqA=
X-Received: by 2002:a05:620a:3d0:: with SMTP id
 r16mr632612qkm.129.1601287739335; 
 Mon, 28 Sep 2020 03:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8S+4hyY+dsWLFPcfxjR0thU64SrCGX8u8n_3YEi-0RwVA@mail.gmail.com>
 <d8a1a7eb-b20d-9236-232f-ba1cb51a59cc@samba.org>
In-Reply-To: <d8a1a7eb-b20d-9236-232f-ba1cb51a59cc@samba.org>
Date: Mon, 28 Sep 2020 12:08:48 +0200
Message-ID: <CAC-fF8QOT0e+5Jih__jFs3XLSDGE607y8rqV35eqnAJ4TXf++g@mail.gmail.com>
Subject: Re: winbindd callbacks not triggered
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

On Mon, Sep 28, 2020 at 11:09 AM Ralph Boehme <slow@samba.org> wrote:
>
> Am 9/28/20 um 10:51 AM schrieb Isaac Boukris via samba-technical:
> > Thoughts?
>
> have you tried setting "winbind:request profile threshold" to something
> like 5 or 10?

I'll try that, thanks!

