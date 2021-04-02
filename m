Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CEF352BD5
	for <lists+samba-technical@lfdr.de>; Fri,  2 Apr 2021 17:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ggySz5ziFujBJxLBrs7YHDp8OTC2HkWK1c+xKFsqIgE=; b=E2XFZ+hwSFU85AXrbTqdt6Xwy3
	F4cnwnY0xbm9Rl0WRHLBylcD1OGDg264nQYmpziO+aQTzlBiliyN+XLQ87Ta7WKhsCzWocEpTIyXK
	rXcww8IeOMteesmN8GiE9gqk4a4aLlCylIxmSz6bGpooDuO1MRTshfpl4beI+rc4BZxaEXTQc52M9
	nvR/DqG9nEqnlyst3hxF3TiYI61NYAQCLpSy/Isg46irxN19KkIv0lxRTXdTh/4ivkzieWJTLE9EE
	IwYKVAFlWjOQUhO78dvXgMANX7ZtZ9rEXclmFkDjd4r6GD6FY+m0i8ntuJ0Z9hIQJwxkCmnsH2+SI
	VpgAP6dA==;
Received: from ip6-localhost ([::1]:34612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lSLwK-009gAT-NW; Fri, 02 Apr 2021 15:42:28 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:36573) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lSLwD-009gAM-RK
 for samba-technical@lists.samba.org; Fri, 02 Apr 2021 15:42:24 +0000
Received: by mail-lj1-x231.google.com with SMTP id o16so5999946ljp.3
 for <samba-technical@lists.samba.org>; Fri, 02 Apr 2021 08:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ggySz5ziFujBJxLBrs7YHDp8OTC2HkWK1c+xKFsqIgE=;
 b=Nz7dQjym5qVZsccPilJbfmOGjEgHU6MXQXCryAUdG0ybN3lGI6mBsl1Gwi5F340fnw
 gmubvWwqdURU3W9hFdxCyhNPvu1p+4RJX6Z+wIYQmnMyPANbC8Xs0K1Qc1mBQ4YuFzby
 LIk5wcLuGcoVsX2RibIRZAEVSk9K5Myr8Pu3yiY25+9FTJyRA+BNBXYdxVM+qtHqn6q5
 r6Ln0yccRTPax8JfcUYyH/YPdCi92DgtkFyZCk6Gb9xxfAgbk8NduhwlqnfZYcKYyRC6
 Hh7y+8VlmQf64Rn56rNL1Ct6jnZK3poF7hWlU6CSVLBX9DSCIwnIUSgqL4/+gQqObfPn
 neEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ggySz5ziFujBJxLBrs7YHDp8OTC2HkWK1c+xKFsqIgE=;
 b=cmU90bf3mvyKSZMnqbJaWBBAKqqcs/mjIZr3UEUToVcb9c8hw0kxPLqts40sva8j0v
 f5XgZPScosqP2uhgTe9CDo9nY86NJ3wotsT6CoxQJ/YyjkLyVionmK8wQU0jqgb00zzt
 COV2VtB5vwQDf3t9Lu7cjFaDTjTn+IbijVuA5ysZVS8574vCqeDWB4kq+03xE/gCDjOd
 W4q6TP+loyYQdMvSB0D1ZgCoi3ros+Glj9dvOC00gRQs/sR/fcPiZpKYADdb7rezYWVj
 1RjEZPvrUmHsqvaRgbuI2Ni7FBQsFZa6TDLO7dm3L2nLfc18ZSKj/UeJyAVFTRFi4dpG
 Gwng==
X-Gm-Message-State: AOAM533KXopscXPrSQBvjXrvB0n2XRdmxN0i+rUDnPBELnj14udJ7ml4
 qsZJscOy8RPpi7634nunQX8Ecu9LEVImQ8EBWTA=
X-Google-Smtp-Source: ABdhPJyV8JUgqosPubOwp84IVUCKDKLhg6YVBOoZt9qxKxatixf45J3IS0QozRVb6PrEBUw8/o36RQRXg8sJYO1+fUA=
X-Received: by 2002:a2e:8503:: with SMTP id j3mr8627596lji.272.1617378140014; 
 Fri, 02 Apr 2021 08:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210401075117.998330-1-wanjiabing@vivo.com>
In-Reply-To: <20210401075117.998330-1-wanjiabing@vivo.com>
Date: Fri, 2 Apr 2021 10:42:09 -0500
Message-ID: <CAH2r5ms-rZPZi9TLE6f4Xoc33B51YKbuT+pVy8xaeNFzg9jLVg@mail.gmail.com>
Subject: Re: [PATCH] fs: cifs: Remove unnecessary struct declaration
To: Wan Jiabing <wanjiabing@vivo.com>
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 kael_w@yeah.net, samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, Apr 1, 2021 at 2:52 AM Wan Jiabing <wanjiabing@vivo.com> wrote:
>
> struct cifs_readdata is declared twice. One is declared
> at 208th line.
> And struct cifs_readdata is defined blew.
> The declaration here is not needed. Remove the duplicate.
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  fs/cifs/cifsglob.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
> index 67c056a9a519..ec824ab8c5ca 100644
> --- a/fs/cifs/cifsglob.h
> +++ b/fs/cifs/cifsglob.h
> @@ -1283,8 +1283,6 @@ struct cifs_aio_ctx {
>         bool                    direct_io;
>  };
>
> -struct cifs_readdata;
> -
>  /* asynchronous read support */
>  struct cifs_readdata {
>         struct kref                     refcount;
> --
> 2.25.1
>


-- 
Thanks,

Steve

