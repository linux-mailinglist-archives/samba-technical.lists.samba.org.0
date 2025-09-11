Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E9896B530FB
	for <lists+samba-technical@lfdr.de>; Thu, 11 Sep 2025 13:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=J/buQccK88AayBkZLdHTD8rL7PNnaYcuDyk+/ec5h/8=; b=HtN6OF+by/JVAn+g3n6xPfrSgv
	WotC8J7Wf82dyeICbOlgbeou9YW69LPT+Pgoz21s2kvkUYymxxlUO74ZULYVERM5dGtOWtz11IOYt
	hrboGDBPXr6IVMG80p8LMLR1JsUehGnGZAsm4ByM6gl2fkHhq5bRLgsvtkKTwtEvqtBFz+pusuR5r
	nSLbcgC62Smy3zmzS5Ufg829G+nkUWDeCV0Owtok41I3KUHuoBSH3IcFO3Uxgc2rld763llw8i+pO
	9Ge3XBmbyi8UeonyR3C8YpXnRBH3A4nN8oRlC012iln0ac7ThXtLIYbc3llhAIFPANM0JNUxVSALw
	Vk+pstvA==;
Received: from ip6-localhost ([::1]:65248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uwff6-003YB4-9D; Thu, 11 Sep 2025 11:40:24 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42456) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uwff0-003YAv-C2
 for samba-technical@lists.samba.org; Thu, 11 Sep 2025 11:40:21 +0000
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b046f6fb230so119940366b.1
 for <samba-technical@lists.samba.org>; Thu, 11 Sep 2025 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757590817; x=1758195617; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J/buQccK88AayBkZLdHTD8rL7PNnaYcuDyk+/ec5h/8=;
 b=aOvkPNiC9qh8p33evGqT9R6BkJIYSiB6nNLvSEZQSxong3VX67unMOc1i4CFChf7un
 nvyMZTywj7EfWyRI/gAjfjCYJjyWBniaxSLjOVkQb5IZJfVB88xnrEkI7qBdTaGvGfFe
 hYv22NxswV/d/gL7uYIefdcT29yvr97wvozMK+b5uF4oXS0eG5sP/oEkN20EGyCrnpu/
 CMwQKtzIOjMk07SL2OG9ci1aV0K4ZuvVZ5Cb6lBmxS0axhJUSV1oWn/t+m7xQxeCs3L8
 T/ZDVzQOWcuAzd8MULujJVl9vbZ7zj6paFR+DtqCzpuf9DnfMMqvnnQ3N7b57BLR0H/4
 NQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757590817; x=1758195617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J/buQccK88AayBkZLdHTD8rL7PNnaYcuDyk+/ec5h/8=;
 b=EHWv1uquFpdiPm+5fMvGR3/0FPgGklDglnJsRuRfigGqlvQjHcubhhdl3d8pR9rD77
 +yOjYtLI8KImyh337ATf3HeRKdN0cOUom/jYbVn1vnC2yejz9XleokACez4u6p/gEIMA
 PQiMiFfpW20SloltnD/Pot1zi8tkWBmewOYDN3u16WtQ2UVHY0m/KnNVfXvASkWcbFZk
 QTLKRk61RG6eBJat1xnc/Rs+Ttz6hGRwsZLxlsvIzm69/H2LeTI4aLhbY+sIpx51ESEs
 qmm6ROVHvaheOvoJEFIB4AGeGw0orPujRJTHChmP6A6fuWWwBFaCjMTlIfJOwpOdWHRW
 ne8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHOIE05/p6KbwViizM32qSJhOPsq3pX6r5xBaTt9gho9Jo9YZ4pGKwGTFFKIg+Pyw7f281rJSk9Pwxa5xJvwA=@lists.samba.org
X-Gm-Message-State: AOJu0Yy72vUkYGK6pthTcOGLq4YvcrPBHoV0aR7UkbHC9t+giBm20fko
 I4e+eNw8nkOSjH7vhXuKni8zZrKNBaR1Twr/sWUQo/knk3LVWH/owxd8ao0eKLZRRhnvhshRP5J
 6+Vf8jD68EmWIFSJnX22KvwiH4+SvBBw=
X-Gm-Gg: ASbGncu5oXaQ+acI6q5Qu+i/XL5gvaRziYUAd7Y8tZyvtCg+2FniUvWmaoVNlQ5mf5E
 8v2pbFKtBUwkaHj7d5Sz8jrDI8tRQgZeiiaWvsXwJgLpNJjy0Nxo8rz9tUaqMEaqCp6C+9ZZ77L
 2TZNX700TEVqc7zW076i3enX71A4gsv/JuszVMvaY4E41AHn6C3ogoPhWic8XpGv/1ItGU9B0LT
 G1bhg==
