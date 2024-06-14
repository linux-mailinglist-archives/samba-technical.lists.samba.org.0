Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8F990924C
	for <lists+samba-technical@lfdr.de>; Fri, 14 Jun 2024 20:31:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Tgc6c/AlVm64X+LxZJ5q+Y3/Dp2q9nBZcMIEcvsnAKg=; b=3mh/LV7rq7/IV+8Ja6e9/NmdTT
	RjiiiJwiWTjy3K8lQ3LGn/zgIRk56YrSbz1aHApnVYrNRgV4XGEeg6DVLC4Tp9m8ahOid66K/gF0k
	8PiXIGV/usDrJcrr1bfEI8LXB7NY+oLV1k7jpTqixnI/+dbyljFS8zi9eWZ+vRdrEVNP575y7Chhk
	tR0vMPyVat5uXOhzPIKx6vZangwNiTabqpWUezSUIuKm6NErmQLDP5zOQ38MHc7QLdr/78+CEKU++
	1V9IkHFHO79pwCMrJvF5O2OAGs0snkRDNrSOzCL+gYxmjobNmPuTa6b9+NI5l1zGOH4UqMCJ13R1u
	cF6YVqEw==;
Received: from ip6-localhost ([::1]:55652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sIBhD-00DrPs-Pm; Fri, 14 Jun 2024 18:30:43 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:50274) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sIBh9-00DrPk-09
 for samba-technical@lists.samba.org; Fri, 14 Jun 2024 18:30:42 +0000
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso22761001fa.0
 for <samba-technical@lists.samba.org>; Fri, 14 Jun 2024 11:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718389836; x=1718994636; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tgc6c/AlVm64X+LxZJ5q+Y3/Dp2q9nBZcMIEcvsnAKg=;
 b=NlBc3ewlWSuOCMAilsf1kxQiBYz5ZX4LRrFDITg6HXSaUDP7bUgaOKnRRWa0QHcn4w
 xyKhJvSr2lYDLdUwQ687/T7wsEn62AObZItQpolPF8x/a+E7OwhIi931To0yti3Xf5Gp
 KEN0n4W+hJzsXHGz/TW0ZHwGgMN63pzwAMrrCTI8XpiljsSeGVRJS3959Ku2V9Msyxy4
 wF/sUhj3/TSZnWMCPkvpcIleutjG/vjVWEskyc4CPI8k1aPk3aJD3PBdA2oHovSU8N8G
 RWW/YT7qhZVreu3xPie77CePUp46iv/rERJTmIlmw9oSLI4YD+eClIYuIEBVXYJlLnyI
 QFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718389836; x=1718994636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tgc6c/AlVm64X+LxZJ5q+Y3/Dp2q9nBZcMIEcvsnAKg=;
 b=tiTeQGSXJlyvKjuvCRvdi2CW6z95ejmNVnIy4sbgjTHX100IK1lx5PMuQDOPLBGGRd
 7hwYqUyl0FCWP2Kg1IMBeypShek8vaf+P0gMtEip37WZpHL5wOfreu/eZlIn8rfC2/ZL
 bI6KiNRwJu8VEY9P97JSTONfG93h/IeBlK9udpp1btY1/PF9SIYcD5eTcwfooKIIFQnv
 iguxeuUE1I5aCWjebSGvp1iYl4NvGM+zTuuKdA6ez10HP7wrnqD/V2m2/MP2V7dH1ORE
 DktzA5SG62yq5Ti0KF9baqTodh9HmSiw/TdqXnRnD5hKMflCQmyL3XnE6ZX+4nm1IttU
 zwrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1tuwlyjPzppr2ok0mtJ+ykFK80EWrDl0jA3J2fjsv10kBUNIHKdquCX4VBv3esL8gg801ju7rxuKmx7yX4BvO82dqOsxXgpR7FAb2n0/9
X-Gm-Message-State: AOJu0YxJd67Qt6HOt+99dK4vMA+PthQseVKgeuCux7fpkT5SByxlJq6y
 ffE0bE1mavL4Rb/19z2uhczhI0sIFGRaj/jfkl3AQEt2fMAJJtDaiELtbhOMdfigIBQVOX5LfKu
 BB7Yb9mh1jrUDnpF900P3B8JnsdA=
