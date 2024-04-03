Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D63CE897965
	for <lists+samba-technical@lfdr.de>; Wed,  3 Apr 2024 21:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=kLRbB4vJiwQh+bNquoBLIDoB6fRHgFG4JUhpR8/WLSU=; b=YmxLStnmFEqO441BuMuNEZIE48
	aUt6rIHP8V2OD9O9+rLQh8/z1kY97kkA4r3lIG/MWODvOVT2FrQgpMKNeuRDE2lrWmrVXac/6MMmL
	oppimO6MGT9QCTzYkfnUoDUfUhh/m8WsXxcaPY83pwmvwO9iUT+3nd1VznW8qrRFmB44u3oISYRF8
	pQ/hKNmBMpY9IWYpTcq51qBuL3o/Mu22pUUf13UFX5GdGK/JWcLMHkB2owLJEUzptdPyTsppMBL6v
	xTM4Q2AqoZzl8UpedYir3DimTi5K3SXmsWEd8iOQ18JM0KJuDoQgJGqASjGTVpoaWJIDyHcjYQny5
	LuEf8QEQ==;
Received: from ip6-localhost ([::1]:40036 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rs6gy-003rGc-3B; Wed, 03 Apr 2024 19:54:40 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:47330) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rs6gq-003rGV-MH
 for samba-technical@lists.samba.org; Wed, 03 Apr 2024 19:54:38 +0000
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d6fd3cfaa6so3326101fa.2
 for <samba-technical@lists.samba.org>; Wed, 03 Apr 2024 12:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712174070; x=1712778870; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EwQ7LeguxXFHFb2AkESHWiYJEorjbtIag8chNFhMNrk=;
 b=Eq1nhn/Y7d2nc1TVwQdT2++20kTIx7Nvt6ZzNrpiwj1zH7akrxtA+HKHg9TZSAxcOy
 +TziW+Mj/Lo5BXLLAtvFkjrCD7tkdly9NJw4bBgkxLoA0m4xVYCk0sR8RrDKXcxOsTbM
 cwakwBISCXB3UmDPkTQtjnFhJTiQc8qM/CawxOpNAI/EBe1XApKSHGNcuM/6t1xEKwjF
 hr0Kg3yU1zoGAj2DLLX4SCt5OaN9xxt9bR2FNfja3ipmAB1wEHd/l/s9FqCv7rOV0890
 k8wYxGacljtBY31MMz1us83eDI/Tjz7fx1qcQ8JOWSJodAvjgx56As47DfQUT+PWZ7NB
 mX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174070; x=1712778870;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EwQ7LeguxXFHFb2AkESHWiYJEorjbtIag8chNFhMNrk=;
 b=GwfjhzMS8IFCnKAC8T9o+GM5Ws5Z2lsAfpS4SYfNM0kQUiGrWJJp0i/m4gGbBPZ0Ct
 C0C0nCiyGx1/dodjGIpiHOWtuGk0f2/Wc1uwzB9kaGeA0W/vXGgM12NykG+shzFhidD0
 DDis1mbNy8WIhakyZ5Xbh3l3eNp7fmjw/YRT319O498X99w0hFBYlv6hVYd++Pv9wNyz
 yjFBSAYmWiDH2mc44pqvSN1L1lboc307i3pUmg1/PixNbCtOSOk1KDjqLdV2USk4X6my
 T1cKgXm5G5q0mKkrNWLRFbKuQ3+//wIFUWCEMIOrUmnA6MHbqbq75Wd/AMJJVAWt6WWy
 BsLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqSbzvS7GxzDsgl8TbmYo07kpi6lZsn/jNsEzy7LVdsSxC9/J+JlYPg/gctbGvD0+lUpH+uUxiCby5g2LgrIVedRnw482UyEqWpHqJNlUy
X-Gm-Message-State: AOJu0YwTAeCeHc/DUZWGr63DxqQ4OL9qSjsTDHKDdIucw970nh/eb2np
 RTxbFctR1+rK/xqTuWnZVTnQUX78BZnBFEzqUYi/6gbkxRu3CXADTxxM3kXcLzf8TFmgv1PVOn9
 dVvU0/LFaLx7voSgr+CUe69AGDBs=
X-Google-Smtp-Source: AGHT+IFuF6mBKEuCuisolA4PSBDveFGo5aWn7lYNDNzhx4tAnf0D+P9WeVO73DCbekTEkXWZTV6V501l/c1y9Hvb4xw=
X-Received: by 2002:a2e:7c0a:0:b0:2d6:ff04:200f with SMTP id
 x10-20020a2e7c0a000000b002d6ff04200fmr458440ljc.33.1712174070008; Wed, 03 Apr
 2024 12:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <202404032326.KpdXGGKv-lkp@intel.com>
In-Reply-To: <202404032326.KpdXGGKv-lkp@intel.com>
Date: Wed, 3 Apr 2024 14:54:17 -0500
Message-ID: <CAH2r5mvQh0vQi-RD7=yVOCsaKoqrCbb0waWr=MCQ_pepUKTbOg@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 727900b675b749c40ba1f6669c7ae5eb7eb8e837
To: kernel test robot <lkp@intel.com>,
 Ritvik Budhiraja <budhirajaritviksmb@gmail.com>
Content-Type: multipart/mixed; boundary="0000000000003ca74306153697c3"
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000003ca74306153697c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixed (and updated in cifs-2.6.git for-next)
Updated patch attached



On Wed, Apr 3, 2024 at 10:57=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:

