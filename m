Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 441451E5841
	for <lists+samba-technical@lfdr.de>; Thu, 28 May 2020 09:12:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=w6OO5bVn0jHinTtuTCWeZnJaXJC1TV8XwufFCwAr56w=; b=CPGXy6KEdRjvRKkH0sha+zrEzq
	LvJtWNSQt5Xn69zOPkzaj+I6WoMtdR44VO3RW0qTty1ts7Jk90TMKGqJY/vnmquZ7LxUeLBsUEqZ9
	hP4YR7K4zbVZtqRiYmIMMuv+1yrEh8PT8qnuhjXxQTZ4BxxCZ5Mnalbousl7DaZF5/C6O0JzeUuvg
	4yErtQOMp2SXYJcUgBVoXyVNsfZLxiNFoOyx71qJ7Pj4PrS7xszjLOTN6PIsPFWyCvf54Q66zn7e3
	dDfAI+Z6Oz3AY7eUaoVMqBhi/pmKXKiqTqgtM+ichMKC6jIR0h9rVDlkobLkCdyq/JwOrfY0AM0gT
	VqSMCIhA==;
Received: from localhost ([::1]:35100 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeCi4-0068S8-6Y; Thu, 28 May 2020 07:12:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28774) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeChr-0068S1-0g
 for samba-technical@lists.samba.org; Thu, 28 May 2020 07:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=w6OO5bVn0jHinTtuTCWeZnJaXJC1TV8XwufFCwAr56w=; b=XHuT98oEND3BdGwyxvZ2KJgFLm
 e6/059zQ+DSPCMQo/lhVG1KXkfimFfHy/qTIHhYN/b0LOGwVhvCBZ21HTCWwpSVjqMFMDTJFNE7TL
 AemfR9E+H6N0mU9K2ktX6XB13uDQonxTDpA9zZScrLQKUO8FruYMGc9OJTPqo2aMsb38sl9mgGSRX
 y+JqA+64a1NuYN11kDRaNOsWB9iDP4CyOF72Ap5eVOGrvl0GPk4mGDO31vkpDlxSKBWpgCs8iwWC6
 FB3oKbpcguHaItRz4AdU3bK03ZvWAFEYVz/YXIzXkVpdlFgZghQAsWYFVbnKKHcxwKdZH1DnTI3Ex
 UwHH4XyEReh7I12CNCvuYrVk+0fw1f9DHqh1ZB/R8sozbg5ahof3PGq9X6LTsQMIFpRqMgr4JoOG4
 IcaoVWdDOcGdMHcdEmjLcwrAY8Dn1X3VtxAqoq7HViJaYbAV26t5WSdSxw+3mvE43Jbk4BoHCYlXW
 4tkQ/RyNHLdaMeuGwNpclId0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeChq-000877-BV
 for samba-technical@lists.samba.org; Thu, 28 May 2020 07:11:58 +0000
Subject: Re: Samba user quota implementation question
References: <4D14BB46-74F3-4EB7-A3F4-0C290A464D16@contoso.com>
 <beb6a045-722d-fe0d-e41d-ab7a25fbc5fb@samba.org>
 <CD19BF6F-5055-4697-A1BD-C8FF6948FD51@storagecraft.com>
 <CAB5c7xquGEb=k_d5uJ5zvQKOfVA7QC4eHNDkgUiCzfG91YQ8ug@mail.gmail.com>
 <E40C01D9-9EC6-4C85-A535-03B220BDB12F@storagecraft.com>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <4b2bd68d-475e-a15b-37fd-749cd2e8e7d4@samba.org>
