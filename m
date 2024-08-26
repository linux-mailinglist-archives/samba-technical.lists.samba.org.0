Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6343495FBDE
	for <lists+samba-technical@lfdr.de>; Mon, 26 Aug 2024 23:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=M8UX7DZIO7YQ5kYa4vKn6N+ajEGTTOIuFMehslawkfs=; b=OTjA1+VRlHJQx+uKan2J/Id6q6
	vlCVwuFVx/rUO9X0jK+6H0ljcQfFf6kIKGMxpZIv5l/yDlTKPvFlekIFg3y9LDMlZrSeeLRohL2sx
	8KPXaj6Ik3w/1gdNSVYFEHFvYzWdIFL7vJvcny3Bgb/XgtMzzIXaUwbW2orSi+o7LBxHbGIoXPPnh
	dHqYPQR7/SZfrqw4ZTMI/JNzGwtp9FHlEoWB3Go89HLJn07mchttEdYNogmAPK1fhOEj29+bohljh
	2nBKDzGGj30zXPdjoqXNEumTbl1cTo3pMmPPCW7VRoypnaoLNFZBbdxnItcFf48j6IJ48L3/aVuR4
	GYDWjFiA==;
Received: from ip6-localhost ([::1]:26810 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sihRt-005YFi-Oe; Mon, 26 Aug 2024 21:40:29 +0000
Received: from postal3.et.byu.edu ([128.187.48.33]:54130) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sihRp-005YFb-7E
 for samba-technical@lists.samba.org; Mon, 26 Aug 2024 21:40:27 +0000
Received: from localhost (localhost [127.0.0.1])
 by postal3.et.byu.edu (Postfix) with ESMTP id 6051E6E0C5;
 Mon, 26 Aug 2024 15:40:19 -0600 (MDT)
Received: from postal3.et.byu.edu ([127.0.0.1])
 by localhost (postal3.et.byu.edu [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQwKTxDbsXeQ; Mon, 26 Aug 2024 15:40:18 -0600 (MDT)
Received: from [10.35.115.20] (edo.et.byu.edu [10.35.115.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by postal3.et.byu.edu (Postfix) with ESMTPSA id 892606E098;
 Mon, 26 Aug 2024 15:40:18 -0600 (MDT)
Message-ID: <71f45191-4cc4-4d8c-ac8f-520c10739169@et.byu.edu>
Date: Mon, 26 Aug 2024 15:40:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: become_root() Necessary for Group Quota in quotas.c?
To: Christof Schmitt <cs@samba.org>
References: <65ad7c9a-38a3-4224-b40e-b7c991c8e0b2@et.byu.edu>
 <47bef7c7-50c7-4185-8268-89c0f5664703@et.byu.edu>
 <ZrqdmVERI9qENUBE@samba.org>
Content-Language: en-US
In-Reply-To: <ZrqdmVERI9qENUBE@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Orion via samba-technical <samba-technical@lists.samba.org>
Reply-To: Orion <orion@et.byu.edu>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 8/12/24 17:41, Christof Schmitt via samba-technical wrote:
> On Fri, Aug 09, 2024 at 03:00:48PM -0600, Orion via samba-technical wrote:
>> Here is my proposed patch of the file source3/smbd/quotas.c to fix the issue
>> I outlined previously:
>>
>> @@ -458,10 +458,8 @@ try_group_quota:
>>              S_ISDIR(fname->st.st_ex_mode) &&
>>              fname->st.st_ex_mode & S_ISGID) {
>>                  id.gid = fname->st.st_ex_gid;
>> -               become_root();
>>                  r = SMB_VFS_GET_QUOTA(conn, fname, SMB_GROUP_QUOTA_TYPE, id,
>>                                        &D);
>> -               unbecome_root();
>>          } else {
>>                  id.gid = getegid();
>>                  r = SMB_VFS_GET_QUOTA(conn, fname, SMB_GROUP_QUOTA_TYPE, id,
>>
>> Any comments would be appreciated.
>>
>> On 8/1/24 17:06, Orion wrote:
>>> We have a situation in which the root user does not have access to the
>>> files contained in a directory with SGID set. When a user navigates to
>>> this directory and Samba attempts to request the quota for the
>>> directory, it fails when the code later attempts to do a stat on the
>>> file because of lack of permissions.
> This sounds confusing. Why would the root not have access to the
> directory?
The server is making the request over NFS and root squashing is enabled 
on the machine which causes the permission issue.
>>> In the file samba/source3/smbd/quotas.c if the SGID bit is set, the code
>>> changes the effective GID to the GID of the folder, uses become_root()
>>> to change to root, and then requests the quota. However, if the SGID bit
>>> is not set, quotas.c requests the quota without using the become_root()
>>> function. The question I have is, why when the SGID bit is set does it
>>> change to root before requesting the quota?
>>>
>>> Can we remove the become_root() function call for this instance and
>>> request the quota as the GID of the folder?
>>>
>>> I tested removing the become_root() and unbecome_root() function calls,
>>> and for our particular setup, it works perfectly. However, I am curious
>>> if there is some other setup that may have issues if this bit is
>>> removed.
> Orion,
>
> while i worked on this a while ago, i do not recall the details of this
> change. Looking at the overall picture this could result in a scenario
> of one user querying quota for a completely different group, not the
> user's primary or secondary group.  Is it guaranteed that any user can
> always query any group quota? If so, your change is valid. If not, we
> could look into first issuing the GET_QUOTA call without root
> privileges, and repeat it when permission is denied (EPERM?) as root.
>
> Regards,
>
> Christof
>
Thanks for the response!

I do not believe that it is necessary for the quota to be requested as 
root because this will allow any user to get the quota of any group 
whether or not they have permission to do so. For example, Linux 
quota-tools does not allow users to request quota for groups that they 
do not have access to. Instead it returns a permission denied error. 
FreeBSD (and presumably the other BSDs) also follow this pattern:

"Non-super-users can use the -g flag and optional group argument to view 
only the limits of groups of which they are members." - 
man.freebsd.org/cgi/man.cgi?query=quota

Since the systems should not make a call for a quota outside of which 
they have permissions, I believe we can move forward with just removing 
the become_root() and unbecome_root() parts.


