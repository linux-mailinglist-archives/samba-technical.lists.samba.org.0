Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0976277EEDD
	for <lists+samba-technical@lfdr.de>; Thu, 17 Aug 2023 03:54:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=t3V9xEAkl61emzClaHVcVphj43l/X7lvvUncqXXONOI=; b=gwMCpXzG1OmnhUyNKA5FomI0oS
	t40EK8UAFV9D9jknduNs3HF4ghbMQ5Jj5YLlZJbUNrz7Mti11X+pfYxozI/E0s9t46nr6GOgnLI+z
	pRBUHpITR759oV+9uGpxrs23AEOXzQMGXwlGG6Asda3K21R2sXR6hOGxLW82ertqG0K9NkZhPlRpf
	NyxvpTKILU0rLornyWbOUMbifHQXicdVEM/JyxQ12pf9aU3ReteGmUVuEK1DWFR8J/IodOCy3rnV6
	ggIs8tIYaKUhAdPbl9cGeoW3wiu8IfzrqVyrlxUVG5mlMhgd8CdfBj28yswgxrp7wJcKWi2sjJNRk
	gfjeGs/Q==;
Received: from ip6-localhost ([::1]:49506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qWSCv-00CdPd-7Q; Thu, 17 Aug 2023 01:53:53 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:54719) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qWSCo-00CdPT-QH
 for samba-technical@lists.samba.org; Thu, 17 Aug 2023 01:53:51 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-649921ec030so3291796d6.1
 for <samba-technical@lists.samba.org>; Wed, 16 Aug 2023 18:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692237224; x=1692842024;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t3V9xEAkl61emzClaHVcVphj43l/X7lvvUncqXXONOI=;
 b=SEePGrvP8luAXjnfZh95X1s919VSJukMycMiVNptcS/jPcRLoKaOMntnhRu34/xSJp
 6lHt312LPwGoz/hPUmv83NzKwYtLsQ/4zXeSkDRqABF7ja/XunisPJDvGcekImcP7/Mv
 UB6uZBwvaViLXFcamXDjaQWhdQx5IUBmkC1znAZ2S4NfXl+2OvwuIOFh2lyS7EMzpgIN
 IolAGwwP7aokcvBMJ5AyzSUWXHCTRm4CHY4j+BFbrv+9YlpLcFg7HdN5H1xH+YnbCIaF
 id61/bH+RhWkW3zwjdN9+WM0e0zNj/DUVp3izU89gB4ksj98HOyLSgmxOj2cEm7uYWik
 W8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692237224; x=1692842024;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t3V9xEAkl61emzClaHVcVphj43l/X7lvvUncqXXONOI=;
 b=VS04Q8+4BRKZxSXn6+TIKnkPwuKd7BBb5cWY4QGoYs4yO9g1yOgadr5iBr7Mmmjnx/
 CzWDsEJ0X87u4dKEbcKSNtaABASIhtIWWH8a8gZ1AJ3/SMDSWOHjAqZhBY8WRWzFTsZA
 /wO8lvElRZMd+iTJF+SHXdvZoZ8Bha25fY7PcSwS+KfPeYG22UlNGhO3vwG2QmVet8Tj
 0LDc/cKOu8E8Fh6DTpb0Toa4O+nsGTMXOz+awhNYf2ANJQeWTI2VL3C8fxakZsLqO/xk
 t+xZFnIyWIyZxYOWOhGU+bgPGwmiAR5rn0ZcP58HE/DoyMpsDwylrlIW0FBGaoNdQnsY
 YpPg==
X-Gm-Message-State: AOJu0YxZiBdw1R0eoS7mDNgmDwiPf4r1O38PVXfGRN0z8yuOJq0dg1qg
 ZUO2WW5VVq6xV4o0jJzfdIUrCIsDnVEmWbjnzaFalsqgKew=
X-Google-Smtp-Source: AGHT+IH43KQG82/7bIIJj08UdasoSX5q+dxCnLgeenR2sQR69jzsyjq1/+y4EY7uz8aMKvzljd5ERddXukqVPB0HFx8=
X-Received: by 2002:a0c:e391:0:b0:63c:ea63:4717 with SMTP id
 a17-20020a0ce391000000b0063cea634717mr3607691qvl.43.1692237224545; Wed, 16
 Aug 2023 18:53:44 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 16 Aug 2023 18:50:33 -0700
Message-ID: <CACyXjPzjJTfpx7ad2BQS0CiN0SRazz_7tdSwDnX7+qZR9VFfYg@mail.gmail.com>
Subject: Building Samba master from a few days ago on CentOS 8.5 runs into a
 weird Python problem
To: samba-technical <samba-technical@lists.samba.org>
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

I am trying to configure Samba master from a few days ago on a CentOS
8.5 system.

I ran the bootstrap script and it only complained about lmdb-devel ...

Then when I ran configure --enable-debug, I got this error:

--------------------------------------
# ./configure --enable-debug
Setting top to                           : /root/src/samba-ad-error-injecti=
on
Setting out to                           :
/root/src/samba-ad-error-injection/bin
Checking for 'gcc' (C compiler)          : Traceback (most recent call last=
):
  File "/root/src/samba-ad-error-injection/third_party/waf/waflib/Utils.py"=
,
line 833, in wrap
    return cache[k]
KeyError: (<samba_waf18.ConfigurationContext object at 0x7fb83837d8e0>,)

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/root/src/samba-ad-error-injection/third_party/waf/waflib/Utils.py"=
,
line 833, in wrap
    return cache[k]
KeyError: (<samba_waf18.ConfigurationContext object at 0x7fb83837d8e0>,)
---------------------------------------

In looking at the Python code it seems like there is an issue with the
except KeyError clause in the code.

Has anyone seen this issue before?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

