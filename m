Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D11A5D4D4
	for <lists+samba-technical@lfdr.de>; Wed, 12 Mar 2025 04:42:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=92scuT0mPLxGItmKoFTauVYvE2ycFCz6mNcLharBo24=; b=VDvJF1CuRXB2UFcjAzOty81FGI
	eQY9T3U6NVeDMR4LLZuEoYNFP3fPOp3VsWHXEVXK4pe2un+EGgxB2pPOP4u2TUC8On1fH4678f5Qw
	74o/FO+V8ztKtEpTvBsHKrIB4LHqKgoE2Tw1hkIK9eFK2dCewNOQtUuRke/kTLrLQ57AP214DhKXY
	7tVZyhrZ4SrtJggmkjHUwrG8JvLUjQn9vAF69qi9vred92FRa7W+eEu1buerfBq3E4YQpB8zpDuCo
	lNrb+eoMzMm98F6J8YvLIPdxfLN4L9QXqx6VImd8x3rQipKHZVOz+WTgjWIhbZ1XfeIL5AhAChH2A
	v3ikjjnA==;
Received: from ip6-localhost ([::1]:32734 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tsCyK-00G6LS-PM; Wed, 12 Mar 2025 03:41:32 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:49458) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tsCyD-00G6LL-GC
 for samba-technical@lists.samba.org; Wed, 12 Mar 2025 03:41:29 +0000
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30c091b54aaso37387551fa.3
 for <samba-technical@lists.samba.org>; Tue, 11 Mar 2025 20:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741750872; x=1742355672; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=92scuT0mPLxGItmKoFTauVYvE2ycFCz6mNcLharBo24=;
 b=O+mZ/7wIn2fIt0gjocvghnJQA5LqbhbIxV9Z0NPsl1w30MakRtngxFsAluu6qP92fr
 7UsawI2My3w17+vWmHUc/D6QT41TZXCv2nirxQX3YFeLovppqYfdinMV7erVNT+NT3Js
 mvgIuyOMWBa4DB24wktIqWLMhU5vNEFRBURTiYVWWpkt968yOC7FivzqYqNtdZ7NDxt/
 LpO6wr0Eyc6HG8uoEV+Wo/OgdqwPtUzhusmR1VDAz3dZaUbV9J+rlUhqaie4fkRB3Dc/
 dw6oUa2Lxh1EzFkvdQ/lHJpQmvEe+8K1kxZJINIQHPyXcE8q1xzVPjbbL8MYJ3HK6Jb0
 GaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741750872; x=1742355672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=92scuT0mPLxGItmKoFTauVYvE2ycFCz6mNcLharBo24=;
 b=rq3aYJdSYbPx3P1RzNsFQCL+ib3UeHgaQ4H/v6dZZp4mQl4C/Mr+2DxHn8TNr5lg0V
 8Pc3E9ywJvurXTMOG2oQAdH6Ly0iLQ2Qsb+OCX+eSIhGF97YbaudTYQWKUAeN9RANVfA
 0tEWn/M8CzycgwiPUrFtd2cN+GmXXpkY3NdKYNNDUdwStbSU/S7Xf3y/ohGbOGhfMYUe
 gbeqjB+atwae0ImglD62p29nuUk/4nGooA+//eMGMLYxvF/8LM39x6wvAuOv9aQSJR4p
 9VEXNAIHtx0g+fAWsETaMEebIrYWJ7tp01O8Kre2rkDF19sD+Y2FQ2emX83hsSc0mbwh
 9gKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpVhEo+U3PXcExMm33DQgdm/r8pbiyuZ/KB6Ei9gkMkN4bjGJM90oba40gjbXzU1gfpPhAkXiqm/mkeI8nqTQ=@lists.samba.org
X-Gm-Message-State: AOJu0YxvjD8lARJFpRjHleGXNa5LTVREecGa6iH80/PCN8U2ztm6FEf1
 Ogs2V0l3OcsXbZYzytbyFjXKfe3koMISVkAEYMK851+Gsc3zDm5epscFDfM8cWZUEYSFtEvuizH
 vEjAntDOI/aWR48dGx6vS+t+4yxo=
X-Gm-Gg: ASbGncu3gMTfLm3gO9DAN4qKQKR+0U0LEBFYaY/Aoil3gBFceGRrmDAplMK2c1qy+OD
 7jl2nkGWM/sA5hlI1F6ReXBXNRj6JMmLZCf+tgZsJGbzEKZZBppEhhZlUPunAZ9xriEKha0e/Fp
 piOFdkItzDnhJWZPZIjumqtMVgeq/+qAX2hO1AKbePtvFm7wllLUYGFyUR8IM=
X-Google-Smtp-Source: AGHT+IEXM+5xWJasauWbNbCS2YfDh1yeixbbhn9cHO3JOongiCVBYDLz+zdUkf5WvIfevUBa4DGHP4Ubo+i5MsMuNKA=
X-Received: by 2002:a05:6512:220a:b0:545:d35:6be2 with SMTP id
 2adb3069b0e04-54990eacf31mr7132413e87.34.1741750871834; Tue, 11 Mar 2025
 20:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250311142206.2045-1-m.masimov@mt-integration.ru>
In-Reply-To: <20250311142206.2045-1-m.masimov@mt-integration.ru>
Date: Tue, 11 Mar 2025 22:41:02 -0500
X-Gm-Features: AQ5f1Joakb8bvYoYy1SXusb21hOdUoqGZatk-hDwb6TEKKEamC-CnIoAqjUpvm4
Message-ID: <CAH2r5msC7iL9UcS6CtD4yB-xyDEYrhXy9EWVUNxgxuLy2SsoMA@mail.gmail.com>
Subject: Re: [PATCH 0/4] cifs: Fix integer overflow while processing mount
 options
To: Murad Masimov <m.masimov@mt-integration.ru>
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, lvc-project@linuxtesting.org,
 Suresh Jayaraman <sjayaraman@suse.de>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, "Paulo Alcantara \(SUSE\)" <pc@cjr.nz>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next pending additional
review and testing

On Tue, Mar 11, 2025 at 9:25=E2=80=AFAM Murad Masimov
<m.masimov@mt-integration.ru> wrote:
>
> These patches fix similar issues that have different origin commits.
> User-provided mount parameters are intended to have upper limits, but
> are validated after their values are converted from seconds to jiffies,
> which can lead to an integer overflow.
>
> Murad Masimov (4):
>   cifs: Fix integer overflow while processing acregmax mount option
>   cifs: Fix integer overflow while processing acdirmax mount option
>   cifs: Fix integer overflow while processing actimeo mount option
>   cifs: Fix integer overflow while processing closetimeo mount option
>
>  fs/smb/client/fs_context.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> --
> 2.39.2
>
>


--=20
Thanks,

Steve

