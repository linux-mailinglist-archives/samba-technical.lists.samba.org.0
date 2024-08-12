Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5423494FA5F
	for <lists+samba-technical@lfdr.de>; Tue, 13 Aug 2024 01:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=PXYumxXXFHHsJeJyz0JpG8yGc+9TGqNsfVG8wCRIpOY=; b=fiiO07JtcKkgew7kyGw80V31Bt
	XDmkdBtd5NgAWewx64NGRxYVP1tQ+nu1ieyQbVuebhsyyyiYm7VirYr9JvRTD4QH60/ynZuyXrj8m
	/PXUSgzK1uc7LaXgmuOd+J66iYCGSW3o8y/4O0NQdqtjWjTme4WEt1jrIzfIcYGhKfYlyzYfbZc30
	cb6+0SpVByPhz1QOry6MPNI9bHwSliQfjxAbtCSrLhvNJJGi717BsliCr2O707MqsLltYgNYzhTVN
	oSIjwMIZrACF5D++2k/kov8qEh96MyAQk+/s6/sfdZ0Rx+JaFyWzKJ2+a5UNTX9byON3zk7v1/Xud
	6Ravl+ng==;
Received: from ip6-localhost ([::1]:41104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sdefD-004UJT-2e; Mon, 12 Aug 2024 23:41:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64660) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sdef7-004UJG-IB
 for samba-technical@lists.samba.org; Mon, 12 Aug 2024 23:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=PXYumxXXFHHsJeJyz0JpG8yGc+9TGqNsfVG8wCRIpOY=; b=eFuFUcdiaT2gLt8JwcAiJc6gx5
 qGDYsOo4ukg3Cel5/eEYogbXsOzYLWc4VLejJNUZdmR6mQsRLc91/hs/zaeJ31YISMMvmjVNg6KDZ
 0bzDU01rHc8dAKywmVZHKAF1WIl0K3AgXGdP3gzGurDRC0dwiyHgTN8yYUi2okaSC4plKvzFg5qr+
 P+wUrNlRrjtXy4RxlOhZpg4kxnCCxMBm2+J3G5FGObi6/X4deSAQR8azgDyoLZ4UPAveviVkTgi8f
 VlFvR2hcBYO96kIy1yEW0E1qDzxnd1T8rfyzjWoQ/LhvvWDdbzYIncNi/8W4QkoGJtxKvrKuQKdpn
 rmD9ZC0KW8M5hcLpZMPvp8Qfgy/g/Eo2+f3UsgnPYgANNAOEhqXRpcuwenEJ+KzKDicnKa89k1DJQ
 n4Nj6ymm+A6rVu07PIxmo14VJq85kTpDZY1mZkRTEdWp331t53Bzh1sXfYn67spQLLSTr1M/k6w7M
 pEsk5GMa3r6p2z4m3/t7+aPD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sdef6-0068Br-0p; Mon, 12 Aug 2024 23:41:16 +0000
Date: Mon, 12 Aug 2024 16:41:13 -0700
To: Orion <orion@et.byu.edu>
Subject: Re: become_root() Necessary for Group Quota in quotas.c?
Message-ID: <ZrqdmVERI9qENUBE@samba.org>
References: <65ad7c9a-38a3-4224-b40e-b7c991c8e0b2@et.byu.edu>
 <47bef7c7-50c7-4185-8268-89c0f5664703@et.byu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47bef7c7-50c7-4185-8268-89c0f5664703@et.byu.edu>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Aug 09, 2024 at 03:00:48PM -0600, Orion via samba-technical wrote:
> Here is my proposed patch of the file source3/smbd/quotas.c to fix the issue
> I outlined previously:
> 
> @@ -458,10 +458,8 @@ try_group_quota:
>             S_ISDIR(fname->st.st_ex_mode) &&
>             fname->st.st_ex_mode & S_ISGID) {
>                 id.gid = fname->st.st_ex_gid;
> -               become_root();
>                 r = SMB_VFS_GET_QUOTA(conn, fname, SMB_GROUP_QUOTA_TYPE, id,
>                                       &D);
> -               unbecome_root();
>         } else {
>                 id.gid = getegid();
>                 r = SMB_VFS_GET_QUOTA(conn, fname, SMB_GROUP_QUOTA_TYPE, id,
> 
> Any comments would be appreciated.
> 
> On 8/1/24 17:06, Orion wrote:
> > We have a situation in which the root user does not have access to the
> > files contained in a directory with SGID set. When a user navigates to
> > this directory and Samba attempts to request the quota for the
> > directory, it fails when the code later attempts to do a stat on the
> > file because of lack of permissions.

This sounds confusing. Why would the root not have access to the
directory?

> > In the file samba/source3/smbd/quotas.c if the SGID bit is set, the code
> > changes the effective GID to the GID of the folder, uses become_root()
> > to change to root, and then requests the quota. However, if the SGID bit
> > is not set, quotas.c requests the quota without using the become_root()
> > function. The question I have is, why when the SGID bit is set does it
> > change to root before requesting the quota?
> > 
> > Can we remove the become_root() function call for this instance and
> > request the quota as the GID of the folder?
> > 
> > I tested removing the become_root() and unbecome_root() function calls,
> > and for our particular setup, it works perfectly. However, I am curious
> > if there is some other setup that may have issues if this bit is
> > removed.

Orion,

while i worked on this a while ago, i do not recall the details of this
change. Looking at the overall picture this could result in a scenario
of one user querying quota for a completely different group, not the
user's primary or secondary group.  Is it guaranteed that any user can
always query any group quota? If so, your change is valid. If not, we
could look into first issuing the GET_QUOTA call without root
privileges, and repeat it when permission is denied (EPERM?) as root.

Regards,

Christof