> tree/branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git maste=
r
> branch HEAD: 727900b675b749c40ba1f6669c7ae5eb7eb8e837  Add linux-next
> specific files for 20240403
>
> Error/Warning reports:
>
> https://lore.kernel.org/oe-kbuild-all/202404031246.aq5Yr5KO-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202404031346.wpIhNpyF-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202404032101.sKzRXCWH-lkp@intel.com
>
> Error/Warning: (recently discovered and may have been fixed)
>
> fs/smb/client/file.c:728:12: warning: variable 'rc' is used uninitialized
> whenever 'if' condition is false [-Wsometimes-uninitialized]
> mm/kasan/hw_tags.c:280:14: warning: assignment to 'struct vm_struct *'
> from 'int' makes pointer from integer without a cast [-Wint-conversion]
> mm/kasan/hw_tags.c:280:16: error: implicit declaration of function
> 'find_vm_area'; did you mean 'find_vma_prev'?
> [-Werror=3Dimplicit-function-declaration]
> mm/kasan/hw_tags.c:284:29: error: invalid use of undefined type 'struct
> vm_struct'
> riscv32-linux-ld: section .data LMA [001f9000,009465d7] overlaps section
> .text LMA [000a7e84,0177d68b]
>
> Unverified Error/Warning (likely false positive, please contact us if
> interested):
>
> fs/smb/client/file.c:619 serverclose_work() error: uninitialized symbol
> 'rc'.
> fs/smb/client/file.c:732 _cifsFileInfo_put() error: uninitialized symbol
> 'rc'.
>
> Error/Warning ids grouped by kconfigs:
>
> gcc_recent_errors
> |-- alpha-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- alpha-allyesconfig
> |   |--
> drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-tr=
uncated-writing-bytes-into-a-region-of-size-between-and
> |   |--
> drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-=
be-truncated-writing-between-and-bytes-into-a-region-of-size
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- alpha-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm-allmodconfig
> |   |--
> drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-tr=
uncated-writing-bytes-into-a-region-of-size-between-and
> |   |--
> drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-=
be-truncated-writing-between-and-bytes-into-a-region-of-size
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm-allyesconfig
> |   |--
> drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-tr=
uncated-writing-bytes-into-a-region-of-size-between-and
> |   |--
> drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-=
be-truncated-writing-between-and-bytes-into-a-region-of-size
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm-aspeed_g5_defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm-randconfig-004-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm-randconfig-r061-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm64-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm64-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm64-randconfig-003-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm64-randconfig-r011-20220710
> |   |--
> mm-kasan-hw_tags.c:error:implicit-declaration-of-function-find_vm_area
> |   |--
> mm-kasan-hw_tags.c:error:invalid-use-of-undefined-type-struct-vm_struct
> |   `--
> mm-kasan-hw_tags.c:warning:assignment-to-struct-vm_struct-from-int-makes-=
pointer-from-integer-without-a-cast
> |-- arm64-randconfig-r064-20240403
> |   |--
> drivers-firmware-arm_scmi-raw_mode.c:WARNING:scmi_dbg_raw_mode_reset_fops=
:write()-has-stream-semantic-safe-to-change-nonseekable_open-stream_open.
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- csky-allmodconfig
> |   |--
> drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-tr=
uncated-writing-bytes-into-a-region-of-size-between-and
> |   |--
> drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-=
be-truncated-writing-between-and-bytes-into-a-region-of-size
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- csky-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- csky-allyesconfig
> |   |--
> drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-tr=
uncated-writing-bytes-into-a-region-of-size-between-and
> |   |--
> drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-=
be-truncated-writing-between-and-bytes-into-a-region-of-size
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- csky-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- csky-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- csky-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-allmodconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-allyesconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-buildonly-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-buildonly-randconfig-005-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-003-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-004-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-006-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-011-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-013-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-015-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-051-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-053-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-061-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-062-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-063-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- loongarch-allmodconfig
> |   |--
> drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-tr=
uncated-writing-bytes-into-a-region-of-size-between-and
> |   |--
> drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-=
be-truncated-writing-between-and-bytes-into-a-region-of-size
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- loongarch-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- loongarch-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- loongarch-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- loongarch-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- m68k-allmodconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- m68k-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- m68k-allyesconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- m68k-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- m68k-m5307c3_defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- m68k-randconfig-r053-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- microblaze-allmodconfig
> |   |--
> drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-tr=
uncated-writing-bytes-into-a-region-of-size-between-and
> |   |--
> drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-=
be-truncated-writing-between-and-bytes-into-a-region-of-size
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- microblaze-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- microblaze-allyesconfig
> |   |--
> drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-tr=
uncated-writing-bytes-into-a-region-of-size-between-and
> |   |--
> drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-=
be-truncated-writing-between-and-bytes-into-a-region-of-size
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- microblaze-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- microblaze-randconfig-r122-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- mips-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- mips-allyesconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- mips-loongson3_defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- nios2-allmodconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- nios2-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- nios2-allyesconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- nios2-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- nios2-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- nios2-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- nios2-randconfig-r131-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- nios2-randconfig-r133-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- openrisc-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- openrisc-allyesconfig
> |   |--
> drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-tr=
uncated-writing-bytes-into-a-region-of-size-between-and
> |   |--
> drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-=
be-truncated-writing-between-and-bytes-into-a-region-of-size
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- openrisc-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- openrisc-randconfig-r111-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc-allmodconfig
> |   |--
> drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-tr=
uncated-writing-bytes-into-a-region-of-size-between-and
> |   |--
> drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-=
be-truncated-writing-between-and-bytes-into-a-region-of-size
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc-mpc837x_rdb_defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc-mvme5100_defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc-ppc64e_defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc-randconfig-r121-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc64-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc64-randconfig-003-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- riscv-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- riscv-randconfig-r032-20221115
> |   `--
> riscv32-linux-ld:section-.data-LMA-001f9465d7-overlaps-section-.text-LMA-=
000a7e7d68b
> |-- riscv-randconfig-r112-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- s390-alldefconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- s390-allyesconfig
> |   |--
> drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-tr=
uncated-writing-bytes-into-a-region-of-size-between-and
> |   |--
> drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-=
be-truncated-writing-between-and-bytes-into-a-region-of-size
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- s390-randconfig-r052-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- s390-randconfig-r123-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- sparc-allmodconfig
> |   |--
> drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-tr=
uncated-writing-bytes-into-a-region-of-size-between-and
> |   |--
> drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-=
be-truncated-writing-between-and-bytes-into-a-region-of-size
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- sparc-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- sparc-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- sparc-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- sparc-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- sparc-randconfig-r051-20240403
> |   |--
> (.head.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-init.tex=
t
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- sparc64-allmodconfig
> |   |--
> drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-tr=
uncated-writing-bytes-into-a-region-of-size-between-and
> |   |--
> drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-=
be-truncated-writing-between-and-bytes-into-a-region-of-size
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- sparc64-allyesconfig
> |   |--
> drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-tr=
uncated-writing-bytes-into-a-region-of-size-between-and
> |   |--
> drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-=
be-truncated-writing-between-and-bytes-into-a-region-of-size
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- sparc64-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- sparc64-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- sparc64-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- um-allyesconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- um-i386_defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- um-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-buildonly-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-buildonly-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-buildonly-randconfig-004-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-buildonly-randconfig-006-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-003-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-004-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-005-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-011-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-012-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-013-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-014-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-015-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-016-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-072-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-074-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-075-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-076-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-101-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-102-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |   `--
> sound-soc-codecs-rk3308_codec.c:warning:rk3308_codec_of_match-defined-but=
-not-used
> |-- x86_64-randconfig-103-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-104-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-122-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-161-20240403
> |   |--
> drivers-pinctrl-pinctrl-aw9523.c-aw9523_gpio_get_multiple()-error:uniniti=
alized-symbol-ret-.
> |   |--
> drivers-pinctrl-pinctrl-aw9523.c-aw9523_pconf_set()-error:uninitialized-s=
ymbol-rc-.
> |   |--
> fs-smb-client-file.c-_cifsFileInfo_put()-error:uninitialized-symbol-rc-.
> |   |--
> fs-smb-client-file.c-serverclose_work()-error:uninitialized-symbol-rc-.
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- xtensa-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- xtensa-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- xtensa-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> `-- xtensa-randconfig-r062-20240403
>     |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
>     `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> clang_recent_errors
> |-- arm-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm-imx_v6_v7_defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm-pxa168_defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm-randconfig-003-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm64-allmodconfig
> |   |--
> drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:arithme=
tic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_t=
ype-)-Werror-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dce110-irq_service_dce110.c:=
error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-a=
nd-enum-irq_type-)-Werror-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-amd-amdgpu-amdgpu_drv.c:error:bitwise-operation-between-d=
ifferent-enumeration-types-(-enum-amd_asic_type-and-enum-amd_chip_flags-)-W=
error-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-amd-amdgpu-amdgpu_ras.c:error:arithmetic-between-differen=
t-enumeration-types-(-enum-amdgpu_ras_block-and-enum-amdgpu_ras_mca_block-)=
-Werror-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-i915-display-intel_ddi.c:error:arithmetic-between-differe=
nt-enumeration-types-(-enum-hpd_pin-and-enum-port-)-Werror-Wenum-enum-conve=
rsion
> |   |--
> drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-dif=
ferent-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-=
Werror-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-dif=
ferent-enumeration-types-(-enum-tc_port-and-enum-port-)-Werror-Wenum-enum-c=
onversion
> |   |--
> drivers-gpu-drm-lima-lima_drv.c:error:cast-to-smaller-integer-type-enum-l=
ima_gpu_id-from-const-void-Werror-Wvoid-pointer-to-enum-cast
> |   |--
> drivers-gpu-drm-msm-adreno-a6xx_gpu_state.c:error:variable-out-set-but-no=
t-used-Werror-Wunused-but-set-variable
> |   |--
> drivers-gpu-drm-panthor-panthor_sched.c:error:variable-csg_mod_mask-set-b=
ut-not-used-Werror-Wunused-but-set-variable
> |   |--
> drivers-gpu-drm-pl111-pl111_versatile.c:error:cast-to-smaller-integer-typ=
e-enum-versatile_clcd-from-const-void-Werror-Wvoid-pointer-to-enum-cast
> |   |--
> drivers-gpu-drm-radeon-radeon_drv.c:error:bitwise-operation-between-diffe=
rent-enumeration-types-(-enum-radeon_family-and-enum-radeon_chip_flags-)-We=
rror-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-renesas-rcar-du-rcar_cmm.c:error:unused-function-rcar_cmm=
_read-Werror-Wunused-function
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm64-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm64-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- arm64-randconfig-004-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- hexagon-allmodconfig
> |   |--
> include-asm-generic-io.h:error:performing-pointer-arithmetic-on-a-null-po=
inter-has-undefined-behavior-Werror-Wnull-pointer-arithmetic
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- hexagon-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- hexagon-allyesconfig
> |   |--
> include-asm-generic-io.h:error:performing-pointer-arithmetic-on-a-null-po=
inter-has-undefined-behavior-Werror-Wnull-pointer-arithmetic
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- hexagon-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- hexagon-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- hexagon-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- hexagon-randconfig-r063-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-buildonly-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-buildonly-randconfig-003-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-buildonly-randconfig-004-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-buildonly-randconfig-006-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-005-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-012-20240403
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-014-20240403
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-016-20240403
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-052-20240403
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-054-20240403
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-141-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- i386-randconfig-r132-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- mips-bcm63xx_defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- mips-mtx1_defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc-allyesconfig
> |   |--
> drivers-gpu-drm-amd-amdgpu-amdgpu_drv.c:error:bitwise-operation-between-d=
ifferent-enumeration-types-(-enum-amd_asic_type-and-enum-amd_chip_flags-)-W=
error-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-amd-amdgpu-amdgpu_ras.c:error:arithmetic-between-differen=
t-enumeration-types-(-enum-amdgpu_ras_block-and-enum-amdgpu_ras_mca_block-)=
-Werror-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-lima-lima_drv.c:error:cast-to-smaller-integer-type-enum-l=
ima_gpu_id-from-const-void-Werror-Wvoid-pointer-to-enum-cast
> |   |--
> drivers-gpu-drm-msm-adreno-a6xx_gpu_state.c:error:variable-out-set-but-no=
t-used-Werror-Wunused-but-set-variable
> |   |--
> drivers-gpu-drm-nouveau-nvkm-subdev-bios-shadowof.c:error:cast-from-void-=
(-)(const-void-)-to-void-(-)(void-)-converts-to-incompatible-function-type-=
Werror-Wcast-function-type-strict
> |   |--
> drivers-gpu-drm-panthor-panthor_sched.c:error:variable-csg_mod_mask-set-b=
ut-not-used-Werror-Wunused-but-set-variable
> |   |--
> drivers-gpu-drm-pl111-pl111_versatile.c:error:cast-to-smaller-integer-typ=
e-enum-versatile_clcd-from-const-void-Werror-Wvoid-pointer-to-enum-cast
> |   |--
> drivers-gpu-drm-radeon-radeon_drv.c:error:bitwise-operation-between-diffe=
rent-enumeration-types-(-enum-radeon_family-and-enum-radeon_chip_flags-)-We=
rror-Wenum-enum-conversion
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc-eiger_defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc-mpc512x_defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc-randconfig-003-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc-randconfig-r054-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- powerpc64-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- riscv-allmodconfig
> |   |--
> drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:arithme=
tic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_t=
ype-)-Werror-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dce110-irq_service_dce110.c:=
error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-a=
nd-enum-irq_type-)-Werror-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-amd-amdgpu-amdgpu_drv.c:error:bitwise-operation-between-d=
ifferent-enumeration-types-(-enum-amd_asic_type-and-enum-amd_chip_flags-)-W=
error-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-amd-amdgpu-amdgpu_ras.c:error:arithmetic-between-differen=
t-enumeration-types-(-enum-amdgpu_ras_block-and-enum-amdgpu_ras_mca_block-)=
-Werror-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-i915-display-intel_ddi.c:error:arithmetic-between-differe=
nt-enumeration-types-(-enum-hpd_pin-and-enum-port-)-Werror-Wenum-enum-conve=
rsion
> |   |--
> drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-dif=
ferent-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-=
Werror-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-dif=
ferent-enumeration-types-(-enum-tc_port-and-enum-port-)-Werror-Wenum-enum-c=
onversion
> |   |--
> drivers-gpu-drm-lima-lima_drv.c:error:cast-to-smaller-integer-type-enum-l=
ima_gpu_id-from-const-void-Werror-Wvoid-pointer-to-enum-cast
> |   |--
> drivers-gpu-drm-msm-adreno-a6xx_gpu_state.c:error:variable-out-set-but-no=
t-used-Werror-Wunused-but-set-variable
> |   |--
> drivers-gpu-drm-panthor-panthor_sched.c:error:variable-csg_mod_mask-set-b=
ut-not-used-Werror-Wunused-but-set-variable
> |   |--
> drivers-gpu-drm-pl111-pl111_versatile.c:error:cast-to-smaller-integer-typ=
e-enum-versatile_clcd-from-const-void-Werror-Wvoid-pointer-to-enum-cast
> |   |--
> drivers-gpu-drm-radeon-radeon_drv.c:error:bitwise-operation-between-diffe=
rent-enumeration-types-(-enum-radeon_family-and-enum-radeon_chip_flags-)-We=
rror-Wenum-enum-conversion
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- riscv-allyesconfig
> |   |--
> drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:arithme=
tic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_t=
ype-)-Werror-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dce110-irq_service_dce110.c:=
error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-a=
nd-enum-irq_type-)-Werror-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-amd-amdgpu-amdgpu_drv.c:error:bitwise-operation-between-d=
ifferent-enumeration-types-(-enum-amd_asic_type-and-enum-amd_chip_flags-)-W=
error-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-amd-amdgpu-amdgpu_ras.c:error:arithmetic-between-differen=
t-enumeration-types-(-enum-amdgpu_ras_block-and-enum-amdgpu_ras_mca_block-)=
-Werror-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-lima-lima_drv.c:error:cast-to-smaller-integer-type-enum-l=
ima_gpu_id-from-const-void-Werror-Wvoid-pointer-to-enum-cast
> |   |--
> drivers-gpu-drm-msm-adreno-a6xx_gpu_state.c:error:variable-out-set-but-no=
t-used-Werror-Wunused-but-set-variable
> |   |--
> drivers-gpu-drm-panthor-panthor_sched.c:error:variable-csg_mod_mask-set-b=
ut-not-used-Werror-Wunused-but-set-variable
> |   |--
> drivers-gpu-drm-pl111-pl111_versatile.c:error:cast-to-smaller-integer-typ=
e-enum-versatile_clcd-from-const-void-Werror-Wvoid-pointer-to-enum-cast
> |   |--
> drivers-gpu-drm-radeon-radeon_drv.c:error:bitwise-operation-between-diffe=
rent-enumeration-types-(-enum-radeon_family-and-enum-radeon_chip_flags-)-We=
rror-Wenum-enum-conversion
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- riscv-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- riscv-randconfig-001-20240403
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- riscv-randconfig-002-20240403
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- s390-allmodconfig
> |   |--
> drivers-gpu-drm-amd-amdgpu-amdgpu_drv.c:error:bitwise-operation-between-d=
ifferent-enumeration-types-(-enum-amd_asic_type-and-enum-amd_chip_flags-)-W=
error-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-amd-amdgpu-amdgpu_ras.c:error:arithmetic-between-differen=
t-enumeration-types-(-enum-amdgpu_ras_block-and-enum-amdgpu_ras_mca_block-)=
-Werror-Wenum-enum-conversion
> |   |--
> drivers-gpu-drm-lima-lima_drv.c:error:cast-to-smaller-integer-type-enum-l=
ima_gpu_id-from-const-void-Werror-Wvoid-pointer-to-enum-cast
> |   |--
> drivers-gpu-drm-panthor-panthor_sched.c:error:variable-csg_mod_mask-set-b=
ut-not-used-Werror-Wunused-but-set-variable
> |   |--
> drivers-gpu-drm-pl111-pl111_versatile.c:error:cast-to-smaller-integer-typ=
e-enum-versatile_clcd-from-const-void-Werror-Wvoid-pointer-to-enum-cast
> |   |--
> drivers-gpu-drm-radeon-radeon_drv.c:error:bitwise-operation-between-diffe=
rent-enumeration-types-(-enum-radeon_family-and-enum-radeon_chip_flags-)-We=
rror-Wenum-enum-conversion
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> include-asm-generic-io.h:error:performing-pointer-arithmetic-on-a-null-po=
inter-has-undefined-behavior-Werror-Wnull-pointer-arithmetic
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- s390-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- s390-defconfig
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- s390-randconfig-001-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- s390-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- um-allmodconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- um-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- um-defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- um-randconfig-002-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- um-x86_64_defconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-allmodconfig
> |   |--
> drivers-gpu-drm-kmb-kmb_dsi.c:error:unused-function-set_test_mode_src_osc=
_freq_target_hi_bits-Werror-Wunused-function
> |   |--
> drivers-gpu-drm-kmb-kmb_dsi.c:error:unused-function-set_test_mode_src_osc=
_freq_target_low_bits-Werror-Wunused-function
> |   |--
> drivers-gpu-drm-lima-lima_drv.c:error:cast-to-smaller-integer-type-enum-l=
ima_gpu_id-from-const-void-Werror-Wvoid-pointer-to-enum-cast
> |   |--
> drivers-gpu-drm-msm-adreno-a6xx_gpu_state.c:error:variable-out-set-but-no=
t-used-Werror-Wunused-but-set-variable
> |   |--
> drivers-gpu-drm-panthor-panthor_sched.c:error:variable-csg_mod_mask-set-b=
ut-not-used-Werror-Wunused-but-set-variable
> |   |--
> drivers-gpu-drm-pl111-pl111_versatile.c:error:cast-to-smaller-integer-typ=
e-enum-versatile_clcd-from-const-void-Werror-Wvoid-pointer-to-enum-cast
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-allnoconfig
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-allyesconfig
> |   |--
> drivers-gpu-drm-kmb-kmb_dsi.c:error:unused-function-set_test_mode_src_osc=
_freq_target_hi_bits-Werror-Wunused-function
> |   |--
> drivers-gpu-drm-kmb-kmb_dsi.c:error:unused-function-set_test_mode_src_osc=
_freq_target_low_bits-Werror-Wunused-function
> |   |--
> drivers-gpu-drm-lima-lima_drv.c:error:cast-to-smaller-integer-type-enum-l=
ima_gpu_id-from-const-void-Werror-Wvoid-pointer-to-enum-cast
> |   |--
> drivers-gpu-drm-msm-adreno-a6xx_gpu_state.c:error:variable-out-set-but-no=
t-used-Werror-Wunused-but-set-variable
> |   |--
> drivers-gpu-drm-panthor-panthor_sched.c:error:variable-csg_mod_mask-set-b=
ut-not-used-Werror-Wunused-but-set-variable
> |   |--
> drivers-gpu-drm-pl111-pl111_versatile.c:error:cast-to-smaller-integer-typ=
e-enum-versatile_clcd-from-const-void-Werror-Wvoid-pointer-to-enum-cast
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-buildonly-randconfig-003-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-buildonly-randconfig-005-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-002-20240403
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-006-20240403
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-071-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-073-20240403
> |   |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-121-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> |-- x86_64-randconfig-123-20240403
> |   |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
> |   `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
> `-- x86_64-rhel-8.3-rust
>     |--
> fs-smb-client-file.c:warning:variable-rc-is-used-uninitialized-whenever-i=
f-condition-is-false
>     |--
> mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-des=
cribed-in-mempool_create_node
>     `--
> mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-desc=
ribed-in-mempool_create_node
>
> elapsed time: 726m
>
> configs tested: 179
> configs skipped: 3
>
> tested configs:
> alpha                             allnoconfig   gcc
> alpha                            allyesconfig   gcc
> alpha                               defconfig   gcc
> arc                              allmodconfig   gcc
> arc                               allnoconfig   gcc
> arc                              allyesconfig   gcc
> arc                                 defconfig   gcc
> arc                   randconfig-001-20240403   gcc
> arc                   randconfig-002-20240403   gcc
> arm                              allmodconfig   gcc
> arm                               allnoconfig   clang
> arm                              allyesconfig   gcc
> arm                       aspeed_g5_defconfig   gcc
> arm                                 defconfig   clang
> arm                       imx_v6_v7_defconfig   clang
> arm                          pxa168_defconfig   clang
> arm                   randconfig-001-20240403   gcc
> arm                   randconfig-002-20240403   gcc
> arm                   randconfig-003-20240403   clang
> arm                   randconfig-004-20240403   gcc
> arm64                            allmodconfig   clang
> arm64                             allnoconfig   gcc
> arm64                               defconfig   gcc
> arm64                 randconfig-001-20240403   clang
> arm64                 randconfig-002-20240403   clang
> arm64                 randconfig-003-20240403   gcc
> arm64                 randconfig-004-20240403   clang
> csky                             allmodconfig   gcc
> csky                              allnoconfig   gcc
> csky                             allyesconfig   gcc
> csky                                defconfig   gcc
> csky                  randconfig-001-20240403   gcc
> csky                  randconfig-002-20240403   gcc
> hexagon                          allmodconfig   clang
> hexagon                           allnoconfig   clang
> hexagon                          allyesconfig   clang
> hexagon                             defconfig   clang
> hexagon               randconfig-001-20240403   clang
> hexagon               randconfig-002-20240403   clang
> i386                             allmodconfig   gcc
> i386                              allnoconfig   gcc
> i386                             allyesconfig   gcc
> i386         buildonly-randconfig-001-20240403   gcc
> i386         buildonly-randconfig-002-20240403   clang
> i386         buildonly-randconfig-003-20240403   clang
> i386         buildonly-randconfig-004-20240403   clang
> i386         buildonly-randconfig-005-20240403   gcc
> i386         buildonly-randconfig-006-20240403   clang
> i386                                defconfig   clang
> i386                  randconfig-001-20240403   gcc
> i386                  randconfig-002-20240403   clang
> i386                  randconfig-003-20240403   gcc
> i386                  randconfig-004-20240403   gcc
> i386                  randconfig-005-20240403   clang
> i386                  randconfig-006-20240403   gcc
> i386                  randconfig-011-20240403   gcc
> i386                  randconfig-012-20240403   clang
> i386                  randconfig-013-20240403   gcc
> i386                  randconfig-014-20240403   clang
> i386                  randconfig-015-20240403   gcc
> i386                  randconfig-016-20240403   clang
> loongarch                        allmodconfig   gcc
> loongarch                         allnoconfig   gcc
> loongarch                           defconfig   gcc
> loongarch             randconfig-001-20240403   gcc
> loongarch             randconfig-002-20240403   gcc
> m68k                             allmodconfig   gcc
> m68k                              allnoconfig   gcc
> m68k                             allyesconfig   gcc
> m68k                                defconfig   gcc
> m68k                        m5307c3_defconfig   gcc
> microblaze                       allmodconfig   gcc
> microblaze                        allnoconfig   gcc
> microblaze                       allyesconfig   gcc
> microblaze                          defconfig   gcc
> mips                              allnoconfig   gcc
> mips                             allyesconfig   gcc
> mips                        bcm63xx_defconfig   clang
> mips                      loongson3_defconfig   gcc
> mips                           mtx1_defconfig   clang
> nios2                            allmodconfig   gcc
> nios2                             allnoconfig   gcc
> nios2                            allyesconfig   gcc
> nios2                               defconfig   gcc
> nios2                 randconfig-001-20240403   gcc
> nios2                 randconfig-002-20240403   gcc
> openrisc                          allnoconfig   gcc
> openrisc                         allyesconfig   gcc
> openrisc                            defconfig   gcc
> parisc                           allmodconfig   gcc
> parisc                            allnoconfig   gcc
> parisc                           allyesconfig   gcc
> parisc                              defconfig   gcc
> parisc                randconfig-001-20240403   gcc
> parisc                randconfig-002-20240403   gcc
> parisc64                            defconfig   gcc
> powerpc                          allmodconfig   gcc
> powerpc                           allnoconfig   gcc
> powerpc                          allyesconfig   clang
> powerpc                       eiger_defconfig   clang
> powerpc                     mpc512x_defconfig   clang
> powerpc                 mpc837x_rdb_defconfig   gcc
> powerpc                    mvme5100_defconfig   gcc
> powerpc                      ppc64e_defconfig   gcc
> powerpc               randconfig-001-20240403   gcc
> powerpc               randconfig-002-20240403   gcc
> powerpc               randconfig-003-20240403   clang
> powerpc                     stx_gp3_defconfig   clang
> powerpc64             randconfig-001-20240403   gcc
> powerpc64             randconfig-002-20240403   clang
> powerpc64             randconfig-003-20240403   gcc
> riscv                            allmodconfig   clang
> riscv                             allnoconfig   gcc
> riscv                            allyesconfig   clang
> riscv                               defconfig   clang
> riscv                 randconfig-001-20240403   clang
> riscv                 randconfig-002-20240403   clang
> s390                             alldefconfig   gcc
> s390                             allmodconfig   clang
> s390                              allnoconfig   clang
> s390                             allyesconfig   gcc
> s390                                defconfig   clang
> s390                  randconfig-001-20240403   clang
> s390                  randconfig-002-20240403   clang
> sh                               allmodconfig   gcc
> sh                                allnoconfig   gcc
> sh                               allyesconfig   gcc
> sh                                  defconfig   gcc
> sh                    randconfig-001-20240403   gcc
> sh                    randconfig-002-20240403   gcc
> sh                           se7721_defconfig   gcc
> sh                        sh7763rdp_defconfig   gcc
> sparc                            allmodconfig   gcc
> sparc                             allnoconfig   gcc
> sparc                               defconfig   gcc
> sparc64                          allmodconfig   gcc
> sparc64                          allyesconfig   gcc
> sparc64                             defconfig   gcc
> sparc64               randconfig-001-20240403   gcc
> sparc64               randconfig-002-20240403   gcc
> um                               allmodconfig   clang
> um                                allnoconfig   clang
> um                               allyesconfig   gcc
> um                                  defconfig   clang
> um                             i386_defconfig   gcc
> um                    randconfig-001-20240403   gcc
> um                    randconfig-002-20240403   clang
> um                           x86_64_defconfig   clang
> x86_64                            allnoconfig   clang
> x86_64                           allyesconfig   clang
> x86_64       buildonly-randconfig-001-20240403   gcc
> x86_64       buildonly-randconfig-002-20240403   gcc
> x86_64       buildonly-randconfig-003-20240403   clang
> x86_64       buildonly-randconfig-004-20240403   gcc
> x86_64       buildonly-randconfig-005-20240403   clang
> x86_64       buildonly-randconfig-006-20240403   gcc
> x86_64                              defconfig   gcc
> x86_64                randconfig-001-20240403   gcc
> x86_64                randconfig-002-20240403   clang
> x86_64                randconfig-003-20240403   gcc
> x86_64                randconfig-004-20240403   gcc
> x86_64                randconfig-005-20240403   gcc
> x86_64                randconfig-006-20240403   clang
> x86_64                randconfig-011-20240403   gcc
> x86_64                randconfig-012-20240403   gcc
> x86_64                randconfig-013-20240403   gcc
> x86_64                randconfig-014-20240403   gcc
> x86_64                randconfig-015-20240403   gcc
> x86_64                randconfig-016-20240403   gcc
> x86_64                randconfig-071-20240403   clang
> x86_64                randconfig-072-20240403   gcc
> x86_64                randconfig-073-20240403   clang
> x86_64                randconfig-074-20240403   gcc
> x86_64                randconfig-075-20240403   gcc
> x86_64                randconfig-076-20240403   gcc
> x86_64                          rhel-8.3-rust   clang
> xtensa                            allnoconfig   gcc
> xtensa                randconfig-001-20240403   gcc
> xtensa                randconfig-002-20240403   gcc
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>

--=20
Thanks,

Steve

--0000000000003ca74306153697c3
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-retrying-on-failed-server-close.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-retrying-on-failed-server-close.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_luk87s160>
X-Attachment-Id: f_luk87s160

RnJvbSAxNzMyMTdiZDczMzY1ODY3Mzc4YjVlNzVhODZmMDA0OWUxMDY5ZWU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSaXR2aWsgQnVkaGlyYWphIDxyYnVkaGlyYWphQG1pY3Jvc29m
dC5jb20+CkRhdGU6IFR1ZSwgMiBBcHIgMjAyNCAxNDowMToyOCAtMDUwMApTdWJqZWN0OiBbUEFU
Q0hdIHNtYjM6IHJldHJ5aW5nIG9uIGZhaWxlZCBzZXJ2ZXIgY2xvc2UKCkluIHRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uLCBDSUZTIGNsb3NlIHNlbmRzIGEgY2xvc2UgdG8gdGhlCnNlcnZlciBh
bmQgZG9lcyBub3QgY2hlY2sgZm9yIHRoZSBzdWNjZXNzIG9mIHRoZSBzZXJ2ZXIgY2xvc2UuClRo
aXMgcGF0Y2ggYWRkcyBmdW5jdGlvbmFsaXR5IHRvIGNoZWNrIGZvciBzZXJ2ZXIgY2xvc2UgcmV0
dXJuCnN0YXR1cyBhbmQgcmV0cmllcyBpbiBjYXNlIG9mIGFuIEVCVVNZIG9yIEVBR0FJTiBlcnJv
ci4KClRoaXMgY2FuIGhlbHAgYXZvaWQgaGFuZGxlIGxlYWtzCgpDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBSaXR2aWsgQnVkaGlyYWphIDxyYnVkaGlyYWphQG1pY3Jv
c29mdC5jb20+ClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0
LmNvbT4KLS0tCiBmcy9zbWIvY2xpZW50L2NhY2hlZF9kaXIuYyB8ICA2ICsrLS0KIGZzL3NtYi9j
bGllbnQvY2lmc2ZzLmMgICAgIHwgMTEgKysrKysrKwogZnMvc21iL2NsaWVudC9jaWZzZ2xvYi5o
ICAgfCAgNyArKystLQogZnMvc21iL2NsaWVudC9maWxlLmMgICAgICAgfCA2MyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLQogZnMvc21iL2NsaWVudC9zbWIxb3BzLmMgICAg
fCAgNCArLS0KIGZzL3NtYi9jbGllbnQvc21iMm9wcy5jICAgIHwgIDkgKysrLS0tCiBmcy9zbWIv
Y2xpZW50L3NtYjJwZHUuYyAgICB8ICAyICstCiA3IGZpbGVzIGNoYW5nZWQsIDg1IGluc2VydGlv
bnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvY2FjaGVk
X2Rpci5jIGIvZnMvc21iL2NsaWVudC9jYWNoZWRfZGlyLmMKaW5kZXggYTAwMTc3MjRkNTIzLi4x
M2E5ZDdhY2Y4ZjggMTAwNjQ0Ci0tLSBhL2ZzL3NtYi9jbGllbnQvY2FjaGVkX2Rpci5jCisrKyBi
L2ZzL3NtYi9jbGllbnQvY2FjaGVkX2Rpci5jCkBAIC00MTcsNiArNDE3LDcgQEAgc21iMl9jbG9z
ZV9jYWNoZWRfZmlkKHN0cnVjdCBrcmVmICpyZWYpCiB7CiAJc3RydWN0IGNhY2hlZF9maWQgKmNm
aWQgPSBjb250YWluZXJfb2YocmVmLCBzdHJ1Y3QgY2FjaGVkX2ZpZCwKIAkJCQkJICAgICAgIHJl
ZmNvdW50KTsKKwlpbnQgcmM7CiAKIAlzcGluX2xvY2soJmNmaWQtPmNmaWRzLT5jZmlkX2xpc3Rf
bG9jayk7CiAJaWYgKGNmaWQtPm9uX2xpc3QpIHsKQEAgLTQzMCw5ICs0MzEsMTAgQEAgc21iMl9j
bG9zZV9jYWNoZWRfZmlkKHN0cnVjdCBrcmVmICpyZWYpCiAJY2ZpZC0+ZGVudHJ5ID0gTlVMTDsK
IAogCWlmIChjZmlkLT5pc19vcGVuKSB7Ci0JCVNNQjJfY2xvc2UoMCwgY2ZpZC0+dGNvbiwgY2Zp
ZC0+ZmlkLnBlcnNpc3RlbnRfZmlkLAorCQlyYyA9IFNNQjJfY2xvc2UoMCwgY2ZpZC0+dGNvbiwg
Y2ZpZC0+ZmlkLnBlcnNpc3RlbnRfZmlkLAogCQkJICAgY2ZpZC0+ZmlkLnZvbGF0aWxlX2ZpZCk7
Ci0JCWF0b21pY19kZWMoJmNmaWQtPnRjb24tPm51bV9yZW1vdGVfb3BlbnMpOworCQlpZiAocmMg
IT0gLUVCVVNZICYmIHJjICE9IC1FQUdBSU4pCisJCQlhdG9taWNfZGVjKCZjZmlkLT50Y29uLT5u
dW1fcmVtb3RlX29wZW5zKTsKIAl9CiAKIAlmcmVlX2NhY2hlZF9kaXIoY2ZpZCk7CmRpZmYgLS1n
aXQgYS9mcy9zbWIvY2xpZW50L2NpZnNmcy5jIGIvZnMvc21iL2NsaWVudC9jaWZzZnMuYwppbmRl
eCBhYTZmMWVjYjdjMGUuLmQ0MWVlZGJmZjY3NCAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9j
aWZzZnMuYworKysgYi9mcy9zbWIvY2xpZW50L2NpZnNmcy5jCkBAIC0xNTYsNiArMTU2LDcgQEAg
c3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QJKmRlY3J5cHRfd3E7CiBzdHJ1Y3Qgd29ya3F1ZXVlX3N0
cnVjdAkqZmlsZWluZm9fcHV0X3dxOwogc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QJKmNpZnNvcGxv
Y2tkX3dxOwogc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QJKmRlZmVycmVkY2xvc2Vfd3E7CitzdHJ1
Y3Qgd29ya3F1ZXVlX3N0cnVjdAkqc2VydmVyY2xvc2Vfd3E7CiBfX3UzMiBjaWZzX2xvY2tfc2Vj
cmV0OwogCiAvKgpAQCAtMTg4OCw2ICsxODg5LDEzIEBAIGluaXRfY2lmcyh2b2lkKQogCQlnb3Rv
IG91dF9kZXN0cm95X2NpZnNvcGxvY2tkX3dxOwogCX0KIAorCXNlcnZlcmNsb3NlX3dxID0gYWxs
b2Nfd29ya3F1ZXVlKCJzZXJ2ZXJjbG9zZSIsCisJCQkJCSAgIFdRX0ZSRUVaQUJMRXxXUV9NRU1f
UkVDTEFJTSwgMCk7CisJaWYgKCFzZXJ2ZXJjbG9zZV93cSkgeworCQlyYyA9IC1FTk9NRU07CisJ
CWdvdG8gb3V0X2Rlc3Ryb3lfc2VydmVyY2xvc2Vfd3E7CisJfQorCiAJcmMgPSBjaWZzX2luaXRf
aW5vZGVjYWNoZSgpOwogCWlmIChyYykKIAkJZ290byBvdXRfZGVzdHJveV9kZWZlcnJlZGNsb3Nl
X3dxOwpAQCAtMTk2Miw2ICsxOTcwLDggQEAgaW5pdF9jaWZzKHZvaWQpCiAJZGVzdHJveV93b3Jr
cXVldWUoZGVjcnlwdF93cSk7CiBvdXRfZGVzdHJveV9jaWZzaW9kX3dxOgogCWRlc3Ryb3lfd29y
a3F1ZXVlKGNpZnNpb2Rfd3EpOworb3V0X2Rlc3Ryb3lfc2VydmVyY2xvc2Vfd3E6CisJZGVzdHJv
eV93b3JrcXVldWUoc2VydmVyY2xvc2Vfd3EpOwogb3V0X2NsZWFuX3Byb2M6CiAJY2lmc19wcm9j
X2NsZWFuKCk7CiAJcmV0dXJuIHJjOwpAQCAtMTk5MSw2ICsyMDAxLDcgQEAgZXhpdF9jaWZzKHZv
aWQpCiAJZGVzdHJveV93b3JrcXVldWUoY2lmc29wbG9ja2Rfd3EpOwogCWRlc3Ryb3lfd29ya3F1
ZXVlKGRlY3J5cHRfd3EpOwogCWRlc3Ryb3lfd29ya3F1ZXVlKGZpbGVpbmZvX3B1dF93cSk7CisJ
ZGVzdHJveV93b3JrcXVldWUoc2VydmVyY2xvc2Vfd3EpOwogCWRlc3Ryb3lfd29ya3F1ZXVlKGNp
ZnNpb2Rfd3EpOwogCWNpZnNfcHJvY19jbGVhbigpOwogfQpkaWZmIC0tZ2l0IGEvZnMvc21iL2Ns
aWVudC9jaWZzZ2xvYi5oIGIvZnMvc21iL2NsaWVudC9jaWZzZ2xvYi5oCmluZGV4IDI4NmFmYmUz
NDZiZS4uNzdjYTc4NjFhMmNjIDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L2NpZnNnbG9iLmgK
KysrIGIvZnMvc21iL2NsaWVudC9jaWZzZ2xvYi5oCkBAIC00NDIsMTAgKzQ0MiwxMCBAQCBzdHJ1
Y3Qgc21iX3ZlcnNpb25fb3BlcmF0aW9ucyB7CiAJLyogc2V0IGZpZCBwcm90b2NvbC1zcGVjaWZp
YyBpbmZvICovCiAJdm9pZCAoKnNldF9maWQpKHN0cnVjdCBjaWZzRmlsZUluZm8gKiwgc3RydWN0
IGNpZnNfZmlkICosIF9fdTMyKTsKIAkvKiBjbG9zZSBhIGZpbGUgKi8KLQl2b2lkICgqY2xvc2Up
KGNvbnN0IHVuc2lnbmVkIGludCwgc3RydWN0IGNpZnNfdGNvbiAqLAorCWludCAoKmNsb3NlKShj
b25zdCB1bnNpZ25lZCBpbnQsIHN0cnVjdCBjaWZzX3Rjb24gKiwKIAkJICAgICAgc3RydWN0IGNp
ZnNfZmlkICopOwogCS8qIGNsb3NlIGEgZmlsZSwgcmV0dXJuaW5nIGZpbGUgYXR0cmlidXRlcyBh
bmQgdGltZXN0YW1wcyAqLwotCXZvaWQgKCpjbG9zZV9nZXRhdHRyKShjb25zdCB1bnNpZ25lZCBp
bnQgeGlkLCBzdHJ1Y3QgY2lmc190Y29uICp0Y29uLAorCWludCAoKmNsb3NlX2dldGF0dHIpKGNv
bnN0IHVuc2lnbmVkIGludCB4aWQsIHN0cnVjdCBjaWZzX3Rjb24gKnRjb24sCiAJCSAgICAgIHN0
cnVjdCBjaWZzRmlsZUluZm8gKnBmaWxlX2luZm8pOwogCS8qIHNlbmQgYSBmbHVzaCByZXF1ZXN0
IHRvIHRoZSBzZXJ2ZXIgKi8KIAlpbnQgKCpmbHVzaCkoY29uc3QgdW5zaWduZWQgaW50LCBzdHJ1
Y3QgY2lmc190Y29uICosIHN0cnVjdCBjaWZzX2ZpZCAqKTsKQEAgLTE0MzksNiArMTQzOSw3IEBA
IHN0cnVjdCBjaWZzRmlsZUluZm8gewogCWJvb2wgc3dhcGZpbGU6MTsKIAlib29sIG9wbG9ja19i
cmVha19jYW5jZWxsZWQ6MTsKIAlib29sIHN0YXR1c19maWxlX2RlbGV0ZWQ6MTsgLyogZmlsZSBo
YXMgYmVlbiBkZWxldGVkICovCisJYm9vbCBvZmZsb2FkOjE7IC8qIG9mZmxvYWQgZmluYWwgcGFy
dCBvZiBfcHV0IHRvIGEgd3EgKi8KIAl1bnNpZ25lZCBpbnQgb3Bsb2NrX2Vwb2NoOyAvKiBlcG9j
aCBmcm9tIHRoZSBsZWFzZSBicmVhayAqLwogCV9fdTMyIG9wbG9ja19sZXZlbDsgLyogb3Bsb2Nr
L2xlYXNlIGxldmVsIGZyb20gdGhlIGxlYXNlIGJyZWFrICovCiAJaW50IGNvdW50OwpAQCAtMTQ0
Nyw2ICsxNDQ4LDcgQEAgc3RydWN0IGNpZnNGaWxlSW5mbyB7CiAJc3RydWN0IGNpZnNfc2VhcmNo
X2luZm8gc3JjaF9pbmY7CiAJc3RydWN0IHdvcmtfc3RydWN0IG9wbG9ja19icmVhazsgLyogd29y
ayBmb3Igb3Bsb2NrIGJyZWFrcyAqLwogCXN0cnVjdCB3b3JrX3N0cnVjdCBwdXQ7IC8qIHdvcmsg
Zm9yIHRoZSBmaW5hbCBwYXJ0IG9mIF9wdXQgKi8KKwlzdHJ1Y3Qgd29ya19zdHJ1Y3Qgc2VydmVy
Y2xvc2U7IC8qIHdvcmsgZm9yIHNlcnZlcmNsb3NlICovCiAJc3RydWN0IGRlbGF5ZWRfd29yayBk
ZWZlcnJlZDsKIAlib29sIGRlZmVycmVkX2Nsb3NlX3NjaGVkdWxlZDsgLyogRmxhZyB0byBpbmRp
Y2F0ZSBjbG9zZSBpcyBzY2hlZHVsZWQgKi8KIAljaGFyICpzeW1saW5rX3RhcmdldDsKQEAgLTIx
MDMsNiArMjEwNSw3IEBAIGV4dGVybiBzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqZGVjcnlwdF93
cTsKIGV4dGVybiBzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqZmlsZWluZm9fcHV0X3dxOwogZXh0
ZXJuIHN0cnVjdCB3b3JrcXVldWVfc3RydWN0ICpjaWZzb3Bsb2NrZF93cTsKIGV4dGVybiBzdHJ1
Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqZGVmZXJyZWRjbG9zZV93cTsKK2V4dGVybiBzdHJ1Y3Qgd29y
a3F1ZXVlX3N0cnVjdCAqc2VydmVyY2xvc2Vfd3E7CiBleHRlcm4gX191MzIgY2lmc19sb2NrX3Nl
Y3JldDsKIAogZXh0ZXJuIG1lbXBvb2xfdCAqY2lmc19zbV9yZXFfcG9vbHA7CmRpZmYgLS1naXQg
YS9mcy9zbWIvY2xpZW50L2ZpbGUuYyBiL2ZzL3NtYi9jbGllbnQvZmlsZS5jCmluZGV4IGFiNTM2
Y2U4YTA0YS4uOWJlMzdkMGZlNzI0IDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L2ZpbGUuYwor
KysgYi9mcy9zbWIvY2xpZW50L2ZpbGUuYwpAQCAtNDU5LDYgKzQ1OSw3IEBAIGNpZnNfZG93bl93
cml0ZShzdHJ1Y3Qgcndfc2VtYXBob3JlICpzZW0pCiB9CiAKIHN0YXRpYyB2b2lkIGNpZnNGaWxl
SW5mb19wdXRfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspOwordm9pZCBzZXJ2ZXJjbG9z
ZV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayk7CiAKIHN0cnVjdCBjaWZzRmlsZUluZm8g
KmNpZnNfbmV3X2ZpbGVpbmZvKHN0cnVjdCBjaWZzX2ZpZCAqZmlkLCBzdHJ1Y3QgZmlsZSAqZmls
ZSwKIAkJCQkgICAgICAgc3RydWN0IHRjb25fbGluayAqdGxpbmssIF9fdTMyIG9wbG9jaywKQEAg
LTUwNSw2ICs1MDYsNyBAQCBzdHJ1Y3QgY2lmc0ZpbGVJbmZvICpjaWZzX25ld19maWxlaW5mbyhz
dHJ1Y3QgY2lmc19maWQgKmZpZCwgc3RydWN0IGZpbGUgKmZpbGUsCiAJY2ZpbGUtPnRsaW5rID0g
Y2lmc19nZXRfdGxpbmsodGxpbmspOwogCUlOSVRfV09SSygmY2ZpbGUtPm9wbG9ja19icmVhaywg
Y2lmc19vcGxvY2tfYnJlYWspOwogCUlOSVRfV09SSygmY2ZpbGUtPnB1dCwgY2lmc0ZpbGVJbmZv
X3B1dF93b3JrKTsKKwlJTklUX1dPUksoJmNmaWxlLT5zZXJ2ZXJjbG9zZSwgc2VydmVyY2xvc2Vf
d29yayk7CiAJSU5JVF9ERUxBWUVEX1dPUksoJmNmaWxlLT5kZWZlcnJlZCwgc21iMl9kZWZlcnJl
ZF93b3JrX2Nsb3NlKTsKIAltdXRleF9pbml0KCZjZmlsZS0+ZmhfbXV0ZXgpOwogCXNwaW5fbG9j
a19pbml0KCZjZmlsZS0+ZmlsZV9pbmZvX2xvY2spOwpAQCAtNTk2LDYgKzU5OCw0MCBAQCBzdGF0
aWMgdm9pZCBjaWZzRmlsZUluZm9fcHV0X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQog
CWNpZnNGaWxlSW5mb19wdXRfZmluYWwoY2lmc19maWxlKTsKIH0KIAordm9pZCBzZXJ2ZXJjbG9z
ZV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKK3sKKwlzdHJ1Y3QgY2lmc0ZpbGVJbmZv
ICpjaWZzX2ZpbGUgPSBjb250YWluZXJfb2Yod29yaywKKwkJCXN0cnVjdCBjaWZzRmlsZUluZm8s
IHNlcnZlcmNsb3NlKTsKKworCXN0cnVjdCBjaWZzX3Rjb24gKnRjb24gPSB0bGlua190Y29uKGNp
ZnNfZmlsZS0+dGxpbmspOworCisJc3RydWN0IFRDUF9TZXJ2ZXJfSW5mbyAqc2VydmVyID0gdGNv
bi0+c2VzLT5zZXJ2ZXI7CisJaW50IHJjID0gMDsKKwlpbnQgcmV0cmllcyA9IDA7CisJaW50IE1B
WF9SRVRSSUVTID0gNDsKKworCWRvIHsKKwkJaWYgKHNlcnZlci0+b3BzLT5jbG9zZV9nZXRhdHRy
KQorCQkJcmMgPSBzZXJ2ZXItPm9wcy0+Y2xvc2VfZ2V0YXR0cigwLCB0Y29uLCBjaWZzX2ZpbGUp
OworCQllbHNlIGlmIChzZXJ2ZXItPm9wcy0+Y2xvc2UpCisJCQlyYyA9IHNlcnZlci0+b3BzLT5j
bG9zZSgwLCB0Y29uLCAmY2lmc19maWxlLT5maWQpOworCisJCWlmIChyYyA9PSAtRUJVU1kgfHwg
cmMgPT0gLUVBR0FJTikgeworCQkJcmV0cmllcysrOworCQkJbXNsZWVwKDI1MCk7CisJCX0KKwl9
IHdoaWxlICgocmMgPT0gLUVCVVNZIHx8IHJjID09IC1FQUdBSU4pICYmIChyZXRyaWVzIDwgTUFY
X1JFVFJJRVMpCisJKTsKKworCWlmIChyZXRyaWVzID09IE1BWF9SRVRSSUVTKQorCQlwcl93YXJu
KCJTZXJ2ZXJjbG9zZSBmYWlsZWQgJWQgdGltZXMsIGdpdmluZyB1cFxuIiwgTUFYX1JFVFJJRVMp
OworCisJaWYgKGNpZnNfZmlsZS0+b2ZmbG9hZCkKKwkJcXVldWVfd29yayhmaWxlaW5mb19wdXRf
d3EsICZjaWZzX2ZpbGUtPnB1dCk7CisJZWxzZQorCQljaWZzRmlsZUluZm9fcHV0X2ZpbmFsKGNp
ZnNfZmlsZSk7Cit9CisKIC8qKgogICogY2lmc0ZpbGVJbmZvX3B1dCAtIHJlbGVhc2UgYSByZWZl
cmVuY2Ugb2YgZmlsZSBwcml2IGRhdGEKICAqCkBAIC02MzYsMTAgKzY3MiwxMyBAQCB2b2lkIF9j
aWZzRmlsZUluZm9fcHV0KHN0cnVjdCBjaWZzRmlsZUluZm8gKmNpZnNfZmlsZSwKIAlzdHJ1Y3Qg
Y2lmc19maWQgZmlkID0ge307CiAJc3RydWN0IGNpZnNfcGVuZGluZ19vcGVuIG9wZW47CiAJYm9v
bCBvcGxvY2tfYnJlYWtfY2FuY2VsbGVkOworCWJvb2wgc2VydmVyY2xvc2Vfb2ZmbG9hZGVkID0g
ZmFsc2U7CiAKIAlzcGluX2xvY2soJnRjb24tPm9wZW5fZmlsZV9sb2NrKTsKIAlzcGluX2xvY2so
JmNpZnNpLT5vcGVuX2ZpbGVfbG9jayk7CiAJc3Bpbl9sb2NrKCZjaWZzX2ZpbGUtPmZpbGVfaW5m
b19sb2NrKTsKKworCWNpZnNfZmlsZS0+b2ZmbG9hZCA9IG9mZmxvYWQ7CiAJaWYgKC0tY2lmc19m
aWxlLT5jb3VudCA+IDApIHsKIAkJc3Bpbl91bmxvY2soJmNpZnNfZmlsZS0+ZmlsZV9pbmZvX2xv
Y2spOwogCQlzcGluX3VubG9jaygmY2lmc2ktPm9wZW5fZmlsZV9sb2NrKTsKQEAgLTY4MSwxMyAr
NzIwLDIwIEBAIHZvaWQgX2NpZnNGaWxlSW5mb19wdXQoc3RydWN0IGNpZnNGaWxlSW5mbyAqY2lm
c19maWxlLAogCWlmICghdGNvbi0+bmVlZF9yZWNvbm5lY3QgJiYgIWNpZnNfZmlsZS0+aW52YWxp
ZEhhbmRsZSkgewogCQlzdHJ1Y3QgVENQX1NlcnZlcl9JbmZvICpzZXJ2ZXIgPSB0Y29uLT5zZXMt
PnNlcnZlcjsKIAkJdW5zaWduZWQgaW50IHhpZDsKKwkJaW50IHJjID0gMDsKIAogCQl4aWQgPSBn
ZXRfeGlkKCk7CiAJCWlmIChzZXJ2ZXItPm9wcy0+Y2xvc2VfZ2V0YXR0cikKLQkJCXNlcnZlci0+
b3BzLT5jbG9zZV9nZXRhdHRyKHhpZCwgdGNvbiwgY2lmc19maWxlKTsKKwkJCXJjID0gc2VydmVy
LT5vcHMtPmNsb3NlX2dldGF0dHIoeGlkLCB0Y29uLCBjaWZzX2ZpbGUpOwogCQllbHNlIGlmIChz
ZXJ2ZXItPm9wcy0+Y2xvc2UpCi0JCQlzZXJ2ZXItPm9wcy0+Y2xvc2UoeGlkLCB0Y29uLCAmY2lm
c19maWxlLT5maWQpOworCQkJcmMgPSBzZXJ2ZXItPm9wcy0+Y2xvc2UoeGlkLCB0Y29uLCAmY2lm
c19maWxlLT5maWQpOwogCQlfZnJlZV94aWQoeGlkKTsKKworCQlpZiAocmMgPT0gLUVCVVNZIHx8
IHJjID09IC1FQUdBSU4pIHsKKwkJCS8vIFNlcnZlciBjbG9zZSBmYWlsZWQsIGhlbmNlIG9mZmxv
YWRpbmcgaXQgYXMgYW4gYXN5bmMgb3AKKwkJCXF1ZXVlX3dvcmsoc2VydmVyY2xvc2Vfd3EsICZj
aWZzX2ZpbGUtPnNlcnZlcmNsb3NlKTsKKwkJCXNlcnZlcmNsb3NlX29mZmxvYWRlZCA9IHRydWU7
CisJCX0KIAl9CiAKIAlpZiAob3Bsb2NrX2JyZWFrX2NhbmNlbGxlZCkKQEAgLTY5NSwxMCArNzQx
LDE1IEBAIHZvaWQgX2NpZnNGaWxlSW5mb19wdXQoc3RydWN0IGNpZnNGaWxlSW5mbyAqY2lmc19m
aWxlLAogCiAJY2lmc19kZWxfcGVuZGluZ19vcGVuKCZvcGVuKTsKIAotCWlmIChvZmZsb2FkKQot
CQlxdWV1ZV93b3JrKGZpbGVpbmZvX3B1dF93cSwgJmNpZnNfZmlsZS0+cHV0KTsKLQllbHNlCi0J
CWNpZnNGaWxlSW5mb19wdXRfZmluYWwoY2lmc19maWxlKTsKKwkvLyBpZiBzZXJ2ZXJjbG9zZSBo
YXMgYmVlbiBvZmZsb2FkZWQgdG8gd3EgKG9uIGZhaWx1cmUpLCBpdCB3aWxsCisJLy8gaGFuZGxl
IG9mZmxvYWRpbmcgcHV0IGFzIHdlbGwuIElmIHNlcnZlcmNsb3NlIG5vdCBvZmZsb2FkZWQsCisJ
Ly8gd2UgbmVlZCB0byBoYW5kbGUgb2ZmbG9hZGluZyBwdXQgaGVyZS4KKwlpZiAoIXNlcnZlcmNs
b3NlX29mZmxvYWRlZCkgeworCQlpZiAob2ZmbG9hZCkKKwkJCXF1ZXVlX3dvcmsoZmlsZWluZm9f
cHV0X3dxLCAmY2lmc19maWxlLT5wdXQpOworCQllbHNlCisJCQljaWZzRmlsZUluZm9fcHV0X2Zp
bmFsKGNpZnNfZmlsZSk7CisJfQogfQogCiBpbnQgY2lmc19vcGVuKHN0cnVjdCBpbm9kZSAqaW5v
ZGUsIHN0cnVjdCBmaWxlICpmaWxlKQpkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC9zbWIxb3Bz
LmMgYi9mcy9zbWIvY2xpZW50L3NtYjFvcHMuYwppbmRleCBhOWVhYmE4MDgzYjAuLjIxMmVjNmY2
NmVjNiAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9zbWIxb3BzLmMKKysrIGIvZnMvc21iL2Ns
aWVudC9zbWIxb3BzLmMKQEAgLTc1MywxMSArNzUzLDExIEBAIGNpZnNfc2V0X2ZpZChzdHJ1Y3Qg
Y2lmc0ZpbGVJbmZvICpjZmlsZSwgc3RydWN0IGNpZnNfZmlkICpmaWQsIF9fdTMyIG9wbG9jaykK
IAljaW5vZGUtPmNhbl9jYWNoZV9icmxja3MgPSBDSUZTX0NBQ0hFX1dSSVRFKGNpbm9kZSk7CiB9
CiAKLXN0YXRpYyB2b2lkCitzdGF0aWMgaW50CiBjaWZzX2Nsb3NlX2ZpbGUoY29uc3QgdW5zaWdu
ZWQgaW50IHhpZCwgc3RydWN0IGNpZnNfdGNvbiAqdGNvbiwKIAkJc3RydWN0IGNpZnNfZmlkICpm
aWQpCiB7Ci0JQ0lGU1NNQkNsb3NlKHhpZCwgdGNvbiwgZmlkLT5uZXRmaWQpOworCXJldHVybiBD
SUZTU01CQ2xvc2UoeGlkLCB0Y29uLCBmaWQtPm5ldGZpZCk7CiB9CiAKIHN0YXRpYyBpbnQKZGlm
ZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvc21iMm9wcy5jIGIvZnMvc21iL2NsaWVudC9zbWIyb3Bz
LmMKaW5kZXggMzViZjdlYjMxNWNkLi44N2I2M2Y2YWQyZTIgMTAwNjQ0Ci0tLSBhL2ZzL3NtYi9j
bGllbnQvc21iMm9wcy5jCisrKyBiL2ZzL3NtYi9jbGllbnQvc21iMm9wcy5jCkBAIC0xNDEyLDE0
ICsxNDEyLDE0IEBAIHNtYjJfc2V0X2ZpZChzdHJ1Y3QgY2lmc0ZpbGVJbmZvICpjZmlsZSwgc3Ry
dWN0IGNpZnNfZmlkICpmaWQsIF9fdTMyIG9wbG9jaykKIAltZW1jcHkoY2ZpbGUtPmZpZC5jcmVh
dGVfZ3VpZCwgZmlkLT5jcmVhdGVfZ3VpZCwgMTYpOwogfQogCi1zdGF0aWMgdm9pZAorc3RhdGlj
IGludAogc21iMl9jbG9zZV9maWxlKGNvbnN0IHVuc2lnbmVkIGludCB4aWQsIHN0cnVjdCBjaWZz
X3Rjb24gKnRjb24sCiAJCXN0cnVjdCBjaWZzX2ZpZCAqZmlkKQogewotCVNNQjJfY2xvc2UoeGlk
LCB0Y29uLCBmaWQtPnBlcnNpc3RlbnRfZmlkLCBmaWQtPnZvbGF0aWxlX2ZpZCk7CisJcmV0dXJu
IFNNQjJfY2xvc2UoeGlkLCB0Y29uLCBmaWQtPnBlcnNpc3RlbnRfZmlkLCBmaWQtPnZvbGF0aWxl
X2ZpZCk7CiB9CiAKLXN0YXRpYyB2b2lkCitzdGF0aWMgaW50CiBzbWIyX2Nsb3NlX2dldGF0dHIo
Y29uc3QgdW5zaWduZWQgaW50IHhpZCwgc3RydWN0IGNpZnNfdGNvbiAqdGNvbiwKIAkJICAgc3Ry
dWN0IGNpZnNGaWxlSW5mbyAqY2ZpbGUpCiB7CkBAIC0xNDMwLDcgKzE0MzAsNyBAQCBzbWIyX2Ns
b3NlX2dldGF0dHIoY29uc3QgdW5zaWduZWQgaW50IHhpZCwgc3RydWN0IGNpZnNfdGNvbiAqdGNv
biwKIAlyYyA9IF9fU01CMl9jbG9zZSh4aWQsIHRjb24sIGNmaWxlLT5maWQucGVyc2lzdGVudF9m
aWQsCiAJCSAgIGNmaWxlLT5maWQudm9sYXRpbGVfZmlkLCAmZmlsZV9pbmYpOwogCWlmIChyYykK
LQkJcmV0dXJuOworCQlyZXR1cm4gcmM7CiAKIAlpbm9kZSA9IGRfaW5vZGUoY2ZpbGUtPmRlbnRy
eSk7CiAKQEAgLTE0NTksNiArMTQ1OSw3IEBAIHNtYjJfY2xvc2VfZ2V0YXR0cihjb25zdCB1bnNp
Z25lZCBpbnQgeGlkLCBzdHJ1Y3QgY2lmc190Y29uICp0Y29uLAogCiAJLyogRW5kIG9mIGZpbGUg
YW5kIEF0dHJpYnV0ZXMgc2hvdWxkIG5vdCBoYXZlIHRvIGJlIHVwZGF0ZWQgb24gY2xvc2UgKi8K
IAlzcGluX3VubG9jaygmaW5vZGUtPmlfbG9jayk7CisJcmV0dXJuIHJjOwogfQogCiBzdGF0aWMg
aW50CmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L3NtYjJwZHUuYyBiL2ZzL3NtYi9jbGllbnQv
c21iMnBkdS5jCmluZGV4IDNlYTY4ODU1OGU2Yy4uYzBjNDkzM2FmNWZjIDEwMDY0NAotLS0gYS9m
cy9zbWIvY2xpZW50L3NtYjJwZHUuYworKysgYi9mcy9zbWIvY2xpZW50L3NtYjJwZHUuYwpAQCAt
MzYyOCw5ICszNjI4LDkgQEAgX19TTUIyX2Nsb3NlKGNvbnN0IHVuc2lnbmVkIGludCB4aWQsIHN0
cnVjdCBjaWZzX3Rjb24gKnRjb24sCiAJCQltZW1jcHkoJnBidWYtPm5ldHdvcmtfb3Blbl9pbmZv
LAogCQkJICAgICAgICZyc3AtPm5ldHdvcmtfb3Blbl9pbmZvLAogCQkJICAgICAgIHNpemVvZihw
YnVmLT5uZXR3b3JrX29wZW5faW5mbykpOworCQlhdG9taWNfZGVjKCZ0Y29uLT5udW1fcmVtb3Rl
X29wZW5zKTsKIAl9CiAKLQlhdG9taWNfZGVjKCZ0Y29uLT5udW1fcmVtb3RlX29wZW5zKTsKIGNs
b3NlX2V4aXQ6CiAJU01CMl9jbG9zZV9mcmVlKCZycXN0KTsKIAlmcmVlX3JzcF9idWYocmVzcF9i
dWZ0eXBlLCByc3ApOwotLSAKMi40MC4xCgo=
--0000000000003ca74306153697c3--

