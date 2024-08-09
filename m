Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D2894D847
	for <lists+samba-technical@lfdr.de>; Fri,  9 Aug 2024 23:01:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=xWAB1g/0SzLTPFRCFXtydMCFwYseeTo/2qmUztiF7dM=; b=Y83+gz5EAMPjuFMMZ5xq3h52LI
	qLBihg7vB5YsqOrNQUH5pdBULUtWDplfvjrkoR8JQMNqYYT+OFSZ61qzUkhq4HKjdo9NM4+jD+c//
	6OfYBqVA7e8n1glXfc0aSmGff/bSgQCyM0QwM3DLTn25HymiGRggU7zG7Q+9PppBF48jHOszKWi2d
	/f+zch2RXghAR8s6IPxxP0cbxFOIM8E1E0m/VbhB5hSmdcgJs4bPEseFeel6ZcMWzIHFQJiCDa1GG
	GisIxVFZVu8s5UT1w55a8isnKhfcBBcGMeLnzLuEv1MtHbi4OsVO81Y9fNOaF5R5+M6WqWiggATbu
	Z0qMqDjw==;
Received: from ip6-localhost ([::1]:57054 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1scWjL-004Hxv-4L; Fri, 09 Aug 2024 21:00:59 +0000
Received: from postal3.et.byu.edu ([128.187.48.33]:44044) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1scWjG-004Hxo-CW
 for samba-technical@lists.samba.org; Fri, 09 Aug 2024 21:00:57 +0000
Received: from localhost (localhost [127.0.0.1])
 by postal3.et.byu.edu (Postfix) with ESMTP id 19FDF6E0D8
 for <samba-technical@lists.samba.org>; Fri,  9 Aug 2024 15:00:49 -0600 (MDT)
Received: from postal3.et.byu.edu ([127.0.0.1])
 by localhost (postal3.et.byu.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBmDyrkrJlID for <samba-technical@lists.samba.org>;
 Fri,  9 Aug 2024 15:00:48 -0600 (MDT)
Received: from [10.35.115.20] (edo.et.byu.edu [10.35.115.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by postal3.et.byu.edu (Postfix) with ESMTPSA id 9EED06E0D0
 for <samba-technical@lists.samba.org>; Fri,  9 Aug 2024 15:00:48 -0600 (MDT)
Message-ID: <47bef7c7-50c7-4185-8268-89c0f5664703@et.byu.edu>
Date: Fri, 9 Aug 2024 15:00:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: become_root() Necessary for Group Quota in quotas.c?
To: samba-technical@lists.samba.org
References: <65ad7c9a-38a3-4224-b40e-b7c991c8e0b2@et.byu.edu>
Content-Language: en-US
In-Reply-To: <65ad7c9a-38a3-4224-b40e-b7c991c8e0b2@et.byu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Orion via samba-technical <samba-technical@lists.samba.org>
Reply-To: Orion <orion@et.byu.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Here is my proposed patch of the file source3/smbd/quotas.c to fix the 
issue I outlined previously:

@@ -458,10 +458,8 @@ try_group_quota:
             S_ISDIR(fname->st.st_ex_mode) &&
             fname->st.st_ex_mode & S_ISGID) {
                 id.gid = fname->st.st_ex_gid;
-               become_root();
                 r = SMB_VFS_GET_QUOTA(conn, fname, SMB_GROUP_QUOTA_TYPE, id,
                                       &D);
-               unbecome_root();
         } else {
                 id.gid = getegid();
                 r = SMB_VFS_GET_QUOTA(conn, fname, SMB_GROUP_QUOTA_TYPE, id,

Any comments would be appreciated.

On 8/1/24 17:06, Orion wrote:
> We have a situation in which the root user does not have access to the 
> files contained in a directory with SGID set. When a user navigates to 
> this directory and Samba attempts to request the quota for the 
> directory, it fails when the code later attempts to do a stat on the 
> file because of lack of permissions.
>
> In the file samba/source3/smbd/quotas.c if the SGID bit is set, the 
> code changes the effective GID to the GID of the folder, uses 
> become_root() to change to root, and then requests the quota. However, 
> if the SGID bit is not set, quotas.c requests the quota without using 
> the become_root() function. The question I have is, why when the SGID 
> bit is set does it change to root before requesting the quota?
>
> Can we remove the become_root() function call for this instance and 
> request the quota as the GID of the folder?
>
> I tested removing the become_root() and unbecome_root() function 
> calls, and for our particular setup, it works perfectly. However, I am 
> curious if there is some other setup that may have issues if this bit 
> is removed.
>
