Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1C16C7FD7
	for <lists+samba-technical@lfdr.de>; Fri, 24 Mar 2023 15:28:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=SqEfZuy8tLnX5FHEqJsNSOAeHA2l7SrTfTqfaKKqoNg=; b=jZBH5iY6NHFDg4PbPNOo8Dy7n2
	fz5nOv2JiZyYZ3QxhvWQk0EvotOCq7rNHjujR9AbDsMQ0iXuZmz+l63GCo/183/YsukybqF956AfL
	+zBf/xWGvZWmEQwLnGFU/O/JgejvK0dG+0Nq/eTbnhk19YaePyKA5i1NLi4tRTz+FC5f7HC3ZV101
	bFEwkqBVDRVvpnunjWDhMC1qH+HJtS6n25Hzj5ybSEyfNeqzYbJRWyqCcAUJ+IMQUuPnLyISBewfR
	icenNaoBfGsKJYGq/XdFjT/LVGAbIYL7MpKe/meMgojDGQ1KAQF/woVq0L5kTWfdXd0BcsglC8laI
	EfBL9C5w==;
Received: from ip6-localhost ([::1]:20522 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pfiO1-004Lri-Fv; Fri, 24 Mar 2023 14:27:21 +0000
Received: from [104.200.28.160] (port=45120 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1pfiNw-004LrZ-JL
 for samba-technical@lists.samba.org; Fri, 24 Mar 2023 14:27:18 +0000
Received: from edfu.localnet (c-73-114-43-44.hsd1.ma.comcast.net
 [73.114.43.44])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id 28623C5D;
 Fri, 24 Mar 2023 14:10:37 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Possible regression in samba-tool provision
Date: Fri, 24 Mar 2023 10:10:36 -0400
Message-ID: <5862845.irdbgypaU6@edfu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: John Mulligan via samba-technical <samba-technical@lists.samba.org>
Reply-To: John Mulligan <phlogistonjohn@asynchrono.us>
Cc: Anoop C S <anoopcs@cryptolab.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi samba team,

One of our projects consumes container images based on nightly rpm builds of 
samba master. Over the last day or two one of our test jobs has been failing 
and I think it is due to recent changes.  This might only affect mit krb5 based 
builds.

When provisioning a domain we see a traceback like so:

INFO 2023-03-23 21:22:50,399 pid:6 /usr/lib64/python3.10/site-packages/samba/
provision/__init__.py #2021: Fixing provision GUIDs
ERROR(<class 'AttributeError'>): uncaught exception - 'DomainUpdate' object 
has no attribute 'upper'
  File "/usr/lib64/python3.10/site-packages/samba/netcmd/__init__.py", line 
230, in _run
    return self.run(*args, **kwargs)
  File "/usr/lib64/python3.10/site-packages/samba/netcmd/domain.py", line 555, 
in run
    result = provision(self.logger,
  File "/usr/lib64/python3.10/site-packages/samba/provision/__init__.py", line 
2408, in provision
    create_kdc_conf(paths.kdcconf, realm, domain, os.path.dirname(lp.get("log 
file")))
  File "/usr/lib64/python3.10/site-packages/samba/provision/kerberos.py", line 
43, in create_kdc_conf
    domain = domain.upper()
Temporarily overriding 'dsdb:schema update allowed' setting

This is followed by some other logging output but the overall command fails.

I tracked this down to change 4bba26579d124af6c0767bb98bee67357001e1e7 which 
adds some code to `python/samba/provision/__init__.py`. Part of the diff:

> +                try:
> +                    from samba.domain_update import DomainUpdate
> +
> +                    domain = DomainUpdate(samdb, fix=True)
> +                    domain.check_updates_functional_level(adprep_level,
> +                                                         
> DS_DOMAIN_FUNCTION_2008, +                                                 
>         update_revision=True) +
> +                    samdb.transaction_commit()
> +                except Exception as e:
> +                    samdb.transaction_cancel()
> +                    raise e

This block uses the variable domain that gets assigned a DomainUpdate object, 
but the lines below:

>          if not is_heimdal_built():
>              create_kdc_conf(paths.kdcconf, realm, domain,
>              os.path.dirname(lp.get("log file"))) logger.info("The Kerberos            
KDC configuration for Samba AD is "

pass domain to create_kdc_conf which expect the value in domain to be a 
string.  Skimming the code I think this block is the last to use domain 
variable, and the only one to use it after it gets reassigned to a 
DomainUpdate object, so it's probably only the mit krb5 build that will hit 
this error.
A fix might be to just rename `domain` variable in the new block or even remove 
it and chain the 
`DomainUpdate(...).domain.check_updates_functional_level(...)` together.

In the mean time, we think we may be able to work around this issue by using 
the `--adprep-level` option, but we are still investigating.

If you have any other questions, comments, or would prefer I report this to 
bugzilla please just ask.  Thanks!

--John M.


PS: As a python coder, the samdb transaction handling could be written in a 
neater way using a context manager. ;-) ;-)



