Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 711B06CA38
	for <lists+samba-technical@lfdr.de>; Thu, 18 Jul 2019 09:47:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Q3YlYHtqc9O7InLAo47Z1XFcRibA/JN30ieqM/7TI/o=; b=odYyWE/J431Xcb8zeXUqq0iS+y
	0+U93gIH1Iz9ZBqN0KRGASJIg6+xQys1fvjVK+i/XKgT1fXYnMjof/Ou/jPeI5uXEQwt2187taM61
	+x8yfCeD+GhedxEGsM62aokxARElypeFB6myP4eeFyhueKF4MxTEGoSnVJ+qHizflK4776IT1QmEc
	jbcnOTCg5gyAxTiylWbVRiXLihjGaDn+ZxEXz7/YptdAblmEQHAJL10ArTK2BIu33bDofL5qB9Xo1
	iTw04+0YIeSt6nkcb+8WT2rYRX8fLyjKVbDD4TbA9N0NXT+WaF1whU0rLMSUIoPrI1stl+PsaOtUr
	4vYQ1Iyw==;
Received: from localhost ([::1]:59318 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ho18n-000lAL-Hc; Thu, 18 Jul 2019 07:47:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50200) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ho18j-000lAE-7P
 for samba-technical@lists.samba.org; Thu, 18 Jul 2019 07:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=Q3YlYHtqc9O7InLAo47Z1XFcRibA/JN30ieqM/7TI/o=; b=EkazQERqxhpKGb0p5XOlwY249m
 T2zT1BmcEFZVc6MrAlIOCxqvomDWfSFquRcwhucM5vu9ePio3s/D8xvaoRmQSLjBOHj6icV7yoNMO
 kfiSIk53XNuJl737W1nwLcwKsXkpZZzZE9c7zy1+qK+dm4PRWVF9Bp2WZM5MIwq8/v+k=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ho18i-00012P-K0; Thu, 18 Jul 2019 07:47:44 +0000
Date: Thu, 18 Jul 2019 10:47:41 +0300
To: Amit Kumar <amitkuma@redhat.com>
Subject: Re: [PATCH] samba-tool: Fix traceback in samba-tool ntacl subcommands
Message-ID: <20190718074741.GA11484@onega.vda.li>
References: <d0fa6fcc-08ea-26cb-621e-fac39428fc63@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0fa6fcc-08ea-26cb-621e-fac39428fc63@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 18 heinä 2019, Amit Kumar via samba-technical wrote:
> # samba-tool ntacl sysvolcheck
> ERROR(runtime): uncaught exception - samdb_domain_sid failed
>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/__init__.py",
> line 177, in _run
>     return self.run(*args, **kwargs)
>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py", line
> 265, in run
>     domain_sid = security.dom_sid(samdb.domain_sid)
>   File "/usr/lib64/python2.7/site-packages/samba/samdb.py", line 583, in
> get_domain_sid
>     return dsdb._samdb_get_domain_sid(self)
> 
> # samba-tool ntacl sysvolreset
> ERROR(runtime): uncaught exception - samdb_domain_sid failed
>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/__init__.py",
> line 177, in _run
>     return self.run(*args, **kwargs)
>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py", line
> 210, in run
>     domain_sid = security.dom_sid(samdb.domain_sid)
>   File "/usr/lib64/python2.7/site-packages/samba/samdb.py", line 583, in
> get_domain_sid
>     return dsdb._samdb_get_domain_sid(self)
> 
> Signed-off-by: Amit Kumar <amitkuma@redhat.com>
> ---
>  python/samba/netcmd/ntacl.py | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/python/samba/netcmd/ntacl.py b/python/samba/netcmd/ntacl.py
> index 4cc7737ae77..dfcc8bd4d8f 100644
> --- a/python/samba/netcmd/ntacl.py
> +++ b/python/samba/netcmd/ntacl.py
> @@ -393,7 +393,11 @@ class cmd_ntacl_sysvolreset(Command):
>          elif use_s3fs:
>              use_ntvfs = False
>  
> -        domain_sid = security.dom_sid(samdb.domain_sid)
> +        try:
> +            domain_sid = security.dom_sid(samdb.domain_sid)
> +        except Exception as e:
> +            print("domain_sid not returned,",e)
> +            return
I think it is better to raise CommandError() exception here instead.
Pretty much like below with 'Unable to open samdb':

