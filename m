Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8085BD1ECB
	for <lists+samba-technical@lfdr.de>; Thu, 10 Oct 2019 05:11:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=4xNfp0vULGEVDhriWyv07F1/COodoW8CtehK5kiu+S0=; b=ieHFfUAREJvEGTdmWPOqLvhihS
	oyKJzyInINE86O2cYnn1eBzHC7BccsWbe4PNsVSVT4d44KlQQzCiZZaGYBJZVVtUgaMLhQ3PjZvVJ
	K0NKYp2RiZDP2D0HC3N4ZR8GNjvPuWBzFFPQcjc8uAy509Hu/ACEqQ2YUn7pDJ3xwRNSId7FUCekI
	/22KfUYLVyoIZU5p/voBOa5rT4ynTTaWe2kTkWHqEl1nF6OQlPE6AIPGrHzjUnz0Z9dAOpxF1okT6
	Ctd05LgYgNw6rZKnsxLci0AuCL5RvDB4WpQJkuo+lGNPkHuf/4kf71RBlvKe53A8f6KD6WSPU+Ccv
	3luLMJEQ==;
Received: from localhost ([::1]:53774 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iIOqR-002XX6-4o; Thu, 10 Oct 2019 03:10:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47638) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIOqL-002XWz-V0
 for samba-technical@lists.samba.org; Thu, 10 Oct 2019 03:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=4xNfp0vULGEVDhriWyv07F1/COodoW8CtehK5kiu+S0=; b=FdYe1sP6GDngbQDak/joB1rISK
 J3nijaQoZbSXepc/xTSZZnce+TXLG9rVLW7p3PErfiL4azCI5W49DnwAzNqgCxpK+mog3z6h9f1h9
 iyuT7qpkKS8Fu6Td9FRUz3GvfdORSXyCZ6PedBNwrz4t+S6g/oIrucGfiRzlSHwAqz3Zi1HL2UZmM
 l7bUBsWzR7nkPoLDh625t1lOkxcXU+m8waWXq3EGt4iIgZiGbCY5o2fv9ntD3VIaCZj76TXB4htei
 yW+QkVW7umPEFL/OhP3N2+gyvCxmHQUNUZO0mo8xig3VFi+MFBUNCH89004n+OyWq94cNxm0Izeym
 Ma4y8XyknaTvcHHzexQXSdlsCbqV3hVnhYKFsN/tMYDHZ2sdtC+jl2L3LK9yd5mZv0+ZqKD+K9zJW
 mRf93f+6F2Z21AfCEmgKxNFXxreHVusUUorjJAE7SCSgbwQ+ZvzPg0GXUSks1k1q/uArLgTqmY5dQ
 aT23D3DLfzM62t4kUr2/6hoV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIOqJ-0005U1-EN; Thu, 10 Oct 2019 03:10:20 +0000
Message-ID: <93305fb71149337426a697deb92f1a7fb732957c.camel@samba.org>
Subject: docker image creation on private (rackspace) runners
To: samba-technical@lists.samba.org, asn@samba.org
Date: Thu, 10 Oct 2019 16:10:14 +1300
In-Reply-To: <20191008082803.90E00140315@sn.samba.org>
References: <20191008082803.90E00140315@sn.samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-10-08 at 10:28 +0200, Andreas Schneider wrote:
> The branch, master has been updated
>        via  c9d302f20b0 gitlab-ci: Add CentOS 8 to CI
>        via  9cd0d153701 bootstrap: We can only build docker images on
> gitlab shared runners
>        via  42edab7bd76 bootstrap: Remove pyhton2 packages
>       from  7bceafe8401 s3/passdb: clang: Fix 'Value stored during
> initialization is never read'
> 
> https://git.samba.org/?p=samba.git;a=shortlog;h=master
> 
> 
> - Log -------------------------------------------------------------
> ----
> commit c9d302f20b066267a8fd2d7ce4dc171161c9c40c
> Author: Andreas Schneider <asn@samba.org>
> Date:   Mon Oct 7 11:28:24 2019 +0200
> 
>     gitlab-ci: Add CentOS 8 to CI
>     
>     Signed-off-by: Andreas Schneider <asn@samba.org>
>     Reviewed-by: Alexander Bokovoy <ab@samba.org>
>     
>     Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
>     Autobuild-Date(master): Tue Oct  8 08:27:50 UTC 2019 on sn-devel-
> 184
> 
> commit 9cd0d15370142b3694a51fa9b6cfffdb8e08e886
> Author: Andreas Schneider <asn@samba.org>
> Date:   Mon Oct 7 13:28:07 2019 +0200
> 
>     bootstrap: We can only build docker images on gitlab shared
> runners
>     
>     Our rackspace runners don't provide a running docker.
>     
>     Signed-off-by: Andreas Schneider <asn@samba.org>
>     Reviewed-by: Alexander Bokovoy <ab@samba.org>

I don't think this patch is right, you probably just got lucky and got
a shared runner when re-submitting this.

Instead we need the patch Garming did in:

https://gitlab.com/samba-team/samba/merge_requests/803

> diff --git a/bootstrap/.gitlab-ci.yml b/bootstrap/.gitlab-ci.yml
> index 8254986d2dc..e474b4b500f 100644
> --- a/bootstrap/.gitlab-ci.yml
> +++ b/bootstrap/.gitlab-ci.yml
> @@ -6,6 +6,7 @@ services:
>    stage: images
>    tags:
>      - docker
> +    - shared
>    variables:
>      SAMBA_CI_IS_BROKEN_IMAGE: "no"
>    before_script:

Or we need to remove 'shared' from the rackspace runners.  

Currently we declare those as shared to take some of the load, but we
could stop doing that.

If we wanted to still, sometimes, share the load we could instead have
the rackspace runners only declare 'docker' to gitlab.com.

Yeah, the interactions here are a bit too subtle.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




