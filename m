Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2088A6C6DEA
	for <lists+samba-technical@lfdr.de>; Thu, 23 Mar 2023 17:41:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=yXT7Q99MJclBWr90utjHDOXI0lYhfPprxpFtnCAbI3E=; b=EolfU4oDcmitV4Y7t3sZHUugd6
	vrkLykliPiBEQ71kylGcR8i4xAVhCDp/rkfaVgE4KcESWeqWoUW32yCfQiY4yoxFcqCl2go2k4cJf
	hk5fMffkjGX1u3s/lutSrd0DO1R31BY/HaE2Qrukg4Hs3dXTpQE3ZYNfOcI2f2IuX2+X2pn7aGieY
	yhzXQvWv+d6DgAfTH0zMqs2xnEpV4jJov0x6AHWhJHbdb9CkK/bgqSAEDnqls3X2rwPnpC3y6y88w
	hMa6N+USkzl3BP/opyZJ8txWRhkrlNtRdh6EqiLQqYrFdMpfcWLSBG8CSYaWpua03IangXFOWPMTA
	yxLCcchQ==;
Received: from ip6-localhost ([::1]:27790 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pfNzZ-004BSm-M3; Thu, 23 Mar 2023 16:40:45 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:33605) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pfNzS-004BSX-UN
 for samba-technical@lists.samba.org; Thu, 23 Mar 2023 16:40:42 +0000
Received: by mail-lj1-x229.google.com with SMTP id 20so16056384lju.0
 for <samba-technical@lists.samba.org>; Thu, 23 Mar 2023 09:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679589637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yXT7Q99MJclBWr90utjHDOXI0lYhfPprxpFtnCAbI3E=;
 b=K7bGXXSOqaiENwya0fNZ/RjBuNbB5DlugwUBxRk21H4yNPZ8ZmIynx6cqRhFL0VeQS
 hzOmOSD7VcxRQHkt9XRoh0eFMY/sPF6ErTb1nm0H5BNW/DoL/tdKKSrXQunhb4/wooIF
 F9QGNIFoNfpeTfyCulTjH5o1xBEzNzLLaci818BqdvXiUYgotIxIl70yj1a6RGsBAg9c
 18/fTtIUVj4EhhYikNFBe2+hU68OPF8Td0HKTjbTXpZDADl3I5WM/MR/dTySggL2Tvuj
 wSItBFtd4pBoRTnYJxyN7oqKWDEmzPiYwSKPw1dO+w8vXcIqDWAdh5TPSemYAfmip014
 CZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679589637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yXT7Q99MJclBWr90utjHDOXI0lYhfPprxpFtnCAbI3E=;
 b=wL39bzbFRoz+UcaHL4E5SIUgPIDurK1Z4GVCwo5KaDzd10UTECL6wZeeIyIvP1TwRL
 rwWLsNQ7n5i8Fod2BwznnrdfE+5NsyVls003a4tk6PBAlZ5bPCCqF1MTTpo2wvVmI9lQ
 d9S7CdxM1mcgLlr6Q8yA9SFXdhGO4c+DzoKSQ1PUlyq25bOc0xsW7dL7oXZSeJDvTsXC
 OcIuVbFQGjBlXgbq0aJBSth7hcqB5yk7b2HGGjfidZ4B2dd7EXky9VmjoNQV+9+rBvfC
 zJIhGTBJJ3tUzhD45EVzEXslyf7QD/i+VBp95s5HaVIu86ddWqRrvOVmAUs4cfKFZm44
 FCaA==
X-Gm-Message-State: AO0yUKVPxaqIfawad+YTjYIziHrDsd0BYwrwwFK/CtGhH8lhMvEztty1
 LUgsHke9QpnZIdtGOJS5KDP2AAHXCNY21hvZCCY=
X-Google-Smtp-Source: AK7set+J6H0D6JdtlocH4Wq/tcJoY8/CIj+hLVrjQzrduh123EtXGlKAmlm7DWTvEq11Vym5n1sSG5n5brlO2Fju3ME=
X-Received: by 2002:a2e:8ed1:0:b0:299:9de5:2f1b with SMTP id
 e17-20020a2e8ed1000000b002999de52f1bmr3446275ljl.7.1679589637352; Thu, 23 Mar
 2023 09:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <13de0bf0-aa74-46a3-8389-3c70fe77be1f@kili.mountain>
 <bbb33b9e-570f-8d02-1162-fa93fbe006dd@talpey.com>
In-Reply-To: <bbb33b9e-570f-8d02-1162-fa93fbe006dd@talpey.com>
Date: Thu, 23 Mar 2023 11:40:26 -0500
Message-ID: <CAH2r5mscB6L4vZEhAj99sfgRXkPvLpgGJi_5QeJvNtzydArnTg@mail.gmail.com>
Subject: Re: [cifs:for-next 3/8] fs/cifs/connect.c:1303 cifs_ipaddr_cmp()
 error: memcmp() '&saddr4->sin_addr.s_addr' too small (4 vs 16)
