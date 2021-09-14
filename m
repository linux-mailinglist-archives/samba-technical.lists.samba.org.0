Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D1740A52A
	for <lists+samba-technical@lfdr.de>; Tue, 14 Sep 2021 06:15:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=fk5npy068OgmDV0FJiWIYC2aMiqadNbg9v3BldokMwQ=; b=tI/I24/7sFrUKznlafgL8V5cVP
	8RnDgL+2Xl9A9pcf7hTKAD3idt0xUjGA+7xRSfTBrQhj6WLW4u5EyR+gV9ypYIroZRGcR0B81smzf
	WMprviTIAI7FHzTEm5+iCfrFTt9XTYG1Xn55heLuwEPPssUcaelaE6e7Me6FurzMR+yad03W7wd1f
	TfKebIp4rjXjpfykUMN2bfr3gK99pCmmO81dkP1oM5KkSFxZ20E966nbbqlw7ldK+p42shPBCT7ab
	SwqJ7iHVsXdggL4Bhge7g6rQyttq+1sYI0rr+3ZBMnPlck7zNCfZjB5HWdwme8oK342EnGB5HngHY
	zDBgZ+kQ==;
Received: from ip6-localhost ([::1]:55430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mPzqS-00EzOY-3i; Tue, 14 Sep 2021 04:14:56 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:40477) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mPzqM-00EzOP-0c
 for samba-technical@lists.samba.org; Tue, 14 Sep 2021 04:14:52 +0000
Received: by mail-lj1-x22d.google.com with SMTP id i28so21228934ljm.7
 for <samba-technical@lists.samba.org>; Mon, 13 Sep 2021 21:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fk5npy068OgmDV0FJiWIYC2aMiqadNbg9v3BldokMwQ=;
 b=WM/itaV7eQFGJhf+ut/Gi991yYdBohhD7SdazDTHAFwv9VKd2vKHKooUE7AahtWbzS
 Wp+wcfn/hQsFUTnag8WVBYE4qhYDs0ruiKKAHTifyfSIQTyPlC64ooFV9YctB5diCtH6
 Dsmd48SRDriWu/kBiO9jpIwghSPzYTwI47c2QX0pe5ogfX404H+fxwOZpUKDlhefJ9Oo
 /ubitx4mgD2k25hp4/5q9Nkf8nU5n2Zmlle21O8ZH/NjhBJeSMnL/T8h8UdTEkMwVm/k
 nWIYjjOU8xfu/odao53UkeakVe0K0gxFSTIZvjiY7gKqTClmGVKBSSV6Vl+S9yjhUFXd
 kn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fk5npy068OgmDV0FJiWIYC2aMiqadNbg9v3BldokMwQ=;
 b=Zypv0ESPfTheh/k5VAR69Qh7V5u3ZNNiOXeD5HoUzihNdCnvtXRKuXqqWoJ0p0ye6p
 zyKRAZr/eZ5ILNW6QOjiAsQ8fOScwwSgwqooDIDqzCtUMfCpFtyfxTMy9N5kfb9FFPXS
 AsFOQxy4oQlQ7jGoQRKnTJZvl8LaaZToa76xKQ9n+n7/q7HevMTP5ejvYxPYMUomVxz0
 bdI20lPn9RFhXOfoVGW20Wmzb50rqEpcjsLyNFviTXpYqSsVedk3DSuj6vqJorBvjDKB
 PqiXOWwZV42KzZIefqKxuFAYqxWufvu4njWTgPJ/m84cG5W5H+0X8Z9ijcPyiKXFxRB0
 tC6w==
X-Gm-Message-State: AOAM531nZ3IYvwCZChHfT1oEbBIWZPe/GlSCY8SIEPTvJ9TiMdg3Trxb
 Nl3o+InsWeCSUCOrqhqRd7ubL82RUBBAAhHAPtM=
X-Google-Smtp-Source: ABdhPJzaLLNRj8vrhhNRwLPGqsQsPoHZir/7AzhIrkrQkQ4S574j5Ukleo7R8h5NRI086wb9A70pZCg+yq/6UqcW0sU=
X-Received: by 2002:a2e:4e01:: with SMTP id c1mr12814315ljb.460.1631592888353; 
 Mon, 13 Sep 2021 21:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <202109132243.2u0FFC0r-lkp@intel.com>
In-Reply-To: <202109132243.2u0FFC0r-lkp@intel.com>
Date: Mon, 13 Sep 2021 23:14:37 -0500
Message-ID: <CAH2r5msMZFtQt-u+5bw=hXTe4J_s8ugb2JR9RLCP4+9J3Pkzmg@mail.gmail.com>
Subject: Re: [cifs:for-next 1/1] fs/smbfs/cifsroot.c:83:12: warning: no
 previous prototype for 'cifs_root_data'
To: kernel test robot <lkp@intel.com>, Paulo Alcantara <pc@cjr.nz>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, kbuild-all@lists.01.org,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Paulo,
This doesn't look like an error - there is a prototype for this in
init/do_mount.c

Is a change needed? Or something to quiet the buildbot ..

On Mon, Sep 13, 2021 at 10:00 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> head:   bba805a46c91e7a8a1d04704e5409f890acf8b66
> commit: bba805a46c91e7a8a1d04704e5409f890acf8b66 [1/1] cifs: rename fs/cifs directory to fs/smbfs
> config: x86_64-allyesconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build):
>         git remote add cifs git://git.samba.org/sfrench/cifs-2.6.git
>         git fetch --no-tags cifs for-next
>         git checkout bba805a46c91e7a8a1d04704e5409f890acf8b66
>         # save the attached .config to linux build tree
>         make W=1 ARCH=x86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> fs/smbfs/cifsroot.c:83:12: warning: no previous prototype for 'cifs_root_data' [-Wmissing-prototypes]
>       83 | int __init cifs_root_data(char **dev, char **opts)
>          |            ^~~~~~~~~~~~~~
>
>
> vim +/cifs_root_data +83 fs/smbfs/cifsroot.c
>
> 8eecd1c2e5bc73 fs/cifs/cifsroot.c Paulo Alcantara (SUSE  2019-07-16  82)
> 8eecd1c2e5bc73 fs/cifs/cifsroot.c Paulo Alcantara (SUSE  2019-07-16 @83) int __init cifs_root_data(char **dev, char **opts)
>
> :::::: The code at line 83 was first introduced by commit
> :::::: 8eecd1c2e5bc73d33f3a544751305679dbf88eb4 cifs: Add support for root file systems
>
> :::::: TO: Paulo Alcantara (SUSE) <paulo@paulo.ac>
> :::::: CC: Steve French <stfrench@microsoft.com>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Thanks,

Steve

