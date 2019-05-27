Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D0C2B745
	for <lists+samba-technical@lfdr.de>; Mon, 27 May 2019 16:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=dmf0u9Qpy3uf4ovQXbaRVJAl8Va7E2Rp/868hAXaDHQ=; b=oAxU+cirjZiXqW4ov+jKKZmEfe
	pb3NKPnvZczywA2X7yuBhgPFP+jY3r250rphq0wcMr8GS9Xf1gxxuPe6bODgkaUwEvOXxW3FS7F0w
	3kl3MjGsUmM9vHkgmm7Kbp9y2LffyB+bHMBn2VB0sYE5Sz/YhQh+kkUscFn8mA86ojmndS09im4rU
	WVEW+wAs4NG/gYf37lZmYgZ7yvNBj1GWNDVSjCIZIReeB4J9rSkby+BQfBhwcmyHadY4kVW06E+m/
	H34BLhpmT/Y8cO623uaOqzoEnmmsCKIyCUcOWUWKf+FISpPYnZptAF0sjkpwi382RvqNloSTiGz5q
	/F1wpOyg==;
Received: from localhost ([::1]:58746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVGIe-002Axt-TM; Mon, 27 May 2019 14:08:28 +0000
Received: from [2a01:4f8:192:486::147:1] (port=21324 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVGIZ-002Axm-DD
 for samba-technical@lists.samba.org; Mon, 27 May 2019 14:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=dmf0u9Qpy3uf4ovQXbaRVJAl8Va7E2Rp/868hAXaDHQ=; b=et5F9uLOr7OKs1A+XAN2z8AHuz
 6pAJ97VAGyr1IEUcvE2XcAMRx2vmsmmnDhGkWgWHmJ/oRRCuE/4XoXL5ErKzdjXF0EyS9fH6xpeJM
 SXpAaYIFruTCqOG0a/9bZphmiimufyxCIu92gyPTa0YU85F3nOZoY7gMhDUKzDOL8Nfo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVGIQ-000711-8R; Mon, 27 May 2019 14:08:14 +0000
Date: Mon, 27 May 2019 16:08:12 +0200
To: Amit Kumar <amitkuma@redhat.com>
Subject: Re: [PATCH]: winbind handling NULL sids (bug #13914)
Message-ID: <20190527140812.qeyamc5kzomgipuj@inti>
References: <b7d91e0e-e654-3452-37a0-dfbda4936296@redhat.com>
 <b59fbffd-c363-47f1-29eb-621676d5eb52@samba.org>
 <0cc22df8-b48c-73c8-74ad-e1e602b8096a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0cc22df8-b48c-73c8-74ad-e1e602b8096a@redhat.com>
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

On Mon, May 27, 2019 at 05:05:54PM +0530, Amit Kumar via samba-technical wrote:
>Created patch using following command set:
># git clone https://github.com/samba-team/samba
># cd samba
>Done changes
># # git checkout -b null-sid
>M    source3/winbindd/winbindd_rpc.c
>Switched to a new branch 'null-sid'
># git add source3/winbindd/winbindd_rpc.c
># git commit -m "winbind null sid handling"
># git format-patch -1 HEAD
>0001-winbind-null-sid-handling.patch

hm, still fail:

slow@inti:autobuild ▸ git log --oneline -1 HEAD
412afb2aef1 (HEAD -> ab, origin/master, gitlab/master) Fix ubsan null pointer passed as argument 2

slow@inti:autobuild ▸ git am ~/patches/0001-winbind-null-sid-handling.patch
Applying: winbind null sid handling
error: patch failed: source3/winbindd/winbindd_rpc.c:958
error: source3/winbindd/winbindd_rpc.c: patch does not apply
Patch failed at 0001 winbind null sid handling
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Can you check?

While at it, can you please add a bit more desciptive text to the commit message 
describing the problem and the fix? Thanks!

Finally please also add your signed-off by once you're happy with the state of 
your patch:

https://wiki.samba.org/index.php/CodeReview#commit_message_tags

Thanks!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

