Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 207FA3A4BD6
	for <lists+samba-technical@lfdr.de>; Sat, 12 Jun 2021 03:03:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Vy1yHSB7QdKoB1Ad0rDI6r8t+sFis1sfjS2gVqOj4YM=; b=YucCFEsvvWWv0VeR+V+Wx9/wCe
	VaxA0+jEox6FcbOQCXk4yM4zhP8fPZXb1kHvxUxed//bkIpZuqDqV4vkmgFNbcoB2ORPHNgHZyGJv
	0N8cPniXWpl83lz3US36fRNCV6rkC3lxHcMGXNFg9/+9bxoxMOV0p0+gsrzBhmpWlSIFx0MQoshtg
	4wRYgpx75mtGYBaCMULi+qf1FRoghh5nAbf6CTtdf+z49wEUaS9ofjtBt2Xmu5BrA27AtF1hnLMrf
	APtBKbPkYIk0/5I5EuR9HxRWZ9jW2jY/cgo1ElAVMxvTKXpqhqKQbkJ5pTpDjGCOYWggdGq8NdpAB
	qtx6otxg==;
Received: from ip6-localhost ([::1]:28552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lrs2U-005LhF-Aa; Sat, 12 Jun 2021 01:02:18 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37478) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lrs2O-005Lh5-Al
 for samba-technical@lists.samba.org; Sat, 12 Jun 2021 01:02:15 +0000
Received: by mail-ej1-x62a.google.com with SMTP id ce15so7056584ejb.4
 for <samba-technical@lists.samba.org>; Fri, 11 Jun 2021 18:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HWrGBO0Ss3W0YlvvEWad3Dvp88JF2iGF/PZKrMHmMlo=;
 b=NacLFiT32APJpLgdTOcRFJVWY638qXSaNPKhD6S53ROvBqn1ug+BFAwuWheWxbSR0d
 73hWIELU6t2J1vLYzvCPlibCa80pIvd4UckJpw+y11gbagM3XCtWe4ZyALAebQdbZ3tn
 lWHlkSpbRgv3HSCpjZOwqGhZ+nF3KP05txeVgFYhAEdL9+fNa78yJAVohq6EHOfE78YY
 AzUNBfnXRtzs4D14ax46dgcoX39BqinAjay7Eq0xIWaYHCf+4Sxx2gwsYSa8Yky59uhj
 w4A/o5Oqn19PnP5Rf8T8wbmE2SLX6iuCWMrLZzisy+ELnDngXpfHkbc94d3HWHNGJDtF
 vnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HWrGBO0Ss3W0YlvvEWad3Dvp88JF2iGF/PZKrMHmMlo=;
 b=j0hhdyi5rAZ3eho4mb8cCl1GK769+TidwaDKXrd2zwX4eK1oU4nE96TFuTjavK2Tp/
 o9gW5k7OTpKWGjWF5D4SOu4gj6rJ2f+S7BBPpfg6ztNHUp+2kupU/4smfKjjntPeuIOJ
 ujmOtSonAd8uNmkneMcNXvZP3yG0LSCVK8by6Ug+NheTcCbdjiRKGMOlrXb8x1MwiABu
 jFWouf3l3Y1Di6RJsco2f/7keeIm6nI556H7kCDh/lk5Mb71EQP0et20t8H+ht8DsleT
 TaL4RvfEN2Pl3SsU1xnzqXs6wJ9Mk4lm0Yv6uK8+UE5rQ5zPQjxQumC3OvzFgBdMw5wz
 Z8rA==
X-Gm-Message-State: AOAM532/YDtqMSTiY8+MDD/nRfsV+qYeaj+VP/Hd16FE8iUZKPt4m69E
 c6pGfZlV0oB2W4R3KNYxXjrKVgaSv+KSPl3oAAK+QQ==
X-Google-Smtp-Source: ABdhPJzgZ203SmUuAaSAbDFoqk9l3wcrBwwbcOgC/L4oSHssYZkGTh3Tq7JzuzICZ0pzLkjmzZkT9DExqmEktiLUwuE=
X-Received: by 2002:a17:906:e2d6:: with SMTP id
 gr22mr6076511ejb.514.1623459731617; 
 Fri, 11 Jun 2021 18:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAJwt-Jns5=XneYgidODs+SjJmWvoq=BhwbvRA0Z4SDKLgdZs3Q@mail.gmail.com>
 <CAH2r5mvv8dn+u9JVMJo0dvQ_Nk2esO-uDY4J=equS6AcMgSbOg@mail.gmail.com>
In-Reply-To: <CAH2r5mvv8dn+u9JVMJo0dvQ_Nk2esO-uDY4J=equS6AcMgSbOg@mail.gmail.com>
Date: Fri, 11 Jun 2021 21:02:01 -0400
Message-ID: <CAB5c7xq-OrQ2VCAm3xuA2VoCj=Ek+LDpP_5AhjM8v337=0cG0Q@mail.gmail.com>
Subject: Re: Is it possible to mount a cifs share with kerberos using the
 machine account (with active directory)
To: Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jun 11, 2021 at 7:57 PM Steve French via samba-technical <
samba-technical@lists.samba.org> wrote:

> ---------- Forwarded message ---------
> From: Bruno Bigras <bigras.bruno@gmail.com>
> Date: Fri, Jun 11, 2021 at 6:51 PM
> Subject: Is it possible to mount a cifs share with kerberos using the
> machine account (with active directory)
> To: <linux-cifs@vger.kernel.org>
>
>
> When a Linux machine joins an Active Directory's domain, a computer
> account is created.
>
> A network share can be configured to give rights to the computer account.
>
> Can I use that account to mount the cifs share with the computer
> account (with the keytab file)?
>
> Almost every example on the internet is about using a user account or
> using multiuser (which also uses a user account).
>
> Thanks,
>
> Bruno
>
>
> --
> Thanks,
>
> Steve
>

IIRC there are some applications that will use the machine account to
perform operations over the network (like backup applications). Whether
this is successful against a Samba server depends on the configured idmap
backend on the Samba server. If idmap_rid or idmap_autorid are used, then
it _should_ be possible. If you're relying on rfc2307 attributes for
idmapping, then it's probably not possible  since they can't be assigned to
computer accounts IIRC. This is hypothetical, and has caveats. I also
haven't tested with linux clients.
