Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFC2A02E8D
	for <lists+samba-technical@lfdr.de>; Mon,  6 Jan 2025 18:04:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=vDewTj+7tUroBMoex5nb7sNODcMKrxnRD7GW3YVIuh0=; b=hgSRFBNX7uI0VWSkiTkdE3e8pc
	2FjkJc2BgttN9i5IdyJC+j6HwhvDOdxSPDJtA233RH5XBI3ivW0rSYrU6PNSB/vVy0aImGucFN7OO
	LL0TbDoaTNJo/z3dnOh2csDgboOsmVwy0Nc5mBdRn46aODhcisyUaz2V22w6KTDRcBUG3JTXM+Ng3
	0+fWFAJ6jZSUNfWYHCBe41Wm7AtOL71V+4q0aZAuX/VT1RgHk+RdO8wxH0i7V42W0CwmLCW0LYlyI
	dCCnzbgN21hqUqoC5Yx986YNWTI2005fL7qgxWqslSaIEoWeYvIiLO0glmRsTzG4OpZAn5Xy+WLqX
	+JvU6LZA==;
Received: from ip6-localhost ([::1]:32408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tUqW8-007PeB-1K; Mon, 06 Jan 2025 17:03:52 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:47397) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tUqW2-007Pe4-UO
 for samba-technical@lists.samba.org; Mon, 06 Jan 2025 17:03:49 +0000
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5426fcb3c69so1851436e87.3
 for <samba-technical@lists.samba.org>; Mon, 06 Jan 2025 09:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736183025; x=1736787825; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vDewTj+7tUroBMoex5nb7sNODcMKrxnRD7GW3YVIuh0=;
 b=HDe5pCrO6vlzGCyhPO0ICjEZ22oQoWPtXdrs+OynNQGOA5oZJsyW5RjgRHbZsO07c8
 P3qKGxatbOys7sMDLkeS+lEgsOlXRFlHDnnbKkX1hTdjTcHKwZGGMEoT7uc8beHdMYdw
 12mURd5cuhZAmiRirw79bcNZXSw4r1D1j/RWvfy3EVhpcAD14v5CsTLdtxWSMj+cewFb
 KPKOBeJZG9RSsWSO953HNjGCPIwyhApBnPwZVj8F7T2W1s6H3r+7opxPckXj5aeAUaC6
 5u6QsXXIWn63MjqCcryftv2PKnymNILhdxmvD/g471eULR67Lj9AfOilTbajEbig54gG
 MnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736183025; x=1736787825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vDewTj+7tUroBMoex5nb7sNODcMKrxnRD7GW3YVIuh0=;
 b=X/D6WEYob2rcvzWywfYgZ+YuD+uhErfjCjlDSZyNdYDwpp4Nux2w8GT+RC0Vcc+FRM
 Z+bDVJnCCQaWYJ++eDufjXhlvy1lxLxorXmVyryUTtyee7Krhu7TIj7l/2BiPwGzRx7d
 n0M8L9hEgOj6yYsuCZCz2aam5haNC2CtplnDqQRnLI0GO4lKeZIw+f5K74VzfUuAHGnf
 Zs3e8YuG/28yyRJaVBW3kxngsfKkSxSWecdTWSRYnhOCzFEirLSHc3E34Ku6I4KiEaad
 0xjs4HreDAY+oLBkut/7khYRlKu1fmLXp6/olDeFrYX7IL66tPdx53dptcG98e3QZAe/
 TbwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUANaqbIdYpDtIkT3G9uWckuOKBLIiTifqYHbEhiiTFrDNi+JORW7FFzA6S1wjM4J2M8HeCBCriHpUOx2nG9Zo=@lists.samba.org
X-Gm-Message-State: AOJu0YzkbaBqFcdiHcHxmEeq4EDOZ/R1eQLk2zuQIJ8SxfQGCy8G3/3b
 kPhHku9dhlljbhz7GKpX7fAGvysKzwrh/EVD1Nz8Q6d/WA8XSNez3jO68qfWz5p4DjDDkZkP4Pv
 Xfn5swp42o17aHONamS6/OPXma7s=
X-Gm-Gg: ASbGncv35S7TaKkKGZUuvazHHNlM7Nl5X/1zBrBntDS+uUSYle0AxlgNtbULZ4mDFDF
 m6xQ3hnfR9tizyg7V7MOrVBjGdrHkcYt1nLziLp+DF8tmSLkWxfuKGURKW3xh18J8EEIGRPCN
