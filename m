Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 773C279A8F
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jul 2019 23:02:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pCNpzuwWUsosGTYsf9wMIecEjNAuFa1FuOjErmGyzTY=; b=yXChHQWql9Aua+9kfn2Qfb4E3t
	3UjFKfygx3cyPcR0EgIrUF+TVnQa04e6YNqLFAcIoSpwVVonYmUJHu/Ob57X6XzikJN8y3tJzocZB
	ULjKdWWMj0Kv67YLo03+EstnkIWEL7eblQnkS0/thErD0Ouj2aZv47kd4VSxVsDs4xbKWWTJoqZVk
	9c9oP0EbmMfzQQyN9ReebMeCupEuXRKeJNdc0kLjGAj9Nr500bCOfRq6cKYZd+CHt3bE/Zf5GkFO+
	iuHlNW5EHcTmWgs+mYMCa1XvSWdtPhMqYGrG9M+Axx4ppMGr5pv3keh153f3Mf+Gd0aUnvX8o7um6
	2o9lhJnQ==;
Received: from localhost ([::1]:45454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsCmn-000pwU-Qj; Mon, 29 Jul 2019 21:02:25 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41414) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsCmj-000pwN-JN
 for samba-technical@lists.samba.org; Mon, 29 Jul 2019 21:02:23 +0000
Received: by mail-pf1-x441.google.com with SMTP id m30so28643914pff.8
 for <samba-technical@lists.samba.org>; Mon, 29 Jul 2019 14:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pCNpzuwWUsosGTYsf9wMIecEjNAuFa1FuOjErmGyzTY=;
 b=IzkmLlG01iGRvF1fuT9sUpcTZ8HNaMRFXgkiuyHjOlv1v4e80dFXcDNCkJSpgbHviS
 66yN76dRHF2Z1+udiS8D7QUlQWUq76W0yvUwff+NjEdKXMA4lm/uLdoWeMXEY/JIz35a
 9CfxeSht5hm73ZHRBWBZvkLUDqkDb6nYIVlGkEHts1IoMp1SfIvtXJTJfVQLISCyWiFr
 8FWXJsmGqDXWnwFNSu28tjSTfXXYJjg5HqH0VdfUCo4o0hMsNSL00dDZ7/8WC2XHm0aw
 FCVx1e5xJunWEy+gbKuZr3Ag2L1BboIkDZldQD3fAR5o5Z3pA79jwqk2ww3C7rzjqjks
 RRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pCNpzuwWUsosGTYsf9wMIecEjNAuFa1FuOjErmGyzTY=;
 b=UzjZPhz2yrYKNvHC6rsF54z7SOSF78NvHd1LpAt1CbjAwqaVWKETR4xVo8JFKPvd+R
 oMCtC0nkrcDn1ob+Z+nwvEMuCLiHN3bS7yTgP9vDiTHAk8aiOl1SRoQXu504Hir9lUhB
 Ka7Ymii6XaOxVFIZaVqFD8zOTdGLnGbT62xWjR28f/UJw0cbSfhHAuUUq2NMzgFrT+ci
 ZEm98oPF1sBuKIzm6vgwbny6If8B+SdshsHf+xIga1yi1QFwiUQVML6AVhxsdWPZ8ALi
 q4uSVe2rehIDfFEXniTUz4kql8hkhoZlGbkqG0lvQIZPjzUD8BE1ewIXVclTeLDb6KA+
 +jyQ==
X-Gm-Message-State: APjAAAUoKPndrzRhsuRpXWxKBN3Bu+qqnPnKtvk0sx+NRZ7IYZnkJ24v
 Zfqis7E3xj4RdqYwT4Lhj3ijqmnmj1PkTc8JMHE=
X-Google-Smtp-Source: APXvYqxDtZjmODAKtklRhXQGC9Kd6fBk52lB5D4XWhYnxwECEfhajzkSfeG+l0H6OXO4Hp/CHLdhk7XmV3RFasbI5bI=
X-Received: by 2002:a17:90a:360c:: with SMTP id
 s12mr115548659pjb.30.1564434139195; 
 Mon, 29 Jul 2019 14:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <380e1b86-1911-b8a5-6b02-276b6d4be4fe@wallix.com>
 <CAKywueSO=choOsw6THnEnmN4UwhACHU1o1pJX8ypx0wjVTmiKQ@mail.gmail.com>
 <e6246145-8143-ea69-6471-6cc593c95324@wallix.com>
In-Reply-To: <e6246145-8143-ea69-6471-6cc593c95324@wallix.com>
Date: Mon, 29 Jul 2019 16:02:07 -0500
Message-ID: <CAH2r5mva1S6Z=4fiQ986Hv8dA81Liy1C7FGK7UoyvNmt5ZqWoA@mail.gmail.com>
Subject: Re: PROBLEM: Kernel oops when mounting a encryptData CIFS share with
 CONFIG_DEBUG_VIRTUAL
To: Cyrille Mucchietto <cmucchietto@wallix.com>
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
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Sebastien Tisserant <stisserant@wallix.com>, Cristian Popi <cpopi@wallix.com>,
 Pavel Shilovsky <pavel.shilovsky@gmail.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

If the patch is an improvement - I am ok with it.  Unless one of the
mm experts has better idea

On Fri, Jul 26, 2019 at 1:28 AM Cyrille Mucchietto
<cmucchietto@wallix.com> wrote:
>
> On 7/25/19 10:35 PM, Pavel Shilovsky wrote:
> ...
> >> mount works without CONFIG_DEBUG_VIRTUAL
> >>
> >> If we don't set CONFIG_VMAP_STACK mount works with CONFIG_DEBUG_VIRTUAL
> >> We have the following (very quick and dirty) patch :
> >> ...
> > Thanks for reporting this. The patch looks good to me. Did you test
> > your scenario all together with it (not only mounting)?
> >
> >
> > Best regards,
> > Pavel Shilovskiy
>
> We've done some tests (mount/unmount, copy/delete/move files) and it seems
> to be OK.
>
> We aren't sure that our patch corrects the root cause of this issue, as
> for our
> understanding, kernel stack with VMAP_STACK enabled might not be contiguous.
> If the stack is too big to be on one page and data are splitted accross non
> contiguous pages it might not work.
>
> Regards
>
> Cyrille Mucchietto
>
>


-- 
Thanks,

Steve

