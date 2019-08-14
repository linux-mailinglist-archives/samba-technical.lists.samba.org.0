Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C26B8CF08
	for <lists+samba-technical@lfdr.de>; Wed, 14 Aug 2019 11:07:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=j0oporVxh0OvDxY01FQsy3g2jDLPZc+JKQ5aXwNfOVM=; b=EYYwKBQ3oVTZzfdwI8OSfsZ6Eq
	GEoPa9wG4KfkT48u0DZdqH1ffXQ34ubUiYMV4rmcn+aFkvypcV0rZfEiUjVYBLW09a+PM3wc+lD01
	+9afNu0S6ZHYqCUZLbjjEobD+Z0J/I84q/cWcE0XzorBmduUHyWjORDht09ZRjaaFii+yO3WB6+fF
	8LW9KcwFIxQAGB5UPh19N2/YiFwBc/uiIIRT/e5iTxW1TznSIe/+G0+EBw5UfvJQEVlYEFxEaMkUJ
	B+FNRSoUfxHvuuq8Jr5JvTKclDtq/KB7MhhLW5AGIIxkcyysdS5CuAbQ7bVSYD5ZCGML42XJfGgW6
	KSZSia3Q==;
Received: from localhost ([::1]:48352 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hxpFn-006FqF-GD; Wed, 14 Aug 2019 09:07:35 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:42523) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hxpFf-006Fm3-ES
 for samba-technical@lists.samba.org; Wed, 14 Aug 2019 09:07:30 +0000
Received: by mail-oi1-x22c.google.com with SMTP id o6so2707702oic.9
 for <samba-technical@lists.samba.org>; Wed, 14 Aug 2019 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j0oporVxh0OvDxY01FQsy3g2jDLPZc+JKQ5aXwNfOVM=;
 b=TqaG81wNpwvmOq1zCLVFCS9NXRodbUQ64K9/zfHsrq33rz9T2nYhEDFXdLNoUREdSQ
 PCGnRZhrsjGkz2u7N4fmY9+B6BMRaGCHC+Hh7L0S6ovLowHAeMGBfWM659+uWJj8c57i
 dgi/9y74MmLGj05xoEYYVTVDv/ypa/D87DflpoJoET2wGtLW+r3dqoUQVHpLvnCVeExa
 u7ikTcmvFPBG001xWJiWxs4PpxPMux9mxq0XR+pVEBVIatl1z+szpjTJKMVFobcDDFrA
 VvtozURtqezd/C4G/PWrHx1ug03gZxjcmGVDgcyYZHrKZtGz1D2cxYZHjEDItaVmKkb/
 7Q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j0oporVxh0OvDxY01FQsy3g2jDLPZc+JKQ5aXwNfOVM=;
 b=qHUoMlbMVcC+22aWNDgoPv2PPaek36DY/WovYfWO4LUxWDgb7pdATKCeq9GBXj7ot0
 EJj71t3KxAYMrFpGDUEVeR4w/8vGyU1qwvH9olwpoQH1iHAAHe8LZRrW96WRkORjG45h
 o/+JUT7lrzEKTWEZbaFcPgGUujZgdtzJ5lrF7w2UEosvbY6tKKme5p85TTLDah+dc1y7
 uqbxiyUb49zpLx81o6g8TLlyTUqjqFKXQMPq8cSefDDffMfcEd8JVLwsxtSYHm8tZfOl
 9Ee68wJ0d1YNyIbauvc9rajWZ/EMjGKR5RpAOlkIJqdZT7lWTfO+8cCNC5K7utEOkSem
 gUiQ==
X-Gm-Message-State: APjAAAVN+ePsuvp7Sx4Hi6KJWRhIiEkNKb8/K1i5lvQ5xmsXXWi+bpEy
 2HPgZHwXK4dUDMLAyYe4SaHdkSdDRTtq9UB/FSE=
X-Google-Smtp-Source: APXvYqxjcxUJi4ptWrZA0++ESO9FTjqPPR0o2T+HpQCiJRj+NTxOCiH6bUPaFS2LcOqcgRAONnRUDS34xU0Ed//Dq20=
X-Received: by 2002:aca:c713:: with SMTP id x19mr4738884oif.158.1565773645399; 
 Wed, 14 Aug 2019 02:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190814140205.0cae47a5@martins.ozlabs.org>
In-Reply-To: <20190814140205.0cae47a5@martins.ozlabs.org>
Date: Wed, 14 Aug 2019 19:07:14 +1000
Message-ID: <CAJ+X7mQZ9mYrbHn9uh40+_T5Lv3SQg60pvusVLDiAPNaBNGgGw@mail.gmail.com>
Subject: Re: [PATCH] Minor CTDB test improvement
To: Martin Schwenke <martin@meltin.net>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 14, 2019 at 2:02 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Included in this pipeline:
>
>   https://gitlab.com/samba-team/devel/samba/pipelines/76265339
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