X-Google-Smtp-Source: AGHT+IHWwDPZme6hk8Wj9ukxP3B8UmlenwQzmdI5fIXFykX8VP3n3kaWiQt6dUCPVmPlY6BHdfeJVoKcPjKJHpxIId4=
X-Received: by 2002:a05:6512:1313:b0:540:2ef4:9cf0 with SMTP id
 2adb3069b0e04-54229532f62mr16976471e87.18.1736183025029; Mon, 06 Jan 2025
 09:03:45 -0800 (PST)
MIME-Version: 1.0
References: <a376beb3-c362-4b73-b2e6-9104d4df6978@stanley.mountain>
In-Reply-To: <a376beb3-c362-4b73-b2e6-9104d4df6978@stanley.mountain>
Date: Mon, 6 Jan 2025 11:03:33 -0600
Message-ID: <CAH2r5ms7EkWfEmane-V+4fd-_7Y+qpLc_+-y=nDucjo1aG3RnA@mail.gmail.com>
Subject: Re: [cifs:for-next-next 13/13] fs/smb/client/fs_context.c:1466
 smb3_fs_context_parse_param() warn: statement has no effect 22
To: Dan Carpenter <dan.carpenter@linaro.org>
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
Cc: linux-cifs@vger.kernel.org, oe-kbuild@lists.linux.dev,
 samba-technical@lists.samba.org, oe-kbuild-all@lists.linux.dev,
 Steve French <stfrench@microsoft.com>, lkp@intel.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

buggy patch removed

On Mon, Jan 6, 2025 at 3:24=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next-next
> head:   8f97b4a68ea216bad142a5391e30fa63c8efce30
> commit: 8f97b4a68ea216bad142a5391e30fa63c8efce30 [13/13] smb3 client: min=
or cleanup of username parsing on mount
> config: x86_64-randconfig-161-20241220 (https://download.01.org/0day-ci/a=
rchive/20241222/202412220354.ZyCvciEy-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51=
eccf88f5321e7c60591c5546b254b6afab99)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202412220354.ZyCvciEy-lkp@intel.com/
>
> smatch warnings:
> fs/smb/client/fs_context.c:1466 smb3_fs_context_parse_param() warn: state=
ment has no effect 22
>
> vim +1466 fs/smb/client/fs_context.c
>
> 8f97b4a68ea216b fs/smb/client/fs_context.c Steve French     2024-10-23  1=
452            /* if first character is null, then anonymous auth */
> 8f97b4a68ea216b fs/smb/client/fs_context.c Steve French     2024-10-23  1=
453            if (*(param->string) =3D=3D 0) {
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
454                    /* null user, ie. anonymous authentication */
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
455                    ctx->nullauth =3D 1;
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
456                    break;
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
457            }
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
458
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
459            if (strnlen(param->string, CIFS_MAX_USERNAME_LEN) >
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
460                CIFS_MAX_USERNAME_LEN) {
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
461                    pr_warn("username too long\n");
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
462                    goto cifs_parse_mount_err;
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
463            }
> 8f97b4a68ea216b fs/smb/client/fs_context.c Steve French     2024-10-23  1=
464            ctx->username =3D param->string, GFP_KERNEL;
> 8f97b4a68ea216b fs/smb/client/fs_context.c Steve French     2024-10-23  1=
465            /* streal string from caller, but set to NULL so caller does=
n't free */
>
> Typo: "streal" should be "steal".
>
> 8f97b4a68ea216b fs/smb/client/fs_context.c Steve French     2024-10-23 @1=
466            param->string =3D=3D NULL;
>
>
> It should be =3D instead of =3D=3D.  It's surprising this compiles...
>
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
467            break;
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
468    case Opt_pass:
> a4e430c8c8ba96b fs/cifs/fs_context.c       Enzo Matsumiya   2022-09-20  1=
469            kfree_sensitive(ctx->password);
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
470            ctx->password =3D NULL;
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
471            if (strlen(param->string) =3D=3D 0)
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
472                    break;
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
473
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
474            ctx->password =3D kstrdup(param->string, GFP_KERNEL);
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
475            if (ctx->password =3D=3D NULL) {
> 24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1=
476                    cifs_errorf(fc, "OOM when copying password string\n"=
);
> 24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1=
477                    goto cifs_parse_mount_err;
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>


--=20
Thanks,

Steve

