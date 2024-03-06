Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 40777873934
	for <lists+samba-technical@lfdr.de>; Wed,  6 Mar 2024 15:32:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ZUsDDiQHbmberqEw7P+uyxdapk5dWId2FXk+DJYvkNo=; b=WnMaer21bsB2JtnjhrFW7vTYLp
	nnLOPPB5X+An5lF3SBdPAMjxVloustLIpeEfMlANzhDQV6+9+ifejlkYusrJNhlzteEg/QMcrZRVi
	emzYg7eo48LjfbIijyjY8RC07rzZzDT1NY3g5W+p2lkWlik9Pc85Ok5Vvt+s7jV4STzEkeBcFEelV
	konVUGvEW8vA/FmBBvwUGsPubsVGar6bGw6Thq/9DfeArYHSXG3PzZFTxSnPkv5ffGJZMSw/AGrOX
	xp+xRgPX2VaAhzUVDeaEetJmVp+CJu620E8O8wf72PW4M8rhTwBZWHlXKZ4yrIJDqptwSMGcgXcBf
	2ih5ejIQ==;
Received: from ip6-localhost ([::1]:19444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rhsJU-00BxJT-Dl; Wed, 06 Mar 2024 14:32:08 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:35440) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rhsJP-00BxJL-Tt
 for samba-technical@lists.samba.org; Wed, 06 Mar 2024 14:32:05 +0000
Message-ID: <8e729f88f285fefaa8a089da09484ed2@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1709735512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZUsDDiQHbmberqEw7P+uyxdapk5dWId2FXk+DJYvkNo=;
 b=PDOM8VVmK+dA94QTLqGKu5HQNdyoDZErJzR4z7BH4pTmZ1yls9Ef78Gy0tQbhx3wki0jMQ
 bKokoSi01Z5mW5+5npMKEMmL0WZ2BXLqUzVtixzhKlIaTG/6daAvCPpmyZCdUzvKv096an
 E5nVjODhM1IV2Nj7xOHezrYDj7JYs7TJ176FaOep9KcdqmCqyJXUJk3jHXQpDE6YBbnmjm
 yTh9WA1WYxM0jOgAoPgeF/BiKlR5XQSoYDSomHj0XXFyFHf+igRb1DJeWtqfFK5gxzhP+p
 LAJnqx6n5v/4ZGyc2ootXMchCbwgsagaNJuIpw9Z6adcZGJ+v18d7ba6RZrojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1709735512;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZUsDDiQHbmberqEw7P+uyxdapk5dWId2FXk+DJYvkNo=;
 b=o5+1wqzA4JcV+8ZVNtYjv0YS4jgozP0rk2FmEEtvkCbIX+6I5KxzyoS6kdfdkq5f+sFPjV
 l88XrkPm3hsmJXYRuC6RjbV39UTceTvFamOOmOoSJ3S8LdaRtpA5kyYZsESRM/NDKp4C8v
 atWWKd7i79vwnbFUBIepSFpBpikNnevsweRs/FkAEIAlxpd/m3j/ZajNeYUlpgWEpmql6g
 aaWREcA+9Di4/3Oaw9/RPplBcIyNa/U6jQXA33vPL/SyWGAOd+gpqler5reNbE+CgwbXaW
 ub8v72Q45Pr2KSEgf9C42sUcj5Blf+AttPO8PhqR2If4eA3ShcHsVXykn1iEjg==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1709735512; a=rsa-sha256; cv=none;
 b=YkDDd74Db54F3nw6gr6hbVWeVbLjw2J9WdH4c/S63RZD/5XHDeCurWAsYCE1ub+oVbj+66
 orSjB9xLepIurz0hXubtrpXUy/75HvO3DuFxmdrxWTVgZVu38uOZd9HJiZmHqzRxwt2fVO
 H59SBZ0pZvUkJkCiNrsmw+2uJq2bDESP69FetvZfwCxQr5XHVYmO/va3sg+pj6V+SDx5ue
 C2oI3Uut6zn1b/IfKU8lC2iUwVU10ENmMR6ZlAYSfw/iy94SBW62KvsK/JvmbdaZ77NAed
 fSyIECGDUY+LholIRUbqnNvJnVOYZnzkOGx9hcaW6NFGm7PUeAPdw/9eydtFQQ==
To: meetakshisetiyaoss@gmail.com, sfrench@samba.org,
 ronniesahlberg@gmail.com, sprasad@microsoft.com, nspmangalore@gmail.com,
 tom@talpey.com, linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org,
 samba-technical@lists.samba.org, bharathsm.hsk@gmail.com
Subject: Re: [PATCH 2/3] smb: client: do not defer close open handles to
 deleted files
