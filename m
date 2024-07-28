Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7995F93E19C
	for <lists+samba-technical@lfdr.de>; Sun, 28 Jul 2024 02:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=2WtLQ0AuJweiHPK220i2nAx1+PX8DFaWeqci7mSxG24=; b=VZOfwqSsOHuxrR1RwtOsVzsPxN
	xW9Ad5BBzcnvw8fqJWCSC1SHj3jZd9xxCP5dwgvbMJ6HVDoBgEVxDJQTFLhXam4AMQQRC7POsDktu
	g40781CFeLt3GNuibgt1mcs1GW/Xgqe5ju3sZCXMaYSkpfISyXNzDpF+kRB5LU5Iu37nuMnENTy6x
	YxA9e1TVZpsUx3Uvf7WUZa9GGkOXFuAG0H3erLozPJweqx3aEuyw5LXml+8Tm76LWFQRTVxWune5i
	mU8loKgE33Wa4gRsm6bUAt01YDSrAoZTXEdK1NvLBA/MBLle3ByTj6upcaCChT6svD9oOMp9lX4xn
	fRpiQsCA==;
Received: from ip6-localhost ([::1]:25662 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sXrww-001cuT-FG; Sun, 28 Jul 2024 00:39:46 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:44501) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sXrwr-001cuM-JW
 for samba-technical@lists.samba.org; Sun, 28 Jul 2024 00:39:43 +0000
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52efabf5d7bso2848599e87.1
 for <samba-technical@lists.samba.org>; Sat, 27 Jul 2024 17:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722127180; x=1722731980; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2WtLQ0AuJweiHPK220i2nAx1+PX8DFaWeqci7mSxG24=;
 b=XArSF+KxYGGKqPpKzLYwhVZu9tPJu8JRohvGt7qvoPNffR9cz7IUmq6GqlkPsZe3Wo
 ynrFLAWY1X3+z6DRxmOFWLCP/1ULnCKePmXmK+42VxvYF8wUkGdcLjRQRdJqFxGRJrMf
 hqn2W/Gt/t3wsCuBcfbSiXGESSCBmIHzEaCvM5J1PjIhY3+9DVqJno/zPJb79OSg3oiB
 hkngVzifXhSFG+lrfqJiD5JQDrUbLaeg06VBtp4vQesCiexWlH8IAGLn+Yf8A1fvA0IF
 o06o9Y1uQa+yJQKAyWPSV4FyTkdSjSE1bRctsGQTdgZ51Rb8XwLlrzDySTvckScXy6+s
 hGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722127180; x=1722731980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2WtLQ0AuJweiHPK220i2nAx1+PX8DFaWeqci7mSxG24=;
 b=pYuukYP29/jSq7gStc0HKvfMOzk58nf7vADMJnQd/d6s2IdVEgciSMHjUWBgyVoeGi
 tpEQn2PKZzC9Ypc7anQHAwN1UF1pHjhw1WzlLOHjqx5LW1rFi+ie5p3Us/XlSPad2uuv
 2T5QtxlTVyzxYW3NS8SbRU/aQEKpbDjURD1lX9e7H+Mu98TfHmcdoH+T/7j7cKm9+x0Z
 o57nbXE21P7xpCB+kicfZG+7V9qOWb365D09ijRckLjisOvTUCJQjv7M/o3ZpJ15Z06k
 /XKUmAML1F+HF1pKxXSKcTrKXTX001H85gip/yNOLlYVxltersV7PManNRSnTcRis1n/
 u91w==
X-Gm-Message-State: AOJu0Yz0xMq8QGveRbfpSxWZktw6c6K538T1p0jZTpU/CkIznBJKIV0z
 CBsIbl8Xn8eg9MRDQIqUldfQMDPUZMToVztyXVXuSF2vfRZf07l1YzswXlLpQ9f56YxDoMovrND
 AFZUIX9tmbvmCuPv4SgCdbHJu/0c=
X-Google-Smtp-Source: AGHT+IG5JQmE65nithUd9gPWobOGx0/wdLHMpZKHL5EDmk/X0iJLRv2GjUeuZ9m3ZtbUUM4Sp8hPEYcHGMBevld2lSc=
X-Received: by 2002:a05:6512:3414:b0:52f:cb5c:b083 with SMTP id
 2adb3069b0e04-5309b25a268mr2557766e87.5.1722127179445; Sat, 27 Jul 2024
 17:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvMr9YgvLds8_OCMVV6FOzuBUgwn8_X6Pbz3hq_oakSWw@mail.gmail.com>
In-Reply-To: <CAH2r5mvMr9YgvLds8_OCMVV6FOzuBUgwn8_X6Pbz3hq_oakSWw@mail.gmail.com>
Date: Sat, 27 Jul 2024 19:39:28 -0500
Message-ID: <CAH2r5mt6n3-46_gS2GNVtrLj-CE4mCP60W3D_-y3QdZ6UKsgkg@mail.gmail.com>
Subject: Re: [PATCH][SMB3] mark compression as CONFIG_EXPERIMENTAL and fix
 missing compression operation
To: Enzo Matsumiya <ematsumiya@suse.de>, CIFS <linux-cifs@vger.kernel.org>
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
Cc: Anthony Nandaa <profnandaa@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Jun Ma <junma@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Had to add one line due to an error in some configurations pointed out
by the kernel test robot:

index 0cc9c6abf840..3d0d3eaa8ffb 100644
--- a/fs/smb/client/compress/lz77.h
+++ b/fs/smb/client/compress/lz77.h
@@ -9,6 +9,7 @@
 #ifndef _SMB_COMPRESS_LZ77_H
 #define _SMB_COMPRESS_LZ77_H

+#include <linux/uaccess.h>
 #ifdef CONFIG_CIFS_COMPRESSION
 #include <asm/ptrace.h>
 #include <linux/kernel.h>

to address:

   In file included from fs/smb/client/compress/lz77.c:10:
>> fs/smb/client/compress/lz77.h:127:9: error: call to undeclared function =
'copy_from_kernel_nofault'; ISO C99 and later do not support implicit funct=
ion declarations [-Wimplicit-function-declaration]
     127 |         return copy_from_kernel_nofault(dst, src, count);
         |                ^
   1 error generated.


vim +/copy_from_kernel_nofault +127 fs/smb/client/compress/lz77.h

   124
   125  static __always_inline long lz77_copy(u8 *dst, const u8 *src,
size_t count)
   126  {
 > 127           return copy_from_kernel_nofault(dst, src, count);
   128  }
   129  #else /* CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS */
   130  static __always_inline u8 lz77_read8(const void *ptr)
   131  {
   132          return get_unaligned((u8 *)ptr);
   133  }
   134

On Fri, Jul 26, 2024 at 6:53=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> Since some of Enzo's compression patch series has to be changed due to Da=
vid Howell's netfs changes to cifs.ko over the past two releases, I split o=
ut the obvious parts of his patch to implement the client side of SMB3.1.1 =
compression on write requests (see https://git.exis.tech/linux.git/patch/?i=
d=3D40414c6a34081b372e45c7ce5060a6d34779f6ba for the original patch of Enzo=
's) but left out the final piece of the patch (the calls from the write pat=
h).
>
> This moves SMB3.1.1 compression code into experimental config option,
> and fixes the compress mount option to require that config option.
> Also implements unchained LZ77 "plain" compression algorithm as per
> MS-XCA specification section "2.3 Plain LZ77 Compression Algorithm Detail=
s".
>
> See attached
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

