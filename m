Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4316F93A977
	for <lists+samba-technical@lfdr.de>; Wed, 24 Jul 2024 00:49:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Ezg52eHclr4j0zq4BJBkryPVzNv/N9mlBGgYhA+rqMY=; b=GNpHLaf7ugO3Rv9mPUzgFzH2nm
	GQ4BDmnq39jLRBwljZUjz5EufAY/uYRd0/G/H12uBy04NsvcKyJGVergCexKOj158afpjLSiYh8s4
	G1h1P3hA0yt6iCz4LUwpYDL6XRngUmvLY5Om69s+Pn+o6krS1/99dMV7gRLgsYhoPoMYE8nFhenHg
	g+EfsQZ6g8nPe2IPlnBTbo1EGtQaL+ZZSaULcD7vkigieOkrkNJHYoZu6MVpDXkwn3NcBqeFk8H5R
	+rdhfmFbBiRvxpWEqovqI8pGlZnXKr6X/wGm+oP6OrQ8hIdjxoIUxZnHELhdOsuA6PhN6Dx81B166
	na3XUMWw==;
Received: from ip6-localhost ([::1]:30936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sWOJT-001MtE-4T; Tue, 23 Jul 2024 22:48:55 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:43058) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sWOJO-001Mt7-QD
 for samba-technical@lists.samba.org; Tue, 23 Jul 2024 22:48:53 +0000
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52fcc56c882so252311e87.0
 for <samba-technical@lists.samba.org>; Tue, 23 Jul 2024 15:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721774929; x=1722379729; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ezg52eHclr4j0zq4BJBkryPVzNv/N9mlBGgYhA+rqMY=;
 b=gVniZrzhRsR8Z1cxy1LPcVexo8RFJI6JQGLXtLTKAPRnuyKdE5iSUZ4ivVcDqj8gim
 GM+6Hzm5wctUrwJbKDu5YKRbkpQqkbk4sfM6ihX9NqP/vbMfyD96Lk8kQn6IVbwnjTpP
 +K3tulP25YXM8na492lV6GjLblMDTGRXyu0glStk5NGD3uF4xf1spepAGL4iWnLI4gjH
 52+51qPEBOJFqrxNU4oQEQGqFf2tvORf19dF5BVMA+MXSaU0Sq8IXq+b+7MujhCeVBfB
 hp6v/QAb/FWfePxQcluDxuL0kgA7oDySmmkecbkx0vuXilLYMcTYKD+q8pXuuzR21NMr
 AHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721774929; x=1722379729;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ezg52eHclr4j0zq4BJBkryPVzNv/N9mlBGgYhA+rqMY=;
 b=TA3J9enO3JHfoI/WFU1poy6omDFWxtxfmZK15pdZZinZDgqd1UV6PPWdFe4SLH4xVH
 NKBthfyZjuarK7S1a14Vga+7WSjc+gxurC+TUG8aNbLSA0F4TdgHq+Qz53/LgoM301K0
 bRwDmUwLBpNl8WAuDv7sa68dtJeAScHCXULg9hWM3nk21ReAlNUACgP6V9EMbb1R+5zw
 S7YNnC/PfHdxaWDAthDRyHLbLKOUeUmFx3hifkNbbQswo3yT/FyVJdGBqnT/w/8zyztJ
 8Gvk71veK665W5HsbXDaMgmIpv6rKKkUcpaATDOizNXVf+684nVs3aSoMJF9LZLkjzwf
 mZUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa9BRb5Hs5LoJ95u0xpnDpx4T7Egs55m67TBe06xkrS/aDbcxiRntK9i3fRKjpB20jj+C2iG+caHvXLqi8wXbJet5/T4y6f22E1BY/EwRX
X-Gm-Message-State: AOJu0YzoSdvx/HCclLcz740IoVIIVLAq4IBUzD6TBz04oHbY0cit9wJz
 MS2eZvjj1VtHSOBKeruU9nPsB3Mja4VF1MyDzFV/sya4KKz6SBcbH9YOif9BRALsr1ldwC5bIiR
 TMZlvGZGk1yEGA8dyPbAgJWUSe9gtw347
X-Google-Smtp-Source: AGHT+IFAWjl75rvRITC8oU1EWcaQCB9TEMTgIZzmojMWDMCmNyi/UA5XFvmezaW/1vinOlJXFxGZiwOoOEYB+w+nEC8=
X-Received: by 2002:a05:6512:3044:b0:52e:7f23:5d98 with SMTP id
 2adb3069b0e04-52fcf8b5068mr17989e87.8.1721774928873; Tue, 23 Jul 2024
 15:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <202407240638.kjmPxwJV-lkp@intel.com>
In-Reply-To: <202407240638.kjmPxwJV-lkp@intel.com>
Date: Tue, 23 Jul 2024 17:48:37 -0500
Message-ID: <CAH2r5mtC6LAFJxvoeWe4DPAKx=01LdYRSO7FE0R_jOC0iVX40A@mail.gmail.com>
Subject: Re: [cifs:for-next 2/3] ERROR: modpost: "reset_cifs_unix_caps"
 [fs/smb/client/cifs.ko] undefined!
To: kernel test robot <lkp@intel.com>
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Fixed with this change and repushed to for-next

diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
index b66d8b03a389..89d9f86cc29a 100644
--- a/fs/smb/client/connect.c
+++ b/fs/smb/client/connect.c
@@ -3686,6 +3686,7 @@ int cifs_mount(struct cifs_sb_info *cifs_sb,
struct smb3_fs_context *ctx)
 }
 #endif

+#ifdef CONFIG_CIFS_ALLOW_INSECURE_LEGACY
 /*
  * Issue a TREE_CONNECT request.
  */
@@ -3825,6 +3826,7 @@ CIFSTCon(const unsigned int xid, struct cifs_ses *ses=
,
        cifs_buf_release(smb_buffer);
        return rc;
 }
+#endif /* CONFIG_CIFS_ALLOW_INSECURE_LEGACY */

 static void delayed_free(struct rcu_head *p)
 {

On Tue, Jul 23, 2024 at 5:37=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> head:   dde12e91303b6d38322ed69801ce3129aba82ad5
> commit: 2a9b3eb1b0838cc99aafdc50e37138538d4593bb [2/3] cifs: fix reconnec=
t with SMB1 UNIX Extensions
> config: x86_64-randconfig-101-20240723 (https://download.01.org/0day-ci/a=
rchive/20240724/202407240638.kjmPxwJV-lkp@intel.com/config)
> compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240724/202407240638.kjmPxwJV-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407240638.kjmPxwJV-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_=
mutex.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in mm/dmapool_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in mm/zsmalloc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8-selftes=
t.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/rational.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/find_bit_benchmark.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_dhry.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_firmware.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_sysctl.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ida.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test-kstrtox.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_min_heap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_bas=
e.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_printf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_scanf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bitmap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_xarray.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_maple_tree.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_kmod.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_memcat_p.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_meminit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_free_pages.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/atomic64_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/core/cxl_co=
re.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/cxl_pci.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/cxl_mem.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/cxl_pmem.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/cxl_port.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb_=
debug.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/mxup=
ort.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/navm=
an.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb-=
serial-simple.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/symb=
olserial.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_simpleondemand.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_userspace.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_r=
src.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/yenta_so=
cket.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestrea=
m-example.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-examp=
le.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-e=
xample.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-ex=
ample.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kobject=
-example.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kset-ex=
ample.o
> >> ERROR: modpost: "reset_cifs_unix_caps" [fs/smb/client/cifs.ko] undefin=
ed!
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>


--=20
Thanks,

Steve

