Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A08673D1B7
	for <lists+samba-technical@lfdr.de>; Sun, 25 Jun 2023 17:31:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qPfAWbbsynVcpfTqxjuy1xkvQeLgFDy+XFs6rfeDUk0=; b=ji3Efqe/OFWzHfDDCx9oeASc/+
	zGUPbl0oX7vtujWEuypLrVnWJhkWCcK2FJD7mk2nMGuLyteR5WIz0ubLA/mRHHTKV6vbE3i1qTESb
	2T3NIO44PN/eTXktNpDDEAfyeOLM6yTPMJpTlb+VZE+CvJ+9vt+qdzc+NVvIdIfA+8RlgZDv81XDf
	JT3Xk/E/wpoIo6PbMXCxkQwT71L4MYIeCXw+9hyuFsiUAxK921wR4h89C7wNcMHiojZ5nWCehBEQ6
	7UCaPN1JoEubS1D1EqF07COGdK1XClz3LS+fYoVg1cShNgCqMHDct3te7R3W7tJooyC6lHPXu3N+N
	xWy7nU5Q==;
Received: from ip6-localhost ([::1]:25390 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qDRhp-004Omw-Hd; Sun, 25 Jun 2023 15:31:13 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:52360) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qDRhf-004Omn-Qx
 for samba-technical@lists.samba.org; Sun, 25 Jun 2023 15:31:11 +0000
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b6a16254a4so632511fa.0
 for <samba-technical@lists.samba.org>; Sun, 25 Jun 2023 08:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687707062; x=1690299062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qPfAWbbsynVcpfTqxjuy1xkvQeLgFDy+XFs6rfeDUk0=;
 b=XzhcWDVCHZwRy2vQHRHF2gGQatMHsvGqUhi4mvJaSK54mVwCtHTOEkXLAHj8/gdUxS
 sUzweBLSNQe4R7rUXa1boXrKjkC2sEQDTzIfPnuWKAhOvDs2CiLyiztDtYtRoVilCdNI
 oEfA0eXIyVU27bl1+9atY3VbyKj35o5y3ez6Bmr5F5oEMhTaLF1SbPhvIy9GMLvGTcTV
 IyTARp9FQ4GAy3Gt1K0ji0JzR+Ja5mtXspJiUFR0wjzxLYjMrFqdYqLuflnDxTGG81Rl
 i0s6x1pnQOVSInpPrATzP6XUQE6ebZmNy/uhyqRyrf6dG7LVyLlo2KZaQptJVn+flZZt
 RMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687707062; x=1690299062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qPfAWbbsynVcpfTqxjuy1xkvQeLgFDy+XFs6rfeDUk0=;
 b=brcnmgICF8rO0HP3WViyrlSLCSXkOxyiByw/QT9xQfaFkRE6yKjNx7WROeA8NH93sD
 XUVSfbnGVqyHHLlLndM0tqrbZKJP2GzwqhhwHmeo+s9gUZkeA9iAUpPY9ukF31IX6ZZS
 +yE/Hle9wGAmbWW9IwFmCJ47ZaMkRTazy6vszV2MlP2iSyQBhyMnH/iXuIj7TW66j6NK
 m9C/0Er/Wcx8mo0ejNpw2i0gdlme/GllBpV1DTq5cVJgdpUR6F7ySFd74HMFrswbM4L4
 koRIY0gDSrk7eySwcZV2+kMLq5FAkxYW0eYDlg7SKQe1xdpzb1fY4Ttq8UYVPggBBrq+
 z3AA==
X-Gm-Message-State: AC+VfDwB3lx9r58M6Y6REDODvQ5QYjm/jtuLDd4tZQ6KkEqPTXyZCHOl
 VuNueD159meKpHvj59fW0IGGIQK1Cl8BhzVS3WM=
X-Google-Smtp-Source: ACHHUZ64pspJmcfMnNf0zXJx9qSTTGdi/TFG2yp/Oww3plre+ByHhqW97KKhoqIzOePHL+ksONGcQMMc/p4WsNUgAuk=
X-Received: by 2002:a19:7108:0:b0:4f3:8507:d90d with SMTP id
 m8-20020a197108000000b004f38507d90dmr14437095lfc.34.1687707062134; Sun, 25
 Jun 2023 08:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <202306251539.R34e3RXd-lkp@intel.com>