In-Reply-To: <20240306034353.190039-2-meetakshisetiyaoss@gmail.com>
References: <20240306034353.190039-1-meetakshisetiyaoss@gmail.com>
 <20240306034353.190039-2-meetakshisetiyaoss@gmail.com>
Date: Wed, 06 Mar 2024 11:31:48 -0300
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@manguebit.com>
Cc: Meetakshi Setiya <msetiya@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

meetakshisetiyaoss@gmail.com writes:

> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index b75282c204da..46951f403d31 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -483,6 +483,7 @@ struct cifsFileInfo *cifs_new_fileinfo(struct cifs_fid *fid, struct file *file,
>  	cfile->uid = current_fsuid();
>  	cfile->dentry = dget(dentry);
>  	cfile->f_flags = file->f_flags;
> +	cfile->status_file_deleted = false;

This is unnecessary as @cfile is kzalloc()'d.

>  	cfile->invalidHandle = false;
>  	cfile->deferred_close_scheduled = false;
>  	cfile->tlink = cifs_get_tlink(tlink);
> @@ -1085,7 +1086,7 @@ int cifs_close(struct inode *inode, struct file *file)
>  		if ((cifs_sb->ctx->closetimeo && cinode->oplock == CIFS_CACHE_RHW_FLG)
>  		    && cinode->lease_granted &&
>  		    !test_bit(CIFS_INO_CLOSE_ON_LOCK, &cinode->flags) &&
> -		    dclose) {
> +		    dclose && !(cfile->status_file_deleted)) {
>  			if (test_and_clear_bit(CIFS_INO_MODIFIED_ATTR, &cinode->flags)) {
>  				inode_set_mtime_to_ts(inode,
>  						      inode_set_ctime_current(inode));
> diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> index 3073eac989ea..3242e3b74386 100644
> --- a/fs/smb/client/inode.c
> +++ b/fs/smb/client/inode.c
> @@ -893,6 +893,9 @@ cifs_get_file_info(struct file *filp)
>  	struct cifsFileInfo *cfile = filp->private_data;
>  	struct cifs_tcon *tcon = tlink_tcon(cfile->tlink);
>  	struct TCP_Server_Info *server = tcon->ses->server;
> +	struct dentry *dentry = filp->f_path.dentry;
> +	void *page = alloc_dentry_path();
> +	const unsigned char *path;
>  
>  	if (!server->ops->query_file_info)
>  		return -ENOSYS;

You're leaking @page if above condition is true.

> @@ -907,7 +910,14 @@ cifs_get_file_info(struct file *filp)
>  			data.symlink = true;
>  			data.reparse.tag = IO_REPARSE_TAG_SYMLINK;
>  		}
> +		path = build_path_from_dentry(dentry, page);
> +		if (IS_ERR(path)) {
> +			free_dentry_path(page);
> +			return PTR_ERR(path);

Now you're leaking @data and @fid if above condition is true.

> +		}
>  		cifs_open_info_to_fattr(&fattr, &data, inode->i_sb);
> +		if (fattr.cf_flags & CIFS_FATTR_DELETE_PENDING)
> +			cifs_mark_open_handles_for_deleted_file(inode, path);
>  		break;
>  	case -EREMOTE:
>  		cifs_create_junction_fattr(&fattr, inode->i_sb);
> @@ -937,6 +947,7 @@ cifs_get_file_info(struct file *filp)
>  	rc = cifs_fattr_to_inode(inode, &fattr);
>  cgfi_exit:
>  	cifs_free_open_info(&data);
> +	free_dentry_path(page);
>  	free_xid(xid);
>  	return rc;
>  }
> @@ -1075,6 +1086,7 @@ static int reparse_info_to_fattr(struct cifs_open_info_data *data,
>  	struct kvec rsp_iov, *iov = NULL;
>  	int rsp_buftype = CIFS_NO_BUFFER;
>  	u32 tag = data->reparse.tag;
> +	struct inode *inode = NULL;
>  	int rc = 0;
>  
>  	if (!tag && server->ops->query_reparse_point) {
> @@ -1114,8 +1126,12 @@ static int reparse_info_to_fattr(struct cifs_open_info_data *data,
>  
>  	if (tcon->posix_extensions)
>  		smb311_posix_info_to_fattr(fattr, data, sb);
> -	else
> +	else {
>  		cifs_open_info_to_fattr(fattr, data, sb);
> +		inode = cifs_iget(sb, fattr);
> +		if (inode && fattr->cf_flags & CIFS_FATTR_DELETE_PENDING)

You shouldn't ignore if cifs_iget() failed.  Return -ENOMEM instead.

Besides, calling cifs_iget() here looks wrong as @fattr is not fully
set, yet.  Why can't you use @inode from cifs_get_fattr() or do above
check right after cifs_get_fattr() in cifs_get_inode_info{,_unix}()?