To: Tom Talpey <tom@talpey.com>
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
Cc: "Paulo Alcantara \(SUSE\)" <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Shyam Prasad N <sprasad@microsoft.com>, lkp@intel.com,
 oe-kbuild@lists.linux.dev, samba-technical@lists.samba.org,
 oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>,
 Dan Carpenter <error27@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I have removed that patch from for-next (so still has the other 8
multichannel fixes and debug improvements).  Should be adding an
important deferred close fix later this afternoon and the "umount -f"
fix as well

On Thu, Mar 23, 2023 at 8:07=E2=80=AFAM Tom Talpey via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On 3/23/2023 5:40 AM, Dan Carpenter wrote:
> > tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> > head:   96114df697dfaef2ce29c14089a83e4a5777e915
> > commit: 010c4e0a894e6a3dee3176aa2f654fce632d0346 [3/8] cifs: fix sockad=
dr comparison in iface_cmp
> > config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/2=
0230323/202303230210.ufS9gVzi-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Link: https://lore.kernel.org/r/202303230210.ufS9gVzi-lkp@intel.com/
> >
> > New smatch warnings:
> > fs/cifs/connect.c:1303 cifs_ipaddr_cmp() error: memcmp() '&saddr4->sin_=
addr.s_addr' too small (4 vs 16)
> > fs/cifs/connect.c:1318 cifs_ipaddr_cmp() error: memcmp() '&saddr6->sin6=
_addr' too small (16 vs 28)
> >
> > Old smatch warnings:
> > fs/cifs/connect.c:1303 cifs_ipaddr_cmp() error: memcmp() '&vaddr4->sin_=
addr.s_addr' too small (4 vs 16)
> > fs/cifs/connect.c:1318 cifs_ipaddr_cmp() error: memcmp() '&vaddr6->sin6=
_addr' too small (16 vs 28)
> > fs/cifs/connect.c:2937 generic_ip_connect() error: we previously assume=
d 'socket' could be null (see line 2925)
> >
> > vim +1303 fs/cifs/connect.c
> >
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1279  int
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1280  cifs_ipaddr_cmp(struct=
 sockaddr *srcaddr, struct sockaddr *rhs)
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1281  {
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1282       struct sockaddr_i=
n *saddr4 =3D (struct sockaddr_in *)srcaddr;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1283       struct sockaddr_i=
n *vaddr4 =3D (struct sockaddr_in *)rhs;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1284       struct sockaddr_i=
n6 *saddr6 =3D (struct sockaddr_in6 *)srcaddr;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1285       struct sockaddr_i=
n6 *vaddr6 =3D (struct sockaddr_in6 *)rhs;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1286
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1287       switch (srcaddr->=
sa_family) {
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1288       case AF_UNSPEC:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1289               switch (r=
hs->sa_family) {
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1290               case AF_U=
NSPEC:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1291                       r=
eturn 0;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1292               case AF_I=
NET:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1293               case AF_I=
NET6:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1294                       r=
eturn 1;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1295               default:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1296                       r=
eturn -1;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1297               }
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1298       case AF_INET: {
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1299               switch (r=
hs->sa_family) {
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1300               case AF_U=
NSPEC:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1301                       r=
eturn -1;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1302               case AF_I=
NET:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27 @1303                       r=
eturn memcmp(&saddr4->sin_addr.s_addr,
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1304                        =
      &vaddr4->sin_addr.s_addr,
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1305                        =
      sizeof(struct sockaddr_in));
> >
> > saddr4 and vaddr4 are type sockaddr_in.  But sin_addr.s_addr is an
> > offset into the struct.  This looks like a read overflow.  I would thin=
k
> > it should be sizeof(struct in_addr).
>
> Oh, definitely. It's more than a read overflow, it's an incorrect
> comparison which will lead to creating new and unnecessary channels.
> Two bugs here.
>
> Tom.
>
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1306               case AF_I=
NET6:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1307                       r=
eturn 1;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1308               default:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1309                       r=
eturn -1;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1310               }
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1311       }
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1312       case AF_INET6: {
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1313               switch (r=
hs->sa_family) {
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1314               case AF_U=
NSPEC:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1315               case AF_I=
NET:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1316                       r=
eturn -1;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1317               case AF_I=
NET6:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27 @1318                       r=
eturn memcmp(&saddr6->sin6_addr,
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1319                        =
             &vaddr6->sin6_addr,
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1320                        =
             sizeof(struct sockaddr_in6));
> >
> > Same.
> >
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1321               default:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1322                       r=
eturn -1;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1323               }
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1324       }
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1325       default:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1326               return -1=
; /* don't expect to be here */
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1327       }
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1328  }
> >
>


--=20
Thanks,

Steve