X-Google-Smtp-Source: AGHT+IEAc+suiNpxsaxTVE3JcGvm1yFRs9zplv7RA6o4nBsX4YPEhrbynV7aXjNM8Ha/ZQ2Tm/hltcx7EhAS+r7vEDg=
X-Received: by 2002:a17:907:3da0:b0:b04:46df:5cb6 with SMTP id
 a640c23a62f3a-b07a62910c5mr336372566b.1.1757590817068; Thu, 11 Sep 2025
 04:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250911030120.1076413-1-yangerkun@huawei.com>
 <2780505c-b531-7731-3c3d-910a22bf0802@huawei.com>
 <2025091109-happiness-cussed-d869@gregkh>
 <ff670765-d3e2-bc0a-5cef-c18757fe3ee0@huawei.com>
 <2025091157-imply-dugout-3b39@gregkh>
 <95935128-69fa-2641-c2a7-9d9660e2f9ba@huawei.com>
In-Reply-To: <95935128-69fa-2641-c2a7-9d9660e2f9ba@huawei.com>
Date: Thu, 11 Sep 2025 17:10:05 +0530
X-Gm-Features: Ac12FXz3BiUAfn24EQJMYs0OoXCzIGFjpCrrcdfX5wINxcOzJGdakBPduJhBPyk
Message-ID: <CANT5p=rE+=g7KA0RKOxs2UCnMEKfr3cm2V_+mwdb1g7+yV8NtA@mail.gmail.com>
Subject: Re: [PATCH v3] cifs: fix pagecache leak when do writepages
To: yangerkun <yangerkun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, ematsumiya@suse.de,
 Greg KH <gregkh@linuxfoundation.org>, samba-technical@lists.samba.org,
 yangerkun@huaweicloud.com, lsahlber@redhat.com, sfrench@samba.org,
 dhowells@redhat.com, stable@kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Sep 11, 2025 at 4:55=E2=80=AFPM yangerkun <yangerkun@huawei.com> wr=
ote:
>
>
>
> =E5=9C=A8 2025/9/11 19:17, Greg KH =E5=86=99=E9=81=93:
> > On Thu, Sep 11, 2025 at 07:09:30PM +0800, yangerkun wrote:
> >>
> >>
> >> =E5=9C=A8 2025/9/11 18:53, Greg KH =E5=86=99=E9=81=93:
> >>> On Thu, Sep 11, 2025 at 11:22:57AM +0800, yangerkun wrote:
> >>>> Hello,
> >>>>
> >>>> In stable version 6.6, IO operations for CIFS cause system memory le=
aks
> >>>> shortly after starting; our test case triggers this issue, and other=
 users
> >>>> have reported it as well [1].
> >>>>
> >>>> This problem does not occur in the mainline kernel after commit 3ee1=
a1fc3981
> >>>> ("cifs: Cut over to using netfslib") (v6.10-rc1), but backporting th=
is fix
> >>>> to stable versions 6.6 through 6.9 is challenging. Therefore, I have=
 decided
> >>>> to address the issue with a separate patch.
> >>>>
> >>>> Hi Greg,
> >>>>
> >>>> I have reviewed [2] to understand the process for submitting patches=
 to
> >>>> stable branches. However, this patch may not fit their criteria sinc=
e it is
> >>>> not a backport from mainline. Is there anything else I should do to =
make
> >>>> this patch appear more formal?
> >>>
> >>> Yes, please include the info as to why this is not a backport from
> >>> upstream, and why it can only go into this one specific tree and get =
the
> >>> developers involved to agree with this.
> >>
> >> Alright, the reason I favor this single patch is that the mainline sol=
ution
> >> involves a major refactor [1] to change the I/O path to netfslib.
> >> Backporting it would cause many conflicts, and such a large patch set =
would
> >> introduce numerous KABI changes. Therefore, this single patch is provi=
ded
> >> here instead...
> >
> > There is no stable kernel api, sorry, that is not a valid reason.  And
> > we've taken large patch sets in the past.
> >
> > But if you can get the maintainers of the code to agree that this is th=
e
> > best solution, we'll be glad to take it.
>
> OK, Steve, can you help give a feedback for this patch?
>
> Thanks,
> Yang Erkun.
>
> >
> > thanks,
> >
> > greg k-h
> >

Hi Greg,

Steve can give you the final confirmation, but I can add some context here.

This bug was never fixed upstream since the write/read code path was
entirely refactored (with most of the folio maintenance
responsibilities offloaded to netfs).
We've recently had at least a couple of customers complaining about
this in Microsoft, following which we've been able to repro the
growing memory usage with a certain type of application workload.
We've also been able to verify that the issue does not reproduce when
cifs.ko was built with this patch against the 6.6 kernel of Azure
Linux (and that kernel is mostly equivalent to stable 6.6). If you
need a confirmation that this patch fixes the issue even on stable
6.6, we can do that check.

Additionally @Enzo Matsumiya also mentioned that SLES had to backport
this change to their v6.4 kernel to fix this folio leak.

--=20
Regards,
Shyam

