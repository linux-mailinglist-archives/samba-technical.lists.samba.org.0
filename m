Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0845964C35C
	for <lists+samba-technical@lfdr.de>; Wed, 14 Dec 2022 05:58:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ajhW9t358rJQB8MHn9DjK0GaLclWuaE3UlU09Pj8U5g=; b=GfE9QLCWg+dFDdZkHrY31uCUC1
	c4Jx6OIMlsZDeeWABFQsSL0MakYpMF1nYo0JdtyNJSGVTPSV5q6YHv64aYxQXClZzEdYKx1PzyuZl
	l9hSe+UugrPIzhyJKmQbyJdZ26RPVp/6EnF8XfMhh/5oGOkbaw+NqQNWuTgpfQTELTGIrZ6dAFBWb
	4CXbZZmmfSm7PQJJNEO9bY+x2jvthSfGIt0hDkC6f/kaii0k5wPAUwkB5xm7Qg/qG5SjkFGRgfodZ
	lWH7jQUBq9TG9mUJ/x2RHQBIUvyi8Q0sQkB8TNZVECNGgJ26k8hc9EmDXWfWWTwBgs1bBc90QPBlY
	HKvYP7jQ==;
Received: from ip6-localhost ([::1]:28200 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p5Jpk-008xFa-GU; Wed, 14 Dec 2022 04:57:32 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:38801) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p5Jpd-008xFR-5t
 for samba-technical@lists.samba.org; Wed, 14 Dec 2022 04:57:29 +0000
Received: by mail-lj1-x22c.google.com with SMTP id b9so5530886ljr.5
 for <samba-technical@lists.samba.org>; Tue, 13 Dec 2022 20:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3xgSUy00+qCYyEoOi5NBasSre59KZUaI8eBSedCVpJU=;
 b=qM/lOPUoLSFQF42vDnTGOysLqvvfxuSH72kcSHNtKNCkELACAOtPZ4drXaImfMghgF
 NqKRKgbH6O77NZ388SkB62UHZnK+LS6rc3acUlOkGet9nbQpJOVme+CeHTnYXLcHKkvM
 oTMsUCB9hqxXeT+WW3VZiRfjAibtNMh64MUA2a7CrnVgoe0Kfcuj+6f3PE/w6i5m1Vr4
 bxxvVUzdp4L3YcFlRuOcEVvDfzpBV1KevNc51gAV4aSZkrXpVwLV9Rc7lU/ZXxKfVMav
 MZ4yxJ4ldcHPvl4/q7YuDfBZ7ejPCWehfNPx3aUTp/Nm/5NIPiatCz4NTMwgKqQAuTqu
 K+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3xgSUy00+qCYyEoOi5NBasSre59KZUaI8eBSedCVpJU=;
 b=r+eiqo+xIY+bmoGDzTtr17oAIut/SU+JiYSk3PWV6NtK3TISzAaFjgCLiaYEaBqpVk
 x24+qzxulGfUS7QczyDSzbB48UuUgjHWthnLaS5i6XYYEDS7dFbRfPuxfNoy02H61i2W
 cfVvLDBXB2hxK8Gif468qL4dZmvO4dz81GZfehC9SL46BeBg38QORIp3xdG1Dtrq8Mr6
 bVTn/7rPZ++VdY+fFh2jYqEcD494ONJ8c7fswEb5dRMzXa3zTJP1ZIO2cue02fjRCDud
 1M0XONWwC40FkMTC5FLlGOhGyiJX908bqj87VhzzHTU2KB8IvXia+lKCoCNL63MjzGx2
 264Q==
X-Gm-Message-State: ANoB5pkalgIATCKqjCZ9ZJGyip8TaLEYRaQXFdxlkZrNkaAeOcloltwj
 /jvFw/b4L92B090N5PHjsTPyGeBT6nZWLEQ6ycY=
X-Google-Smtp-Source: AA0mqf7WNj0Ynm3PVCvuA29jAkmOA6Npbs1AyiQtj/0mTTzWdFCqHbDeiD8ErZ1SR9kcqEYq7+Xn80+mV03F61nKsNU=
X-Received: by 2002:a2e:86d2:0:b0:279:df97:e895 with SMTP id
 n18-20020a2e86d2000000b00279df97e895mr8534659ljj.226.1670993843453; Tue, 13
 Dec 2022 20:57:23 -0800 (PST)
MIME-Version: 1.0
References: <20221214023911.85141-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20221214023911.85141-1-yang.lee@linux.alibaba.com>
Date: Tue, 13 Dec 2022 22:57:11 -0600
Message-ID: <CAH2r5mteMFGi2B2eYei_pfZk_MLVbk4JQ0bNujZhhJVd5=te2w@mail.gmail.com>
Subject: Re: [PATCH -next] cifs: Remove duplicated include in cifsglob.h
To: Yang Li <yang.lee@linux.alibaba.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 Abaci Robot <abaci@linux.alibaba.com>, Paulo Alcantara <pc@cjr.nz>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 lsahlber@redhat.com, tom@talpey.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git for-next

On Tue, Dec 13, 2022 at 8:44 PM Yang Li <yang.lee@linux.alibaba.com> wrote:

> ./fs/cifs/cifsglob.h: linux/scatterlist.h is included more than once.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3459
> Fixes: f7f291e14dde ("cifs: fix oops during encryption")
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  fs/cifs/cifsglob.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
> index 703685e2db5e..82f2d3070c26 100644
> --- a/fs/cifs/cifsglob.h
> +++ b/fs/cifs/cifsglob.h
> @@ -23,7 +23,6 @@
>  #include "cifs_fs_sb.h"
>  #include "cifsacl.h"
>  #include <crypto/internal/hash.h>
> -#include <linux/scatterlist.h>
>  #include <uapi/linux/cifs/cifs_mount.h>
>  #include "../smbfs_common/smb2pdu.h"
>  #include "smb2pdu.h"
> --
> 2.20.1.7.g153144c
>
>

-- 
Thanks,

Steve
