Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 778BA9F0C1
	for <lists+samba-technical@lfdr.de>; Tue, 27 Aug 2019 18:51:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=r5iDTktveqn+SnKH4Bsiz4c5TaVGhXsj4B/rhRHTwPw=; b=1NZi9snqNRn4hMZC1k55yc079b
	CI+SnbNmgck0sMZVixnp4o4W+byWt3dPVk29AZZgr3zrLxiHnsX8AfqLdaPIKbECj24gx7DM6pu3l
	XOWkjjIe4YlgYyjyFbO7B7kwzyH9uyhRgaiNIboIFoKcfoWqDohJ1/FBpeEZd1s1LQQBKtCdVt5Zi
	Ty4N5MDvfW6H8EE6VpNXi980bq9CmtbQA7MMz6VHAjRO05+SIqk2naVDHm/uVXO3jpG2Ips1B9k1N
	S0OBTSVsnbh1FS7lG6xchMntkW8+12MlKKYoM8DChQTyTJBkYtHJ4I8j0nkA3UxCZYpvySwFZwtsU
	y7r5lW1g==;
Received: from localhost ([::1]:27260 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2egb-008mXG-Mr; Tue, 27 Aug 2019 16:51:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60356) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2egX-008mX9-My
 for samba-technical@lists.samba.org; Tue, 27 Aug 2019 16:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=r5iDTktveqn+SnKH4Bsiz4c5TaVGhXsj4B/rhRHTwPw=; b=mEPOmmX6aE/PRARY+ChVAbYwbC
 RN75/zoqRadmrcbtgkrfxxHGICOH3an4vNnsqFsppDjZ+97Z+f1UUv5o3B6EgKZlUnusAdcDbw4GI
 p8NEvdT2fJItyIQbAlWbDyBMfm8L2QFRx1uvHkajgWqCIWdHOkdivdvZFwsW5+knBaJQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i2egV-0004By-GP; Tue, 27 Aug 2019 16:51:07 +0000
Date: Tue, 27 Aug 2019 09:51:04 -0700
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: Add option to sort dacl into canonical order in nfs4_acls
Message-ID: <20190827165103.GA14309@samba.org>
References: <CAB5c7xqToOayxaAp9TYexiz-vKFbx-tUnbNqfgNGbE7EYMQ+eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB5c7xqToOayxaAp9TYexiz-vKFbx-tUnbNqfgNGbE7EYMQ+eg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 27, 2019 at 10:49:19AM -0400, Andrew Walker via samba-technical wrote:
> There are many ways that applications can write NFS4 ACL entries in a
> non-canonical order per MS-DTYP 2.4.5. It would be nice to have the option
> to automatically sort these into canonical order so that Windows doesn't
> complain when viewing these.  I'm honestly a bit torn regarding the best
> path forward with this. It's easy to say "you're doing it wrong - fix your
> ACLs", but I imagine that some admins would want a "stop nagging me" option.
> 
> Example of some operations resulting out-of-order ACEs:
> # file: /mnt/dozer/share/inherited
> # owner: root
> # group: smbuser
>       user:smbuser:rwxpDdaARWcCos:-------:allow
>             owner@:rwxpDdaARWcCos:fd----I:allow
>             group@:rwxpDdaARWcCos:fd----I:allow
>          everyone@:--------------:fd----I:allow
> root@freenas[/mnt/dozer]# setfacl -m u:root:full_set:fd:allow
> /mnt/dozer/share/inherited
> root@freenas[/mnt/dozer]# getfacl /mnt/dozer/share/inherited
> 
> # file: /mnt/dozer/share/inherited
> # owner: root
> # group: smbuser
>          user:root:rwxpDdaARWcCos:fd-----:allow
>       user:smbuser:rwxpDdaARWcCos:-------:allow
>             owner@:rwxpDdaARWcCos:fd----I:allow
>             group@:rwxpDdaARWcCos:fd----I:allow
>          everyone@:--------------:fd----I:allow
> root@freenas[/mnt/dozer]# chmod 777 /mnt/dozer/share/inherited
> root@freenas[/mnt/dozer]# getfacl /mnt/dozer/share/inherited
> # file: /mnt/dozer/share/inherited
> # owner: root
> # group: smbuser
>          user:root:rwxpDdaARWcCos:fd-----:allow
>       user:smbuser:rwxpDdaARWcCos:-------:allow
>             owner@:rwxpDdaARWcCos:fdi---I:allow
>             group@:rwxpDdaARWcCos:fdi---I:allow
>          everyone@:--------------:fdi---I:allow
>             owner@:rwxp--aARWcCos:-------:allow
>             group@:rwxp--a-R-c--s:-------:allow
>          everyone@:rwxp--a-R-c--s:-------:allow


I am not quite familiar with the output here, but i assume this is about
having inherited ACL entries after explicit ACL entries. If all entries
are "allow", then reordering them should not be a problem. On the other
hand, if there are "allow" and "deny" entries, then the order is
important and reordering would change the meaning of the ACL.

What is the problem to solve here? That an administrator changes the ACL
through setfacl while not adhering to the order expected by the Windows
clients?  Ideally, there could be a way in setfacl or even in the file
system to only allow the Windows ACL order. As this is likely not
feasible, maybe the "sort_dacl" option could be restricted to only
reorder if there are only "allow" entries, but skip the reordering if
there are "deny" entries. With that, the meaning of the ACL would not
change. In any case, the behavior should also be documented in the man
pages.

Christof

> diff --git a/source3/modules/nfs4_acls.c b/source3/modules/nfs4_acls.c
> index 4d50223..6011a72 100644
> --- a/source3/modules/nfs4_acls.c
> +++ b/source3/modules/nfs4_acls.c
> @@ -107,6 +107,10 @@ int smbacl4_get_vfs_params(struct connection_struct *conn,
>  
>  	params->map_full_control = lp_acl_map_full_control(SNUM(conn));
>  
> +	params->sort_dacl = lp_parm_bool(SNUM(conn),
> +					 SMBACL4_PARAM_TYPE_NAME,
> +					 "sort_dacl", False);
> +
>  	DEBUG(10, ("mode:%s, do_chown:%s, acedup: %s map full control:%s\n",
>  		enum_smbacl4_modes[params->mode].name,
>  		params->do_chown ? "true" : "false",
> @@ -532,6 +536,11 @@ static NTSTATUS smb_get_nt_acl_nfs4_common(const SMB_STRUCT_STAT *sbuf,
>  		return NT_STATUS_NO_MEMORY;
>  	}
>  
> +	if ((*ppdesc)->dacl && params->sort_dacl) {
> +		dacl_sort_into_canonical_order((*ppdesc)->dacl->aces,
> +					       (unsigned int)(*ppdesc)->dacl->num_aces);
> +	}
> +
>  	DEBUG(10, ("smb_get_nt_acl_nfs4_common successfully exited with "
>  		   "sd_size %d\n",
>  		   (int)ndr_size_security_descriptor(*ppdesc, 0)));
> diff --git a/source3/modules/nfs4_acls.h b/source3/modules/nfs4_acls.h
> index c9fcf6d..ad981a3 100644
> --- a/source3/modules/nfs4_acls.h
> +++ b/source3/modules/nfs4_acls.h
> @@ -113,6 +113,7 @@ struct smbacl4_vfs_params {
>  	bool do_chown;
>  	enum smbacl4_acedup_enum acedup;
>  	bool map_full_control;
> +	bool sort_dacl;
>  };
>  
>  int smbacl4_get_vfs_params(struct connection_struct *conn,


