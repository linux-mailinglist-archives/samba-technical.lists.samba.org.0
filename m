Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F66909211
	for <lists+samba-technical@lfdr.de>; Fri, 14 Jun 2024 19:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GILKZDItdd3j1P2FkcCvz44akW43rqMhwWgwb4koatE=; b=yeWZuj5CaQhU79/PBbfx2PQwep
	AViDWttw96+ohF9IKsJaJdAySqgw6E9svBdeJu24wrkPT3QSiFj8X+uCXQSCVObFN96+l4hyop78j
	W7+aAmqVKiQC4rWiu4GCwYrrPMJr5c8NSwpWlI8ku0DUZz4Wuyt5O7I9M8I7elZaK5JIz3W+c5EZ7
	k9rxt0FOVB/zf3Ifo4/TURiXCM0oawBD8RKF00RduHWOFOuzmA6ggq2KPyoZWoGTf1Nvnu3rFOnDC
	h/6A0HG+lyEIoMhn7Sru2KrvuqmX9LEtKYBsj9ZOjHit5MlriyYcUtSo0mhTbvfziu6rVNW1Fethu
	yOPsBP/w==;
Received: from ip6-localhost ([::1]:58606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sIBC0-00Dqkt-7I; Fri, 14 Jun 2024 17:58:28 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:48299) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sIBBu-00Dqkm-7Y
 for samba-technical@lists.samba.org; Fri, 14 Jun 2024 17:58:25 +0000
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52bc1261e8fso2875443e87.0
 for <samba-technical@lists.samba.org>; Fri, 14 Jun 2024 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718387901; x=1718992701; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zBIyoi+p6nAtEctYKpcWjN27GPWe1pucSH6tIg85YiM=;
 b=HHFbC6e4xRm87tbTOtv6GB8ax+Z10QtnYvk+YYeltyAwd8htRtygNSJ3XVe/F1nw62
 4G1C+AeZRs5wDz4HmS16mVq59jucblLjMRvqsMgTS/6V2jxGGITUOBTV6xyNwudFpLCP
 YQtt4FxnXbyA0dAe0hmiVD3zJpdIv9PVRWPB3CamEMNJNOFacLjc07y6MFhgKRfESPZR
 2jlfqxfPEUcrW/fE1zF8OXwXIoGYAztOwyrns0dPQZ8D4JnGhypaJbmL509W+Jmap4ap
 fZoWUSY1/2tbogK52UfjQKnGuNP9Mpo5bigwEd3tnX+RKE+A7hSralXbDzzJdzEAtmRx
 kADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718387901; x=1718992701;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zBIyoi+p6nAtEctYKpcWjN27GPWe1pucSH6tIg85YiM=;
 b=bn/pWBnDsxgk6peuZ2dPnU0KIFzC5MDxZ/gcesxlCFoSrUifFruyi3rW7mtclMWP4O
 hL1nJzymx6wDZxUSWXoFju+H/SWzYc/o9YoUw2VJEW8FBM2pFwrKtfQdmQ3sB0PbHVDv
 aO50AOuNb45qIPNqNlmUlJcfh7HT07j2qyYINxRSpUAjs1Rn40Wt1+CaqQk6z/GeTmyw
 s/r8QdyiNQwkNvOOPrtZcbcBxBTyTOEC+a73TxorI1kevEytMdNG3QOEEGgfqPb4rmdL
 qvSLtyiMeVlkMhdwnhIolixK1/JE87N6vFPnWHm5iSN/vPpo/ad1JAQ7hSQzstyq+0/u
 g9eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt/lNiIFL7K0JXiK0nX4BE98tcFaGeZ1lHD1iryc4qgvkxZHpwNB5lmHwo6OVDK18OCIXvqO33/ZCmlZqodSoA7z2nD4zxIAoUPqUyUWN3
X-Gm-Message-State: AOJu0Yw4Ipwrxi2NL+9xpdIeeH8ZKTjgmafMoJH5eyUZ1As56PqOxPJ5
 4dKTYUbovwpuV/9UsfqNxvbzg6Kn/WlMNV2Edai+jjyhMDqdfy+ntaqlNH5s6siXACpJ4Tq6zLi
 z8DvOaUgZNPo2SIXH3VW4FcM1hDI=
