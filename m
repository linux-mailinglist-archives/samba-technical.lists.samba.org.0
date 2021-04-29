Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3D736EA99
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 14:37:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DzMStwa7ZYpMx50/7fnRvZQUiKGeVtWNZTY8X4lMoKY=; b=bwH/CNY7x892YvKuY2ZMswYhkM
	36/nTRob+WyoAd6zSSUKxHCMiJAFWNIHUI/KFV0NUHeUjM10i7FPhNF/+jCwRLcy04t93Q/iIZu4x
	nfXfeGLwmcI9W8AEncrwo5WaytFNeb/2rnD8tzd0bBgXVskFXlRl63lb/fOn8B/QKc/BEIdNFt6S6
	2fD5wvt91MU4GQF5P3cAuVH+obFvJ0QbCPcPhKx1V5s+2UY3CseDdCkPYJT0aFYOMNHt44iFmKrhi
	FHRPDKZJYnV4OqouNO6Y1Fqh7QPyvv3Zm9E2stQAXydK9cKMPjUQA20FJkafiNjHdIiOBy3FHBEp2
	C9XqqgvA==;
Received: from ip6-localhost ([::1]:24716 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lc5v6-00D7M2-Qj; Thu, 29 Apr 2021 12:37:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38430) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc5v1-00D7Lv-Ra
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 12:37:26 +0000
Received: by mail-wr1-x42e.google.com with SMTP id k14so16843675wrv.5
 for <samba-technical@lists.samba.org>; Thu, 29 Apr 2021 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CT4UXMjCkR8VGFmYb5V2J+maNhp1crygGDQFoZCisCA=;
 b=c399s4Rxzi+riTo+ifIOE2sBHHZXyYuZlieTWHE4ywKnKONDZMzMIVF/NY+tdR5tL3
 5RJWyZgFyd1NbLnmBxDgzunNW5Alph/3oDRN+sST4tgmkedVdR9dJFELW4EY9xDM2HM8
 hinYtqcEJcQBcP50gMuKAJTY7SvhFfW/3on6WPz7COIdMGpfpL3l9miVtb9BTBaDkhmw
 R1M5PB2PCKLxsiAgQhOpll6y3Whjvlc5hJcMkKW1fwbmUezWrCFBG3uO27H3X70yzo2u
 oCpVYRLfJc1gjCPW2R3p4wLUMU7ZdXSYU537b8stdTNHNl6jvs3tMCFjCw6UxrjIopHD
 uqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CT4UXMjCkR8VGFmYb5V2J+maNhp1crygGDQFoZCisCA=;
 b=ahMMfeLBdqvSSKl9iNF6qarjPSFl+Yw8+rDwOfxw8ON96Pqub7QVVIxOzRGBPrIY/0
 gpg0jaLcf1I55XN4/AYaSZ1ANXRUxT2vXTV7nonKRnCFzM+GuDACAj/RrTjTFL5eB8Ut
 Qr9X8OUZ0QxbxeuKAVQvSM/FnV18wKryOV6sy/UHewesKmKNe2bz5Fe/q6AB4jnBcsvA
 y9ntPzgfejxnKtEQpSKYnVQY4JHxxmTdbFVLSZhA3ZQIln22RrKLxeMx2f5cX+qFSq24
 Ck1W701aT/0pkeKALoldb653X6SQygXd19ms0PCc2jekJS6UW+L9oHpeKUizmIxiMLCE
 MSpQ==
X-Gm-Message-State: AOAM5333WZRR9s8q1Xt1l3i/o5ViyH7SlM98i4qD7CtAY1oQmVRpLmUj
 dF9sJSrCAAUbS3SctXrbatJIyk6H/+mGBxTG/TEuaQ/IPwpefjh8
X-Google-Smtp-Source: ABdhPJyqrWZ1i6ACaklaD2dFLPlsgW9cYlASOlcvmK8LMvXrd2X++aYDx3tmVKcfQtvmlNMDh/RpgVvPEcmeri8JWNk=
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr6081774wrn.281.1619699842980; 
 Thu, 29 Apr 2021 05:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAHbM3qio_0K45DZbK5aYXPE_QAkku8K_XBpFxHQWksf=iK65uA@mail.gmail.com>
 <20210429034446.GC808221@jeremy-acer>
In-Reply-To: <20210429034446.GC808221@jeremy-acer>
Date: Thu, 29 Apr 2021 18:07:12 +0530
Message-ID: <CAHbM3qgQctYp2sYdpvt3NbtiJ+Dhv4h1KMsMgjnic4jLdONW4w@mail.gmail.com>
Subject: Re: domain join stuck at krb5_get_init_creds_password
To: Jeremy Allison <jra@samba.org>
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
From: Shilpa K via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shilpa K <shilpa.krishnareddy@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jeremy,

Thanks for the response. I do not have the network traces. In this case, we
were using 'net ads join -k' and 'net ads testuser -k'. But what I got to
know was that there was a firewall for one of the KDCs and Samba tried to
connect to it and the function krb5_sendto() got blocked in connect(). It
appears like the timeout value for connect() was 60seconds. As there were
multiple attempts to connect(), it added to the delay. I tested a fix from
heimdal which uses non blocking connect with timeout and this seems to help.

Thanks,
Shilpa

On Thu, Apr 29, 2021 at 9:14 AM Jeremy Allison <jra@samba.org> wrote:

> On Thu, Apr 29, 2021 at 05:55:33AM +0530, Shilpa K via samba-technical
> wrote:
> >Hello,
> >
> >In one of the cases, we had a situation where KDC was not reachable during
> >domain join. In this case, we found that  krb5_get_init_creds_password()
> >will be stuck for about 6minutes. Is there a way I can reduce the timeout
> >value for  krb5_get_init_creds_password() so that domain join will not be
> >waiting on this call for too long?
>
> Where in krb5_get_init_creds_password() is it stuck ?
>
> Is it the DNS resolution, or in the connect() call ?
>
> Can you give more data on what you see in this situation
> in wireshark please, and what Samba binary is calling
> krb5_get_init_creds_password(). That will help a lot
> in debugging this.
>