In-Reply-To: <202306251539.R34e3RXd-lkp@intel.com>
Date: Sun, 25 Jun 2023 10:30:50 -0500
Message-ID: <CAH2r5mup6woFss05nQ2PA88UkFowzxdnBvztVycE=wcW5bTLMA@mail.gmail.com>
Subject: Re: [cifs:for-next 13/14] fs/smb/client/cifs_debug.c:167:1: warning:
 label at end of compound statement is a C2x extension
To: kernel test robot <lkp@intel.com>
Content-Type: multipart/mixed; boundary="000000000000ec7c7305fef5eba1"
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
 llvm@lists.linux.dev, samba-technical@lists.samba.org,
 oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000ec7c7305fef5eba1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Updated Shyam's patch to address this and a sparse warning and a
checkpatch warning


On Sun, Jun 25, 2023 at 2:14=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> head:   d75e841ced93ce9cd86dc46b8a9453241dcbc61b
> commit: 33bc5dec2b4fd8d00fed51183615d91badf607d6 [13/14] cifs: display th=
e endpoint IP details in DebugData
> config: hexagon-randconfig-r045-20230625 (https://download.01.org/0day-ci=
/archive/20230625/202306251539.R34e3RXd-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git =
4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251539=
.R34e3RXd-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306251539.R34e3RXd-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from fs/smb/client/cifs_debug.c:15:
>    In file included from include/uapi/linux/ethtool.h:19:
>    In file included from include/linux/if_ether.h:19:
>    In file included from include/linux/skbuff.h:17:
>    In file included from include/linux/bvec.h:10:
>    In file included from include/linux/highmem.h:12:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1=
:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:547:31: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      547 |         val =3D __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:560:61: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      560 |         val =3D __le16_to_cpu((__le16 __force)__raw_readw(PCI_=
IOBASE + addr));
>          |                                                         ~~~~~~=
~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded fro=
m macro '__le16_to_cpu'
>       37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>          |                                                   ^
>    In file included from fs/smb/client/cifs_debug.c:15:
>    In file included from include/uapi/linux/ethtool.h:19:
>    In file included from include/linux/if_ether.h:19:
>    In file included from include/linux/skbuff.h:17:
>    In file included from include/linux/bvec.h:10:
>    In file included from include/linux/highmem.h:12:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1=
:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:573:61: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      573 |         val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_=
IOBASE + addr));
>          |                                                         ~~~~~~=
~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded fro=
m macro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>          |                                                   ^
>    In file included from fs/smb/client/cifs_debug.c:15:
>    In file included from include/uapi/linux/ethtool.h:19:
>    In file included from include/linux/if_ether.h:19:
>    In file included from include/linux/skbuff.h:17:
>    In file included from include/linux/bvec.h:10:
>    In file included from include/linux/highmem.h:12:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1=
:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:584:33: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      584 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:594:59: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBA=
SE + addr);
>          |                                                       ~~~~~~~~=
~~ ^
>    include/asm-generic/io.h:604:59: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBA=
SE + addr);
>          |                                                       ~~~~~~~~=
~~ ^
> >> fs/smb/client/cifs_debug.c:167:1: warning: label at end of compound st=
atement is a C2x extension [-Wc2x-extensions]
>      167 | }
>          | ^
>    7 warnings generated.
>
>
> vim +167 fs/smb/client/cifs_debug.c
>
> 33bc5dec2b4fd8 fs/smb/client/cifs_debug.c Shyam Prasad N 2023-06-09  166
> 85150929a15b4e fs/cifs/cifs_debug.c       Aurelien Aptel 2019-11-20 @167 =
 }
> 85150929a15b4e fs/cifs/cifs_debug.c       Aurelien Aptel 2019-11-20  168
>
> :::::: The code at line 167 was first introduced by commit
> :::::: 85150929a15b4e0a225434d5970bba14ebdf31f1 cifs: dump channel info i=
n DebugData
>
> :::::: TO: Aurelien Aptel <aaptel@suse.com>
> :::::: CC: Steve French <stfrench@microsoft.com>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
Thanks,

