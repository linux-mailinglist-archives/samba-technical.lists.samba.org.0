Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CCF21383
	for <lists+samba-technical@lfdr.de>; Fri, 17 May 2019 07:44:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=YHQjskY6T9omRjtUbjEOscZ9sYzF3cie9vohK2Z092Q=; b=Bnrl1H9crDXyMPa5fmSQxd3lit
	2mZeGRYGf1blwJUa1JzCJ/j4vScp/Ss7YKTqFeftzYl/swGkg4mIGr/854aK/PmIkbnpTMEPwfGy0
	k0AUnP57KirTOThmhi19Kxh2ODAH4e7uZJno8DDHVtWSPtdNkfcIi889sh1T2e3F0Gx4jn5BMj161
	UfIYgbbnlzumU/iQ1ULx6A0PaURjsxQlV6JZ4Fbwkh/rJ5jJshvkuwcGAuVTY8YHiXFeeK/9B7mGL
	lL37QTCrlu6F8tfz5zStuO0Jjbmly/rcl68diKhU7EK36O8sLn6YzsvCjkO/K2gqBCIngkNfbRXom
	6Tbu4bYA==;
Received: from localhost ([::1]:58288 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hRVfV-000Ch4-8N; Fri, 17 May 2019 05:44:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:18460) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hRVfR-000Cgx-6r
 for samba-technical@lists.samba.org; Fri, 17 May 2019 05:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=YHQjskY6T9omRjtUbjEOscZ9sYzF3cie9vohK2Z092Q=; b=ZdccltL52VLoJlhyqVePc00bua
 IxFmjV/nvJ8ye1stweX1U6SsKFjTEGkeJH3qrfRDfPI7iTFwxnmF2hq3JnP0BVw+MIxb6Ms2OgbCV
 xLwBHBCdVnLSy4gMLv4wl6uzDUzc6Q33zOYE7OtmZpWUgUMRajQnRr5rqFuHP/hRpPBE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hRVfQ-0007VQ-SP; Fri, 17 May 2019 05:44:29 +0000
Date: Fri, 17 May 2019 07:44:26 +0200
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: [PATCH] zfsacl: Fix ACL behavior issues with vfs_zfsacl
Message-ID: <20190517054426.aoyovsk4cwsse2li@inti>
References: <CAB5c7xr4d8oiKoeL3wYCcH860RTP3LY_FYTsBGC--ukGRiTa5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CAB5c7xr4d8oiKoeL3wYCcH860RTP3LY_FYTsBGC--ukGRiTa5A@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, May 11, 2019 at 03:19:48PM -0400, Andrew Walker via samba-technical wrote:
>This patch addresses two problems that we've seen with ZFS / samba users
>for a while.
>1) It's not possible in Windows explorer to disable inheritance. I've
>introduced a new zfsacl parameter "zfsacl:map_dacl_protected" to allow this.
>
>2) If admins remove all special aces (owner@, group@, everyone@), then ZFS
>will automatically append them to the ACL of newly created subdirectories /
>files. In this case, it's just default ZFS inheritance behavior in the
>absence of inheritable special entries. I've introduced a new parameter
>"zfsacl:block_zfs_acl_chmod" to block this behavior. It does so by adding /
>maintaining a hidden empty inheriting everyone@ ACL entry "everyone@
>::fd:allow".
>
>I believe they are both necessary to avoid POLA violations for Windows
>admins, but have made them default to off (so that we don't affect existing
>install base). I'm happy to make any changes you suggest.

thanks for working on this. I thing I've seen one of the issues described myself. :)

A few comments:

- commit message is all in one line

- this is a hot code path and parmetric options are expensive, can you please use a 
  configuration object, the existing parametric option denymissingspecial should 
  be converted to the config object option while at it. Cf other VFS modules on how 
  to do it, eg gpfs or fruit

- please check mixed space/tabs indentation

- please check trailing space

- pleaseuse common struct initializer:

  SMB_ACE4PROP_T hidden_ace;
  if (S_ISDIR(fsp->fsp_name->st.st_ex_mode)) {
          hidden_ace.flags = SMB_ACE4_ID_SPECIAL;
          hidden_ace.who.id = SMB_ACE4_WHO_EVERYONE;
          hidden_ace.aceType = SMB_ACE4_ACCESS_ALLOWED_ACE_TYPE;
          hidden_ace.aceFlags = (SMB_ACE4_FILE_INHERIT_ACE|SMB_ACE4_DIRECTORY_INHERIT_ACE);
          hidden_ace.aceMask = 0;
          DBG_DEBUG("zfsacl: setting empty everyone@ ace on dir  %s \n", fsp->fsp_name->base_name);
  } else {
          hidden_ace.flags = SMB_ACE4_ID_SPECIAL;
          hidden_ace.who.id = SMB_ACE4_WHO_EVERYONE;
          hidden_ace.aceType = SMB_ACE4_ACCESS_ALLOWED_ACE_TYPE;
          hidden_ace.aceFlags = 0;
          hidden_ace.aceMask = 0;
          DBG_DEBUG("zfsacl: setting empty everyone@ ace on file  %s \n", fsp->fsp_name->base_name);
  }

  rewrite as:

  SMB_ACE4PROP_T hidden_ace = (SMB_ACE4PROP_T) {
          hidden_ace.flags = SMB_ACE4_ID_SPECIAL;
          hidden_ace.who.id = SMB_ACE4_WHO_EVERYONE;
          hidden_ace.aceType = SMB_ACE4_ACCESS_ALLOWED_ACE_TYPE;
  };

  if (S_ISDIR(fsp->fsp_name->st.st_ex_mode)) {
          hidden_ace.aceFlags = (SMB_ACE4_FILE_INHERIT_ACE|SMB_ACE4_DIRECTORY_INHERIT_ACE);
  }
  DBG_DEBUG("zfsacl: setting empty everyone@ ace on file  %s \n", fsp->fsp_name->base_name);

- please split the patch in two patches, each just adding one option

- please add the new options to the manpage

- I don't understand the mechanics of setting the SEC_DESC_DACL_PROTECTED flag 
  when no inheritable ACEs are present. If ZFS does support the flag, why not 
  just map the flag from the wire like gpfs? I might be missing something...

- the option name block_zfs_acl_chmod seems a bit misleading. Can we come up 
  with something else that better describes the intended semantics? Eg 
  "ignore_empty_mode".

Thanks!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