X-Google-Smtp-Source: AGHT+IFPgrI+XOVyPXCGZSmA53iQPcrxc33s7Eswc6YQqN5F35xKen6AJCL8R8auJDKWE29rXvLseGBGXSB02mtAihM=
X-Received: by 2002:a19:e041:0:b0:52c:8df9:2e6f with SMTP id
 2adb3069b0e04-52ca6e92d40mr2269631e87.42.1718387900544; Fri, 14 Jun 2024
 10:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <202406141533.e9eb9ad9-oliver.sang@intel.com>
In-Reply-To: <202406141533.e9eb9ad9-oliver.sang@intel.com>
Date: Fri, 14 Jun 2024 12:58:09 -0500
Message-ID: <CAH2r5muisz3GrrPREB=sSH6h_sMS7E+WMynvZQqevHGzrmtcvg@mail.gmail.com>
Subject: Re: [dhowells-fs:netfs-writeback] [netfs,
 cifs] d639a2f9ab: xfstests.generic.080.fail
To: kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Paulo Alcantara <pc@manguebit.com>, Steve French <sfrench@samba.org>,
 lkp@intel.com, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Jeff Layton <jlayton@kernel.org>, David Howells <dhowells@redhat.com>,
 linux-fsdevel@vger.kernel.org, oe-lkp@lists.linux.dev, netfs@lists.linux.dev
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I also ran into this (mtime update bug) so did not merge this patch into
cifs-2.6.git for-next

On Fri, Jun 14, 2024 at 2:57=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com>
wrote:

>
>
> Hello,
>
> kernel test robot noticed "xfstests.generic.080.fail" on:
>
> commit: d639a2f9abbeb29246eb144e6a3ed9edd3f6d887 ("netfs, cifs: Move
> CIFS_INO_MODIFIED_ATTR to netfs_inode")
> https://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git
> netfs-writeback
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
> test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake)
> with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes:
> https://lore.kernel.org/oe-lkp/202406141533.e9eb9ad9-oliver.sang@intel.co=
m
>
> 2024-06-13 08:02:14 mount /dev/sdb1 /fs/sdb1
> 2024-06-13 08:02:15 mkdir -p /smbv3//cifs/sdb1
> 2024-06-13 08:02:15 export FSTYP=3Dcifs
> 2024-06-13 08:02:15 export TEST_DEV=3D//localhost/fs/sdb1
> 2024-06-13 08:02:15 export TEST_DIR=3D/smbv3//cifs/sdb1
> 2024-06-13 08:02:15 export
> CIFS_MOUNT_OPTIONS=3D-ousername=3Droot,password=3Dpass,noperm,vers=3D3.0,=
mfsymlinks,actimeo=3D0
> 2024-06-13 08:02:15 echo generic/080
> 2024-06-13 08:02:15 ./check -E tests/cifs/exclude.incompatible-smb3.txt -=
E
> tests/cifs/exclude.very-slow.txt generic/080
> FSTYP         -- cifs
> PLATFORM      -- Linux/x86_64 lkp-skl-d05 6.10.0-rc2-00003-gd639a2f9abbe
> #1 SMP PREEMPT_DYNAMIC Thu Jun 13 09:50:57 CST 2024
>
> generic/080       [failed, exit status 2]- output mismatch (see
> /lkp/benchmarks/xfstests/results//generic/080.out.bad)
>     --- tests/generic/080.out   2024-06-12 14:13:57.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//generic/080.out.bad   2024-06-1=
3
> 08:03:12.373660796 +0000
>     @@ -1,2 +1,4 @@
>      QA output created by 080
>      Silence is golden.
>     +mtime not updated
>     +ctime not updated
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/080.out
> /lkp/benchmarks/xfstests/results//generic/080.out.bad'  to see the entire
> diff)
> Ran: generic/080
> Failures: generic/080
> Failed 1 of 1 tests
>
>
>
>
> The kernel config and materials to reproduce are available at:
>
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
>

--=20
Thanks,

Steve