Steve

--000000000000ec7c7305fef5eba1
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-cifs-display-the-endpoint-IP-details-in-DebugData.patch"
Content-Disposition: attachment; 
	filename="0002-cifs-display-the-endpoint-IP-details-in-DebugData.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ljbl76ch0>
X-Attachment-Id: f_ljbl76ch0

RnJvbSA1ZTVmMzA0NTVjMjRiYjRiM2RkNWNjYThjOWFjMjA3NjdlNWE2ZjQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaHlhbSBQcmFzYWQgTiA8c3ByYXNhZEBtaWNyb3NvZnQuY29t
PgpEYXRlOiBGcmksIDkgSnVuIDIwMjMgMTI6NDY6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIIDIv
Ml0gY2lmczogZGlzcGxheSB0aGUgZW5kcG9pbnQgSVAgZGV0YWlscyBpbiBEZWJ1Z0RhdGEKCldp
dGggbXVsdGljaGFubmVsLCBpdCBpcyB1c2VmdWwgdG8ga25vdyB0aGUgc3JjIHBvcnQgZGV0YWls
cwpmb3IgZWFjaCBjaGFubmVsLiBUaGlzIGNoYW5nZSB3aWxsIHByaW50IHRoZSBpcCBhZGRyIGFu
ZApwb3J0IGRldGFpbHMgZm9yIGJvdGggdGhlIHNvY2tldCBkZXN0IGFuZCBzcmMgZW5kcG9pbnRz
LgoKU2lnbmVkLW9mZi1ieTogU2h5YW0gUHJhc2FkIE4gPHNwcmFzYWRAbWljcm9zb2Z0LmNvbT4K
UmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpDbG9zZXM6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzA2MjUxNTM5LlIzNGUzUlhk
LWxrcEBpbnRlbC5jb20vClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWlj
cm9zb2Z0LmNvbT4KLS0tCiBmcy9zbWIvY2xpZW50L2NpZnNfZGVidWcuYyB8IDUzICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L2NpZnNf
ZGVidWcuYyBiL2ZzL3NtYi9jbGllbnQvY2lmc19kZWJ1Zy5jCmluZGV4IGIyNzlmNzQ1NDY2ZS4u
MmM3NzFjODRiOTcwIDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L2NpZnNfZGVidWcuYworKysg
Yi9mcy9zbWIvY2xpZW50L2NpZnNfZGVidWcuYwpAQCAtMTMsNiArMTMsNyBAQAogI2luY2x1ZGUg
PGxpbnV4L3Byb2NfZnMuaD4KICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+CiAjaW5jbHVkZSA8
dWFwaS9saW51eC9ldGh0b29sLmg+CisjaW5jbHVkZSA8bmV0L2luZXRfc29jay5oPgogI2luY2x1
ZGUgImNpZnNwZHUuaCIKICNpbmNsdWRlICJjaWZzZ2xvYi5oIgogI2luY2x1ZGUgImNpZnNwcm90
by5oIgpAQCAtMTQ3LDYgKzE0OCwyMCBAQCBjaWZzX2R1bXBfY2hhbm5lbChzdHJ1Y3Qgc2VxX2Zp
bGUgKm0sIGludCBpLCBzdHJ1Y3QgY2lmc19jaGFuICpjaGFuKQogCQkgICBpbl9mbGlnaHQoc2Vy
dmVyKSwKIAkJICAgYXRvbWljX3JlYWQoJnNlcnZlci0+aW5fc2VuZCksCiAJCSAgIGF0b21pY19y
ZWFkKCZzZXJ2ZXItPm51bV93YWl0ZXJzKSk7CisKKyNpZm5kZWYgQ09ORklHX0NJRlNfU01CX0RJ
UkVDVAorCWlmIChzZXJ2ZXItPnNzb2NrZXQpIHsKKwkJc3RydWN0IHNvY2thZGRyIHNyYzsKKwkJ
aW50IGFkZHJsZW47CisKKwkJYWRkcmxlbiA9IGtlcm5lbF9nZXRzb2NrbmFtZShzZXJ2ZXItPnNz
b2NrZXQsICZzcmMpOworCQlpZiAoYWRkcmxlbiAhPSBzaXplb2Yoc3RydWN0IHNvY2thZGRyX2lu
KSAmJiBhZGRybGVuICE9IHNpemVvZihzdHJ1Y3Qgc29ja2FkZHJfaW42KSkKKwkJCXJldHVybjsK
KworCQlzZXFfcHJpbnRmKG0sICJcblx0XHRJUCBhZGRyOiBkc3Q6ICVwSVNwYywgc3JjOiAlcElT
cGMiLCAmc2VydmVyLT5kc3RhZGRyLCAmc3JjKTsKKwl9CisjZW5kaWYKKwogfQogCiBzdGF0aWMg
aW5saW5lIGNvbnN0IGNoYXIgKnNtYl9zcGVlZF90b19zdHIoc2l6ZV90IGJwcykKQEAgLTI2Myw3
ICsyNzgsNyBAQCBzdGF0aWMgaW50IGNpZnNfZGVidWdfZmlsZXNfcHJvY19zaG93KHN0cnVjdCBz
ZXFfZmlsZSAqbSwgdm9pZCAqdikKIHN0YXRpYyBpbnQgY2lmc19kZWJ1Z19kYXRhX3Byb2Nfc2hv
dyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKnYpCiB7CiAJc3RydWN0IG1pZF9xX2VudHJ5ICpt
aWRfZW50cnk7Ci0Jc3RydWN0IFRDUF9TZXJ2ZXJfSW5mbyAqc2VydmVyOworCXN0cnVjdCBUQ1Bf
U2VydmVyX0luZm8gKnNlcnZlciwgKm5zZXJ2ZXI7CiAJc3RydWN0IFRDUF9TZXJ2ZXJfSW5mbyAq
Y2hhbl9zZXJ2ZXI7CiAJc3RydWN0IGNpZnNfc2VzICpzZXM7CiAJc3RydWN0IGNpZnNfdGNvbiAq
dGNvbjsKQEAgLTMxOCw3ICszMzMsNyBAQCBzdGF0aWMgaW50IGNpZnNfZGVidWdfZGF0YV9wcm9j
X3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICp2KQogCiAJYyA9IDA7CiAJc3Bpbl9sb2Nr
KCZjaWZzX3RjcF9zZXNfbG9jayk7Ci0JbGlzdF9mb3JfZWFjaF9lbnRyeShzZXJ2ZXIsICZjaWZz
X3RjcF9zZXNfbGlzdCwgdGNwX3Nlc19saXN0KSB7CisJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZl
KHNlcnZlciwgbnNlcnZlciwgJmNpZnNfdGNwX3Nlc19saXN0LCB0Y3Bfc2VzX2xpc3QpIHsKIAkJ
LyogY2hhbm5lbCBpbmZvIHdpbGwgYmUgcHJpbnRlZCBhcyBhIHBhcnQgb2Ygc2Vzc2lvbnMgYmVs
b3cgKi8KIAkJaWYgKENJRlNfU0VSVkVSX0lTX0NIQU4oc2VydmVyKSkKIAkJCWNvbnRpbnVlOwpA
QCAtMzk2LDYgKzQxMSwyOSBAQCBzdGF0aWMgaW50IGNpZnNfZGVidWdfZGF0YV9wcm9jX3Nob3co
c3RydWN0IHNlcV9maWxlICptLCB2b2lkICp2KQogCQkJYXRvbWljX3JlYWQoJnNlcnZlci0+c21i
ZF9jb25uLT5tcl9yZWFkeV9jb3VudCksCiAJCQlhdG9taWNfcmVhZCgmc2VydmVyLT5zbWJkX2Nv
bm4tPm1yX3VzZWRfY291bnQpKTsKIHNraXBfcmRtYToKKyNlbHNlCisJCWlmIChzZXJ2ZXItPnNz
b2NrZXQpIHsKKwkJCXN0cnVjdCBzb2NrYWRkciBzcmM7CisJCQlpbnQgYWRkcmxlbjsKKworCQkJ
Lyoga2VybmVsX2dldHNvY2tuYW1lIGNhbiBibG9jay4gc28gZHJvcCB0aGUgbG9jayBmaXJzdCAq
LworCQkJc2VydmVyLT5zcnZfY291bnQrKzsKKwkJCXNwaW5fdW5sb2NrKCZjaWZzX3RjcF9zZXNf
bG9jayk7CisKKwkJCWFkZHJsZW4gPSBrZXJuZWxfZ2V0c29ja25hbWUoc2VydmVyLT5zc29ja2V0
LCAmc3JjKTsKKwkJCWlmICgoYWRkcmxlbiAhPSBzaXplb2Yoc3RydWN0IHNvY2thZGRyX2luKSkg
JiYKKwkJCSAgICAoYWRkcmxlbiAhPSBzaXplb2Yoc3RydWN0IHNvY2thZGRyX2luNikpKSB7CisJ
CQkJc3Bpbl9sb2NrKCZjaWZzX3RjcF9zZXNfbG9jayk7CisJCQkJZ290byBza2lwX2FkZHJfZGV0
YWlsczsKKwkJCX0KKworCQkJc2VxX3ByaW50ZihtLCAiXG5JUCBhZGRyOiBkc3Q6ICVwSVNwYywg
c3JjOiAlcElTcGMiLCAmc2VydmVyLT5kc3RhZGRyLCAmc3JjKTsKKworCQkJY2lmc19wdXRfdGNw
X3Nlc3Npb24oc2VydmVyLCAwKTsKKwkJCXNwaW5fbG9jaygmY2lmc190Y3Bfc2VzX2xvY2spOwor
CQl9CisKK3NraXBfYWRkcl9kZXRhaWxzOgogI2VuZGlmCiAJCXNlcV9wcmludGYobSwgIlxuTnVt
YmVyIG9mIGNyZWRpdHM6ICVkLCVkLCVkIERpYWxlY3QgMHgleCIsCiAJCQlzZXJ2ZXItPmNyZWRp
dHMsCkBAIC00OTMsNyArNTMxLDE4IEBAIHN0YXRpYyBpbnQgY2lmc19kZWJ1Z19kYXRhX3Byb2Nf
c2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKnYpCiAJCQkJc2VxX3ByaW50ZihtLCAiXG5c
blx0RXh0cmEgQ2hhbm5lbHM6ICV6dSAiLAogCQkJCQkgICBzZXMtPmNoYW5fY291bnQtMSk7CiAJ
CQkJZm9yIChqID0gMTsgaiA8IHNlcy0+Y2hhbl9jb3VudDsgaisrKSB7CisJCQkJCS8qCisJCQkJ
CSAqIGtlcm5lbF9nZXRzb2NrbmFtZSBjYW4gYmxvY2sgaW5zaWRlCisJCQkJCSAqIGNpZnNfZHVt
cF9jaGFubmVsLiBzbyBkcm9wIHRoZSBsb2NrIGZpcnN0CisJCQkJCSAqLworCQkJCQlzZXJ2ZXIt
PnNydl9jb3VudCsrOworCQkJCQlzcGluX3VubG9jaygmY2lmc190Y3Bfc2VzX2xvY2spOworCiAJ
CQkJCWNpZnNfZHVtcF9jaGFubmVsKG0sIGosICZzZXMtPmNoYW5zW2pdKTsKKworCQkJCQljaWZz
X3B1dF90Y3Bfc2Vzc2lvbihzZXJ2ZXIsIDApOworCQkJCQlzcGluX2xvY2soJmNpZnNfdGNwX3Nl
c19sb2NrKTsKKwogCQkJCQlpZiAoQ0lGU19DSEFOX05FRURTX1JFQ09OTkVDVChzZXMsIGopKQog
CQkJCQkJc2VxX3B1dHMobSwgIlx0RElTQ09OTkVDVEVEICIpOwogCQkJCQlpZiAoQ0lGU19DSEFO
X0lOX1JFQ09OTkVDVChzZXMsIGopKQotLSAKMi4zNC4xCgo=
--000000000000ec7c7305fef5eba1--