X-Google-Smtp-Source: AGHT+IFuCxPnWdPgZbZjnxz7le4BHJ/RAuc/8+LsBd0/tfr7kPXDMr6z8YOqeHaBhxeI+8JhzPHALYypcJVIiakDE2E=
X-Received: by 2002:a2e:2e0f:0:b0:2eb:e840:4a1b with SMTP id
 38308e7fff4ca-2ec0e5b5e75mr22786271fa.7.1718389836228; Fri, 14 Jun 2024
 11:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <202406141533.e9eb9ad9-oliver.sang@intel.com>
In-Reply-To: <202406141533.e9eb9ad9-oliver.sang@intel.com>
Date: Fri, 14 Jun 2024 13:30:23 -0500
Message-ID: <CAH2r5msBudvQREvO1C5QB=AjHmDJEZk6KzPGjELsO8f-W7+_Xg@mail.gmail.com>
Subject: Re: [dhowells-fs:netfs-writeback] [netfs,
 cifs] d639a2f9ab: xfstests.generic.080.fail
To: kernel test robot <oliver.sang@intel.com>
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
Cc: Paulo Alcantara <pc@manguebit.com>, Steve French <sfrench@samba.org>,
 lkp@intel.com, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Jeff Layton <jlayton@kernel.org>, David Howells <dhowells@redhat.com>,
 linux-fsdevel@vger.kernel.org, oe-lkp@lists.linux.dev, netfs@lists.linux.dev
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I also ran into this (mtime update bug) so did not merge this patch
into cifs-2.6.git for-next


On Fri, Jun 14, 2024 at 2:57=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "xfstests.generic.080.fail" on:
>
> commit: d639a2f9abbeb29246eb144e6a3ed9edd3f6d887 ("netfs, cifs: Move CIFS=
_INO_MODIFIED_ATTR to netfs_inode")
> https://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git netfs-=
writeback
>
> in testcase: xfstests
> version: xfstests-x86_64-e46fa3a7-1_20240612
> with following parameters:
>
>         disk: 4HDD
>         fs: ext4
>         fs2: smbv3
>         test: generic-080
>
>
>
> compiler: gcc-13
> test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake)=
 with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202406141533.e9eb9ad9-oliver.san=
g@intel.com
>
> 2024-06-13 08:02:14 mount /dev/sdb1 /fs/sdb1
> 2024-06-13 08:02:15 mkdir -p /smbv3//cifs/sdb1
> 2024-06-13 08:02:15 export FSTYP=3Dcifs
> 2024-06-13 08:02:15 export TEST_DEV=3D//localhost/fs/sdb1
> 2024-06-13 08:02:15 export TEST_DIR=3D/smbv3//cifs/sdb1
> 2024-06-13 08:02:15 export CIFS_MOUNT_OPTIONS=3D-ousername=3Droot,passwor=
d=3Dpass,noperm,vers=3D3.0,mfsymlinks,actimeo=3D0
> 2024-06-13 08:02:15 echo generic/080
> 2024-06-13 08:02:15 ./check -E tests/cifs/exclude.incompatible-smb3.txt -=
E tests/cifs/exclude.very-slow.txt generic/080
> FSTYP         -- cifs
> PLATFORM      -- Linux/x86_64 lkp-skl-d05 6.10.0-rc2-00003-gd639a2f9abbe =
#1 SMP PREEMPT_DYNAMIC Thu Jun 13 09:50:57 CST 2024
>
> generic/080       [failed, exit status 2]- output mismatch (see /lkp/benc=
hmarks/xfstests/results//generic/080.out.bad)
>     --- tests/generic/080.out   2024-06-12 14:13:57.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//generic/080.out.bad   2024-06-1=
3 08:03:12.373660796 +0000
>     @@ -1,2 +1,4 @@
>      QA output created by 080
>      Silence is golden.
>     +mtime not updated
>     +ctime not updated
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/080.out /lkp/ben=
chmarks/xfstests/results//generic/080.out.bad'  to see the entire diff)
> Ran: generic/080
> Failures: generic/080
> Failed 1 of 1 tests
>
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240614/202406141533.e9eb9ad9-ol=
iver.sang@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>


--=20
Thanks,

Steve

