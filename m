Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC7336F89E
	for <lists+samba-technical@lfdr.de>; Fri, 30 Apr 2021 12:43:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ujkAWHZ4CenG3z5lpUG2VDaON9Y5u0DiW0Z0x5NAtUk=; b=Wxyyx9dDFSyyvhe+MtWFXKLyka
	4PSYLjducydBMaGJXHaUOzaCMVs0SUXob2croeYCBSx1L5KEiI8C3fpugpVdHtp6cyvCxkqkFuU/N
	Q0hZou0CTsFdmUq92nllmyyAUHcEnYuQ5rclPull4kYPhEpSa0Z8U4LmT1LvZzqWdE1E2M/VTmJcm
	wzpj0O5d/yBRJyN8fFXt3FtN4GuZ5d5/lXD5RnijcuoUJkZsdYnvQpiRZNub55JaUcSZ68kgsbneR
	ToYczYjUw3U5NFHnxo0mxzR6Njl2Mb8VpWTMevn19KmpO1TeEv6+yzeSkZVjaJrAOcfBteOfKOgRa
	n4T7Eo/w==;
Received: from ip6-localhost ([::1]:42700 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcQbj-00DIVV-Pl; Fri, 30 Apr 2021 10:42:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35509) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcQbd-00DIVN-9M
 for samba-technical@lists.samba.org; Fri, 30 Apr 2021 10:42:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id a4so70045563wrr.2
 for <samba-technical@lists.samba.org>; Fri, 30 Apr 2021 03:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IHNuaBD/fl7eLeF9uqR+Rv8bKGnIMWSCa/NJp8iWmzI=;
 b=YgLzZ2Cd72p0Wqru+ohqGYonvsbX9MXHWaI00vTPCnB6vHjL0OiGH3pUBMniQ7R2cL
 4g340y+zQQ9KiRPTKKFgUCE++CXicdDyHsL16phYGQa650qfkhe6DAq84CRtAUGn5XA1
 CroTRekgFVAEAhacr3G5sIc1JnpYCzOEIncYSpMHNBJv5T1zyPuLOQZcj9eyzefxepbG
 35MKqM6mdybrBjaBSR9JeUxD1zlSP2ETx7UaphMrZaP3iO7EGJ3/xyn0X+2BtmWvNP9G
 03/J0p5byBKUcEaNAxEvlXkN9k0nV9bTOEHzHQwdbc29gKrQzR5V1Tk7EOfqUkQcVshj
 NnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IHNuaBD/fl7eLeF9uqR+Rv8bKGnIMWSCa/NJp8iWmzI=;
 b=gyDbgv2xoaUvKkAwF8s1we2gdU4t5Fqwp4Mm5HzmPNVb8Q7HhovJcjSJyJ11U1h7DV
 u8HifCT1EdiNzj6AmdnX78lES18bWJiD2JGvVOhGSZHAmSTJZuX+VPjGhzkAVUalBOV3
 z67EPHPE+ZTOY0Xo72PPGP23LaiKMcMqmBs69yUeoEaspAMG0AuP6Ss9L2B4w3GuR0x4
 WBfBvNOARTDz+O978DTOu5UwEBxr3PZ2yUIa19XYnZGbgqOcujZbyFtAH7yiQOuNHhRS
 yYNmdhU2o7dLu2nGctvG9Zl3+dHAcMj1vNigY+WMocUXTuW3PwNVG20P0eV8hYq4S1WO
 qB8A==
X-Gm-Message-State: AOAM533S2CzdtJECsqki/oVe8OZgHjFUVvPySPtuNrpxSwQD2JR6+s4t
 /wKkKWzkgVFyu9wWtGnOC2CUDck+qfJCyg0uEh6G5xuHFpNDCg==
X-Google-Smtp-Source: ABdhPJyTy6ON82O0aY4O5DhcZAVF830AiTkPf39I4yT3O6Ykd10ZpOa1haARRxAlqSmNNTm/4sCI424U2BgNxC0bEiQ=
X-Received: by 2002:adf:d22c:: with SMTP id k12mr6048450wrh.25.1619779361674; 
 Fri, 30 Apr 2021 03:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAHbM3qj_N3XKNC0q3nfmkqjDsGis+rRd8eSRUjs2LWYrUNZZyg@mail.gmail.com>
 <17822891.NNXsROtQf7@magrathea>
In-Reply-To: <17822891.NNXsROtQf7@magrathea>
Date: Fri, 30 Apr 2021 16:12:31 +0530
Message-ID: <CAHbM3qgUBhz0_UqVVHkAU3Q7RnmktCMK1WhW-qJo0fahoL40dg@mail.gmail.com>
Subject: Re: Fallback to NTLMSSP allowed if KDC is not reachable?
To: Andreas Schneider <asn@samba.org>
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

Hi Andreas,

Thanks for the response. I was using --user along with -k and provided the
password at the prompt. libnet_join_connect_dc_ipc() has fallback after
kerberos, but not ads_sasl_spnego_bind(). In the
routine ads_sasl_spnego_bind() which is called as part of domain join,
there is this check:

                /* only fallback to NTLMSSP if allowed */
                if (ADS_ERR_OK(status) ||
                    !(ads->auth.flags & ADS_AUTH_ALLOW_NTLMSSP)) {
                        goto done;
                }

It is checking only for the flag and not the password to fallback to
NTLMSSP. Is this expected?

Thanks,
Shilpa

On Fri, Apr 30, 2021 at 3:23 PM Andreas Schneider <asn@samba.org> wrote:

> On Friday, 30 April 2021 03:38:44 CEST Shilpa K via samba-technical wrote:
> > Hello,
> >
> > In one instance, port 88 was blocked while port 445 and port 139 were
> > allowed on the DC. In this scenario, when we tried to execute 'net ads
> join
> > -k', it was not working. But, with the below code modification, it will
> > fallback to NTLMSSP and works. Is it expected to fallback to NTLMSSP in
> net
> > ads commands if krb does not work?
>
> 'net ads join -k' without specifying a user/password, means that kerberos
> is
> required!
>
> If you specify a username/password it will fall back to an alternative.
>
> --
> Andreas Schneider                      asn@samba.org
> Samba Team                             www.samba.org
> GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
>
>
>
