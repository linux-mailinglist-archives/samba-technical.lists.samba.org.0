Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FBF324B5A
	for <lists+samba-technical@lfdr.de>; Thu, 25 Feb 2021 08:39:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1f8E1P2pGTdUDkLDMpF9v0CslqPA3HGGhTjYJrJsX3M=; b=5fSGzMmvuQTf7YnChiaPmGsdkv
	GbH/VUyCZZ3HBoYAu6zF8/60O3YFGsVlmB0dFtBk6KfEQJ/eWHufD8YyXJW0t4cR+KiUBtVdTE8nH
	i6Dra/GPC01lJRd3NXGHM1OWAxdgwUMgN4RumsNNicK4zfx9cggBsP5DaLppv/P//69YUWoVv7OtA
	cDZBrQf+lWqGsosIjkNthk9Ayt5eeWnxHbH+y35iFkb8xwDl0fHZQ4fvRs1tTKX+AqFqL04oDpZMa
	tAdmXXYaIcUuCosQgsc1y0/XJhFKFPllnoUfpaif/33nDWH56/aMETwQ+D6B1qoBTwV5mi7kyyesh
	lZJIVGGQ==;
Received: from ip6-localhost ([::1]:27670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lFBDr-001I9R-Q2; Thu, 25 Feb 2021 07:38:07 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:43661) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFBDl-001I9K-0h
 for samba-technical@lists.samba.org; Thu, 25 Feb 2021 07:38:03 +0000
Received: by mail-io1-xd2a.google.com with SMTP id f20so4880582ioo.10
 for <samba-technical@lists.samba.org>; Wed, 24 Feb 2021 23:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1f8E1P2pGTdUDkLDMpF9v0CslqPA3HGGhTjYJrJsX3M=;
 b=VA0cX86FGbvMKuOI0m0PEInj72Y36sNpI5/70irqMap6yqs1Yta4O9l+BG4q46p/6u
 Azc35Hd6ngWB6+KW+pgtlumq6RNPrOvTAoqYMHR86Lahojzmw9xyCkYpFOQ6/jeDXhP4
 HFMkp1RNtEvtmRtBQ/E6a9RRkqiXXiiT2q1ksqoC2KQMiBXYWnjKglmdgzPXorbmYRTg
 YOZ0Ew7IOr+bSUrwn5QEL0fnQZk9OIc1YonZwiT0v2wMMTEI9UWf957+evG/T3SwLSih
 j9DTQ+dWZ/kttOaNfBQ1Y9SuE8Yvqs88ZdTMl/jhijfst8tcnP5rrNllVpG5S8dMqYdF
 TFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1f8E1P2pGTdUDkLDMpF9v0CslqPA3HGGhTjYJrJsX3M=;
 b=W6m/KhY/a+u5BQgvNgbJWlEu6qO4TSVPwdYQRzeHKskFvEBaqdA0ptk6JO+V7JZjRk
 lGRaW2KSKaOh4aR/HVKW0y0eGZzLYkeb7Qrus0/TlmoqN3ncyKb1tcZgrb6s0/Uv0XmC
 +K34dfep/z+uefNKrvnuY0duF3taRy42Em5JmAw18tz31ml5D2Z9YfXcAuyHI7VUMEpc
 IRaow7UyD45gf3ZdgZyuQfefXJ/7eyUI1scYoSwQ0yMjAGzMg6P2nyFzlFvWyDecpALO
 rpv0jVboJlkWLMpJUCs87n/GjhuZjh56jr7fSiK2aV1brSsWaVBBN1hfXEJQFfPbbeia
 wYRA==
X-Gm-Message-State: AOAM532w4rwIhovhifRGF2hmKClUVfWgLWDhsJmCNhCsBEKY+IcG+i3m
 p0mwZ8OI1EiZmupbdwnMLiYArnPW0igJorCAMkM=
X-Google-Smtp-Source: ABdhPJx6i2DSsK0nrnULUaYbRT7ykq7it2VJDvXmC2xXQWBwY2nM+F24O+XjZAzKzg2fzrZoVi3eYN5EatqFn8wUtME=
X-Received: by 2002:a02:ec5:: with SMTP id 188mr1960434jae.20.1614238677775;
 Wed, 24 Feb 2021 23:37:57 -0800 (PST)
MIME-Version: 1.0
References: <0736dea6-ab54-454d-a40b-adaa372a1f53@www.fastmail.com>
In-Reply-To: <0736dea6-ab54-454d-a40b-adaa372a1f53@www.fastmail.com>
Date: Thu, 25 Feb 2021 17:37:46 +1000
Message-ID: <CAN05THRTEXjZ+TQB+X2kA_i8CgKctBDB1UhbifAu0WzqHOuNmw@mail.gmail.com>
Subject: Re: Using a password containing a comma fails with 5.11.1 kernel
To: simon@simon-taylor.me.uk
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Simon,

Looks like the special handling of escaped ',' characters in the
password mount argument was lost when we
switched to the new mount api.

I just sent a patch for this to the list,  can you try that patch?

Thanks for the report.


regards
ronnie sahlberg

On Thu, Feb 25, 2021 at 2:56 PM Simon Taylor <simon@simon-taylor.me.uk> wrote:
>
> There seems to be a bug mounting a share when the password contains a comma with the 5.11.1 kernel.
>
> I used a credential file named commapw
>
> user=CommaTest
> pass=beforecomma,aftercomma
>
> and the mount command
>
> mount.cifs //workstation/arch /mnt/arch -o vers=3.1.1,cred=/root/commapw
>
> This successfully mounts the share when using the 5.10.16 kernel but fails when using 5.11.1.
>
> The debug log was:
>
> [ 3835.380355] CIFS: fs/cifs/fs_context.c: CIFS: parsing cifs mount option 'source'
> [ 3835.380360] CIFS: fs/cifs/fs_context.c: CIFS: parsing cifs mount option 'ip'
> [ 3835.380362] CIFS: fs/cifs/fs_context.c: CIFS: parsing cifs mount option 'unc'
> [ 3835.380364] CIFS: fs/cifs/fs_context.c: CIFS: parsing cifs mount option 'vers'
> [ 3835.380365] CIFS: fs/cifs/fs_context.c: CIFS: parsing cifs mount option 'user'
> [ 3835.380366] CIFS: fs/cifs/fs_context.c: CIFS: parsing cifs mount option 'pass'
> [ 3835.380367] CIFS: fs/cifs/fs_context.c: CIFS: parsing cifs mount option 'aftercomma'
> [ 3835.380368] cifs: Unknown parameter 'aftercomma'
>
> The kernels are from Arch Linux packages:
>
> Linux 5.10.16-arch1-1 #1 SMP PREEMPT Sat, 13 Feb 2021 20:50:18 +0000 x86_64 GNU/Linux
> Linux 5.11.1-arch1-1 #1 SMP PREEMPT Tue, 23 Feb 2021 14:05:30 +0000 x86_64 GNU/Linux
>
> --
> Regards,
> Simon

