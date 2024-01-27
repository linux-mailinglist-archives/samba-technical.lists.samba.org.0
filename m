Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA3883F171
	for <lists+samba-technical@lfdr.de>; Sun, 28 Jan 2024 00:02:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=N3PtoOCmflXE8JrM44LwtaHSMNzcJ3eR+Esxbam8yVg=; b=bQ1EK/BZzVPUTfTJujB6DpSYH5
	cTbAVt8y5ThZUrJimYYXd94Sm9+oBcLEGkK0RMU5Gr70Skq+pJoYEKvkzdu03rEN8Lmhz2B6SLfEw
	P5oN5bIp5vn3hGYgWmJVYgOPQ3eirHdTahgpW1wcf/QuDPJOCvPRLT9JF3Z87KE0cHapqKINTR12g
	VfZ+/SLMqmbsWc3mJX3wz/cLDAWi8EV2GxrFj0KjsQDhW5plEQKKEi23caPF5v7T+sAVyZrfiB8xC
	u9hDNvzxSR+YX86/9tPw4D8fiiEYrxqTy/aWxZl86sheyltxSCc76wTIx7DquxPVXyktPKWzCMD0l
	x51PZYlA==;
Received: from ip6-localhost ([::1]:64158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rTrgD-004i6p-PN; Sat, 27 Jan 2024 23:01:41 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:57774) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rTrg6-004i6i-UX
 for samba-technical@lists.samba.org; Sat, 27 Jan 2024 23:01:39 +0000
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-51030ce36fbso738457e87.3
 for <samba-technical@lists.samba.org>; Sat, 27 Jan 2024 15:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706396490; x=1707001290; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N3PtoOCmflXE8JrM44LwtaHSMNzcJ3eR+Esxbam8yVg=;
 b=So4Ca/hiWJoRYVAEabfbMcEDpwyRR0UerfxyJ4iLe1WxNYvN2pWL2r842WH2dLwzUZ
 bo4q9vXDKuOqsmdwhbytJxOy0kZnTwC1lJAojxj+l0hM07+GjtJ8Nk3LW/5N82xm9M0A
 vuXAevWi1YT8Yx0suxYUnzzca0JgdOegtzDQvP3JAjPyQ7oKCf+KWThdCZrMWKmxMxJi
 y9E1Bo5ji5KKJVpLbT6N1/gp2e4ghbwynxIup3mOClnx1eWZykftgtTBNXstufoVVWh9
 LrEPINunGXYmTZNVCJ0lagUj6qzG5i1V/spbMZ3nUKPj50pGtNLaP45f+rReZuPXA3L5
 LdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706396490; x=1707001290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N3PtoOCmflXE8JrM44LwtaHSMNzcJ3eR+Esxbam8yVg=;
 b=CI7788xgnmcVShNymWuFEk9+++dkPTtHdQOs/ITVSap7Isa/SaDAGXpzZW9jS+XmiV
 8lXSSPqIR5wb5LqcCTwu6C8iV+wlxYp7cQ8g2pEEy1tXc60CuxhGskRy2nneuyFen/Em
 3jhekvqfgqC3OWX0UWEwPXFdmMabENBGgr0jGtWAtyIJSriEAs5aUV1xgsFYipHTRSsL
 78lAcXAHPaWt/L0Mv316PJ8EuLASBlLREubbue6QR0dys1WkoaR1skUmAfG2xQdhFD9w
 tyQOWNzY4J9nB06DGHZDps4H/Evs0f79hBml7YTXGD8Axf0YZbXNXRjjOoSgwQxCRqsv
 xPpQ==
X-Gm-Message-State: AOJu0YytBKCycMiwKogiUgo0Z6mRqSNaijxQIme77AGFvqkl8fTglMHo
 q86B+CkyKTllaHl3dwce3bi3ULFqR5gmkq8j/incNMY0tTSI/UodBUod365D9rEjCr5Yj+QLf36
 tqaucEM7Moxr8KXZT+Znl/m7fWbR/e5fC
