Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4F12E81D8
	for <lists+samba-technical@lfdr.de>; Thu, 31 Dec 2020 20:50:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=q4GADhOM3Di9puOis0bQoYcmPc7qddXCQPPvPPHyXN8=; b=m9P3eEvZtxzjOdIKdFKYFQptyi
	cW58nlBr1pG06s3A+tX734iAS9bPB1nIyjNNaa0DH89+aiLTxbxydqdrCYWmxkhs5nKPWSi/v8Xya
	JEWtszwJTOvTUjK9aM685vcEgMWa7smZs6iLUBHyU8v2Zd8PFrhxoUSa/3ft/H2h2KIT6rUHgpskE
	GiV3sxWlLFO8pxkORYZYStC2Dcv86Ug5YCJ4xzs98gtsj9+TauN/v7DLybTZUAXPk6oIB4XL6gfCg
	lPLggmUZRwPVUl+5PHnDC7BfUI2Y/S/TJQvXilyIz/Oe4RJI7llHsu5RjBILCgTOKXYqQ6f8f/9HT
	Ino8/Yng==;
Received: from ip6-localhost ([::1]:31002 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kv3x1-002hM4-N7; Thu, 31 Dec 2020 19:49:35 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:43184) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kv3wr-002hLw-LK
 for samba-technical@lists.samba.org; Thu, 31 Dec 2020 19:49:32 +0000
Received: by mail-lf1-x134.google.com with SMTP id 23so45808973lfg.10
 for <samba-technical@lists.samba.org>; Thu, 31 Dec 2020 11:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q4GADhOM3Di9puOis0bQoYcmPc7qddXCQPPvPPHyXN8=;
 b=TZit+ZzpGhp+HstDglk2xvwufzq5vwAD6YVTIeLC2EKa9ovWoXhOWSQzksvKm5hyeW
 vv83RGbTT/RXmmG2g6Ao7bAw9T89m4iw1QX3t1ltaidvjLLPd/eIPJg00O4pk4ZWMfkW
 0j8qwoeWcgMFPMxyUxdmHFGjjlELv2XhIZhJ3ulNIiYYLgomEpfT9/P4KJD7pp89CDXU
 vcFI2xJjz+h1eTZ1My73fFvYH16TPO3xiFA4+/byi90kuhM+JYN5/Cf/uHzBiUGPIls6
 jCCDXPajjR8yuai/Jfj12ITdIONkO6rBZv1ytpqNZ36pJnnZ9o1I1/biHqbfXwNDNC7K
 mgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q4GADhOM3Di9puOis0bQoYcmPc7qddXCQPPvPPHyXN8=;
 b=BiNKiLJNA1i5PQOw3cSjWEHY7V+Qki4nG7vCi4vcio0/Ca6E9dvl2wXUYNvK2TeGLS
 /r3RXjD1+Rl7z0kSCPTFCO+XGmMXVJ0rECttvHTYP02UAHIYcylL1pySV0Qx+yrnvVJ+
 Ss+t49VJXkUrXuOYbSdTEkWtEt1omejYN176Uar+dqzYT7vDZIotXjOezcLYG9XiFjFk
 vPkX8KlUH7ZzvY950PSYb498NHwkijKYzJYVk4ZxoERC7C6Oij7MKyf2J5fX5bn0Gq5m
 jW35fItOk5DxPNGsKdvxNgiYPjtBTrVFgR4pUr+jsLxijqoUcXRf0stmLV47quN8Daow
 v66w==
X-Gm-Message-State: AOAM532V3e24t3LvHJ4n6a+z0vh7hCbau+p7Fz8/NX7kXxv5J8LHu3bK
 VwsmCATKeG93oSJ9XWMxnjaLEsMakSO5AdXb0MM=
X-Google-Smtp-Source: ABdhPJzh0FiWoAo5nbILBFboXjTjGWuHbZudk/ItyhPYbOzhyw2Yoeia6xoE5mC6mbYqHLE1SMbO3mrJ6DyMaHBpaZI=
X-Received: by 2002:ac2:5689:: with SMTP id 9mr26659052lfr.175.1609444147846; 
 Thu, 31 Dec 2020 11:49:07 -0800 (PST)
MIME-Version: 1.0
References: <1609310145-75787-1-git-send-email-abaci-bugfix@linux.alibaba.com>
In-Reply-To: <1609310145-75787-1-git-send-email-abaci-bugfix@linux.alibaba.com>
Date: Thu, 31 Dec 2020 13:48:56 -0600
Message-ID: <CAH2r5mtvuz+Ro2Y7upQQcmSk2Q2sgxykYrKgq0wmhGPKjEeJvw@mail.gmail.com>
Subject: Re: [PATCH] cifs: style: replace one-element array with flexible-array
To: YANG LI <abaci-bugfix@linux.alibaba.com>
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
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Wed, Dec 30, 2020 at 12:37 AM YANG LI <abaci-bugfix@linux.alibaba.com> wrote:
>
> There is a regular need in the kernel to provide a way to declare
> having a dynamically sized set of trailing elements in a structure.
> Kernel code should always use "flexible array members"[1] for these
> cases. The older style of one-element or zero-length arrays should
> no longer be used[2].
>
> [1] https://en.wikipedia.org/wiki/Flexible_array_member
> [2] https://www.kernel.org/doc/html/v5.9/process/
>     deprecated.html#zero-length-and-one-element-arrays
>
> Signed-off-by: YANG LI <abaci-bugfix@linux.alibaba.com>
> Reported-by: Abaci <abaci@linux.alibaba.com>
> ---
>  fs/cifs/smb2pdu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/smb2pdu.h b/fs/cifs/smb2pdu.h
> index 204a622..d85edf5 100644
> --- a/fs/cifs/smb2pdu.h
> +++ b/fs/cifs/smb2pdu.h
> @@ -424,7 +424,7 @@ struct smb2_rdma_transform_capabilities_context {
>         __le16  TransformCount;
>         __u16   Reserved1;
>         __u32   Reserved2;
> -       __le16  RDMATransformIds[1];
> +       __le16  RDMATransformIds[];
>  } __packed;
>
>  /* Signing algorithms */
> --
> 1.8.3.1
>


-- 
Thanks,

Steve