>  
>          s3conf = s3param.get_context()
>          s3conf.load(lp.configfile)
> @@ -448,7 +452,11 @@ class cmd_ntacl_sysvolcheck(Command):
>          except Exception as e:
>              raise CommandError("Unable to open samdb:", e)
^^ Here.

Also, please use 'Cannot retrieve domain SID' as a friendly message
instead of 'domain_sid not returned'.

Same applies to the second patch.

>  
> -        domain_sid = security.dom_sid(samdb.domain_sid)
> +        try:
> +            domain_sid = security.dom_sid(samdb.domain_sid)
> +        except Exception as e:
> +            print("domain_sid not returned,",e)
> +            return
>  
>          provision.checksysvolacl(samdb, netlogon, sysvol,
>                                   domain_sid,
> -- 
> 2.17.1
> 
> 
> Opened MR: https://gitlab.com/samba-team/samba/merge_requests/650
> 

> From 646c9d78413d59399636d1ca14cad65341b912c6 Mon Sep 17 00:00:00 2001
> From: Amit Kumar <amitkuma@redhat.com>
> Date: Fri, 19 Jul 2019 00:43:58 +0530
> Subject: [PATCH] samba-tool: Fix traceback in samba-tool ntacl subcommands
> 
> # samba-tool ntacl sysvolcheck
> ERROR(runtime): uncaught exception - samdb_domain_sid failed
>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/__init__.py", line 177, in _run
>     return self.run(*args, **kwargs)
>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py", line 265, in run
>     domain_sid = security.dom_sid(samdb.domain_sid)
>   File "/usr/lib64/python2.7/site-packages/samba/samdb.py", line 583, in get_domain_sid
>     return dsdb._samdb_get_domain_sid(self)
> 
> # samba-tool ntacl sysvolreset
> ERROR(runtime): uncaught exception - samdb_domain_sid failed
>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/__init__.py", line 177, in _run
>     return self.run(*args, **kwargs)
>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py", line 210, in run
>     domain_sid = security.dom_sid(samdb.domain_sid)
>   File "/usr/lib64/python2.7/site-packages/samba/samdb.py", line 583, in get_domain_sid
>     return dsdb._samdb_get_domain_sid(self)
> 
> Signed-off-by: Amit Kumar <amitkuma@redhat.com>
> ---
>  python/samba/netcmd/ntacl.py | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/python/samba/netcmd/ntacl.py b/python/samba/netcmd/ntacl.py
> index 4cc7737ae77..dfcc8bd4d8f 100644
> --- a/python/samba/netcmd/ntacl.py
> +++ b/python/samba/netcmd/ntacl.py
> @@ -393,7 +393,11 @@ class cmd_ntacl_sysvolreset(Command):
>          elif use_s3fs:
>              use_ntvfs = False
>  
> -        domain_sid = security.dom_sid(samdb.domain_sid)
> +        try:
> +            domain_sid = security.dom_sid(samdb.domain_sid)
> +        except Exception as e:
> +            print("domain_sid not returned,",e)
> +            return
>  
>          s3conf = s3param.get_context()
>          s3conf.load(lp.configfile)
> @@ -448,7 +452,11 @@ class cmd_ntacl_sysvolcheck(Command):
>          except Exception as e:
>              raise CommandError("Unable to open samdb:", e)
>  
> -        domain_sid = security.dom_sid(samdb.domain_sid)
> +        try:
> +            domain_sid = security.dom_sid(samdb.domain_sid)
> +        except Exception as e:
> +            print("domain_sid not returned,",e)
> +            return
>  
>          provision.checksysvolacl(samdb, netlogon, sysvol,
>                                   domain_sid,
> -- 
> 2.17.1
> 


-- 
/ Alexander Bokovoy