X-Google-Smtp-Source: AGHT+IE+iOPuu6oBq6RfhXdXaSlN1kLy8vx7/5kCGbP8mMThNsfKdD+U3LBhdWItjkggF7qNNwFD84CJsW07upVjH9M=
X-Received: by 2002:a05:6512:20d2:b0:50e:7aaf:ec53 with SMTP id
 u18-20020a05651220d200b0050e7aafec53mr1226739lfr.12.1706396490033; Sat, 27
 Jan 2024 15:01:30 -0800 (PST)
MIME-Version: 1.0
References: <20240126193143.245122-1-kovalev@altlinux.org>
 <2024012613-woozy-exhume-7b9d@gregkh>
 <472d92aa-1b49-43c9-a91f-80dfc8f25ad3@oracle.com>
In-Reply-To: <472d92aa-1b49-43c9-a91f-80dfc8f25ad3@oracle.com>
Date: Sat, 27 Jan 2024 17:01:18 -0600
Message-ID: <CAH2r5mv2ipr4KJfMDXwHgq9L+kGdnRd1C2svcM=PCoDjA7uALA@mail.gmail.com>
Subject: Re: [PATCH 0/2] smb: client: fix "df: Resource temporarily
 unavailable" on 5.10 stable kernel
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: "pc@manguebit.com" <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 ndesaulniers@google.com, keescook@chromium.org, linux-doc@vger.kernel.org,
 Greg KH <greg@kroah.com>, corbet@lwn.net, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, "Mohamed Abuelfotoh,
 Hazem" <abuehaze@amazon.com>, sfrench@samba.org,
 Darren Kenny <darren.kenny@oracle.com>,
 Vegard Nossum <vegard.nossum@oracle.com>,
 Shyam Prasad N <nspmangalore@gmail.com>, kovalev@altlinux.org,
 natechancellor@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Jan 27, 2024 at 12:43=E2=80=AFAM Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> Hi,
>
> Adding more people to CC.(who have looked at this issue)
>
> On 27/01/24 6:19 am, Greg KH wrote:
> > On Fri, Jan 26, 2024 at 10:31:41PM +0300, kovalev@altlinux.org wrote:
> >> After mounting a remote cifs resource, it becomes unavailable:
> >> df: /mnt/sambashare: Resource temporarily unavailable
> >>
> >> It was tested on the following Linux kernels:
> >> Linux altlinux 5.10.208-std-def-alt1
> >> Linux fedora 5.10.208-200.el8.x86_64
> >>
> >> The error appeared starting from kernel 5.10.206 after adding
> >> the commit [1] "smb: client: fix OOB in SMB2_query_info_init()",
> >> in which the buffer length increases by 1 as a result of changes:
> >> ...
> >> -      iov[0].iov_len =3D total_len - 1 + input_len;
> >> +      iov[0].iov_len =3D len;
> >> ...
> >>
>
> We can reproduce this on 5.15.148(latest 5.15.y) and Mohamed reported
> this on 6.1.y, so we need backports there as well.
>
> https://lore.kernel.org/all/09738f0f-53a2-43f1-a09d-a2bef48e1344@oracle.c=
om/
>
>
> [root@vm1 xfstests-dev]# ./check -g quick -s smb3
> TEST_DEV=3D//<SERVER_IP>/TEST is mounted but not a type cifs filesystem
> [root@vm1 xfstests-dev]# df
> df: /mnt/test: Resource temporarily unavailable
>
>
> This two patch series doesn't cleanly apply to 5.15.y.
>
> Also I am unsure, which is the better approach to go with
>
> Approach 1 - suggested by Paulo:
> https://lore.kernel.org/all/446860c571d0699ed664175262a9e84b@manguebit.co=
m/
>
> Approach 2 - this series
> Pulling in [PATCH 2/2] smb3: Replace smb2pdu 1-element arrays with
> flex-arrays like this series did.
>
> I think approach 1 is better as the changes are minimal, but please
> correct me if that seems wrong.

Yes - Paulo's fix looks simple


--=20
Thanks,

Steve

