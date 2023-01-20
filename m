Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEE0675DCF
	for <lists+samba-technical@lfdr.de>; Fri, 20 Jan 2023 20:18:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=fYPQJWlniGBmq4AzLRQJWodVCfnM6YRZwibUhCT+d5A=; b=hvBtzlyB/VnWYPg3oS0o9fS6CL
	CO9nOyMK16fkbbVSVi8xHfYSPa34mbW0NEpVUfppCBboZfPdxQZtlhPCdWx0gJmtUUlERRHWH9ky8
	y1NixsYx9sp1vbCpAspErTvk2E6fkOsLlEPkN7Aod2HF3L1UiyVem/YJ+O7UPZxEddhiTbLxP+x7R
	KvZJKG0ojk7XgqYGg3wKVzwcCVIo3mdKDTclMVguzQ4apbcSBdRUBeZtQ+U3K5pbDZaGr7NShud8f
	8oh8EUDdMDyhfw1+v3cHoCC7vrwLpoTe/NXMjJC2nqT8AnbLpxf2/pypd3eKqP99kdNfzcTVYyV1S
	iV1RDKWg==;
Received: from ip6-localhost ([::1]:36388 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pIwtp-001FGx-Gp; Fri, 20 Jan 2023 19:18:05 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:34553) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pIwtk-001FGo-6i
 for samba-technical@lists.samba.org; Fri, 20 Jan 2023 19:18:02 +0000
Received: by mail-lf1-x12f.google.com with SMTP id cf42so9543423lfb.1
 for <samba-technical@lists.samba.org>; Fri, 20 Jan 2023 11:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fYPQJWlniGBmq4AzLRQJWodVCfnM6YRZwibUhCT+d5A=;
 b=heb15bTtdZT17xmmqjNbgXZT0dR2QN6/fu8nuXR960n6sInBBperAgntX22WCjwI2n
 I+g6HqywVBYfiBrGn/zojiY5V3EHTnonOlNP3RdOw44+HwSm34z5JjBJz65SuGhOCXC9
 j+iv6bzjhCisC3KHwxyceKjn5A2X5q1fy0Pc3sF2M34Fp8VqntW18liDTWnUl8MWrLUA
 OIIgmEnMkN9lfCwBscWFHFAXWURMk6uvWbUx2WSxUdtg9mmwAxunaqv6Gty9RdskDzjw
 W2NrC8hH594iosmYoGQ3BGNbWdf93K6yNPM3md3/ij/lk289A5YBrVcQRwMsbRqdHTPw
 v1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fYPQJWlniGBmq4AzLRQJWodVCfnM6YRZwibUhCT+d5A=;
 b=3WZm0533Acmxd0IVbB0YD4TYVGY5EhqUyH4nDjVHqMftl9LEKJCVF6b8cAsNC+0yds
 kPUPiFxkYovmxiLNMXdtg3xc50AVzBlo3R6aMLOVKWC8P6l3rQ8+WnV45VmzVSjKzFwI
 VdF8WzoyGrbTLOMgCko6mJdr0xHYwftld0n7jZWo4/0VpTyqO4idYoH3XpIwqhDYyMf4
 Ta9C7Q7rfxNorMZEeJJ3ayb8yDdfCSZhHRUD7m3DvFFYpa0mQedG4zmPnJl12BK9i4rH
 tkCfNUvKPEfsSfdAIQ3agzUdH+I/0E3iTWmMMZwPdzEhYKVWQGxdr8Hp6+Wpv4eJTSIB
 Kv4g==
X-Gm-Message-State: AFqh2ko8sP0GZokxnn/UrCh3WhT5Pf/b4hPl5z1HeUW1G1fBshbJ30uC
 LlCHlu0wApmsKtKIjIObtpwF7HTV8qQABBFfunM=
X-Google-Smtp-Source: AMrXdXtDjM/fxl3sPQunHrLRY+Jj0Ha2oXd/y57zrVpFObrM9t3REGLn9LV3cDjpgSmVtgRrV4wMJxAi7FbJPsX/uXE=
X-Received: by 2002:a05:6512:2397:b0:494:842e:3f6 with SMTP id
 c23-20020a056512239700b00494842e03f6mr858882lfv.225.1674242278695; Fri, 20
 Jan 2023 11:17:58 -0800 (PST)
MIME-Version: 1.0
References: <20230120120857.60444-1-andriy.shevchenko@linux.intel.com>
 <87r0vpe182.fsf@cjr.nz>
In-Reply-To: <87r0vpe182.fsf@cjr.nz>
Date: Fri, 20 Jan 2023 13:17:47 -0600
Message-ID: <CAH2r5mvgSnVhLSx=sjAu=dK1C5q9tqby-EmSz6_3rp+Azw-hKg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] cifs: Get rid of unneeded conditional in the
 smb2_get_aead_req()
To: Paulo Alcantara <pc@cjr.nz>
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
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Tom Talpey <tom@talpey.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Fri, Jan 20, 2023 at 8:22 AM Paulo Alcantara via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
>
> > In the smb2_get_aead_req() the skip variable is used only for
> > the very first iteration of the two nested loops, which means
> > it's basically in invariant to those loops. Hence, instead of
> > using conditional on each iteration, unconditionally assing
> > the 'skip' variable before the loops and at the end of the
> > inner loop.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  fs/cifs/smb2ops.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
>
> Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>
>


-- 
Thanks,

Steve

