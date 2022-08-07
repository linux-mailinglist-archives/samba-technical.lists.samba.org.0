Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E78158BE53
	for <lists+samba-technical@lfdr.de>; Mon,  8 Aug 2022 01:35:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=QgCxyLvTh19j6tVaZZIEY9cxpwEfMK0/gtU3iupqUe0=; b=ZPo8I4c5t3q69eGDuztCYcCKPV
	jmlmn2pKawnqgVpNX3JGS3EmN4H1kWwvPf00Qpoyk0Klt5LwbglNWJ9Fknb6olAUORxYPvJC15DvZ
	jXrco+FLL6Mb9TWxcf8VdWVT8yuKwrCyWF6Lj+17Mo6hkNfjq2v2R21a92t468uaYW7wAarC+/0FO
	5a7VlnbomF2IS5jZUTIibfYqDwELr3pOgfGlUhsjKSVc7CSw8tucRiqou5Hxuw1HcdMOZZGGKbN5z
	9/54fCmdWWbgY0NNHLxY5SOWrgRFiaxBdgqvcVIS37eAhAUUrbs8SHwKgSO2sdutNDQY+jab5sRD4
	hxRb+vEw==;
Received: from ip6-localhost ([::1]:41474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oKpnI-005zWM-He; Sun, 07 Aug 2022 23:34:52 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:35651) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oKpnD-005zWB-9f
 for samba-technical@lists.samba.org; Sun, 07 Aug 2022 23:34:49 +0000
Received: by mail-qv1-xf33.google.com with SMTP id b7so5376498qvq.2
 for <samba-technical@lists.samba.org>; Sun, 07 Aug 2022 16:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc; bh=p7albqQTPmcIAZdfPAb7wH8VLsoteiq09jzPjqW6D88=;
 b=Xqs1MKpVVieMCCanbdxBjeT4Dy9+1ZByxxsDlNssIl0jhTgzA9XZEO6vbwI9ywjeg6
 07hszRO0asCWNxPR79UzMEwr7YMIUWxqekfA6MZWS12rD/mx38XBBDKVcYqnfUYfeGtG
 lB1PwYVoafGWJnHo+/T7I361IydtJ0RV2R9GoQWizauZZVakAUaAa2om7BDT4FBJv8bx
 avcAc/LnBn2oDm6K9uzFhYHoss7rtxJa+Tce64DpD64q0nmXOgQEjPF1iTd/CVDDnwDz
 kgWG5Vxf8eso6F6wK9Xe3fUW7MyQ8SJAvrq6wUXYcu5923r6EcH/gRAW56Ro89P9TLGO
 cwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=p7albqQTPmcIAZdfPAb7wH8VLsoteiq09jzPjqW6D88=;
 b=j2kWgnYS0k1oB/acY5VvhgCdm7SNP2Br0zIHy8cJhKzj+xtATjLmlwx6YX1O5DYujG
 urBkF1pmmq3XyjD4f6kHtM0ta3nFmiSDNwROwQsgu5iIs7Q3dfL4ayrMcjGqeKQhKxCH
 pQwhN/G64CKWSBKsN/jKd9PVkog5coHnSryTXQUn9N1vWqYF314na7zAkW4AtnBw3gGO
 xaFk04rYQDSitcjoLBTTXgbDkVxqr2Xg7kxhzVdjQqOcRq4+EeQjeTu0Jtq93NUwSJgE
 PuuEQiqdb4LAFTCZ6Aisg/1AKT1/CfwqFR3VtvfcMQXByU9inbqKyqtXsnERBD8BcPMs
 +IBA==
X-Gm-Message-State: ACgBeo38Fa5/hyIm/XUME99sc5g53eGMwHklTj4sifWxPJWY0XryCtVT
 RFRBDRNulLRlDeAHuXJ/3pN1JzDcuFvBVSAu8DdRjoGB4xKgp3lP
X-Google-Smtp-Source: AA6agR6+CLwtxsgwEcJqY9YgJInQwgmZbIHw7T+WZOc39qAiJkp1nMtnfxSmbxQz9VlpjNaAfdROe6XGs0zKXkyd/44=
X-Received: by 2002:a05:6214:f6c:b0:476:6e82:7af4 with SMTP id
 iy12-20020a0562140f6c00b004766e827af4mr13550304qvb.129.1659915285300; Sun, 07
 Aug 2022 16:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAHA-KoN_GK3f0RkYqGvsPGahL6tPJ=2RjqRFVsTQRB0F56-rQA@mail.gmail.com>
In-Reply-To: <CAHA-KoN_GK3f0RkYqGvsPGahL6tPJ=2RjqRFVsTQRB0F56-rQA@mail.gmail.com>
Date: Mon, 8 Aug 2022 11:34:35 +1200
Message-ID: <CAHA-KoMRc3pbmdcH0VMfmy+LkNGS2M-4ci9C84Lg9ZYOXeqU7A@mail.gmail.com>
Subject: Re: Review !2271 for merge please - DNS updates allow/deny for
 SAMBA_INTERAL dns server.
To: samba-technical <samba-technical@lists.samba.org>
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

URL for git lab:

https://gitlab.com/samba-team/samba/-/merge_requests/2271

On Mon, 8 Aug 2022 at 11:33, Matt Grant <matt@mattgrant.net.nz> wrote:

> Hi!
>
> Code is finally ready for review for merge, have filled out the test suite
> enough and cleaned up the code.
>
> Could someone please take this on, it will be a release feature item for
> 2.18 hopefully!
>
> The patch set filters the dynamic DNS update mess from clients on a
> network with an ISP PD IPv6 prefix + (IPv6 ULA or RFC1918) private network,
> and has support for access by IP for dynamic DNS update purely from an
> enabled DHCP server.  I wrote it for use in the SMB/SOHO set ups I maintain
> with Samba on Linux.
>
> Thanks heaps!
>
> Best Regards,
>
> Matt Grant
>
