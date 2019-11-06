Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C72F1C8C
	for <lists+samba-technical@lfdr.de>; Wed,  6 Nov 2019 18:35:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=LLoMjFIH5C3+5CS0OFBuafCZUqMlMy91niiSl+T8caA=; b=Xk8z2xY5e2/h45YXXUI0TJYPyp
	ylzU7oxeJE9HsEgDjf6DdXT5BF7EFlBZoEJXJwse/NuxPd49GiMaJRpQ0gniq1taxG2zhm4f9bPFI
	15pdhV5YV3ai8Pln46XJXgAu2Sl9NZiVrCNASg/tE0RD1XdoCBGNTK7eAVMjJ3pZ68Oz/mPIhOEGu
	7oYblrl2ERHUSQvZiszjMh8kUFrtB041KLnNbq4QdieSODAh0zZMcXEHNBKjglkHMEwgtELpL4BZm
	2B7xinmm4YcitLLnFHPe6t5AJOVMgHeomdJryIpRtIWW5/758I5muo2moTfAMT6ut27HTNdoh4tcF
	ha4hHeSw==;
Received: from localhost ([::1]:60104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iSPCj-0077wZ-03; Wed, 06 Nov 2019 17:34:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46174) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iSPCe-0077wS-Pf
 for samba-technical@lists.samba.org; Wed, 06 Nov 2019 17:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=LLoMjFIH5C3+5CS0OFBuafCZUqMlMy91niiSl+T8caA=; b=Kpbxfagqs4LgxoxYdgq9IVo0U+
 xobg1ja/h/wiXnJOL8rqSN7/GzxpznsbknVU1J8r31SVEiWKCc4MpsQTMkqBdcznyMsPM/z9yTKyE
 HPhEBkJrLU3vTdCcWZHtmDQV/6KEXVzbYG9pchYoTJhBEOf35rwsxk203vTZiblg47VIYrcrqbTNj
 gDVMftbYF0UV/Kwy/bXUAzA5sYlN9PKCGOc57GItkghc2huBrUNLLqlp9niYEfDEen/FVmMBmMRH5
 darTa8cJ/+m4eyzS+82vOTwb15/2jvzxNPqmipgUS/ok+0wJp4DNTqObe6Dr63hp/noOAddSw7IQR
 SWQXAQxQIAXbFtyka7O6qR0bhJMFuQ4GHbA9o9AWBzkebJ34+4Z0qwylXdDRcE0+fn4SgIHEpMkHH
 etPZ2ljl9ymEMZzDMlAg92DE20hCCGoj33dpRQJADwUvk6X89sUGxBaDtppg5UlctxzButmc86C82
 rPRHh2v0hVYJdaDaCg/iG6Hn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iSPCc-0008E7-KJ; Wed, 06 Nov 2019 17:34:43 +0000
Message-ID: <343cb710c4bb9936e0d6c75f82c81ab0f3d35bf9.camel@samba.org>
Subject: bootstrap: Fix centos7 image creation
To: samba-technical@lists.samba.org, asn@samba.org
Date: Thu, 07 Nov 2019 06:34:38 +1300
In-Reply-To: <20191106133603.2F5431404C0@sn.samba.org>
References: <20191106133603.2F5431404C0@sn.samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: cs@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-11-06 at 14:36 +0100, Andreas Schneider wrote:
> The branch, master has been updated
>        via  35bb734d638 bootstrap: Fix centos7 image creation
>        via  6a3b19fb170 bootstrap: Add Fedora 31
>        via  1ba0a32e707 bootstrap: Remove Fedora 28 which is already EOL
>       from  bf99f820778 ctdb-tests: Make process exists test more resilient
> 
> https://git.samba.org/?p=samba.git;a=shortlog;h=master
> 
> 
> - Log -----------------------------------------------------------------
> commit 35bb734d638e273f2fd1a19220db5f200d3e7489
> Author: Andreas Schneider <asn@samba.org>
> Date:   Wed Nov 6 08:43:05 2019 +0100
> 
>     bootstrap: Fix centos7 image creation
>     
>     Signed-off-by: Andreas Schneider <asn@samba.org>
>     Reviewed-by: Alexander Bokovoy <ab@samba.org>
>     
>     Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
>     Autobuild-Date(master): Wed Nov  6 13:35:17 UTC 2019 on sn-devel-184

G'Day Andreas,

I actually think we should remove nettle entirely, it is incorrectly
listed as a dependency.  It came about due to some work we did for the
encrypted passwords support (which metze then changed to use our
internal AES, now removed in favour of pure GnuTLS).  

I picked this this when Christof proposed the same patch here:
https://gitlab.com/samba-team/samba/merge_requests/875#note_239077036

He was able to successfully drop the nettle dep.

Sadly he had trouble with the ktest environment I also asked him to add
so it hasn't merged yet. 

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



