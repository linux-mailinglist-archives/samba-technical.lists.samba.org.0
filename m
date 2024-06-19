Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0264F90F9CD
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2024 01:33:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=F4CpIzNzbBUMPI+mEbkLZg02CLmFQNk66TZ/t91MMao=; b=BIENWUz3bC5l6vU0SeGTr88tlU
	utYxTIzIB1nTInEEADw/qSuUtGv4UNSddzZxjKv3zPO4vXz7s3JWkDwTna0E74u3KXhkNESecKNOK
	TODW3b9gvDIsqQbzCIgyHG9sdrB6mhIZojOmLOc/dlO/wx9JClJzyO+9LEuONR+Z+bxLZNk5zG6ZD
	xsJtLiIMmcFLdg4uahXJdIUZU1H+dhY0vyI6pvOOgBYuvqbrfFMHkbE0wKDfLoF/60TmsnInBtzBt
	xSReoWGhVFhyEWhhiosWkv7B4cBTbQKncgHXYH5gz2f7Ct7k6BeUq8ZycOrudE7O65R8HkmBGzWTt
	9VjMgrSQ==;
Received: from ip6-localhost ([::1]:32978 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sK4my-00EY6f-7P; Wed, 19 Jun 2024 23:32:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1]:34022) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sK4mt-00EY6Y-1i
 for samba-technical@lists.samba.org; Wed, 19 Jun 2024 23:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 38576CE2139
 for <samba-technical@lists.samba.org>; Wed, 19 Jun 2024 23:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D8CC32781
 for <samba-technical@lists.samba.org>; Wed, 19 Jun 2024 23:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718839933;
 bh=F4CpIzNzbBUMPI+mEbkLZg02CLmFQNk66TZ/t91MMao=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fLUXXsvZAPE9OKsb3U0T1Wij/dHh7+TZHI6YSxmnJ31CHIL0NM1VEn2t+F9OooW7e
 YH1LEvqE5BltEbIzJoZEb+PJLxNBkS3j8KZeWhZmi6CubdXtB33kBy+LLmSK+Ngryr
 XaMRIWBR23l66F2sIo2AcL/tPysTE9P7XN8vL1rxrd0zU/hw9O7qA1qhyJI+N7hgkW
 v27trALBU5biyPJka64GjGcpegFsOC6t/nbhJo6FdjwuqGrX2t+wiAyQkzB8+dCacf
 e9ZJm2tH906glOF2cdzu6oPozbv+qiQMUmulYQh3ZiEJv4NRHanmglzAy5dIJ+C25G
 xnu5KsammyuBA==
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-5b97a071c92so127754eaf.1
 for <samba-technical@lists.samba.org>; Wed, 19 Jun 2024 16:32:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX1zcdrrkj9lBCfuLxrGrCwytPZ6BUT5HOza1Oew5RGF+x9kETaAHPstZUG5JWokdkjiZGsvRQHadEMqvqp7xBEM9M9Cx+N/fzCCsGSFJFy
X-Gm-Message-State: AOJu0YyjCNYB8KjSXQCuq8L/22Jp4VNnYC3xkFxzXXIlS1dULNfdySng
 ui6KTuN32yuH1qeQMi5JvxpTdaPsOo5tptaObmpHZjKsQHPY2SwSq3OY/VImWXRBB5+vZxOQ394
 8LcEuXJO7xEUbLkwKaIWBspEPlEE=
X-Google-Smtp-Source: AGHT+IHztATvBmnqgF15p6/sdSBgWtaA7Pf8BZ+Y2cUp/dd+2nIxbJC+EgJkCNcFTcQIFIugOT8rEaxmZOCNLtYCLKw=
X-Received: by 2002:a4a:91c2:0:b0:5bb:672:4067 with SMTP id
 006d021491bc7-5c1adc0d1fcmr4011799eaf.7.1718839932856; Wed, 19 Jun 2024
 16:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240619161753.385508-1-chenxiaosong@chenxiaosong.com>
In-Reply-To: <20240619161753.385508-1-chenxiaosong@chenxiaosong.com>
Date: Thu, 20 Jun 2024 08:32:01 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-V80sdH2uXoDe+xqf9N-gFYTjqWtERrB+-vH0s0NUMvw@mail.gmail.com>
Message-ID: <CAKYAXd-V80sdH2uXoDe+xqf9N-gFYTjqWtERrB+-vH0s0NUMvw@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: remove duplicate SMB2 Oplock levels definitions
To: chenxiaosong@chenxiaosong.com
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 liuzhengyuan@kylinos.cn, linux-cifs@vger.kernel.org, liuyun01@kylinos.cn,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 huhai@kylinos.cn, sfrench@samba.org, senozhatsky@chromium.org,
 bharathsm@microsoft.com, chenxiaosong@kylinos.cn
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2024=EB=85=84 6=EC=9B=94 20=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 1:18, <=
chenxiaosong@chenxiaosong.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: ChenXiaoSong <chenxiaosong@kylinos.cn>
>
> smb/common already have SMB2 Oplock levels definitions, remove duplicate
> definitions in server.
>
> Signed-off-by: ChenXiaoSong <chenxiaosong@kylinos.cn>
> Signed-off-by: ChenXiaoSong <chenxiaosong@chenxiaosong.com>
Applied it to #ksmbd-for-next-next.
Thanks for your patch!

