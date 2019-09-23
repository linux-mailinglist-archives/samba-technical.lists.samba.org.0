Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1A3BBD3F
	for <lists+samba-technical@lfdr.de>; Mon, 23 Sep 2019 22:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=U6MHJsGSLOTv6Pv1bVtqCC1V56u49R+xVS0qNuovdfQ=; b=iBpgU4vk4gqESG9BCSzokJEcQq
	RhKHXrK/5ytZzRo3X9Kt+3hgi130Y9mg6rtUHiALVXB+PHtz7vguEh/f/4/uFfnd9le31Zss3yLnK
	1VJtpChrETDG2wVf0qQ6yHEIr96dl2RCRH74uDrj6T4s5UqO0kkOTXcNN55KYzjFelNvzDAUPzkwr
	abJQ2dFL0ck26T7CRkKCXCQQNez4rs6SpQ8i4vti8lrSjgGXXhDrW2FOS8eKmVsrrk0Cd25U9tfzz
	z8eS58/7lS9bK2b1qUREZ/Lgfz/0bB5nRLkrZFM7WcjJ2gDzMr8Lx7kr3P0kKg2GUNOxV+7LnEo2V
	GdXDrANw==;
Received: from localhost ([::1]:64110 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iCVAp-008477-2m; Mon, 23 Sep 2019 20:43:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35882) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCVAl-008470-0X
 for samba-technical@lists.samba.org; Mon, 23 Sep 2019 20:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=U6MHJsGSLOTv6Pv1bVtqCC1V56u49R+xVS0qNuovdfQ=; b=MiBJUR1aLhB4bSLmc7JzCLJsao
 k96savJfkqf1tE/SaCBHE9jnTSeMh5G/p4+Vv4s4eN6eIRo1Q6rzeeB2kUaiIouDJ1M4W+aw5D+Aj
 G4lWIixh/LcE86CqoUoM+Fc9U6fjD2AbKRbHeIRpxKFx6Rvi/PTUTZG7aNZtBG9kutk8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCVAk-0006R8-JP
 for samba-technical@lists.samba.org; Mon, 23 Sep 2019 20:43:02 +0000
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
To: samba-technical@lists.samba.org
References: <20190923193911.GA9762@samba.org>
Message-ID: <62c2ca93-2600-27d9-1697-0d465efed1a9@samba.org>
Date: Mon, 23 Sep 2019 21:43:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923193911.GA9762@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 23/09/2019 20:39, Christof Schmitt via samba-technical wrote:
> The behavior of winbindd changed in regards to whether a group with
> ID_TYPE_BOTH returns a fake user structure. This surfaced during a test
> of creating files from a SMB client and then checking the ownership
> directly on the file system.
>
> make testenv SELFTEST_TESTENV=ad_member_idmap_rid
> is an environment that provides ID_TYPE_BOTH for testing.

Surely if that is a testenv, then it should be removed or modified, a 
Unix domain member using idmap_rid will not work in that way, using 
'getent passwd' against a group returns nothing.

Rowland


>
> 4-5-test returns fake passwd information for the group:
>
> $ getent passwd "$DOMAIN/Domain Users"
> ADDOMAIN/domain users:*:2000513:2000513::/home/ADDOMAIN/domain
> users:/bin/false
> $ echo $?
> 0
>
> $ getent passwd 2000513
> ADDOMAIN/domain users:*:2000513:2000513::/home/ADDOMAIN/domain
> users:/bin/false
> $ echo $?
> 0
>
> $ ls -l testfile
> -rw-rw-r--. 1 ADDOMAIN/domain users ADDOMAIN/domain admins 0 Sep 23
> 12:24 testfile
>
>
> 4-6-test no longer does this:
>
> $ getent passwd "$DOMAIN/Domain Users"
> $ echo $?
> 2
>
> $ getent passwd 2000513
> $ echo $?
> 2
>
> $ ls -l testfile
> -rw-r--r--. 1 2000513 ADDOMAIN/domain admins 0 Sep 23 12:30 testfile
>
> It looks like the behavior was introduced for Samba 4.5 through commit
> 394622ef8c916cf361f8596dba4664dc8d6bfc9e
>      s3:winbindd: change getpwsid() to return a passwd struct for a group
> sid id-mapped with ID_TYPE_BOTH
>
> and then changed for Samba 4.6 through the patches around
> bce19a6efe11980933531f0349c8f5212419366a
>      winbind: Restructure wb_getpwsid
>
> What is the intended behavior here? Returning a fake passwd for the
> group makes the "ls -l" output nicer as no manual lookup of the uid to
> the group is required. On the other hand, creating fake user information
> might cause problems elsewhere.
>
> What are other's opinions around this? I am planning to add a testcase
> to ensure that this does not change again, but i would like to
> understand first whether winbindd should behave as in Samba 4.5 or in
> the newer releases.
>
> Christof
>
>


