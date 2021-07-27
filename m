Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F7F3D6E6D
	for <lists+samba-technical@lfdr.de>; Tue, 27 Jul 2021 07:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=shUXGuyjtjvSD7NxlNidqdGfnJn8D4KtCMriQSyI5U0=; b=z8Y4eZGbEa1tKPidrJ0IPZeR1j
	HGqKG1y0TVCFl74wbOmvsnShGGgWU6yObzYGx82uZWKFgyudgUfHBxNyo13M811+QLiM9IdndK5BQ
	g6EPkMtqob+S+Ycm9IRoprmXC+tRD7L00Ftdt4FkCS8SeOBvHXWyWAGNWnH5Y3EVdX3wpEM501rHb
	1DXH4pnn4mQbWY7RXC0XOXtxav9IMJD+O5WZC8kgstrYBAkc7+OpGL5xBW+CQyRmGIlN2becsJgJL
	tTeZHzhedtbDU/Vl/zbtpxPb9srGrTXhP/lg5CEprS6TrMTj3ll1Abu6NMZJapT+EwaGenQAgtg4V
	4PM5OEWw==;
Received: from ip6-localhost ([::1]:61816 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m8G4r-000zSe-7k; Tue, 27 Jul 2021 05:56:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48040) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8G4m-000zSV-4Z
 for samba-technical@lists.samba.org; Tue, 27 Jul 2021 05:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=shUXGuyjtjvSD7NxlNidqdGfnJn8D4KtCMriQSyI5U0=; b=iDsexxaiGmt9ZD7ZUpuXtgjMvz
 cuzrJqETYxylg3ZYQ+vtYG/z17IfCFRZyXE4M5vpRZAK68qWm1UzBk0+KdSNSlrFkpau3ZYJ2Zib2
 tfLdACyKhsAnyGesLrcdxnHls7q2ixFuz29ERu1BfOY2D2KhKCLXobNdirGWl11ImA5d6xRh7duTq
 pj/wvasBXGXpSEs+NLS663Xecf8ARIEWhAlp9MrEtpYSOSAJ/8NPBFyQZfR3dRR65tXrnMXL0LqSf
 IXhLS7mt/LcmvxWGk2MNzwgu18zRBoOz/QL+bWWh1fTQCfPLCRT5hMYpMuFRsxI43JoecpXMAnBQm
 AiqSbg9pOtSXUGMq+NeRGnbxD1sxMIUgrU6g9GmbfSlHf5VK8O9GbPduHxfrPWjDl/Mm7YgOTzHn0
 YxQKQKF4jeEskL52pbtjSjLjJWBlcx7MgXMhzdJD3xdWKtU/j75FqsxhifriTs1PFC/LwX6CWRGRB
 xmLDy7zPX5GmPgYm8SBGN1/n;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8G4k-0004GO-Oc; Tue, 27 Jul 2021 05:56:22 +0000
Subject: Re: Is "acl_xattr:ignore system acl = yes" recommended?
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <5d214a265708c2062855bcf31550416c5183089d.camel@samba.org>
Message-ID: <201468d0-47c0-1a5a-efdf-7206e70f7e8b@samba.org>
Date: Tue, 27 Jul 2021 08:56:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5d214a265708c2062855bcf31550416c5183089d.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 7/26/21 9:23 PM, Andrew Bartlett via samba-technical wrote:
> In our wiki:
> 
> https://wiki.samba.org/index.php/Setting_up_a_Share_Using_Windows_ACLs
> 
> there is the fairly strong suggestion to set:
> 
>   acl_xattr:ignore system acl = yes
> 
> I feel like this is a fairly bad idea, we should defer to the kernel
> unless we really know that just doesn't work.
> 
> But I don't fileserver every day, so I wanted to ask first.
> 
> What is the broader view on this option?
> 
> Andrew Bartlett
> 

I'm not recommending one way or the other because I don't remember the 
full set of implications, and it depends on use case, but in general, 
the system ACLs can get in the way of emulating a Windows file server 
using acl_xattr. If the files are to be accessed only via SMB and full 
NT emulation is desired, then we're better off ignoring system ACLs.

When system ACLs are ignored, the file has ugo permissions as set by 
smb.conf settings, SMB ACL modifications just change the xattr, and 
fetching the security descriptor for the purpose of access check is a 
matter of reading and parsing the xattr, and comparing the SIDs with the 
ones in the token. Notice that no network activity is involved here. If 
the xattr does not exist, the generated default ACL is something that 
makes sense in the Windows world.

When system ACLs are not ignored, the vfs_acl_xattr module also sets 
POSIX ACLs in a best effort way, but this doesn't always work well 
because the NT mode is much richer. One prominent thing that affects 
security is deny lists. POSIX ACLs are not (AFAIK) in common use, this 
hasn't even made it into a POSIX standard, so poking in them could be 
surprising to sys admins.

The translation from SID to unix ID could involve network traffic (if 
only to determine whether the SID is a user or group SID), could result 
attempt to contact a foreign domain, and I don't remember what happen if 
those fail - whether the operation is failed or we skip failed entries.

Additionally, if the POSIX acls are modified externally or by an SMB1 
client with POSIX extensions, smbd "forgets" the xattr blob and uses 
something derived from POSIX ACLs.

Finally, the default ACL used if the xattr blob doesn't exist is derived 
from system ACL and that's not always desirable - see 
https://bugzilla.samba.org/show_bug.cgi?id=12028

Uri.