Date: Thu, 28 May 2020 08:11:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <E40C01D9-9EC6-4C85-A535-03B220BDB12F@storagecraft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 28/05/2020 02:27, Krishna Harathi wrote:
>
> Andrew – Tried with "winbind enum users = yes" and "winbind enum 
> groups = yes" configuration, no change or improvement.
>
> Rowland – smb.conf attached.
>
> Regards.
>
> Krishna Harathi
>
> *From: *Andrew Walker <awalker@ixsystems.com>
> *Date: *Wednesday, May 27, 2020 at 4:45 PM
> *To: *Krishna Harathi <krishna.harathi@storagecraft.com>
> *Cc: *Rowland penny <rpenny@samba.org>, Isaac Boukris via 
> samba-technical <samba-technical@lists.samba.org>
> *Subject: *Re: Samba user quota implementation question
>
> ****EXTERNAL SENDER. Only open links and attachments from known 
> senders. DO NOT provide your username or password.****
>
> Depending on the situation, you may need "winbind enum users = yes" 
> and "winbind enum groups = yes" in your smb.conf for AD user quotas to 
> be enumerated. It might be nice to have some mechanism to override the 
> default user quota enumeration method in Samba. For example "zfs 
> userspace <dataset>" and "zfs groupspace <dataset>" will enumerate 
> user / group quotas on a given dataset (and the equivalent can be 
> obtained (though not trivially easily) through libzfs.
>
> Andrew
>
> On Wed, May 27, 2020 at 6:17 PM Krishna Harathi via samba-technical 
> <samba-technical@lists.samba.org 
> <mailto:samba-technical@lists.samba.org>> wrote:
>
>     On the contrary; normally, there is no passwd entry made for a AD
>     user in the local password file.
>
>     The set user-quota (for a user user-quota was not set before) is
>     working fine as intended without any manual addition to local
>     password file.
>
>     I have to manually add the uid/gid entry of the SID/GID of the
>     user authenticated/authorized by AD,  in order for the windows
>     client to list/show the user that has user-quota already set.
>
>     My question is - is it expected to find the subset of AD users
>     with user-quota set in the local password file ?
>     I am trying to figure out if there is any other way to accomplish
>     windows client listing existing quota without this manual
>     intervention.
>     But if this is expected, I will find a way to make those entries
>     in the local password file when a quota for a new user is set.
>
>     Hope this explanation helps to describe the problem more. I will
>     post the actual smb.conf file asap (not available at this moment).
>     We have the "get quota command" and "set quota command" values and
>     AD server with idmap "backend = autorid" and range configured.
>
>     Regards.
>     Krishna Harathi
>
>
>     On 5/27/20, 12:53 PM, "samba-technical on behalf of Rowland penny
>     via samba-technical" <samba-technical-bounces@lists.samba.org
>     <mailto:samba-technical-bounces@lists.samba.org> on behalf of
>     samba-technical@lists.samba.org
>     <mailto:samba-technical@lists.samba.org>> wrote:
>
>         ***EXTERNAL SENDER. Only open links and attachments from known
>     senders. DO NOT provide your username or password.***
>
>         On 27/05/2020 20:42, Krishna Harathi via samba-technical wrote:
>         > Our OneXafe FS  supports share/fs level quota using smb.conf
>     “set quota command” and “get quota command”.
>         >
>         > We are currently extending support to user-level quotas
>     using the same interface, when Samba smbd is an AD DC member.
>         >
>         > Setting user quota from a windows client is working as
>     expected. But once quota is set, none of the users are listed in
>     the quota’s pop-up window, so cannot delete or modify quota
>     properties. Moreover, creating a new quota entry for the same user
>     is generating a “quota entry already exists for this user” error.
>         >
>         > By tracing get/set requests to our file server, I see that
>     our FS server is receiving a get request for Samba for every user
>     entry in the local password file, but none for the UID of the DC
>     member user. But I do see a default quota get request for the
>     group GID.
>         >
>         > The problem seems to be that the get/set command interface
>     does not obviously support a “list” user quota api to the hosting FS.
>         >
>         > Questions on this –  We can post and manage user entry
>     (host-local uid/gid) corresponding to the DC user sid/gid whenever
>     a “set user quota” is received. I did verify that when an entry is
>     made manually, windows user quota workflow behaves as expected. Is
>     the problem assumption correct and is this a way to implement? Is
>     there a better way, given the constraints?
>         >
>         > We are using Samba 4.7.11 patched with
>     https://nam03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.samba.org%2Fshow_bug.cgi%3Fid%3D13553%23c17&amp;data=01%7C01%7Ckrishna.harathi%40storagecraft.com%7Cb00f68c028324ea5ece308d80277a7c3%7C99f4e3c9bed5443dbd532b3f22d4eddf%7C0&amp;sdata=T6FbBy04TqSxJ%2FFx%2BZ3nVF29h%2BoHdNEqqIwuZXzm0hY%3D&amp;reserved=0
>     <https://nam03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.samba.org%2Fshow_bug.cgi%3Fid%3D13553%23c17&data=01%7C01%7Ckrishna.harathi%40storagecraft.com%7Cebaa380afa4b42ec029108d802980280%7C99f4e3c9bed5443dbd532b3f22d4eddf%7C0&sdata=JMjlHIwI3IZb3S6JW8ON0%2FdTpRg7LBFwi6INMjLAvYQ%3D&reserved=0>
>     fix for 4.7.
>         >
>         > Any help is this issue is much appreciated in advance.
>         >
>         > Regards.
>         > Krishna Harathi
>
>          From reading the above, it looks like you are saying that you
>     have the
>         same users in /etc/passwd and AD, is this correct ?
>
>         Can you also please post the entire smb.conf you are using on
>     the OneXafe.
>
>         Rowland
>
>
>
Is this computer a member of a CTDB cluster, if not, remove 'clustering 
= yes'

You have:

idmap config * : backend = tdb
idmap config * : range = 2000000-2999999

And:

idmap config *: backend = autorid
idmap config *: range = 10000000-2020000000
idmap config *: rangesize = 100000000

You cannot have both ;-)

I would suggest you remove the first two lines.

You have a share called 'Public' with 'guest ok = yes' and presumably it 
is supposed to be a public share, it isn't, because you do not have 'map 
to guest = bad user' set in '[global]'. I also cannot see how quota is 
going to work on a share where everything is going to end up belonging 
to nobody:nogroup.

Finally if 'path = /exports/Public' and 'path = /exports/TestQ' means 
that you are sharing NFS shares via Samba, then this is never a good idea.

Rowland



